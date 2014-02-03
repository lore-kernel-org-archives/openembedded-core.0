Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 762426D491
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:58:35 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so3644590igb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dn76uGsIRmkNUK8x8QEUrOBtjwCPAscP2c2gzq7OJFI=;
	b=buFnrkIof3fbINTBbhJaktnJ6hs3R6itwUdtiLmOwdcEp2kkmsYHCnLlN2G6QadxUp
	vqEPLMBgtI5ndzPChl5XOsJG0TNYZqwNLUqS62u514HpGCyCNr6EYAWtnqZLCOeqWJXB
	hU31pHCzUH+SlNWfrMcVYHH9PDV2phTgV+cEL+jE0YT6goJRQXjp0u11yfaneOeQ49yK
	EKSJzm1vr3bhe9Lzte/AFEQjUqDGnyzMsjQkKAU7klkpol20KxFszj/zApRCHYY6smbc
	8WSvPdCskXj0W7l9B3mooXfML90Bylh/oM0Y4SPg9H2ZwVlAnl1Q9bn65Y7a7/EWSKno
	z1TQ==
X-Received: by 10.42.227.195 with SMTP id jb3mr25443926icb.27.1391410715951;
	Sun, 02 Feb 2014 22:58:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Sun, 2 Feb 2014 22:58:05 -0800 (PST)
In-Reply-To: <52EF3AE6.2000505@linux.intel.com>
References: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
	<316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
	<52EF3AE6.2000505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2014 22:58:05 -0800
Message-ID: <CAMKF1sqyS6-c5Gd8DCcZtLO4_nACt_YOPB2CFXG0WChFJiVyUw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wireless-tools: Upgrade 29 -> 30.pre9
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
X-List-Received-Date: Mon, 03 Feb 2014 06:58:35 -0000
Content-Type: text/plain; charset=UTF-8

>>
>> file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
>>   SECTION = "base"
>> -PE = "1"
>> -PR = "r4"
>>
>
> Did you really intend to remove the PE = "1", won't that make packages go
> backwards?
>

no. See my prior reply. Its been already taken care of and patch is on
pull branch

