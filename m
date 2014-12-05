Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2DA72304
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:27:46 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id f73so201919yha.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=9FsFPjA85YR0LeSZ7ZslCrjNy7kLvtYFcFvBZ9lWRII=;
	b=uWlrGE4cexl3QNFakB7Rm5kQhgbb6QNsyCg5Vo55UzR9KhfcJUja5H5P+5UDR7mBW3
	wI8cEMwLP9cXx33TVvlZPyRTvMPHkHuYQiU3/rCn9UQBl86Rx13DyHXXT20AbA0HP3mv
	46IY4ygxL5yfknb1683dV82mH1FFRmxXnwOB5VT5ocXML77O4fTpQBM1jhUbCy9VSTtM
	tiihTNztOnzCOsjKMo4Fqmb1Nq8uWCKFDemM+4P2kRCNhrvz+N0iTwyLhxsfdkDBcrWm
	OAu/38U1eH3vKHPExE2X7PE4iAe9l6+GzZIDT8AMKLN4oxf21o78AhEPsz69krd135lH
	VPgA==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr22380159ykp.30.1417778867344;
	Fri, 05 Dec 2014 03:27:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Fri, 5 Dec 2014 03:27:47 -0800 (PST)
In-Reply-To: <54814E43.3080602@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<CAP9ODKrh_p=yv7x2hWg7QcV_4vG2xvF+7WgcckMqf=FU457ovg@mail.gmail.com>
	<54814E43.3080602@topic.nl>
Date: Fri, 5 Dec 2014 09:27:47 -0200
X-Google-Sender-Auth: GI6AtucdUmZroeJ2w30T2VglOs4
Message-ID: <CAP9ODKq1LXe0PPsgcYepf5uRmbVkHdHHDQfL32eFgUZNUUKW2w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Busybox mdev improvements
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
X-List-Received-Date: Fri, 05 Dec 2014 11:27:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 4:18 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 12/04/2014 09:47 PM, Otavio Salvador wrote:
>>
>> On Thu, Dec 4, 2014 at 8:27 AM, Mike Looijmans <mike.looijmans@topic.nl>
>> wrote:
>>>
>>> This first series fixes the touchscreen support. A patch to automatically
>>> have mdev mount storage devices will follow soon, I'm still testing it.
>>
>>
>> I enjoy this idea but please put this one in a specific sub-package or
>> with a setting in /etc/default/mdev to enable/disable it.
>
>
> By "this" you refer to the automatic mounting? No problem, and a good
> suggestion too.

Yes.

> Another problem I solved in various projects is the automatic loading of
> kernel drivers. It makes mdev automatically load modules and firmware, e.g.
> when plugging in a USB device, and adds a script to scan for hotpluggable
> devices at boot. It's only a few lines, but these make mdeve provide most of
> udev's functionality.

Agreed and I think this is also a good addition; however we should
have it in a subpackage as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

