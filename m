Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 33AE7763E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id EEE9C609155
Message-ID: <1438273329.3455.27.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:22:09 +0100
In-Reply-To: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
References: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
X-Mailer: Evolution 3.16.4 (3.16.4-2.fc22) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH 0/2] Backports for WIC
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
X-List-Received-Date: Thu, 30 Jul 2015 16:22:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ash,

On Thu, 2015-07-23 at 14:44 -0700, Ash Charles wrote:
> In order to use the wic tool multiple times (Ubuntu 15.04 host), I 
> need
> to cherry-pick these two patches onto the fido branch.  Otherwise, 
> wic
> just hangs on the second invocation.  Can these two patches be 
> applied
> as backports to Fido?

Thanks for reporting the issue and finding the fix. Backporting those
changes seems reasonable to me, I've queued them in my joshuagl/fido
-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

> Alexandre Belloni (1):
>   wic: remove intermediate partitions
> 
> Ed Bartosh (1):
>   wic: Make sure file exists before removing it
> 
>  scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> -- 
> 2.1.4
> 

