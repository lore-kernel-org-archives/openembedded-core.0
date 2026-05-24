Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A53CD4F54
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 08:35:19 +0000 (UTC)
Received: from mailer163.gate185.sl.smtp.com (mailer163.gate185.sl.smtp.com [192.40.185.163])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1403.1779588163945265509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2026 19:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=r4/IOwLO;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=kibTnYtO;
 spf=pass (domain: centricular.com, ip: 192.40.185.163, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.128] (unknown [10.138.12.203])
	by mtl-mta02-out1 (Halon) with ESMTP
	id fb3c5254-eff6-4985-9747-016381520011;
	Sun, 24 May 2026 02:02:43 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-3) with SMTP id
 623912ca-ad75-404d-a41b-dcfc20a7aaa0  for
 openembedded-core@lists.openembedded.org;
  Sun, 24 May 2026 02:02:31 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id 623912ca-ad75-404d-a41b-dcfc20a7aaa0;
	Sun, 24 May 2026 02:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33C209CB0D;
	Sun, 24 May 2026 04:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1779588149;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B+HPjdG4CwnTH+3UeAcJHLnRL88DDzQTlteGNOrXlOU=;
	b=r4/IOwLO3d0IdYF9OcuvL1fqA7wHCp6bqm+Nd9v4wxYh9EVMp+sZEwhoWvtZ4+2EZ9M+gA
	GZRUt5vw8wfiJzlT1YHyR3Orp8OFTShwnMk/dFxOcsNwtrLd/yp/Z93jA5C68WqnWgKZW/
	Bvcb97xkEFkhmAWgj91IsIh6/x+yWIUIh4sIMcWqkDG8CWmlUeL+4cJyTbpnL7V+XYGW/J
	B2avEqQ7zkzQTacu97UTxNnc/IyoOAJcowm21a22hSLY6DTKJ8pIW8FwtNFp7eOrWBkt1V
	1pSOid8tFJsChHDPCh+TLZqcitBgRWtGYpaZWdzxOHV9t3dsix8wJLaN5+9sqA==
Message-ID: <01d286fdf64dedc49f10f7119d42e292adf224ea.camel@centricular.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "sebastian@centricular.com" <sebastian@centricular.com>,
 "nirbheek@centricular.com"
	 <nirbheek@centricular.com>
Date: Sun, 24 May 2026 07:32:24 +0530
In-Reply-To: 
 <DB5PR02MB10213BD65229D53D15895FD37EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260511133450.50595-1-tarun@centricular.com>
		 <DB5PR02MB10213B7E2D21553836D68AAE2EF392@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <9aa88cfb4590219b93894806744c6de5bd5b0481.camel@centricular.com>
	 <DB5PR02MB10213BD65229D53D15895FD37EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 623912ca-ad75-404d-a41b-dcfc20a7aaa0
X-SMTPCOM-Message-ID: 1ada8edb-38fe-4229-ac49-3dff55cb36fe
X-SMTPCOM-Payload: 
 N4u-dSh45KoCBbYQps0PGHrB7Zq2Xvu5urEVTVhr2N-LQLr6edi59qKGlqaPuEhID6jmkTGlKTW8M3vDL3ojYaM1fPkstfh4J0O0sxNJtbIZYbhMSYJeBLA2VA_J4T__fN-BzC83YEn8ezIvKKd1dcBgUi5gPesXPYRtRGU63i2k9j-RgaSJGbyqTxAFGGSxHsegEcSJynKdbR4AeZbetQ==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=1ada8edb-38fe-4229-ac49-3dff55cb36fe_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=1ada8edb-38fe-4229-ac49-3dff55cb36fe&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1779588157;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=2A7+IExO+pbU3/IJHiVPY0o7+RfRNUsQGmK5pcuMF9M=;
 b=kibTnYtOSXVZmZg1h6pu03ZupcKB6CwqzCpPKG2p5FqDwgE0ZFdGLmM1Vsv6F//VfNS6s
 5PR74KpH17Kdlu836DFRjHW/KBjGSfhDx7u+gSSz+TgU00/CgKP5SW1SZqYZgFvQD1e8Eka
 VnHkUvyNCll9HLbmr3GVqPlpwb6rVQXIEJPqu/D7W6aMFwmDoZDcXOt0qtdGJKr9eYzbVPI
 HhXOQQECIfiAQwnRVoEuB8MwwXtgwtw4KN7P0JwX6wm8Ly0oAQ5+QyKVs6I2zptb3IF9ZJ5
 5T0c2raiOGyHf/ohsmgOwzIBqMl1F1pq3nKaZ3M7OdAqmExZCr/VwZ+T0k8Q==
Content-Type: multipart/alternative; boundary="=-cHGKaArlNU8549Ul6tYC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237564

--=-cHGKaArlNU8549Ul6tYC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 2026-05-13 at 07:56 +0000, Peter Kjellerstedt wrote:
> Are the plugins built as single binaries, or is it one binary containing =
all plugins?

The plugins are built as single binaries.

>  If it is separate binaries, then=0D  being able to install plugins indiv=
idually is very important when you have multiple products being built from =
the same code base, but with different needs for which plugins they need. F=
lash size is unfortunately a limited resource, especially with today=E2=80=
=99s=0D  memory prices. Otherwise we will have to make the recipe machine s=
pecific, which I=E2=80=99d rather avoid. =20

Agreed. I have made changes in the latest patch (V3) and each plugin is dec=
lared as a PACKAGE now. So I think these packages can grouped together into=
 multiple PACKAGEGROUPS for different images. Please let me know if I am mi=
ssing something.

Thanks,

Tarun=0D=20=0D

--=-cHGKaArlNU8549Ul6tYC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Peter,</p>
<p>On Wed, 2026-05-13 at 07:56 +0000, Peter Kjellerstedt wrote:</p>
<blockquote type=3D"cite">
<p>Are the plugins built as single binaries, or is it one binary containing=
 all plugins?</p>
</blockquote>
<p>The plugins are built as single binaries.</p>
<blockquote type=3D"cite">
<p>If it is separate binaries, then
being able to install plugins individually is very important when you have =
multiple products being built from the same code base, but with different n=
eeds for which plugins they need. Flash size is unfortunately a limited res=
ource, especially with today=E2=80=99s
memory prices. Otherwise we will have to make the recipe machine specific, =
which I=E2=80=99d rather avoid.</p>
</blockquote>
<p>Agreed. I have made changes in the latest patch (V3) and each plugin is =
declared as a PACKAGE now. So I think these packages can grouped together i=
nto multiple PACKAGEGROUPS for different images. Please let me know if I am=
 missing something.</p>
<p>Thanks,</p>
<p>Tarun</p>

--=-cHGKaArlNU8549Ul6tYC--

