Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548DDC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 20:11:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.678.1693426252711999613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 13:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Spri1LJl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401ec23be82so719585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693426251; x=1694031051; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBS44frQzItlpzq36XZtUxaVCzciO4ThFlJGAtF8/TI=;
        b=Spri1LJlQ2s4ld8iZv2WkRr2yfqd+yW5U903TOPLvngy44iGKuBvYOzINJj6Agyivn
         XOwYchwVVbtW83wIdgTCbRUXp0WQFWoLgTYcdEXt07/5vdQkVChMetuU/j+IH2eIoOjM
         noMdKiN7Gz5J3OkcLVxsoxa88neL0lIhFh1AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426251; x=1694031051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zBS44frQzItlpzq36XZtUxaVCzciO4ThFlJGAtF8/TI=;
        b=YEVZKKpyFMwWBWIr/ooHYdt0NX6j4B0WGUIQ69LWNxpsfi6PBiALYvzZ4BVk3dO8Eg
         ZiS71zGIOzY3NPJFkkWb6kQGHpzjNo9jGP/yl7Q2dm4xLfWxoIfX+YKEzxFgiKze0cjP
         MDs+OaoTxd5MBZd+jtNlMCsivXqDRJ1b/8c+j9zaCGwEfE3qcMPiiENr92+Y1q1d1uoM
         bGt3QCHwhbdTvsEoR3WkPZXZDcz8bn9TDIhQnGdeVzhmUL5tk/8L+rRfVTs5rHDFkzJw
         ESJWFPAZ4xu8sfqCpB8jjzeu2zX5lBpVJkdItvaRtwT9d6OX8mj5wQPfumnHPIJmtmnA
         1pKg==
X-Gm-Message-State: AOJu0Yy7USczChtbpuPWPIZKQUybRJHlREimZrRKxkO1722jdnVQrUBB
	XDeFGKN5N98NVPLyHHtgpWM/oU3pObznJf6o3mo=
X-Google-Smtp-Source: AGHT+IErhcwzK2vt0wVj7lS4ixDo51MWvcQAEf5OnxYOjFtrajCLy2DImo+9lKU9lYCh3TnLdJt09A==
X-Received: by 2002:a05:600c:3658:b0:3fe:f45:772d with SMTP id y24-20020a05600c365800b003fe0f45772dmr2478129wmq.28.1693426251050;
        Wed, 30 Aug 2023 13:10:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22b:9179:6474:7878? ([2001:8b0:aba:5f3c:22b:9179:6474:7878])
        by smtp.gmail.com with ESMTPSA id t18-20020a7bc3d2000000b003feef82bbefsm3162700wmj.29.2023.08.30.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:10:50 -0700 (PDT)
Message-ID: <3f421bfedaad2abb8f8f8d858e2fad0be8c546e7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd
 with man
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 21:10:49 +0100
In-Reply-To: <17804216F153645F.29905@lists.openembedded.org>
References: <20230830123912.2052665-1-pidge@baylibre.com>
	 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
	 <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
	 <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
	 <66ee8cdb-967d-ced7-8247-53a38416b708@baylibre.com>
	 <17804216F153645F.29905@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186925

On Wed, 2023-08-30 at 21:08 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2023-08-30 at 18:07 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> > On 30/08/2023 15:08, Richard Purdie wrote:
> > > On Wed, 2023-08-30 at 15:04 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlanna=
g=C3=A1in wrote:
> > > > On 30/08/2023 14:19, Richard Purdie wrote:
> > > > > On Wed, 2023-08-30 at 12:39 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhl=
annag=C3=A1in wrote:
> > > > > > [YOCTO #15023]
> > > > > >=20
> > > > > > In this instance (do_populate_sdk with api-documentation turned=
 on),
> > > > > > pseudo is going to end up finding the passwd/groups files in
> > > > > > recipe-sysroot-native which is incorrect and does not have man.=
 The
> > > > > > solution here should be to ensure that pseudo points to the pas=
swd/groups
> > > > > > files in recipe-sysroot (which does have man:man).
> > > > > >=20
> > > > > > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pid=
ge@baylibre.com>
> > > > > > ---
> > > > > >    scripts/postinst-intercepts/update_mandb | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/scripts/postinst-intercepts/update_mandb b/scripts=
/postinst-intercepts/update_mandb
> > > > > > index a061bb426a6..6bc073bfff5 100644
> > > > > > --- a/scripts/postinst-intercepts/update_mandb
> > > > > > +++ b/scripts/postinst-intercepts/update_mandb
> > > > > > @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L =
$D $D${bindir}/mandb --config-file $C
> > > > > >   =20
> > > > > >    rm -f $CONFIG
> > > > > >   =20
> > > > > > -chown -R man:man $D${localstatedir}/cache/man/
> > > > > > +PSEUDO_PASSWD=3D$D chown -R man:man $D${localstatedir}/cache/m=
an/
> > > > >=20
> > > > > Is there a more general problem here? Wouldn't this issue apply t=
o
> > > > > other postinst scripts too?
> > > >=20
> > > > Yes and No. The other postinst scripts if they do attempt to chown,=
 are
> > > > trying to do it for root:root (which recipe-native-sysroot's passwd=
 and
> > > > groups obviously have). We could add this to the others as well, ju=
st to
> > > > maintain consistency.
> > > >=20
> > > > This is all because in image.bbclass, we're setting PSEUDO_PASSWD t=
o
> > > > STAGING_DIR_NATIVE which I believe normally should be correct, exce=
pt in
> > > > an instance like this.
> > >=20
> > > image.bbclass sets it to:
> > >=20
> > > meta/classes-recipe/image.bbclass:PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}:=
${STAGING_DIR_NATIVE}"
> > >=20
> > > so it should look at IMAGE_ROOTFS first, which I think is the same as
> > > $D here?
> > >=20
> > > Something isn't quite adding up...
> >=20
> > In this case, IMAGE_ROOTFS and D are not the same, either at the start=
=20
> > of do_populate_sdk or when the postinst script runs:
> >=20
> > bitbake -e yields:
> >=20
> > IMAGE_ROOTFS=3D"/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/c=
ore-image-base/1.0/rootfs"
> >=20
> > Passing IMAGE_ROOTFS into the update-mandb postinst scripts yields this=
:
> >=20
> > D=3D"/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-b=
ase/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/core2-64-po=
ky-linux"
> > IMAGE_ROOTFS=3D"/home/pidge/poky/build/tmp/work/core2-64-poky-linux/eud=
ev/3.2.12/rootfs"
> >=20
> > Even if we were relying on an IMAGE_ROOTFS that pointed to what we=20
> > expected, it is probably the wrong option here because there is no=20
> > assurance it's populated with a passwd file when we run bitbake=20
> > core-image-base -f -c do_populate_sdk. I've checked on my setup and hav=
e=20
> > verified that it doesn't contain anything at that stage.
> >=20
> > In my patch $D is actually set to ${SDK_OUTPUT}/${SDKPATHNATIVE} (not=
=20
> > recipe-sysroot, I'll correct this in the log) which incidentally is als=
o=20
> > the same place we're running mandb from.
>=20
> This might hint at the real issue :)
>=20
> If this is during do_populate_sdk, it is worth noting that the SDK
> doesn't have file ownership, either for the nativesdk components or the
> target ones. This therefore shouldn't be running in that context at
> all!

Have a look at=C2=A0

https://git.yoctoproject.org/poky/tree/scripts/nativesdk-intercept/chown

The real question is why that doesn't change man:man (or whatever) to
root:root...

Cheers,

Richard


