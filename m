Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB7075EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 11:02:37 +0000 (UTC)
Received: by iody8 with SMTP id y8so215287400iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=mxio2UD+DmiEDBXwcuw4HRcQn9BuMhd9UPuLc1gCyy4=;
	b=OTEzN9qtHQ0tNgUnrDaWERvkGNgVLXe5cInRI8q+KkoYaMVZbeeWz5rSQQdos6lIZ0
	8FJVMnzAAm0qOPmn9GQVN2t7dTIhFQjHzaivCfb/+cyDf0kjOeHQCxSPPRuBqFYaDDAs
	5Ivger6dJeB32KNxkcP2a73yLIV7HFFYLNsXJ0rqpwA2BpOFINSfaBY7iqqMxTuK9Jmt
	VxesfzgYK0ASKS4WQrAAPEwMEO0gqxG5N5UMRqiC/p125I08CdKE83omCtYGIj7YDlmN
	mN2Wiz5r4tWOtjZsDnOQ1r9NQ1uxKPtq6H8eDlwL5JV6bH2FspVI9SfZdg6sZWyAi7EJ
	dxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=mxio2UD+DmiEDBXwcuw4HRcQn9BuMhd9UPuLc1gCyy4=;
	b=R7XLln26YT0jqF11ZakpgCuROEEwd6IUeUuZThqO2E/qfXOHkLaz7w2GRu3Ogauppz
	ZfidyM5QOkGtSH6nkE8Icv8OT8FwsxThbq4TrNnPS/ckmv7HZBaxZWc3g7c5dJiRs73X
	tgAf+M8m61FF6ee4RpvTZxusHPzZivgZR7EdnR5Nj9h8jSD1lOqxhNOJ3hPI08PgERqX
	0kZ1XUxxspueewDt+TrrxwqJUQKc6/m+27ex0UJz0sFG60KTEmZ2/BHsaWJOAgZvwi+k
	0jz6hzb+sFhoM4131OaGWSHajzm91YotaKhJ4VWfvzLjo6C9rllyKWSymKjj+eqlJUdp
	stLQ==
X-Gm-Message-State: ALoCoQleCu/nfe/mAciVXbVtbRqhj3lom8iLOabgM+NxYIyQWl79O4CDQaIlt5XpXA30G9X/AExv
X-Received: by 10.107.168.97 with SMTP id r94mr2989421ioe.181.1447153357412;
	Tue, 10 Nov 2015 03:02:37 -0800 (PST)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	q80sm1191301ioe.31.2015.11.10.03.02.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 03:02:35 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so216047320iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 03:02:35 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr3458667ior.28.1447153355110;
	Tue, 10 Nov 2015 03:02:35 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Tue, 10 Nov 2015 03:02:35 -0800 (PST)
In-Reply-To: <20151109232526.GL8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<20151109202937.GH8499@bill-the-cat>
	<CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
	<20151109214736.GK8499@bill-the-cat>
	<CAP9ODKqAmMkQ6bEhU1QTuDVNz3eiYp_YbpMD=9t+JODts-3fCw@mail.gmail.com>
	<20151109232526.GL8499@bill-the-cat>
Date: Tue, 10 Nov 2015 09:02:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKquw2jxRHMSv4mWW2OHuY5hvY-5wYw+pZa-nEBYkpuz3w@mail.gmail.com>
Message-ID: <CAP9ODKquw2jxRHMSv4mWW2OHuY5hvY-5wYw+pZa-nEBYkpuz3w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Tue, 10 Nov 2015 11:02:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 9, 2015 at 9:25 PM, Tom Rini <trini@konsulko.com> wrote:
> On Mon, Nov 09, 2015 at 08:04:31PM -0200, Otavio Salvador wrote:
>> On Mon, Nov 9, 2015 at 7:47 PM, Tom Rini <trini@konsulko.com> wrote:
>> > On Mon, Nov 09, 2015 at 07:11:37PM -0200, Otavio Salvador wrote:
>> >> On Mon, Nov 9, 2015 at 6:29 PM, Tom Rini <trini@konsulko.com> wrote:
>> >> > On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:
>> >> >
>> >> >> The U-Boot 2015.10 has been released at October 20th 2015. This also
>> >> >> removes the GCC workaround, for the inline behavior, as this version
>> >> >> properlu supports the GCC 5.2 as compiler.
>> >> >>
>> >> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >> >
>> >> > Sorry for being late on this.  Please make sure to cherry-pick at least
>> >> > c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number of
>> >> > boards won't boot Linux) and possibly even
>> >> > fb3db635757f68e68ab3e943396c34886529b88e /
>> >> > 2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
>> >> > 347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MIPS
>> >> > fixes.
>> >>
>> >> I queued those here for the next patch version however it seems noone
>> >> has yet cooked a proper fix for the ppc issue. Are you aware of anyone
>> >> working on it?
>> >
>> > Does https://patchwork.ozlabs.org/patch/535537/ fix the issue?
>>
>> No; it is a failure at the inline handling due GCC 5.2 behaviour change.
>
> Ah!  https://patchwork.ozlabs.org/patch/540952/
>
> But then you run into (as I see just now) that 535537 only covers
> mpc85xx and not all of the rest of the platforms so you'll still want
> the patch OE has that removes that line from everyone until I post what
> I just did locally.

I sent v2. As the next release is a little far, it might be good to
consider releasing a 2015.10.1 with those fixes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

