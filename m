Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id B8FD66013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 11:43:37 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so67194498qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 04:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Rwa4Z9vZ8uWB/CA6LZ9XORkIuR7Y3JhsaaXoD0Znxvo=;
	b=A6oCfNu9WHdr2W8VgdePuvPsFkEXIIuSIprMtemdWHRzEIPhSJ6xCDMP1a2OcGZyJz
	wwTgafk8STNBkp7eehl1F2CRnzSbWIFEoZykRHQigRIC/lDvJ2aHwSL+D+Z4WhGUQcWj
	xJHJNltBvm26cDMcCrqj70ankav+TzwG/v6ZD+Q9xyhIodKd+aM+J0o/6Hy6iHc7ldak
	I82Xc4rs370DxU6J6q9bpdMgxzIgkrNPbrZs4h42TFLuS/X7a3wiuRxanCulxmaCr5qg
	MbfdsdvxzGmTUGQ2oiiJQZuN034jvN9Q5PYEXRqdfhmi5kyKzV1PuTYo5HwmASdo9UjS
	1lYQ==
X-Gm-Message-State: ALoCoQnE8JwWDQILDYyF5BnMTkrwe08VLctMKFyVO9+w7xwlaGQ00GlM1fCHBPUPWRq0Vs25uWm7
X-Received: by 10.140.39.164 with SMTP id v33mr12435982qgv.80.1431344619051;
	Mon, 11 May 2015 04:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 11 May 2015 04:43:18 -0700 (PDT)
In-Reply-To: <0cbcafec984ec2146a0e4ff1800b95f7f3c67e02.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<0cbcafec984ec2146a0e4ff1800b95f7f3c67e02.1431324180.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 May 2015 12:43:18 +0100
Message-ID: <CAJTo0LYZj2hottHmqHUDFH80Y+6Q-0fbtYLZepe86AdtZ33z5g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] packagegroup-core-qt: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 11:43:41 -0000
Content-Type: multipart/alternative; boundary=001a11c14eae91f6930515cce3f4

--001a11c14eae91f6930515cce3f4
Content-Type: text/plain; charset=UTF-8

On 11 May 2015 at 07:08, Robert Yang <liezhi.yang@windriver.com> wrote:

> +# The quicky and fotowall requires x11 in DISTRO_FEATURES
> +REQUIRED_DISTRO_FEATURES = "x11"
>

As this is a helper packagegroup, would it make sense to have these as
optional dependencies based on DISTRO_FEATURES instead?

Ross

--001a11c14eae91f6930515cce3f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2015 at 07:08, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4jr" clas=
s=3D"a3s" style=3D"overflow:hidden">+# The quicky and fotowall requires x11=
 in DISTRO_FEATURES<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;</div></blockquote></div><br>A=
s this is a helper packagegroup, would it make sense to have these as optio=
nal dependencies based on DISTRO_FEATURES instead?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c14eae91f6930515cce3f4--
