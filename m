Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D35A754B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:55:06 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r16-v6so56341153oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3Fc+sI+mzWOG5KdqQ54LlmldwfxqTnTJER36Tx9yyAM=;
	b=ajQmvN7QeyfSRhp6Zqj1k09EYPrQD1zwXcz7fq+5DBIorcfBNK8KTzNBZAfnwJbQfl
	SIaJ2+ijfdJ8YNlsdXXcYvrobC9I8AdzJW/gJYMc4HvYvJet6gi1yKnYnR0M8jTm0OBl
	TADFtnYr8c3Pvc3Pi13Z+WFoYNesxCPMRmFl5ThnHlN3/HdKelnwnFb+KtEB8TcfKpJy
	tkPd6Vzasrd4b+QqyODl8QVzwWR6iHvry1trvtUmdMjx7X8c3M0Ta6fXXqaesqDu/SP/
	GZXzjTzoOIk+XZls0WYk3n1qJEyj63YsotllRM9U1iD9J9w2BHhmCEDmIsd/PHH9LkM7
	9osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3Fc+sI+mzWOG5KdqQ54LlmldwfxqTnTJER36Tx9yyAM=;
	b=gjulF+PAKEA9guEaDeCYZ5dbfbKTt6n3ojtRfJlcXbI6fTRtF9zu7J/YZnyl8AdThp
	8boXpYkXfzdrttwGoBnxwy9YKvzJzLpOEiQNQ5hN3MKBeoFTCgCzZgqRal9uI4wtojEZ
	I6Ote4Ixmj91wstpSOTJ3wpfgvyKaenxlLvV2tin0paoT886Elmn/fOh449e5xLmmb8r
	VFqy5cG39NYFUqh6OdZKYhQwERgd8oNxd2WR7cU5WoCsj5Yha91iHD4c41MH1JE4wD//
	gQ7YfzCY6UU4H1bfPCLyH0jTjvfZjS22FEX7Q+9kyNQawI7ReS2iZtDFRsLJDSU3YNcg
	bO6Q==
X-Gm-Message-State: AOUpUlFaDvuH8th+trtR9z3tdAI/U2wyCvwm6XgqK0PkQl6w2q0Fgeh4
	N3MLdWmL8p8lnYo7YpUXS3W9jSriNgC2kRLxNlpxxQ==
X-Google-Smtp-Source: AAOMgpdracTM1li2nqsMP9fG/hj3GpUW8gv9r9qV4DiQUex+vtVn7sY1JKSLky9pQXQBt4Q+by/7Hr2KdHj3zHlPsnc=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr2785860oix.235.1531407308025;
	Thu, 12 Jul 2018 07:55:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:54:47
	-0700 (PDT)
In-Reply-To: <6169db63-d6a3-2953-5770-c7f29dbe67cb@pr.hu>
References: <cover.1522806183.git.akuster808@gmail.com>
	<e929e83164630add80ba28f44d1d34afc2f197c9.1522806183.git.akuster808@gmail.com>
	<6169db63-d6a3-2953-5770-c7f29dbe67cb@pr.hu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2018 15:54:47 +0100
Message-ID: <CAJTo0Lb+eHnDVa+QzVmhRUcAmUx3mddoRCevwO0NsWZBCGuLbQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/21] *proto: remove depricated xorg proto header recipes and replace by xorgproto
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
X-List-Received-Date: Thu, 12 Jul 2018 14:55:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess that tells us how many people actually use xcalibrate...

On 12 July 2018 at 15:07, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Openem=
bedded-core
<openembedded-core@lists.openembedded.org> wrote:
> Hi,
>
> 2018-04-04 03:49 keltez=C3=A9ssel, Armin Kuster =C3=ADrta:
>>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../xorg-proto/bigreqsproto_1.1.2.bb               | 16 ---------
>>   .../xorg-proto/calibrateproto/fix.patch            | 42
>> ----------------------
>
> ...
>>
>> diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>> b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>>
>> deleted file mode 100644
>> index ff8cb25..0000000
>> --- a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
>> +++ /dev/null
>> @@ -1,42 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Add missing length fields to the replies. Without these, sanity checkin=
g
>> in recent X
>> -breaks things.
>> -
>> -RP 11/2/10
>> -
>> -
>> -Index: git/xcalibrateproto.h
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/xcalibrateproto.h 2010-02-11 11:47:45.711985932 +0000
>> -+++ git/xcalibrateproto.h      2010-02-11 11:40:21.000000000 +0000
>> -@@ -67,13 +67,13 @@
>> -     BYTE    type;   /* X_Reply */
>> -     BYTE    pad1;
>> -     CARD16  sequenceNumber B16;
>> -+    CARD32  length;
>> -     CARD32  status;
>> -     CARD32  pad2 B32;
>> -     CARD32  pad3 B32;
>> -     CARD32  pad4 B32;
>> -     CARD32  pad5 B32;
>> -     CARD32  pad6 B32;
>> --    CARD32  pad7 B32;
>> - } xXCalibrateRawModeReply;
>> -
>> - #define sz_xXCalibrateRawModeReply    32
>> -@@ -92,13 +92,13 @@
>> -     BYTE    type;   /* X_Reply */
>> -     BYTE    pad1;
>> -     CARD16  sequenceNumber B16;
>> -+    CARD32  length;
>> -     CARD32  x;
>> -     CARD32  y;
>> -     CARD32  pad2 B32;
>> -     CARD32  pad3 B32;
>> -     CARD32  pad4 B32;
>> -     CARD32  pad5 B32;
>> --    CARD32  pad6 B32;
>> - } xXCalibrateScreenToCoordReply;
>> -
>> - #define sz_xXCalibrateScreenToCoordReply      32
>
>
> Haven't you just introduced an incompatible change by not adding the
> identical
> patch to [PATCH 17/21] xorgproto: add replacement for depricated
> calibrateproto ?
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

