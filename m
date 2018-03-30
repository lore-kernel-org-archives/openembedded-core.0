Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id AD7B3744F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 01:39:28 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t12so4180725pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 18:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M3b6wqepBWp04Pv0YBpKSACfiWLG9ssavdQLctmCZo8=;
	b=lci/gqiuJLoLFWsYKuFz9EbEyXWzoL7tdHcSc8cvZvfLvmrHLyDEAGgjE+o97mPabY
	WahVp//Q0d5INNGYuV9IyT2KOTnvH5tIgbkAgbG6j7Er98tstAiwzj9p/4ttlWlkMBQS
	6erqVNWzzkScu99ffnQX+m6QfocnTUab3jIeL/zZuvnCSWp3rNlXh0hn7IUFTvs6rdfK
	tzSp/cDWmWC/saMWrOTgZ7rPQK8o2yhTFs5AblEPnJqyWYrBOj5dqBCIY4WJqhpjGZC8
	ziDCoKVZvt6+ebzzGzPshbFPLpYBLiT/mP0hpo5VWGyeC1cS8HwHV1HV3EAU/ZaOg+h6
	TgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M3b6wqepBWp04Pv0YBpKSACfiWLG9ssavdQLctmCZo8=;
	b=IS91dePLZ32sFPISFGmy/m0uuHRs3tTivlnMILfWNiTXV0GErFlc92rj7eDg1l/ybI
	iCe9NK9gFKDW8oX2vn9+RTMIjVJrmtecPloUDI0QNnHQnWh0l58DigC/uqYE8oOtwxe6
	LSIDotn0MC4orhx6kj6dFObnckYHoGKicR6XVu5w2/iHSfH+wMHMihn6XyCk3CqEfcBr
	7NGGhg5dtu+HBbLdi6JEqNZzvaWWAPxkctbZcxvvVC5niqMLU3I157MMUw95UA1hGM2r
	MiXDHPuEZSnh/f/jL5E7dK5WNg8c+vF9QbgJaw4Bv28z9+St6XPDg/8/Z4MeBSw2YkMv
	uGCQ==
X-Gm-Message-State: AElRT7Ha7Txwydr0Bg5qYsDlLsAg/PqfSXCLHw5FQNRL4WzTqv+nGtNV
	OhRaOvvG8oE8/2LQNL4Wh7eqVQd/ZPzjiRNT1jM=
X-Google-Smtp-Source: AIpwx493ye2ZT+RyMnNLhzLG5TaqTITKknT2oJ/TmGygudFkHAv0MQOM9PvhVQSZh3C2whtays9+zA/LOdlJ8UFavO4=
X-Received: by 10.101.99.88 with SMTP id p24mr235785pgv.384.1522373968987;
	Thu, 29 Mar 2018 18:39:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.227.8 with HTTP; Thu, 29 Mar 2018 18:38:58 -0700 (PDT)
In-Reply-To: <20180330001724.GL2786@denix.org>
References: <cover.1521507765.git.denys@ti.com>
	<20180329224129.GK2786@denix.org>
	<CAJ86T=Xi01mESEX8D3YAXo1OXj5d93y8wXz5qJw1ffKqHeXjQQ@mail.gmail.com>
	<20180330001724.GL2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Mar 2018 18:38:58 -0700
Message-ID: <CAMKF1soF7xRREZJAD65MpWQ+doNSfu=GwJcMVzNbA1nen3NcUg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 30 Mar 2018 01:39:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 5:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Mar 29, 2018 at 04:39:27PM -0700, Andre McCurdy wrote:
>> On Thu, Mar 29, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > Ping. It's been 10 days - are there any issues with these updates?
>>
>> Only 10 days? :-)
>
> Yeah, I know, I'm too demanding... :)

Ross does pick the patches from ml fairly quickly so always check

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mut

or OE-Core's master-next

http://git.openembedded.org/openembedded-core/log/?h=master-next

from mut to master it might take a while since there are many patches coming in
so integration takes time and sometimes there are issues with infra
which can delay
things,

10 days seems pretty darn good in some cases its years see

https://github.com/projectNe10/Ne10/pull/143

in the end as long as it makes upstream.

