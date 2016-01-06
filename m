Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 23EB6731EA;
	Wed,  6 Jan 2016 23:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06N4LAt023853; Wed, 6 Jan 2016 23:04:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id roR9hKD6ZBvt; Wed,  6 Jan 2016 23:04:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06N4rRI023883
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Jan 2016 23:04:54 GMT
Message-ID: <1452121493.7598.101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 06 Jan 2016 23:04:53 +0000
In-Reply-To: <3002291.NNtibCZEiD@peggleto-mobl.ger.corp.intel.com>
References: <1451307640.4129.16.camel@linuxfoundation.org>
	<3002291.NNtibCZEiD@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Split do_rootfs into image specific tasks?
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
X-List-Received-Date: Wed, 06 Jan 2016 23:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-06 at 10:30 +1300, Paul Eggleton wrote:
> I like this a lot. I'd idly considered this model before (as I'm sure
> others 
> had) as it simplifies a lot of the multi-format image construction
> handling, 
> improves incremental performance, and the added granularity makes it
> slightly 
> easier to see what the build system is doing. Obviously there is some
> minor 
> cleanup work to be done on the patchset as you've noted.
> 
> The only "issue" I can think of is that bitbake -c rootfs will no
> longer build 
> the image files as it did previously; however I'm not sure I'd
> structure things 
> any differently to avoid that though. I suspect people will fairly
> easily adapt 
> to this change as long as we publicise it effectively.

Thanks for the feedback. Just as a heads up for people, I posted an
updated patch set to the OE-Core list. This one has various issues
fixed (including the todos) and is ready for wider testing.

Cheers,

Richard


