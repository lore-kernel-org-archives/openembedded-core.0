Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id E91D86FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 19:59:34 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w33so82583842qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BDOhPb6CcxKaV3jxxXDcDZmyiSzoeep2I+iutftmitQ=;
	b=RVlnJD96SC9hHeCXWuaRq1/1flaKL6Jb0GpJr+rB21ZrbjovWGQ2dE4clTreXJ84DU
	cTlfNm/6won1LGMBA9RdX9+FlrxcM0xtn/0nu4fEsN8jmIE+pyv4yVDMOSeyVDByMhnC
	wtU0iGcYX3lc0e42BHATlId4X/VjfKG2GbPC7So1rS4aI3Bx8p94w/5U8+ptEbg548E3
	/d3a84obNnOHggVR2qD5rwsPASf/pnmtaRVAR0IqG1cOFWeAWDiWMR6FQavBgUqPwTYn
	lyuoJqfq4vzbFs0pjGF9zTT7a9hFqcjPobAhuzdSgwnj7OqzgQGHOyNduuTrua17DQxJ
	KSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BDOhPb6CcxKaV3jxxXDcDZmyiSzoeep2I+iutftmitQ=;
	b=faEHMBYUT06+nAoMYHiPpUq0MC291xum9e1FMW7S7I5htzmilYpGCmxjYxxIeBHQbz
	4MEGyz9tsRSD3dWdM6/dXMV+8Iy3aLGZ0HW5dHhWN0A6bixI5jLGYGgkI0lVkxLz8ZD1
	BJ+w78M7OKkhOIh05p3wXvgnjIU9Q5C47f5r/YrjL8B8JblOvr7Z9p0NarydLWk+i0Tl
	ueKbVaEpnpdjpG4l/ATU3vaYcsxyKYdVaAIAhusYfJXjtmOLmxnzuExRvD1IoCnjWq+9
	iAfH/Yy/w/zuAPgcrHuw33r0MNmmsHNkoRRB9kCW3u4qvrNp0Sz6ReKg1UovQL/qGnSt
	wN2A==
X-Gm-Message-State: ABUngver0DiXuFiBShhsLfpvO75M73+VzeLcekVXigNYmpx3pzSOwHKj2+uw33gD2aV5JxAfwqv5aOaoyk25rP7q
X-Received: by 10.237.37.77 with SMTP id w13mr12344694qtc.197.1479239975773;
	Tue, 15 Nov 2016 11:59:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 11:59:15 -0800 (PST)
In-Reply-To: <1479239005-26229-1-git-send-email-radzy@windriver.com>
References: <1479239005-26229-1-git-send-email-radzy@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 19:59:15 +0000
Message-ID: <CAJTo0LZFy4Y23DjQC=v-3-P4HzVoZCOOPWwYNkty4CCxVfGj+Q@mail.gmail.com>
To: "T.O. Radzy Radzykewycz" <radzy@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] OpenSSL: CVE-2004-2761 replace MD5 hash algorithm
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
X-List-Received-Date: Tue, 15 Nov 2016 19:59:35 -0000
Content-Type: multipart/alternative; boundary=001a114108ea4b868805415c6592

--001a114108ea4b868805415c6592
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 19:43, T.O. Radzy Radzykewycz <radzy@windriver.com>
wrote:

>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
>

oe-core master is on openssl 1.0.2j now, so please rebase.


>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-
> not-MD5-as-default-digest.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/Use-SHA256-
> not-MD5-as-default-digest.patch b/meta/recipes-connectivity/
> openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
> new file mode 100644
> index 000000000000..766af67e1db9
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/Use-SHA256-
> not-MD5-as-default-digest.patch
> @@ -0,0 +1,59 @@
> +From d795f5f20a29adecf92c09459a3ee07ffac01a99 Mon Sep 17 00:00:00 2001
> +From: Rich Salz <rsalz@akamai.com>
> +Date: Sat, 13 Jun 2015 17:03:39 -0400
> +Subject: [PATCH] Use SHA256 not MD5 as default digest.
> +
> +Commit f8547f62c212837dbf44fb7e2755e5774a59a57b upstream.
> +
> +Upstream Status: Backport
>

I'm such a pedant but we do have automated tooling around this, so please
use "Upstream-Status".  Also adding a CVE tag in the patch (CVE:
CVE-2004-2761) would be appreciated for tracking.

Ross

--001a114108ea4b868805415c6592
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 19:43, T.O. Radzy Radzykewycz <span dir=3D"ltr">&lt;=
<a href=3D"mailto:radzy@windriver.com" target=3D"_blank">radzy@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1ee" class=3D=
"gmail-a3s gmail-aXjCH gmail-m158698833ac301c0">=C2=A0.../recipes-connectiv=
ity/<wbr>openssl/<a href=3D"http://openssl_1.0.2h.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssl_1.0.2h.bb</a> |=C2=A0 1 +<br></div></blockquote><di=
v><br></div><div>oe-core master is on openssl 1.0.2j now, so please rebase.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1ee" class=3D"gma=
il-a3s gmail-aXjCH gmail-m158698833ac301c0">
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>openssl/openssl/Use=
-SHA256-<wbr>not-MD5-as-default-digest.<wbr>patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>openssl/openssl/Use-SHA256-<wbr=
>not-MD5-as-default-digest.<wbr>patch b/meta/recipes-connectivity/<wbr>open=
ssl/openssl/Use-SHA256-<wbr>not-MD5-as-default-digest.<wbr>patch<br>
new file mode 100644<br>
index 000000000000..766af67e1db9<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>openssl/openssl/Use-SHA256-<wbr>not-MD=
5-as-default-digest.<wbr>patch<br>
@@ -0,0 +1,59 @@<br>
+From d795f5f20a29adecf92c09459a3ee0<wbr>7ffac01a99 Mon Sep 17 00:00:00 200=
1<br>
+From: Rich Salz &lt;<a href=3D"mailto:rsalz@akamai.com">rsalz@akamai.com</=
a>&gt;<br>
+Date: Sat, 13 Jun 2015 17:03:39 -0400<br>
+Subject: [PATCH] Use SHA256 not MD5 as default digest.<br>
+<br>
+Commit f8547f62c212837dbf44fb7e2755e5<wbr>774a59a57b upstream.<br>
+<br>
+Upstream Status: Backport<br></div></blockquote><div><br></div><div>I&#39;=
m such a pedant but we do have=C2=A0automated tooling around this, so pleas=
e use &quot;Upstream-Status&quot;.=C2=A0 Also adding a CVE tag in the patch=
 (CVE: CVE-2004-2761) would be appreciated for tracking.</div><div><br></di=
v><div>Ross</div></div></div></div>

--001a114108ea4b868805415c6592--
