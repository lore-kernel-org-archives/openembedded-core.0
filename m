Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 48C096DD26
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 12:01:40 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so3730443oag.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4/NkNvDmMGXe/HGpyKDjBEhTU0dhDdxf0buNkG/nECE=;
	b=gIizqYlZbDuFxyJQGxCVyJWGVgGYVdP+MkyvB7SWwLteSzobRVGsEq7On9oY4wo0Zx
	R3F7GAjGiVkIeBsU6vTa8OdzVnRC3vRwzg/UkPKqcu+8JTAByIEVuGFD2aR9g4bIyqA4
	JONtkzIpZUTCmcKVxga9dzjWGuKWs2bS0D6O9IvBSKkf05eFuJTHGabK4+HiJJt4Pk6J
	aqwbyBid/m/aE4X4Aa6tibDK3y+dissdX5CbHySDn6eWnV46oyF/EYGE+YbHRaO8hP8l
	J5gI4I8RNHU7iG+C8RqaxwZ6ZgH4SN23Js4qj3spn3EFHuVJZ/NF5/OqOG+MIrxLdKo7
	mShg==
MIME-Version: 1.0
X-Received: by 10.182.223.37 with SMTP id qr5mr12287447obc.41.1386590499585;
	Mon, 09 Dec 2013 04:01:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 9 Dec 2013 04:01:39 -0800 (PST)
In-Reply-To: <CAJTo0LZbjuaySmTz8q3YEmMxULBWtTTALG7t0zAoMSppGHdVCQ@mail.gmail.com>
References: <1386588627.25847.77.camel@ted>
	<CAJTo0LZbjuaySmTz8q3YEmMxULBWtTTALG7t0zAoMSppGHdVCQ@mail.gmail.com>
Date: Mon, 9 Dec 2013 10:01:39 -0200
X-Google-Sender-Auth: 7ydygHyfMM7beFdYBMFtYbrvIMc
Message-ID: <CAP9ODKqZixNQpMSeXm9sqK-B9F-xyMWiUOytKHNQ3cROOw6aew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Build directory reuse issue - make WORKDIR machine specific?
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
X-List-Received-Date: Mon, 09 Dec 2013 12:01:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 9:44 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 9 December 2013 11:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> b) looks attractive but could be confusing as we'd no longer have
>> PACKAGE_ARCH workdirs, they'd all be "machine specific" however they
>> would still get reused by sstate as they are today. It does however
>> neatly sidestep the set of issues we're currently seeing.
>
> As someone who often switches between mostly-compatible machines
> (qemux86/qemux86-64/genericx86/nuc) I'm often hitting problems like
> this.  Most recently libproxy was using a sysroot that didn't exist,
> which prompted my cmake patch.
>
> Presumably the change would replace the package-architecture element
> in the path with the machine name.  Seems reasonable to me: a more
> logical layout of files without any meaningful impact to performance.

I agree with Ross here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

