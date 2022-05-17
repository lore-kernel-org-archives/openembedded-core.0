Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23460C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 07:32:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.4456.1652772751582792881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 00:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OAYkX7rr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id g17so5306348wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 00:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=VxZFhSeDiVydcj4uEKC3xVZ8A/IvTvNqRp3zpiSV5vI=;
        b=OAYkX7rrKRCzSH6r2lED7TJOsE6/5jBi/APgrhyYSsaDtesf57kQ4IqxLCJj1bV5eK
         hcQJH/y+1hKQ8Mll1mxq28+8dBm9F8kWPkxIJgk/18oYNuGQgwYbwhWsM5ixIUjyU7NW
         TGM3ajzhJYtSMxkEfEWcpCtMn1X6fmBHOJoRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=VxZFhSeDiVydcj4uEKC3xVZ8A/IvTvNqRp3zpiSV5vI=;
        b=0f3STc7wvAXffpWWh6tnAfQwZ3hsPEW44izf/8iydJIiA6aGpZd67+FHZ5vDb725Ni
         KxQhy9DjqaBfw4Cx7xOfBq0LOyNoK3G4GzyBs0qNJs0YdhFI81wRuvrZim21IaZ7EAuW
         gWC8rbEjM8Zztuk6h8jFsLRcZ2jNDz/t1OxnjN6sKNx2TLDTPp3J5rFZZlLd6l/gonTZ
         48KIAWb79+DphJVL083tokNpSYCS5FGMS891VwK1CJbA/eEQo32K+W56BhnnOQIxdUQv
         nr5Yepmp5+FCIoTtqjMya894J2Y6lEuZwrwwWxysEkNu2GvEzzHW416ob4k/vF+5VcKm
         3EIA==
X-Gm-Message-State: AOAM531PKf8Y61wFQNOKnaEGfcIzsn0XMQrOj5AfVnaUUwFjC3/iXHs0
	nIhqwBRgOrPgv3k9oUP2Vi1Pp4TJmnJvkkVu
X-Google-Smtp-Source: 
 ABdhPJwSCXkhdteTa/GrbLiA2pmHUu9vIQzjPSgDHtDucJtcnQpr/vi1h/TG1z1EcK0yC5NnX8FeJw==
X-Received: by 2002:a5d:598c:0:b0:20c:6912:6870 with SMTP id
 n12-20020a5d598c000000b0020c69126870mr17228465wri.465.1652772749844;
        Tue, 17 May 2022 00:32:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9c35:e819:58b3:2e94?
 ([2001:8b0:aba:5f3c:9c35:e819:58b3:2e94])
        by smtp.gmail.com with ESMTPSA id
 j8-20020adfb308000000b0020d0cdbf7eesm3700606wrd.111.2022.05.17.00.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:32:29 -0700 (PDT)
Message-ID: 
 <3b2685854aa1b08583247b6144e5668332508499.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt
 manpage
From: richard.purdie@linuxfoundation.org
To: "Li, Changqing" <Changqing.Li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2022 08:32:28 +0100
In-Reply-To: 
 <SN6PR11MB255785E91DAB262B87A46FBD82CE9@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220516104207.1734099-1-changqing.li@windriver.com>
	 <4e640d6e43aae9a6be851539f6ddbb7882b82a62.camel@linuxfoundation.org>
	 <SN6PR11MB255785E91DAB262B87A46FBD82CE9@SN6PR11MB2557.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 07:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165709

On Tue, 2022-05-17 at 02:27 +0000, Li, Changqing wrote:
>=20
>=20
> From: richard.purdie@linuxfoundation.org
> <richard.purdie@linuxfoundation.org>
> Sent: Monday, May 16, 2022 6:54 PM
> To: Li, Changqing <Changqing.Li@windriver.com>;
> openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] squashfs-tools: always install
> prebuilt manpage=C2=A0
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >=20
> > When other feature enabled, and involve help2man into squashfs-
> > tools's
> > recipe-sysroot-native, install-manpages.sh will run target binary
> > on
> > build host, eg: mksquashfs --help, which will cause error.
> > Eg:
> > =C2=A0 ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6:
> > version `GLIBC_2.34' not found (required by ../squashfs-
> > tools/mksquashfs)
> > > help2man: can't get `--help' info from
> > > /tmp/tmp.pEG5R8COVb/mksquashfs.sh
> > > Try `--no-discard-stderr' if option outputs to stderr
> > > ./mksquashfs-manpage.sh: help2man returned error.=C2=A0 Aborting
> > > ../generate-manpages/install-manpages.sh: Failed to generate
> > > manpage.=C2=A0 Aborting
> >=20
> > Fixed by always install prebuilt manpage, avoid running target
> > binary on
> > build host
> >=20
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>=20
> I'd much prefer not to carry a patch doing this. Which "other feature
> enabled" trigger this to happen?
>=20
> When=C2=A0=C2=A0meta-secure-core=C2=A0 is involved,=C2=A0 and DISTRO_FEAT=
URES=C2=A0efi-secure-
> boot and ima is enabled,=C2=A0=C2=A0
> in=C2=A0meta-signing-key/classes/user-key-store.bbclass,=C2=A0 it will ad=
d
> DEPENDS as following:
> DEPENDS:append:class-target =3D " \
> =C2=A0 =C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "sbsigntool-native", "", d)} \
> =C2=A0 =C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "libsign-native", "", d)} \
> =C2=A0 =C2=A0 openssl-native \
> =C2=A0 =C2=A0 ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "efitools-native gnupg-native", "", d)} \
> "
>=20
> and=C2=A0efitools-native=C2=A0 DEPENDS=C2=A0 on=C2=A0=C2=A0help2man-nativ=
e,=C2=A0 so all target
> depends on=C2=A0help2man-native.
> efitools's manpage also don't=C2=A0configurable.
>=20
> We might want to talk to upstream about making this configurable
> rather
> than carrying a patch, or we make sure help2man is never accessible
> to
> this recipe in some other way.
>=20
> I will talk to upstream about this first.

What would also probably help is adding help2man-native to
SSTATE_EXCLUDEDEPS_SYSROOT in layer.conf in OE-Core.

That runs the risk of triggering some build failures as it did when we
added pkgconfig-native there but is probably the right thing to do. It
would force recipes that want help2man-native to have an explicit
DEPENDS so we'd have to test and fix any recipes that needed that
adding.

Cheers,

Richard


