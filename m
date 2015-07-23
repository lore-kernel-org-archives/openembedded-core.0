Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id EDEAC761B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 21:57:34 +0000 (UTC)
Received: (qmail 1195 invoked by uid 1003); 23 Jul 2015 21:57:33 -0000
Received: from unknown (HELO ?192.168.11.124?)
	(philip@opensdr.com@71.171.10.162)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	23 Jul 2015 21:57:33 -0000
To: Ash Charles <ashcharles@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55B1634C.3070305@balister.org>
Date: Thu, 23 Jul 2015 17:57:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 21:57:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I'd like to see this also. I've added a rm to my script to work around
this, but this change would help a lot of people.

Philip

On 07/23/2015 05:44 PM, Ash Charles wrote:
> In order to use the wic tool multiple times (Ubuntu 15.04 host), I need
> to cherry-pick these two patches onto the fido branch.  Otherwise, wic
> just hangs on the second invocation.  Can these two patches be applied
> as backports to Fido?
> 
> Alexandre Belloni (1):
>   wic: remove intermediate partitions
> 
> Ed Bartosh (1):
>   wic: Make sure file exists before removing it
> 
>  scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

