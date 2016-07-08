Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9289060119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 20:17:20 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id t74so53152071ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lDufEjefzBoSI4zK/IvoKz002vlX47gxpp+mGBDNL3c=;
	b=n/rJNi7H6SenXj1c3cSW2S3LtYjXNv1lWlgWFtpNQGJTjbgXjtPLYJBS1kxBnuNtT8
	n25yG7mcPqAQqaQzrWVHH3Zia1rro28ZqTsztLfu6RUoVbOb1L+fyIfDLZPXbR36+Enm
	Ljm1mrOrEJX86isuSEtykJv0B0JD267TnEnk8vf7b8Xo/Y9YS8AGxz54mcNyhOrQInhQ
	jx7p2iqJm4bAZwFuLM+hYNsfINMfRqAb03BkkpJi/9G4Cn96eChmPqk8Ny409UjDr2mu
	itny1+72VF0yIs10nr0faa++eht0ShjGVPdnZcA74BVRmUx0/OWGeYTu7G9dLoBqFU+1
	xgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lDufEjefzBoSI4zK/IvoKz002vlX47gxpp+mGBDNL3c=;
	b=CHP/kyhuGoZ7WYg7kRZUVDRFcWeN39X4NRAFau6zervRJ/DCZI4gZJ6ZDtyu9jt/Im
	sOALnATORo7/+yOl5xAoCx0cPbHBbD0Sxpu6PotXrzaPg6maSLdgrqVEWPaIquWuNGrE
	sLnagVGSpYVUWCLPqivcNs//1zjq/WBApFqecYja1X/NyQBQIvMHOsOXW33dUngcJp1a
	v4+HVFrN4Uwkpjbdb4CSNZMLCcbN3C0E1KdiDyPakIrPimyKzxUk9lAoFCkRI1EWHSn7
	iWZahVhypQIg12lp0WnSGOdwxBbFO23JR232SkUrifnWybgegUK7by8Ux8y58Qt//KnU
	gIsw==
X-Gm-Message-State: ALyK8tIFBIgUKitJKweR/daJNvWZfXPNHSVV75Y90K9wfAduaFzjPzLyIVOR6BIf/lGVabwCvrJgfTyGA68mQ0bK
X-Received: by 10.107.135.161 with SMTP id r33mr9561359ioi.133.1468009041756; 
	Fri, 08 Jul 2016 13:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Fri, 8 Jul 2016 13:17:02 -0700 (PDT)
In-Reply-To: <b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jul 2016 21:17:02 +0100
Message-ID: <CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Fri, 08 Jul 2016 20:17:22 -0000
Content-Type: multipart/alternative; boundary=001a113ecf5c761b350537257d4a

--001a113ecf5c761b350537257d4a
Content-Type: text/plain; charset=UTF-8

On 7 July 2016 at 16:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> +do_compile_append() {
> +    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
> +}
> +do_install_append() {
> +    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
> +}
>

Is this actually required?  The setuptools class should be doing all the
magic, and this appears to be building and installing an egg, which we
generally try not to do.

Ross

--001a113ecf5c761b350537257d4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2016 at 16:39, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4hm" cla=
ss=3D"a3s aXjCH m155c60503c651065">+do_compile_append() {<br>
+=C2=A0 =C2=A0 ${PYTHON} setup.py -q bdist_egg --dist-dir ./<br>
+}<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/<=
br>
+}</div></blockquote></div><br>Is this actually required?=C2=A0 The setupto=
ols class should be doing all the magic, and this appears to be building an=
d installing an egg, which we generally try not to do.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf5c761b350537257d4a--
