Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0E68A60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 18:03:35 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1a6Mbv-0001cK-Dk; Tue, 08 Dec 2015 19:03:35 +0100
Message-ID: <1449597814.1472.185.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 08 Dec 2015 18:03:34 +0000
In-Reply-To: <1449585777-6697-1-git-send-email-ross.burton@intel.com>
References: <1449585777-6697-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH][RFC] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Tue, 08 Dec 2015 18:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-08 at 14:42 +0000, Ross Burton wrote:
> 
> tl;dr: our definition of libexecdir is fundamentally wrong because it
> embeds
> $BPN.  The prevailing trend (and default in GNU tools) is to use
> /usr/libexec,
> so this patch changes it.

I assume we can expect a patch from Saul in another three years to
change it back again.  Plus ca change... :-}

More seriously though, I think this is a good change.  I have had
essentially this patch locally ever since it was most recently changed
in the other direction, and there never seemed to be any very
compelling reason for the BPN-based version.

p.


