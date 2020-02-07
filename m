Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB34160ED4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 15:44:40 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id x2so2055351ila.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1DFfZfep9vFFI62Cu1WHN/ORmhNn3BzLTHcUefQLovA=;
	b=GO2i4r+ge6HHZwJrqEcMKIUaMPBb/Z8yxZZHb/1SYPPTQt/IwRnielBhABITi3kP9n
	ulKMVkZOTJP672bv1SjDbgEM/TuN+j9bATzjJe7GOxMyh489AsjQOnWArbqeaVykN/S7
	zWbU5MhqeDA6AqjtHVRwqWtc1YDBpo/9Aa2ZFthoIFDE2BHHlmtWpthmbtyad0mwNqjE
	nWJCa7TBaxJF5ilxhV0BNBrsmUkkF8nIracueW+czdVHn8t7Xl/aU49csH8I4q+DbE/3
	1IHcPIYsUc5peosdoW98xml+qBJDymotratV8RCedUxn6ZUoxGJ+608HR/7utjPhWgw6
	ocvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1DFfZfep9vFFI62Cu1WHN/ORmhNn3BzLTHcUefQLovA=;
	b=FV8KccdEJ3AEgL5fJeGxog4okBNCHIThrllZYfdmQqQjK92vsgUJH8hmfw5xAVyA0b
	WUTgvGO1bXuNnMAegWUuhaOetczzv2r0/tw1LczG3Dya1IARnPKjvOEvAbTPiZXb/+OH
	Aykl5vk40ebLv/Y1v+NeZlhs4siwG7TFUqbaW8WXxrPYbDnq1J01zZF8DECExQV3JcXx
	I1cGu976+TzRWArkXr8o0VaqAMoEymE91tg8tQYmbREcvuJqZJuKGNFLqNvNIcwnspU4
	478FWalpx5pUjlz94D+l3ttFpb2svu0Qd1AdJO3NymNt0WyFGOSIOhj8NXs+7jkuOqkx
	ID/A==
X-Gm-Message-State: APjAAAVGxRWtD0Ati+KJSnOUjQEnqy6Oz8pMJSBMe3ioS9OHMNXDYpZ6
	qEDS9dVT8xbg7ubjgmvBSeIQQds2AQ3nHI+JHg4=
X-Google-Smtp-Source: APXvYqzj6dfVZm/VVr5irZTKKq+nnZQ6ZOx9j8Aj5PvLM8mlQsmzemBCHAjEOzYnFImflzbTBu6g5t4zWdNmIuj56P0=
X-Received: by 2002:a92:af08:: with SMTP id n8mr9620425ili.217.1581090281723; 
	Fri, 07 Feb 2020 07:44:41 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
	<6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
In-Reply-To: <6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 7 Feb 2020 15:44:29 +0000
Message-ID: <CAO5Uq5T1k-ZMZwpsDOeE+aQOJMBZ0PQSzC1jeS+iw=20bxyogA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 15:44:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 3:06 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-02-07 at 14:43 +0000, chris.laplante@agilent.com wrote:
> > Hi Richard,
> >
> > > On Fri, 2020-02-07 at 08:16 +0000, Alex Kiernan wrote:
> > > > Hi
> > > >
> > > > We've got a couple of multiconfig builds with different
> > > > configurations in one bitbake run (whether it needs to be like
> > > > this a
> > > > different question - I suspect we had something that worked and
> > > > stopped there!)
> > > >
> > > > However, for sometime we've been seeing errors like this on
> > > > master
> > > > (the recipes vary):
> > > >
> > > > ERROR: mc:forensic:ca-certificates-20190110-r0
> > > > do_deploy_source_date_epoch: Cache unihash
> > > > 37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
> > > > doesn't match BB_UNIHASH
> > > > 09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69
> > >
> > > This is an internal sanity test. It means the hash that it had in
> > > the
> > > task/worker context didn't match what the server thought the
> > > unihash
> > > should be. There have been changes in this area to try and fix
> > > various
> > > things, I'm wondering if we introduced a bug with multiconfig
> > > handling.
> > >
> > > There are some patches in master-next related to this area so it
> > > would
> > > be interesting to know if that made things better/worse.
> >
> > Anecdotally, we are running Zeus for nightly builds with three
> > multiconfigs. I cherry-picked your "bitbake: fix2" and "bitbake:
> > fixup" patches and haven't seen any of the BB_UNIHASH errors since.
> > Granted it's only been a week. But before that, hash equiv +
> > multiconfig was unusable due to the BB_UNIHASH errors.
>
> That is a really helpful data point, thanks. I should probably clean up
> those bitbake patches and get them merged then, I couldn't decide if
> they were right or not...
>

I just picked all your pending changes out of master-next into our
local patch queue - will let you know how it looks when it's finished
cooking!

-- 
Alex Kiernan

