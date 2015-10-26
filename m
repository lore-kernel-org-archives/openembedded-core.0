Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2904E60657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:50:22 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZqkyT-00059r-7k; Mon, 26 Oct 2015 17:50:21 +0100
Message-ID: <1445878220.5251.110.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Oct 2015 16:50:20 +0000
In-Reply-To: <562E58BE.9060003@windriver.com>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net> <562E58BE.9060003@windriver.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Mon, 26 Oct 2015 16:50:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-26 at 11:45 -0500, Mark Hatle wrote:
> 
> 
> While some of the modern hashing techniques and such do improve run
> -time dynamic
> link performance, there is still a hit that we must take.  For
> devices that need
> quick boot times, quick startup, or are memory constrained, the
> prelinker can
> still help.  (Memory usage on very small systems is a good example. 
>  Memory
> usage can be reduced in larger applications by reducing the number of
> Copy-on-write pages required to handle the relocation information.)

Do you have any concrete data on how much of a boot time speedup,
and/or what reduction in dirty pages, you see on a modern image with
prelink versus the same image without?

p.


