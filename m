Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D5BC001B2
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 11:49:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11247.1671191346898113929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 03:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DR0rPH3f;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1671191347;
  x=1702727347;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=tyINQZgFwUVtdM7ir5IiDDdyB3Zi10VDLZbsfHWvQVA=;
  b=DR0rPH3fQ6UMNBPU3yZ3Vw15fuQHtUV6UVWC7/MIn3cjML5gN+qzHRt3
   Ev/v3zxHhZrzf6i06t8nt9iDZSXQQmuEAy+O5+0AY459A3W/jgb1kh5OH
   SDuugFPeJiDErffqVIdsQx5kFaP1k1QMUHkAmuS1M4PPexBzN9RipBqw7
   xuTyn2t7wVSQtghhJc3NKsChGkLqlEEaS0HsOjLQHMSPVQ8TH4Z5nFTnF
   8KrWdxVA2kOCkf+TOSTrsvjiAQrPGqV3SuSWjQbeKKbgYGYCVr062XuC+
   eDJ6leqpKz6T2X1/728Af37x9DMWcDswiS/um7SJJO7tFWHJQpzE7HjTs
   g==;
References: <20221216114650.854563-1-olani@axis.com>
User-agent: mu4e 1.8.8; emacs 29.0.60
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ola x Nilsson <Ola.x.Nilsson@axis.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] v2: Y2038: Sanity checker for non-64-bit time and
 file functions
Date: Fri, 16 Dec 2022 12:47:50 +0100
Organization: Axis Communications AB
In-Reply-To: <20221216114650.854563-1-olani@axis.com>
Message-ID: <jwqwn6ra7ri.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 11:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174740


On Fri, Dec 16 2022, Ola x Nilsson wrote:

> v2:
>
> Renamed conf/distro/time64.conf -> conf/distro/time64.inc
> Use SITEINFO_BITS to select when to apply GLIBC_64BIT_TIME_FLAGS.
>
>
> I did not add _LARGEFILE to the option yet as I do not believe it is
> the right place.
> The _TIME_BITS=64 and _FILE_OFFSET_BITS=64 option redefine types and
> functions.  The _LARGEFILE* options add new types and functions.  The
> purpose of the time64.inc file is to enforce the redefinition of
> time_t and other types in code that has not bothered before.  The
> _LARGEFILE* options should probably only be used by code that has
> explicitly chosen to use these glibc extensions, possible configured
> by autoconf.

I'm working on time64 support in pulseaudio at the moment.  If anyone
else has started on pulseaudio I can move on to something else. 

-- 
Ola x Nilsson

