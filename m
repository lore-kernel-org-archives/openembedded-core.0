Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B2B617704E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 13:13:26 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g203so26548940iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ugdM4NO7Yg+E1N7NPsa9hcV0lEojTqNxozcZtfXDvRg=;
	b=ZcByD+QNZyikUXc7UovsYadVZJWk9Tm2JEMQL0I6XFS9D0iLQGZIBuZNSyEklZ5kXq
	jGaf/y67NdE4tO7uOk9aPyWu3qvBB8X55b2YwPCjm2S1G453ZwnTNVgXyVrld7zvHGEz
	G9earrqduR8R5ndI/juQ+aJsS9SokQgcBb9DT5jUEnr++o7gnLUaLzkPFvlbVyzjd/NL
	L8mSttVDj+mnj0v/0LPWObpuCKoysiLQaHNbzlvMcyxQi/Ly0Kqg5yV12yBoWlWyGsCw
	d7UVKUBJLycXu9Gp6jXZhsmsEln15zv1hzEnkkCiOwuI2D5qv2BYhpITbx6FqkrI4Nt8
	+AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ugdM4NO7Yg+E1N7NPsa9hcV0lEojTqNxozcZtfXDvRg=;
	b=WcidDJD1Yr1L1CkE9+SEDuKNwJxItMy4+mFTYp4QKMwgngJgcj0q1a6OyNJ1E0v3Xq
	JOk3gKbE0AOATPdlFO3DpyACQ4kelEv2FD3EfaEQ7ViUnv00RfeqNuomj0Y1OVZjsPPO
	RenCiV99Y0aYxM9Tuqno9Q+rshSqGuMsHUN5m5wuvUISwX0x+iChfnQuOq0btiFWPJEp
	iguMvyWGqPMAwdgkMGUHsoIaTnTAogcm5hB+xPXiyYaTLd+4hYQCVCFsmIB1YlEUk0KC
	nZZxIObgv2p6vvSkONCRGuki2qATT6Y8unpUEdWqw3nYQ//O+Rum7KveA+xWjwGXEBiY
	3LQQ==
X-Gm-Message-State: AD7BkJIh9JDSiMCxSeH9iqLAJ5FIPhxj88SLNJQBg27BgQjgzKzbZc2/U1oUAxCmcUM1BEvPQFR9iz6aIIIZ3BI5
X-Received: by 10.107.185.8 with SMTP id j8mr2580586iof.94.1457010807327; Thu,
	03 Mar 2016 05:13:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.6.195 with HTTP; Thu, 3 Mar 2016 05:12:47 -0800 (PST)
In-Reply-To: <1456932205.25131.33.camel@linuxfoundation.org>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
	<CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
	<56D6F62C.2020000@linux.intel.com>
	<CAMKF1sqNKzREAVcpQQry9preJf0Jnj6U245CcTE-vpubQ9jJ1w@mail.gmail.com>
	<1456932205.25131.33.camel@linuxfoundation.org>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 3 Mar 2016 13:12:47 +0000
Message-ID: <CAPhnLPC++kxPj6R3ScxbRMdsLvwhBYkhFDnzhWjg7qD19wqarg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Thu, 03 Mar 2016 13:13:28 -0000
Content-Type: text/plain; charset=UTF-8

On 2 March 2016 at 15:23, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-03-02 at 06:30 -0800, Khem Raj wrote:
>> On Wed, Mar 2, 2016 at 6:18 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>> > his probably could be however OE-Core supports musl and poky
>> > > -tiny
>> > > defaults to it. It will be good to test
>> > > changes for it when changing OE-Core at the least bitbake -cpatch
>> > > <recipe>
>> >
>> >
>> > Yes, but that's a job for autobuilder,
>>
>> There is a musl job on autobuilder. Not sure if its run daily. Ross ?
>
> Its run manually at the moment. We've been working to get to the point
> where its reliable, then we'll add it to the list of build tests we
> run. I think we're now at that point actually.
>
> Beth: Should we enable musl and no-x11 by default?
>

Yes, I'll patch nightly today and push it to production after the
current build is done.

> Cheers,
>
> Richard



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

