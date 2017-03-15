Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 148A971CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 11:05:58 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id y76so9625515qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rYszW/vcPQF6Co0WTnDRKIt+5/+JPpIDUqxEEPU5MDM=;
	b=dOLkRTxS9MwEMXvNWU8nfQzqdd2gteCbZUcfLpzN18vnh40971qNp/ce4zBq+K7sBc
	AzeXTlQrbTCsr88RBCJN+ND1MDshAfANDwvW6pc1Af/FOWltuM4NLnhOEJXfMK+ff/w3
	mXwDGeRPoaQ4UWL7QSIAoClhRCquAgsNwHrq2TMHkE0RR3Bx0aWH09Sp8kSPWFRXKQJs
	qZ+EylpOqtPDcmZ8aSUEa61tHIiyEQzOxgMIAkqJeAyYbyCNAPn+oGjK518SlIG7D9ym
	SNK0+dfK+UzEYEwPnEGAsDZZtKvxcc0cpLeQqCyd41smkBb/1mLtHxK2WXr2lCKfNUjh
	fC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rYszW/vcPQF6Co0WTnDRKIt+5/+JPpIDUqxEEPU5MDM=;
	b=Wt3gf0bEWHkpxcGvuzubrDTalnosBL/2WnAX+L1ApMvx0wD5YM/Dx3i+JMfFdUmlPM
	Kzg4vU7p54WZBJdBg+U1mzbZcIXGxw8IazBR9JzL2ut1mYkO+fCqh2bIUPzNNFTUIGAf
	TXSxfKxTtflgpwCl99WnKuMBOWZ2g3W6TxJSaulinMDXK3v4gb97YZXLBCNifLUrTTuD
	0e6xvigGepWMGb2/fHTZVdjJlxjNF3824on6jaVJcCVyJjYbubKAVzZNKy9fEeUUVQbc
	KApDZ2/aEmZwjURce+UHnr9/ZFWsXYJFuE+MAGsezDHksOlwiTp1Ei6hMpCGSqA4XSkK
	I9NA==
X-Gm-Message-State: AFeK/H2C6dXBffgN5xpkCoODrTD7sErBAq+jEjHiItJYzQJGi0IwSIBf152AqQDItsJz7tqqPY/2axjtLzAZ41iL
X-Received: by 10.55.175.195 with SMTP id y186mr2055470qke.26.1489575959709;
	Wed, 15 Mar 2017 04:05:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 15 Mar 2017 04:05:39 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
References: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Mar 2017 11:05:39 +0000
Message-ID: <CAJTo0LZm4zR2f+2Wgvab0=dhdP-Mu-cDGihqh2_hnVvuaOVGmg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what shell programming constructs can we count on in .bbclass files?
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
X-List-Received-Date: Wed, 15 Mar 2017 11:06:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093cf20d32054ac2ed78

--94eb2c06093cf20d32054ac2ed78
Content-Type: text/plain; charset=UTF-8

On 15 March 2017 at 10:44, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   what shell (or level of POSIX compatibility) does one assume for
> writing shell functions in .bbclass files?
>
>   i'm looking at kernel-fitimage.bbclass and i see this:
>
>   #
>   # Step 7: Sign the image and add public key to U-Boot dtb
>   #
>   if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
>
> surely we don't still need to use that ugly "x" prefix hack for string
> comparisons, do we?
>
>   a bit further down:
>
>   do_assemble_fitimage_initramfs() {
>         if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
>                 test -n "${INITRAMFS_IMAGE}" ; then
>
> would it not be equivalent to write that second test as:
>
>   [ -n "${INITRAMFS_IMAGE}"]
>
> and so on. what are we allowed to count on?
>

xFOO = xBAR appears to be a long-standing hangover from the 70s, any POSIX
shell should be safe with quoted instead.

Our shell parser *should* be POSIX compliant.  There are a few places where
it isn't, but I believe those should be considered bugs.  At the end of the
day the shell is actually executed by /bin/sh or /bin/bash anyway, so as
long as bitbake can parse it you can use anything.

Ross

--94eb2c06093cf20d32054ac2ed78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 March 2017 at 10:44, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3gk" cla=
ss=3D"a3s aXjCH m15ad192f36ca4fe8">=C2=A0 what shell (or level of POSIX com=
patibility) does one assume for<br>
writing shell functions in .bbclass files?<br>
<br>
=C2=A0 i&#39;m looking at kernel-fitimage.bbclass and i see this:<br>
<br>
=C2=A0 #<br>
=C2=A0 # Step 7: Sign the image and add public key to U-Boot dtb<br>
=C2=A0 #<br>
=C2=A0 if [ &quot;x${UBOOT_SIGN_ENABLE}&quot; =3D &quot;x1&quot; ] ; then<b=
r>
<br>
surely we don&#39;t still need to use that ugly &quot;x&quot; prefix hack f=
or string<br>
comparisons, do we?<br>
<br>
=C2=A0 a bit further down:<br>
<br>
=C2=A0 do_assemble_fitimage_<wbr>initramfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if echo ${KERNEL_IMAGETYPES} | grep -wq &quot;f=
itImage&quot; &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;${INI=
TRAMFS_IMAGE}&quot; ; then<br>
<br>
would it not be equivalent to write that second test as:<br>
<br>
=C2=A0 [ -n &quot;${INITRAMFS_IMAGE}&quot;]<br>
<br>
and so on. what are we allowed to count on?<br></div></blockquote></div><br=
>xFOO =3D xBAR appears to be a long-standing hangover from the 70s, any POS=
IX shell should be safe with quoted instead.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Our shell parser *should* be POSIX c=
ompliant.=C2=A0 There are a few places where it isn&#39;t, but I believe th=
ose should be considered bugs.=C2=A0 At the end of the day the shell is act=
ually executed by /bin/sh or /bin/bash anyway, so as long as bitbake can pa=
rse it you can use anything.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--94eb2c06093cf20d32054ac2ed78--
