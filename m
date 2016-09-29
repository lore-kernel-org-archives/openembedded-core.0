Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 4C466602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 03:36:20 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 44AC3C495D;
	Wed, 28 Sep 2016 22:36:22 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Robert Yang" <liezhi.yang@windriver.com>
Date: Wed, 28 Sep 2016 22:36:21 -0500
Message-ID: <2B58BF15-5955-4847-88C3-C3EF8036F1D1@seebs.net>
In-Reply-To: <db01ab37-aeb0-46cd-b953-dd110f59de8b@windriver.com>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
	<23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
	<CB33D621-D8CC-4880-AC2F-EAE42D42F943@seebs.net>
	<db01ab37-aeb0-46cd-b953-dd110f59de8b@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Thu, 29 Sep 2016 03:36:22 -0000
Content-Type: text/plain; format=flowed

On 28 Sep 2016, at 22:34, Robert Yang wrote:

> Thanks, it works for me now, I will send a V2 with your patch sooner.
>
> How about the prefix issues? Which ones should be prefixed do you 
> think
> please ?
>
> Yocto 2.2 may not need the prefix, but we can treat it as an 
> enhancement
> for YP 2.3.

I don't think anything should be prefixed at this point. The prefix was 
a suggestion for clarifying those messages which were showing up on the 
console, but really, they shouldn't have been showing up on the console 
in the first place.

And really, ideally several of those messages would become less 
frequent, since they're diagnostics for a circumstance we expect to 
happen. They should probably be debug messages, not unconditional 
diagnostics.

-s

