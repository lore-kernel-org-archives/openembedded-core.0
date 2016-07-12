Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id D76DF606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:18:34 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id v6so16725053vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 04:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=IEkLn/BXxN7lnVV1xON5emgBeFLysYZ8NH5hKZRfTqA=;
	b=t8Gj8Dxfz8/InIGQ1e1r3KoUylosp94IU1Lh0GaCWT8Ubg5nwKutC1/UdskDVIf8gU
	+ATNDJ2ljLFKkve4tW7p0w4PEENJK1UMU331bKNJPBfNIdEntIDIbnMIDmvslzNJ5N6u
	OdAQWtjLbdsFWQHlqsx0F8zda9XYWhQ42tHx9oGpVF0l8+8vD//MuGjekaWKO1kIB1nj
	NHL4fAn3K8aTDLpxne20I33p1KhlajQq/zI2Jp/sZfWY1MfR2R4XC+Es/VSt3Zt+Y2/T
	s1qJnawehd4abcIEgD8md3TA5WEGlgCHZeFv73lzyQXAi8p3NwJGzUcdaEP2xrK0zxwA
	MpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=IEkLn/BXxN7lnVV1xON5emgBeFLysYZ8NH5hKZRfTqA=;
	b=jR9EA5y4/m9tAZ6s0z+MK8IOsQBuZ8AsJA6HohpKKUVoikK97ZeeRl//8AdKoWGTjO
	Lk/iqRvmb7cBU+LZMJu7c/WRLjTmQT2v9k0OAmC0dbvytSg1lWEh933v2Una9bOcVWkl
	Q40MF95RZBqazuvaSbWOJ/meKMcqTwzVrJj+UZSdJdftmzfPaCcjc7OB820lL+Ds0Zxd
	m/PKxt9S3KLCwYC6kjim6+0U5rqNezBiG4U/QkauGhEF+qvdaStRPu3FKMF56Du0OO4K
	QnVjinOPCpLH6rW12+ZBrzNZyW60/5tsRD3LNfBtzkLZpr7tTXbnmzP5aATmki+/lV0T
	ZEfw==
X-Gm-Message-State: ALyK8tJqowDh50RbkvrS+1mDzZ/NnTlmc4LqT9T32nmw9WGlq1+doVzdYp5ylb0dprJvWw==
X-Received: by 10.31.92.15 with SMTP id q15mr766801vkb.92.1468322314499;
	Tue, 12 Jul 2016 04:18:34 -0700 (PDT)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com.
	[209.85.213.53]) by smtp.gmail.com with ESMTPSA id
	b129sm3923580vka.14.2016.07.12.04.18.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 04:18:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f53.google.com with SMTP id v6so16724213vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 04:18:33 -0700 (PDT)
X-Received: by 10.159.38.47 with SMTP id 44mr649684uag.70.1468322313058; Tue,
	12 Jul 2016 04:18:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Tue, 12 Jul 2016 04:18:32 -0700 (PDT)
In-Reply-To: <57844702.9050108@gmail.com>
References: <CAP9ODKp17vE1xOJiePAq6d3poMvCkkK-BCdf4_m6yAUXgsWsPw@mail.gmail.com>
	<57844702.9050108@gmail.com>
Date: Tue, 12 Jul 2016 08:18:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp7WXk=O97yN7HRjcdLq_ChMg+65QAwvOTOReQn_xuwdA@mail.gmail.com>
Message-ID: <CAP9ODKp7WXk=O97yN7HRjcdLq_ChMg+65QAwvOTOReQn_xuwdA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] Backport of new libarchive release
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
X-List-Received-Date: Tue, 12 Jul 2016 11:18:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 10:25 PM, akuster808 <akuster808@gmail.com> wrote:
> On 07/11/2016 07:41 AM, Otavio Salvador wrote:
>> The libarchive 3.2.1 fixes several bugs and security related issues so
>> it seems like a good candidate for backport. I list below the commits
>> I did in our local fork while testing it:
>
> CVE-2016-1541 is the only missing CVE. Are you aware of others? General bug
> fixes are good.  But If I am not mistaken, there are 803 commits between
> 3.1.2 (krogoth) and 3.2.1 (master). The is more than I want to take at this
> time.

No; I am not  aware of other. On OE-Core side has fixes which might be
worth check if they apply, even if not bumping the base version.

> thanks for keeping an eye out for changes needing to go into krogoth.

You're welcome. We are using it a lot so we keep finding issues worth
fixing, with low risk.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

