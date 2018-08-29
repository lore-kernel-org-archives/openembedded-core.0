Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id C713578DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:22:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l82-v6so10502838oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qNZJFUghKKgJUF1ZeoaySbmbX0Rj9er38AarmXf/L9Y=;
	b=ZZbAOaZeA9FobZ++YUlfxz4t+CFq/Kxeio/J6uCUgy/p0l85NEwa3J8cSKZH4Z+9dD
	NqnHteOHPk2G35MiPV7OOGgRthNvwbqEVW/2CYGosIOBDP8bLwDw3omDsMaaDQiFDSgQ
	eMbt6eJNxrRejmnVY3U7/lF/LtCssw5gYUZESRoz+jisUJRl6WSF42teG6ousubDJN7s
	xG13wWez+IqVyYCJC0yl6nl7eNRh2sCOdAjGWpKvxdhjTSWaFkOzjRXo8DhlnZchs8XD
	j+fHUJXZuwp2SOqBDBaUhWA0nv270hgK8khyzlqpM7P6D7fCk6JUECyDKeesBtCM1E2c
	RJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qNZJFUghKKgJUF1ZeoaySbmbX0Rj9er38AarmXf/L9Y=;
	b=mrI2qvN6iaTYBZZIB5Xz0IIVZGfIw99CGo2UC0BvcQ1qPSwdjQCEAt8UmVI7rvkBlg
	oIPRqwHJHxjgX4Byg9GEKbxu7wMr5hHQs1XrS6dQrJu8QlXDOUjYLPa2HSG3BM/icI7k
	0h5vN4kBYDisq5GNX/GxPM8K8vuw8fES39D6W7pFquGM1rUPCD6Muqa4otlfnuymywfa
	Urvfxh7oOmKzZy7xIpKJ3h7xstn1t0pratk1FuX49lAEcVqyFb3LWwa3NDl1OTHRmL6j
	L/439g7R0DFJYOLO+AL9tie+7855StXydDGUvB2gq2elRIr6oKNPfBm8u/OE09nDfARu
	m+Mg==
X-Gm-Message-State: APzg51AdAehGr9/sEP5UDs0G01j8i+VL3Gkqldloagu2V51olg1nqFub
	x95Onzr0utYL8rtQTOZgNe4g1t07c4jsvj3CVDg=
X-Google-Smtp-Source: ANB0VdY/nI5FhNQtITt+1vYFDrJ4p1qoQKB7i1jqoAKeptTrteB8qdcf2jgUoZtKJgt0YlExOZr8Xd4bO2/pzl4yrGI=
X-Received: by 2002:aca:c0c1:: with SMTP id
	q184-v6mr3679235oif.61.1535563341721; 
	Wed, 29 Aug 2018 10:22:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 10:22:21
	-0700 (PDT)
In-Reply-To: <66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
	<66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 29 Aug 2018 19:22:21 +0200
Message-ID: <CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Wed, 29 Aug 2018 17:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2018 at 4:16 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-08-29 at 00:19 +0200, Andreas M=C3=BCller wrote:
>> The patch should increase performance for libsdl2 on GLES2 too.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>>  ...01-GLES2-Get-sin-cos-out-of-vertex-shader.patch | 141
>> +++++++++++++++++++++
>>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   1 +
>>  2 files changed, 142 insertions(+)
>>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-
>> Get-sin-cos-out-of-vertex-shader.patch
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-
>> sin-cos-out-of-vertex-shader.patch b/meta/recipes-
>> graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-out-of-vertex-
>> shader.patch
>> new file mode 100644
>> index 0000000000..621b7ea1a0
>> --- /dev/null
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-GLES2-Get-sin-cos-
>> out-of-vertex-shader.patch
>> @@ -0,0 +1,141 @@
>> +From c215ba1d52a3d4ef03af3ab1a5baa1863f812aed Mon Sep 17 00:00:00
>> 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.=
com>
>> +Date: Fri, 24 Aug 2018 23:10:25 +0200
>> +Subject: [PATCH] GLES2: Get sin/cos out of vertex shader
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The only place angle is activated and causes effect is RenderCopyEx.
>> All other
>> +methods which use vertex shader, leave angle disabled and cause
>> useless sin/cos
>> +calculation in shader.
>> +
>> +To get around shader's interface is changed to a vector that
>> contains results
>> +of sin and cos. To behave properly when disabled, cos value is set
>> with offset
>> +-1.0 making 0.0 default when deactivated.
>> +
>> +As nice side effect it simplifies GLES2_UpdateVertexBuffer: All
>> attributes are
>> +vectors now.
>> +
>> +Additional background:
>> +
>> +* On RaspberryPi it gives a performace win for operations. Tested
>> with
>> +  [1] numbers go down for 5-10% (not easy to estimate due to huge
>> variation).
>> +* SDL_RenderCopyEx was tested with [2]
>> +* It works around left rotated display caused by low accuracy sin
>> implemetation
>> +  in RaspberryPi/VC4 [3]
>> +
>> +Upstream-Status: Submitted [4]
>
> If I'm reading the logs correctly, this was actually merged upstream so
> the status would become Accepted or Backport?
>
>> +[1] https://github.com/schnitzeltony/sdl2box
>> +[2] https://github.com/schnitzeltony/sdl2rendercopyex
>> +[3] https://github.com/anholt/mesa/issues/110
>> +[4] https://hg.libsdl.org/SDL/rev/e5a666405750
>
> Cheers,
>
> Richard
LOL: V1 I tried 'Applied [4]'

and received patch failure message with the following hint:

| Valid status     Pending, Accepted, Backport, Denied, Inappropriate
[reason], Submitted [where]

My favourite would have been

| Accepted[4]

to state out clearly that '[4]' is oe-specific and not part of the
original patch. If I read the hint correctly that would have caused
another patch failure. So I chose Submitted.

So Accepted without []?

Sorry to ask such kind of questions...

Andreas

