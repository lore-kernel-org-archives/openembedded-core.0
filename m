Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id BF1AF76E4A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 02:10:07 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 97678C4993
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 21:10:06 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2016 21:10:03 -0500
Message-ID: <BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
In-Reply-To: <b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
	<b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5260)
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Fri, 02 Sep 2016 02:10:12 -0000
Content-Type: text/plain; format=flowed

On 1 Sep 2016, at 20:33, wenzong fan wrote:

> No, I didn't think it's related to any specific docker version.
>
> I tested it on "Docker version 1.7.1, build 786b29d" & "Docker version 
> 1.11.2, build b9f10c9".
>
> BTW, I also tested the docker build w/o dumb-init, and the build works 
> ...

Yeah, it's definitely specific in some way to docker.

However, it doesn't appear to be 100% reproducible; I just tried a build 
with your reproducer and it completed without problems. (Unless the 
problems are more subtle, and don't prevent a build.) So this one's 
gonna be really fun to track down.

-s

