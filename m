Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5437CED3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:00:45 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id 31so11516731uas.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 04:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PbSO+JkQleJw91TU7GONjLNJyNXG+rU/PxgPnG61ci4=;
	b=UgaT5Rhk7yEUJ3KMeZ76Ij1+xSljJO0a92MeUlhmn2Ut+Tmgp4tgX+Xau0hl34IqCy
	dh7mVbHv7axMGKHGfCLs8LkL45bWBQ/ajvBEKL3Uc0GjWm8mfL0tqHVHYHohAxFHCW6f
	dVMDiDvTL7JA78XgTN4m9jkDGd52FRXAqmtmWg3ING+wkIpYCa6B114Mbd4F8CrFfG3v
	imVirEmkgkalOahQM/N6WR8nXDUHmgFLtR1lh7Y3z599PntcVfDFbmNBnqciT1eOOvP+
	W94PKQLVXiY1iDucnvMepM5TgiHVITaqkecQhjrpztAIKsAjvYDveP617tHj8kNudfK9
	PXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PbSO+JkQleJw91TU7GONjLNJyNXG+rU/PxgPnG61ci4=;
	b=JQAtuRxI3CkJfazR9c3sgrUFuNiV6dEZbgJSuiL+9R/cDAbLuj04ckIewNmt/WxtL/
	ZQUea7c/eVuixEZ2fR+7LncnR9h2QYkieQMO3Xm/wNyZ0bY1n8JH0Gev2z6w3J13eBGu
	nfDK6L4kHfd3mpXoyM48U5DFOIzXzH6KN1I0zwNTv207Hps0eNH+cCCPwo2FrKtWdgP4
	DDMB69uBfAtSiBkx8altVqVBMv7vJpH0/KcZ919d8fvkW+uzKOKwlhCvqMHuwb9mxKNL
	CqX+HyqpJvJIPmv5DgvH1+rf96OWLNoXNldDFesIVWSkHi7ebHcTsfIZ6TnhoL4PGtOB
	whLg==
X-Gm-Message-State: APjAAAXzYhPOTgsGRnmms1NPENRHsApZWjRRpAEaUCHyn+IdXfhjlbei
	QBREuyQLLgYVC0owZTKUXaVnPOMEJchS1ihXLYI=
X-Google-Smtp-Source: APXvYqxgwVaqxfT539whGTLiTUz4JicA0eHSwmcqv8MjZHBYhR+IAdzxPUSmirzfxb5rPPxbvMQ8rA40m1EllpEga0s=
X-Received: by 2002:ab0:7448:: with SMTP id p8mr2315694uaq.71.1575288046798;
	Mon, 02 Dec 2019 04:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-7-alex.kanavin@gmail.com>
	<7aa33e57-5cdc-f82a-36d1-82919e9bcd4c@intel.com>
In-Reply-To: <7aa33e57-5cdc-f82a-36d1-82919e9bcd4c@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2019 13:00:35 +0100
Message-ID: <CANNYZj-0GpCERhk=VESYbFBR3cQaNPO9XL=8DwyF8-CYoovbYA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/15] p11-kit: convert to meson
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
X-List-Received-Date: Mon, 02 Dec 2019 12:00:46 -0000
Content-Type: multipart/alternative; boundary="00000000000072ca540598b754e8"

--00000000000072ca540598b754e8
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2019 at 23:56, Ross Burton <ross.burton@intel.com> wrote:

> Is this intentional?
>
> packages/corei7-64-poky-linux/p11-kit/p11-kit: FILELIST: removed
> "/usr/libexec/p11-kit/trust-extract-compat
> /usr/share/p11-kit/modules/p11-kit-trust.module
> /usr/lib/pkcs11/p11-kit-trust.so /usr/bin/trust"
> packages/corei7-64-poky-linux/p11-kit/p11-kit: RDEPENDS: removed all
> items "libtasn1 (['>= 4.14'])"
>

Nope; meson build requires an additional native dependency for these to be
enabled. I've adjusted the patch.

'trust-extract-compat' doesn't seem to be supported at all with meson.

Alex

--00000000000072ca540598b754e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 29 Nov 2019 at 23:56, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Is this intentional?<br>
<br>
packages/corei7-64-poky-linux/p11-kit/p11-kit: FILELIST: removed <br>
&quot;/usr/libexec/p11-kit/trust-extract-compat <br>
/usr/share/p11-kit/modules/p11-kit-trust.module <br>
/usr/lib/pkcs11/p11-kit-trust.so /usr/bin/trust&quot;<br>
packages/corei7-64-poky-linux/p11-kit/p11-kit: RDEPENDS: removed all <br>
items &quot;libtasn1 ([&#39;&gt;=3D 4.14&#39;])&quot;<br></blockquote><div>=
<br></div><div>Nope; meson build requires an additional native dependency f=
or these to be enabled. I&#39;ve adjusted the patch.</div><div><br></div><d=
iv>&#39;trust-extract-compat&#39; doesn&#39;t seem to be supported at all w=
ith meson.<br></div><div><br></div><div>Alex<br></div></div></div>

--00000000000072ca540598b754e8--
