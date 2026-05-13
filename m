Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAA3CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:51:31 +0000 (UTC)
Received: from mailer29.gate185.sl.smtp.com (mailer29.gate185.sl.smtp.com [192.40.185.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5842.1778673777441944167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 05:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=ZKu/uSMH;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=iX6EP1wR;
 spf=pass (domain: centricular.com, ip: 192.40.185.29, mailfrom: nirbheek@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.156] (unknown [10.138.12.92])
	by mtl-mta01-out1 (Halon) with ESMTP
	id 13ad648a-80ca-42e2-8eb6-0f4798fe6588;
	Wed, 13 May 2026 12:02:56 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app-swarm-manager-2)
 with SMTP id ec2e349b-38fd-4c0b-a0f0-84b47fb24e81  for
 openembedded-core@lists.openembedded.org;
  Wed, 13 May 2026 12:02:35 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id ec2e349b-38fd-4c0b-a0f0-84b47fb24e81;
	Wed, 13 May 2026 12:02:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDD309CAC1;
	Wed, 13 May 2026 14:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1778673749;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6NtgBuW5ZT3da2QjCtTX8WtBMa6PMkEuuy1xfamtH8=;
	b=ZKu/uSMHg/oPgvYCcORAMy62tnCxxpzwoPTL4YZ/8/nN2WkxDIF4/LgmrWUMSYiivKlZBU
	MF8irJw8MykOtSPGQilwpCi8flUsGmVzL37i7HodIc6/x4wNYsp8jk1RceNm4ZPqP/xn0O
	m9/T1nqOAKNK7982LHFzc+igRWebsNl4yjZ41Yfde2d/E+nM3VTebp9hDHW0I+pcdLhM/b
	A1oHpdRL+8UGBLRUaCnfHJxAQJkb56AshlT4zHRaD4xik6Vce089PuaIbNCDFnIIzkKT51
	hu5onMedF39Zmbj3P6fR0tIQMPeXGgteBlv76ltYUwYiqw40b7BuPr0Yuh3czQ==
Message-ID: <f30852d76ecd85f3f437f508ccbbb2591f410353.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
From: Nirbheek Chauhan <nirbheek@centricular.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: tarun@centricular.com, openembedded-core@lists.openembedded.org,
	sebastian@centricular.com
Date: Wed, 13 May 2026 17:32:12 +0530
In-Reply-To: 
 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <20260513071155.1215141-1-tarun@centricular.com>
	 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
	 <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
	 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: ec2e349b-38fd-4c0b-a0f0-84b47fb24e81
X-SMTPCOM-Message-ID: 2de5b8b4-50fb-4501-a506-8bdcab8aec4e
X-SMTPCOM-Payload: 
 T_mfLGdZ2LTWX9B8NyUA8jgOdr84JioEEfo6opf84mnfnowauM-vdyigaQhQsmJ-qDcgK24rhWkKHaP2TFtbPdoJoAhuR_qEf_yHCfY92xTZPjwTkhAhrxTfmcLigqFrvEXhOpZikW0mFaCqF-LPpVSTpaF3yEdq3BkXBJEzk05D5l2A1Dry64BpT0NdD5xU7jKeHMoZREsAZ8VrL6B8Cw==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=2de5b8b4-50fb-4501-a506-8bdcab8aec4e_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=2de5b8b4-50fb-4501-a506-8bdcab8aec4e&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1778673769;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : content-transfer-encoding :
 mime-version : list-unsubscribe : list-unsubscribe-post : subject :
 from : to : cc : date;
 bh=k6NtgBuW5ZT3da2QjCtTX8WtBMa6PMkEuuy1xfamtH8=;
 b=iX6EP1wR1rgiQt5kNFkGcGmLE8c6guVQZ9NwmHNGtTZRh1BbojqOjKfK6348smbM9/QmN
 LTXOeTMdFt1AFPJTyn/eU3bLwGur8fZZEz0q+HPTqVXWdYaHrf6VItJ4Nc2hdBxmLiHOj2+
 4heOzz7Z1G1Xg3fCAPbXDR4G7z+a2UIAK58fjTruja3Qe+qxtPsuAtLDgdycwxeesDcwNqs
 RIzPl2Uhs0xU/Ggd0aBGXlBbS3UkfdPrqgMPkAy3SqCgJp/o0c908k+k3YtsjQRmvsYWpxy
 ckhaO3imyhgGQi1Cv55DXW7Lfs2rokmor1l56hnfCkXD4MW9/cqbMSCnTlrQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236970

On Wed, 2026-05-13 at 13:45 +0200, Alexander Kanavin wrote:
> I meant something else: the items in this list:
>=20
> SRC_URI =3D " \
> +=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gst-plugins-
> rs;protocol=3Dhttps;branch=3D0.15;name=3Ddefault
> \
> +=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk4-
> rs;protocol=3Dhttps;branch=3D0.11;name=3Dgtk4-rs;destsuffix=3Dgtk4-rs
> \
> +=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk-rs-
> core;protocol=3Dhttps;branch=3D0.22;name=3Dgtk-rs-core;destsuffix=3Dgtk-r=
s-
> core
> \
> +=C2=A0=C2=A0=C2=A0 git://github.com/rust-
> av/ffv1.git;protocol=3Dhttps;nobranch=3D1;name=3Dffv1;destsuffix=3Dffv1
> \
> +=C2=A0=C2=A0=C2=A0 git://github.com/rust-
> av/flavors;protocol=3Dhttps;nobranch=3D1;name=3Dflavors;destsuffix=3Dflav=
ors
> \
> +=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gstreamer-
> rs;protocol=3Dhttps;branch=3D0.25;name=3Dgstreamer-rs;destsuffix=3Dgstrea=
mer-
> rs
> \
> +"
>=20
> all should be built with separate recipes. The plugins themselves
> don't need separate recipes, but the resulting plugin binaries should
> be put into separate target packages, same as the classic
> base/good/bad/ugly plugins are. The recipe isn't doing that yet.
>=20

Unfortunately, that's not how Rust works :(

Rust doesn't have a stable ABI, so all external Rust dependencies
(crates) of a Rust project must be compiled from-source when building
the project. The object files will be linked into the final binary
(library, plugin, or executable), and the unnecessary sections will be
GC-ed on LTO.

Yes, this means each plugin has its own copy of gtk-rs, gstreamer-rs,
and other common crates. The reasons for this are complicated:

https://viruta.org/rust-stable-abi.html#rust_does_not_have_a_stable_abi

If you see the librsvg recipe, it does the same thing. Tarun is going
to change these git repo URLs to also use crates.io links in V3.

Cheers,
Nirbheek

