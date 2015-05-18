Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id C7430609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 07:46:02 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so42937435pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=a0XTXbpvRR4ROutXDvfC9uehZYIiw8epzuSNHMY8R3M=;
	b=Oj4ynkd0excjZgEikgSaih6WcMmESYJeF/4xSU5ThyFo5sssAaBw/CMTaucXNOyFGa
	wPjSEFf4FBcJ6UohnnCKMsEO3gHVHwPWEpRCWkx1gqsB8ltM3tTKTJITdDc702Vr/BP0
	glnZQTPgqky+3xP+iF2CgLcio0rEkKBY9cuGcPdDV+YvmPIfFgplmaVKJPCBWNmtEihN
	InUtRbNegMTPURJgedDAWoK9EXxTnz4I2HXEg9xG9HtRzd2vaExEYu3s6nfx6A/wDcB0
	87SDkQFXp7KDqXYBs0rErVvH132XzayR6jN7Ta0mBbyJGVfqEwm0u/AQa76/cPowOJJX
	PzZg==
MIME-Version: 1.0
X-Received: by 10.68.57.170 with SMTP id j10mr25027684pbq.150.1431935163339;
	Mon, 18 May 2015 00:46:03 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Mon, 18 May 2015 00:46:03 -0700 (PDT)
Date: Mon, 18 May 2015 09:46:03 +0200
Message-ID: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: trouble related to oe-core update
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
X-List-Received-Date: Mon, 18 May 2015 07:46:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

have seen that a while ago but had no time to take care.

Since oe-core commit

commit 3e760031f91fb87c3e2f62b77a117eb41164f259
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Wed Feb 18 15:40:35 2015 +0100

    feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix

I get

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
(cortexa9t2hf-vfp-neon).

I don't understand this fully but it seems that
fsl-dynamic-packagearch.bbclass would add this pkg arch but this never
happens because sanity.bbclass is executed first and interrupts
parsing. What I don't understand: Am I the only one having this issue
and if yes - what makes my configuration special.

Help - please :)

Andreas

