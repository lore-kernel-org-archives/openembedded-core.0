Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9ECCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 09:43:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.49861.1759138994265871829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 02:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=atFTj8SX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AE8E1A0FE2
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 09:43:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B867606AE;
	Mon, 29 Sep 2025 09:43:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B1BD102F185F;
	Mon, 29 Sep 2025 11:43:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759138991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFHQItH+sn28GKvIsNkJZK4lrXkahmfbpiP1lnVzdJ8=;
	b=atFTj8SXLW8Ezjd+9OxxKlxOsDQRXSbsWbxwoor77ZxKdnqNgm7Rsqye0vTTaJOgv3Qpdd
	1dBddMUktb/560TG6+PiaE7ZNzVCm64iBn1Ot+FhOvSmA9aQLYQPubfSc5Q9x9l/O7A9gC
	LV+j10pgEFV45p+g24t06BnGHLlLqFJ9OQkeLcZ84P2pKB+5CgHl/oXB9yo4SeFCmqCB1V
	jaZzubvS8tDtk+tVMhmgKK4bBhjr/lGRrtuHUw/dliZ+NbUgcgP8ASIFgrfkk/z9S1Qo6+
	pYMGRA5Lpv5QkAX72ybFVhTW4EQnkf2y8zBvldMYLbTXFQIAJsvnU8G33eEaSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 11:43:09 +0200
Message-Id: <DD56Q799T0XU.2IHLWJPP919QM@bootlin.com>
Subject: Re: [OE-core] [PATCH] sanity: Update minimum gcc version to 10.1
Cc: <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Yoann Congal" <yoann.congal@smile.fr>
References: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
 <CAMSfU+5b1Dd2fohNSgs1pT-9By8cPkv-HLpg3BoO0cveY_78Qg@mail.gmail.com>
 <DD559WH6JH42.39SI3VILMNKY4@bootlin.com>
 <CAMSfU+6KD=iLNmqz2KcX47KFXGsn6AVv5HEkWrJbwyiNphYGzA@mail.gmail.com>
In-Reply-To: <CAMSfU+6KD=iLNmqz2KcX47KFXGsn6AVv5HEkWrJbwyiNphYGzA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 09:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224131

On Mon Sep 29, 2025 at 10:43 AM CEST, Yoann Congal wrote:
> Le lun. 29 sept. 2025 =C3=A0 10:34, Antonin Godard <antonin.godard@bootli=
n.com>
> a =C3=A9crit :
>
>> On Mon Sep 29, 2025 at 10:25 AM CEST, Yoann Congal via
>> lists.openembedded.org wrote:
>> [...]
>> >> -# Require at least gcc version 8.0
>> >> -#
>> >> -# This can be fixed on CentOS-7 with devtoolset-6+
>> >> -# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
>> >> +# Require at least gcc version 10.1
>> >>  #
>> >>  # A less invasive fix is with scripts/install-buildtools (or with us=
er
>> >>  # built buildtools-extended-tarball)
>> >>  #
>> >>  def check_gcc_version(sanity_data):
>> >>      version =3D oe.utils.get_host_gcc_version(sanity_data)
>> >> -    if bb.utils.vercmp_string_op(version, "8.0", "<"):
>> >> -        return "Your version of gcc is older than 8.0 and will break
>> >> builds. Please install a newer version of gcc (you could use the
>> project's
>> >> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>> >> +    if bb.utils.vercmp_string_op(version, "10.1", "<"):
>> >> +        return "Your version of gcc is older than 10.1 and will brea=
k
>> >> builds. Please install a newer version of gcc (you could use the
>> project's
>> >> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>> >>
>> >
>> > While you are modifying this line could you make the version a single
>> > variable instead of repeating it twice? (I know I would forget to upda=
te
>> > the one in the message -_-')
>>
>> Hi Yoann,
>>
>> This is not limited to this test, I think most of the check_*_version te=
sts
>> could benefit from that improvement. Maybe it's more relevant to have a
>> separate
>> patch for this improvement, instead of just here?
>>
>
> Yes, agreed, do you want me to send it?

Sure, it's your idea, please take the credit. :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


