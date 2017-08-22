Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 76CD378243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:07:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MG7wBP010573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 17:08:00 +0100
Message-ID: <1503418078.32591.118.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 17:07:58 +0100
In-Reply-To: <08e38c79-6ff5-fb02-00f3-c94e76b322fc@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
	<1503411893.32591.108.camel@linuxfoundation.org>
	<7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
	<1503415737.32591.112.camel@linuxfoundation.org>
	<7462b13d-0fa2-7a9f-c6d9-49c5a3f6abb0@windriver.com>
	<1503417606.32591.115.camel@linuxfoundation.org>
	<08e38c79-6ff5-fb02-00f3-c94e76b322fc@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 17:08:00 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 16:07:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 12:04 -0400, Bruce Ashfield wrote:
> On 08/22/2017 12:00 PM, Richard Purdie wrote:
> > 
> > On Tue, 2017-08-22 at 11:34 -0400, Bruce Ashfield wrote:
> > > 
> > > I can send you a v4 of the 4.12 patch in the next half an hour,
> > > that's easiest for me to do.
> > > 
> > > .. but if it isn't for you, go ahead and do the merge and I'll
> > > sort it out in a follow up.
> > The above works, I'm still trying to get to the bottom of the other
> > issues that are going on.
> Patch sent as a v4 (although I now realize I forgot to put
> v4 in the subject, only in the summary).

Thanks, I'll pull that into subsequent test runs.

> > Something in the IDE CDROM driver?
> I keep getting sent changes to drop IDE support completely, but
> they aren't in play here, I'm still waiting on a 4.10 linux-yocto
> to configure so I can diff the .configs and fire up some comparison
> boot tests.

I did diff the configs and nothing jumped out to me at
least, CONFIG_INITRAMFS_COMPRESSION=".gz" went missing but doesn't look
relevant as it only affects built in initramfs afaict.

Cheers,

Richard



