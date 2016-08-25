Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5AB86FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:13:45 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id k90so75464083uak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F+jtkdaAl1SigsRRLE7exbgIxLvR2SvLsslsAJx5nYE=;
	b=0FZCkNAqP/aFg35ZzEUNV9VriH5mwiQJXEqOmo1ZLwkXztO6bK4iuncLnSeUzfj3li
	NxE96573tlYqnXrzXY61nqopiGvIBT8UxiCrRJYKvfkT1tBywsQriYwf3Gm6nwSuvB0n
	R6wwLLxcmHWLCzokM5LFSj/EIQ5PqyXb+wJol4ZLBbYzdc1uTryUo8KmjYnusvaMbAyA
	7wOxeNME56y0lnNWyrcaaOIj+akaaIrgicGbwZu/JOd/AQ32LAaXuH3ID4bbeIf0ORhA
	D2HstIWVZ1ht7jPhY5Pw+i/I5B2gG0G8ivQahTidlzdna6f3Yh73n+3rTz9QoOPYQeaG
	gvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F+jtkdaAl1SigsRRLE7exbgIxLvR2SvLsslsAJx5nYE=;
	b=UY7xY1tnJcN/lV7swFUixTFbn/Shet3pKnQAunK4Q2yleQpzd7wnyXC2c2hj5NNCvl
	rK/ApaHwa5m781kBiqs0IIh0BCtdtocteI/g90PbbTQTwphIk3XVOkwhTWmZJGmYcFLl
	vj6HC/yreGvv+h+b4w88lVVDiCSnL2L2bn6BJh/oc3cV/MWbAq/9IsSpOFHAE0w79RQF
	jRY6seAfySA4KFF3GTJ2PT92UuwxUpqWHe0XdLL5Ji7S/ZodIhBA0nsyEbBJVbuJDydx
	A8YspL+CWIaSBhdGVvxboiuhQcdzlGR99v+lIl3D2sipkS82B8nNh3PI5UdwdC8/7oGu
	Kymg==
X-Gm-Message-State: AEkooutCInIuBbeXOsnpaHOhmv582L/XZnB9k2BGMaMhzqijO7/Y84Ra+0LvCT1T+CGLvqgmGULHmHStA7svSg==
X-Received: by 10.31.178.23 with SMTP id b23mr4417848vkf.72.1472120025662;
	Thu, 25 Aug 2016 03:13:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.14.71 with HTTP; Thu, 25 Aug 2016 03:13:45 -0700 (PDT)
In-Reply-To: <CAJTo0LYcCDfuqVBrVKTGXySzP4OLTCm_cXGs5yr_sL04EMi=MA@mail.gmail.com>
References: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
	<CAJTo0LYcCDfuqVBrVKTGXySzP4OLTCm_cXGs5yr_sL04EMi=MA@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
Date: Thu, 25 Aug 2016 10:13:45 +0000
Message-ID: <CADwFkYc84cV0m9NYkEzCpXtOEAMkxhTCybDz18C_sx0Ck-hqvA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Thu, 25 Aug 2016 10:13:45 -0000
Content-Type: text/plain; charset=UTF-8

sorry!

On Thu, Aug 25, 2016 at 9:34 AM, Burton, Ross <ross.burton@intel.com> wrote:
> meta-qt5 bugs should go to openembedded-devel@, not -core@.
>
> Ross
>
> On 25 August 2016 at 08:45, Yi Qingliang <niqingliang2003@gmail.com> wrote:
>>
>> bug detail:
>> https://bugs.archlinux.org/task/49723
>>
>> patch:
>>
>> https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-declarative-gcc6.patch?h=packages/qt5-declarative
>>
>> Yi Qingliang
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

