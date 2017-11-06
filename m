Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id B9A8160017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:36:22 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id q99so8130370ota.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 03:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=elwpPQc894GYtmloIqOqvolwLzayigJLN0yQ0SPFw5E=;
	b=ATNpN8VmqTSgLOd9dU0K3Sms16VX2LD0EiGKUs2OT7MXK8c4/7mRP5JaxxhKyO6Si5
	Z5ATP6oP8vCM/PpdLP+jzOYGTBbhhil6QfP2cRxPo9DEn7Y+TzBnwnst/fIY0Hh20L48
	XFU/248OUIAN5fAdzx+wOUJ2wGxPeqCv0mmkIR5X2Kmyf80dqtqk3hmdEiGkaTXxunsM
	+doI1Az5xjesooG6V/cnDj0NQiPwqLzKrJ3s+cHzaU6n8i/K7wlxMIwKsd5AfQjbZpTV
	4zkx8Hw2PVSgw8FuE4of7J81vgAi3SMbXLDqBpCS78QCIxkPdAL00Ho6qG34opQ4ed7f
	45qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=elwpPQc894GYtmloIqOqvolwLzayigJLN0yQ0SPFw5E=;
	b=PpzHQY9E8fnYg2t9s6JDb+M6MMyVvlq6UP3Sktbq3MYWylmb8JT/JiEIr6kpNxAkVu
	uG1WuXBeAzZeh6/kjUmTQdgts/M3my+l3ka5/1tRL6bELcvgWHKf6sAU78DiRVSGezl+
	6ySZDzsrt0rYq/XT2W/6LIzM2sRD4cEbdJJQxhvsIFeqoDsMsjMEU1vDlaGK2r8OHU6A
	+UPk1KIMvjil+a+kr/DCrgyesEQafNgEC/kwRiZR90YfyjVnpTlzcAb5THPlywacUvB0
	xZWvKcsgoF4kvUfwFDSw8vaUUk9B/nhBm2Qdum7UCFEz/+y85V0IT5g3IjNGI8V7Bh7K
	T+Uw==
X-Gm-Message-State: AJaThX5PV7C8GXWyQ2Ay3t4D5HD8N3OyJ8zlD/PQVpeuQSrmTxbZIxaO
	yt7AwGfVK2KzY0M+5a3FisKLG/1V
X-Google-Smtp-Source: ABhQp+ReWLnK0r9xWxj4xxtlC8kwn8h6bRDyKXXWzs+107rcMdrYbZ8AhHgmKl80L0bzWXBzTcjDEw==
X-Received: by 10.157.68.232 with SMTP id p40mr9961485otg.199.1509968183294;
	Mon, 06 Nov 2017 03:36:23 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	f93sm6082201otb.46.2017.11.06.03.36.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 03:36:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id j126so6808743oib.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 03:36:21 -0800 (PST)
X-Received: by 10.202.177.66 with SMTP id a63mr8583968oif.375.1509968181459;
	Mon, 06 Nov 2017 03:36:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 6 Nov 2017 03:36:20 -0800 (PST)
In-Reply-To: <20171106100829.nqhna6hugyqe636k@linux.intel.com>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
Date: Mon, 6 Nov 2017 09:36:20 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
Message-ID: <CAP9ODKr4+R_ggGvJiVR+wj4iPqQdndzY-vL6s9Y42ZJy=X857w@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Mon, 06 Nov 2017 11:36:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 8:08 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
>> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
>> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
>> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
>> > > > When we have been told to use the UUID we should also update the fstab
>> > > > to make use of PARTUUID instead of hard-coding the device in question.
>> > > > This will make the resulting image much more portable.
>> > > >
>> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
>> > > > ---
>> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
>> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
>> > >
>> > > Where we did we end up with this?  Ed pointed out that you can tell wic
>> > > to use a specific UUID, so reproducible images are not a problem.  And
>> > > making images that are readily portable is why other distros use
>> > > UUID/LABEL and not device names as much as possible.  I personally enjoy
>> > > being able to put an image on uSD for minnow and have it work :)
>> > > Thanks!
>> >
>> > ping?
>>
>> I was just reminded about the real problems this solves (swap isn't
>> /dev/sda3, boot is being excessively slow), so, ping?
>>
>
> I'm generally ok with the patchset. The only thing I'm thinking of is if busybox mount
> supports PARTUUID syntax in fstab. Can you check this, please?

It does.

> I'd like to see Otavio's confirmation that --uuid option solves
> his reproducible builds concern.

I am not against it if the no-fstab-update consider this too. Using
uuid when making a fstab makes more sense but the possibility to not
touch the fstab must be kept.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

