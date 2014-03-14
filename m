Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1AA6EE4D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:45:20 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id pa12so3205302veb.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lsUXJx5pFw2brj08T7trIc2FJ9oGNrvwKduvwHGEsB0=;
	b=siu8QEcMl+VGr+74u3/7/6eNTS/bzv90YUPcKgNMF7CrceVhNLmPcttcEkHpKnh8Y/
	mKH8hTEXReowPFpvJEEG/Wqi/yaf0iMRsUTfFZt539BRI98abTZLuXotTZcQPFjlpLHk
	ugGO5gPRiSUAkIeL2xIar7ivZGcRhK1XVxCv/RtRZvKViGuzkrsjGwZktuARjsQ2LUAU
	dVWJ+shnmioB9xZ8zGtpcKS2/yVdzuonXdAL6VCGCeoABq5Oe/+nCJtIpjfX/xv5a8XP
	thLpMP9NJCR3YsZ93n5S8x+Anot61w9egypsrISNaOHL9nXSMCnd6EwVTM9jRg7cycvo
	ZLcw==
X-Received: by 10.52.189.33 with SMTP id gf1mr6449516vdc.26.1394822721893;
	Fri, 14 Mar 2014 11:45:21 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Mar 2014 11:44:41 -0700 (PDT)
In-Reply-To: <CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Mar 2014 18:44:41 +0000
X-Google-Sender-Auth: bvGkTeVl4_0O_ThaRt44k0pZ5YY
Message-ID: <CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 18:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 March 2014 18:37, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
>> Building on my current development machine I ran into two failures:
>>
>> eglibc-initial, do_configure: Make 4.0 isn't recognised
>>
>> This can be fixed by backporting
>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>>
>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>>
>> I fixed this by removing git-native from ASSUME_PROVIDED in
>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
>> That isn't something we should commit in Dylan but may be useful for
>> others to know the solution if they run into the same problem.
>
> I think if you also lock your build machine OS along with yocto
> release, it is less painful.

It is definitely less painful. I'm lacking the spare hardware though
and I want to avoid building inside a VM if I can as I'll be limited
on how much RAM I can allocate to it and I think the performance will
take a hit. Thankfully this project isn't far off end-of-life now.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

