Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id C3FDB60D5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:00:19 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id e9so6380863qcy.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PS5EHYKKHtpCaQFX/CdlEEpRnlJANlK/ZZSI7Ty2TVg=;
	b=a9ocvmdfIlCS9QMyLHZvi70GqBCOi33T5Co7cwlIA6N/LdcjQDwagdZpzNo4lTuY8Y
	tRpLG8XCfk+xxvxmwVsoL1w9n3cJu61tkr1TvQjdjzeDyq10kawJ4ZNyBFyatoZioyrW
	lAdRF3v0Zw1OUq0VIRiDf5W0f06ekMjigxqr/pwhRrxTFnUWu8Bd8ddqGHobC8J9Cz4c
	J+b4Cf4SypPCYsdKsUFQPeWk59PdeE7nRyBFTs/Cj1jnz1eobNqVbz7LTfMCAe28qipx
	HLNoXv+UrkoR3gBniCHJvqpaoWb10e2D/9T4DL6uBCqYDJwC4bTHInErsXMbYclzH7E1
	he3w==
X-Gm-Message-State: ALoCoQnDEwu62sWn3d9Q9y3Sx1SfCJdrd3v5NS3TuhM7erAexrtKt4LeFJbhpin8pAG7aMJOqqSi
X-Received: by 10.49.132.65 with SMTP id os1mr54927791qeb.39.1387382420477;
	Wed, 18 Dec 2013 08:00:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 18 Dec 2013 08:00:00 -0800 (PST)
In-Reply-To: <0D6B3970-7154-4445-A7D7-A470E4ED44E4@dominion.thruhere.net>
References: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
	<A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
	<CAJTo0LYLDfXcxQT5gQPu9dwCvtjx=-23iHw+Xth+E0w78QWjnQ@mail.gmail.com>
	<0D6B3970-7154-4445-A7D7-A470E4ED44E4@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Dec 2013 16:00:00 +0000
Message-ID: <CAJTo0LarYsTO6QaVZOGxdOin915zRDXNs_uwE9axjE8PmyugDA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Wed, 18 Dec 2013 16:00:20 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2013 15:42, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Why is that bad?  In the read-only-rootfs case you can either pre-seed
>> the machine ID at image creation time (if a single machine ID across
>> all instances is reasonable) or let systemd create a fresh one on
>> every boot in /run/machine-id and bind-mount /etc/machine-id to it.
>
> ... every boot you get a new machine ID and hence a new journal ID, which sucks. We can
> debate if that sucks more or less than having duplicate machine IDs across the boards on
> your desk :)

Out of the box, the journal is in a tmpfs, so it disappears anyway.

Either way, this service file isn't useful.

Ross

