Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2C752772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:25:04 +0000 (UTC)
Received: by wmec201 with SMTP id c201so28299650wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 04:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Nlv5GyoWn5UaIiix8jyymR+vjDRlK/34F6078GYQ/8I=;
	b=BIcG9obn7RRfvkvCMmgNPXGKRZC1E65bk+Dx1rTY1OMhiZOcjPxpNa/jZnB0QBvkYU
	h0uMyE7nzlRmZ1MP5ze3Ho5fyWr2AQxx6J1eXNZ7FfDk1Q3qiTHO2DuEWtnhRkG/hyjk
	D+oEN/9LncQN9LLozkzmmOocpEtkyXwCtIry38+l/eBdPvW35QJANO4B4zEOrmBoWTJZ
	pq6m9CyLjbiIe5dJRLtkG0gAKooU6qLuZFn9DD3E6czqw7hsA6E5uwGlBBm3J7JnyaiJ
	ReePhDKzbOqc8GLdC+NXOiWd+3qlbI+3eiLJKc1JWVGf+sqaJ8sXCcWKGcyotlj0er4+
	QSlw==
X-Received: by 10.28.87.21 with SMTP id l21mr3596166wmb.6.1447417504891;
	Fri, 13 Nov 2015 04:25:04 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	wx10sm19643477wjb.40.2015.11.13.04.25.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 04:25:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LZsH7A7vjZNDQ4BBNYheanAG=k0YTTjkSqO3oMMD=xKHQ@mail.gmail.com>
Date: Fri, 13 Nov 2015 13:25:03 +0100
Message-Id: <D142A1E6-7289-4801-A1E1-314E139AB8DD@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
	<E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
	<CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
	<CAJTo0LYa6-gOECqfbfDZeDXcJKwMNesiUR9Z-N7j0bxKK-pjhw@mail.gmail.com>
	<E6C2BE5A-51EC-4D69-A685-6C00173B022C@gmail.com>
	<CAJTo0LZsH7A7vjZNDQ4BBNYheanAG=k0YTTjkSqO3oMMD=xKHQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Fri, 13 Nov 2015 12:25:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> Am 13.11.2015 um 13:20 schrieb Burton, Ross <ross.burton@intel.com>:
> 
> 
> On 13 November 2015 at 12:18, Jens Rehsack <rehsack@gmail.com> wrote:
> Since we both didn't see something, I send a v2 with PARALLEL_MAKE = ""
> 
> I'm not letting a makefile defeat me! :)

Yeah, but I have in openjdk-8 enough challenges to accept, so no waste
time on such a tiny thing.

Cheers
-- 
Jens Rehsack - rehsack@gmail.com


