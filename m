Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id CB7D47317E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:39:16 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ig19so19444051igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OVZ33Fvaq9yKXjsDcv/xDoQKCkjrXSX1FoeXiPLKvLA=;
	b=LI5luyml1jGS3lAAHOqaFyF6N3drdaN3jYpGO2xJBs4w2eWgspC1nWqvXp0t3KsEfY
	vQ1pn6pyOHY+rWMMv6041+57FQq3UxcFhu8rvWErYAvhDHDhXey9hC5pSyjXgyn72HdN
	zdZhTUwqyyUMGu6wcIQEuCuWQ5JueVP/BiZWp2skaoyKMWwl1+P6y2830orx/LCM9T3U
	PrWZGhFhrNWbsxJ2TQZiGCeLeXJpuA6y/QKQNQ3OjFBOSQnvbWdnjK8CjLi9fZoPpEYL
	GKmWhymrBjWuHuxpr0jGlbIvRLs2NvVyMF+mwaycQscJDSvK8vr/mO4Y9glvQHw0+Eqc
	0/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OVZ33Fvaq9yKXjsDcv/xDoQKCkjrXSX1FoeXiPLKvLA=;
	b=eqmRzubjnxUlvVMXj4qN+zCYl8X+mWWbFb2f3hhnu993nCBCw4IrqYnKERko/UOdxB
	A5/WdZOb4zrM4ZLIh7Fm4iWvoihAQg7hO/ZGBv8j4GvlJac4qNo3S3aD08XfW1HpmuGH
	sTHciMK0p1dhX7gqNt4coSOai1doyp99y3I5HTKGWtXuwLHCE2mzNDTzOHDlhEa4obaB
	SfQuSqq9vjEcseAlKRXLQnf6rRfmWXJeE3xeQsW/4XYlfYj6OV2bwoU/ByhCch/+Yn24
	nufAxjfcVS41CTv1KX8tCZ8BwcYCz3sTpswOirXxkCtYJP4ihPwlAHg3q6ttbzAMOtZ7
	Rb2Q==
X-Gm-Message-State: AD7BkJL4PO/v+06ns4KWvDk4yNrnlpXwG6U31xJuzHgVNo0ZODkegPh2cHA32kZwpA/yydd5bdxQy3wm0x275Pl8
X-Received: by 10.50.126.8 with SMTP id mu8mr11696575igb.52.1457361556918;
	Mon, 07 Mar 2016 06:39:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 06:38:57 -0800 (PST)
In-Reply-To: <00ab01d1787c$106f4320$314dc960$@neuf.fr>
References: <00ab01d1787c$106f4320$314dc960$@neuf.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 14:38:57 +0000
Message-ID: <CAJTo0LadXojbpycCUR4R2KA3rRO-VL5c604Tq4A+MHoDEhJY8g@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 14:39:17 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfe9205f052d766dba

--047d7b1635bfe9205f052d766dba
Content-Type: text/plain; charset=UTF-8

First, the commit message isn't accurate (binfmt was already in
SYSTEMD_PACKAGES).

On 7 March 2016 at 14:17, Herve Jourdain <herve.jourdain@neuf.fr> wrote:

> -SYSTEMD_PACKAGES = "${PN}-binfmt"
> -SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> +SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
> '${PN}-binfmt', '', d)}"
> +SYSTEMD_SERVICE_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG',
> 'binfmt', 'systemd-binfmt.service', '', d)}"
>

You don't need to conditionalise SYSTEDM_SERVICE_${PN}-binfmt, just
SYSTEMD_PACKAGES.

Ross

--047d7b1635bfe9205f052d766dba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">First, the commit message isn&#=
39;t accurate (binfmt was already in SYSTEMD_PACKAGES).</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 7 March 2016 at 14:17, Herve=
 Jourdain <span dir=3D"ltr">&lt;<a href=3D"mailto:herve.jourdain@neuf.fr" t=
arget=3D"_blank">herve.jourdain@neuf.fr</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div id=3D":1pu" class=3D"a3s" style=3D"overflow:hidde=
n">-SYSTEMD_PACKAGES =3D &quot;${PN}-binfmt&quot;<br>
-SYSTEMD_SERVICE_${PN}-binfmt =3D &quot;systemd-binfmt.service&quot;<br>
+SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;binfmt&#39;,<br>
&#39;${PN}-binfmt&#39;, &#39;&#39;, d)}&quot;<br>
+SYSTEMD_SERVICE_${PN}-binfmt =3D &quot;${@bb.utils.contains(&#39;PACKAGECO=
NFIG&#39;,<br>
&#39;binfmt&#39;, &#39;systemd-binfmt.service&#39;, &#39;&#39;, d)}&quot;</=
div></blockquote></div><br>You don&#39;t need to conditionalise SYSTEDM_SER=
VICE_${PN}-binfmt, just SYSTEMD_PACKAGES.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bfe9205f052d766dba--
