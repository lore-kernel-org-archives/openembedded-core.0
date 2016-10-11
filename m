Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id F12D862133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 13:01:17 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:d9ca:78f3:9621:b8b5] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1btwgI-0006hK-CS; Tue, 11 Oct 2016 15:01:18 +0200
Message-ID: <1476190877.16008.48.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>, Yuanjie Huang
	<Yuanjie.Huang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 14:01:17 +0100
In-Reply-To: <91bf66ab-ed87-3f98-b7b1-cd75344e61f0@windriver.com>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<1476186839.16008.43.camel@pbcl.net>
	<91bf66ab-ed87-3f98-b7b1-cd75344e61f0@windriver.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 13:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-10-11 at 14:56 +0200, Mark Hatle wrote:
> 
> This was the first instance of the patch.  However after discussing
> the issue w/
> Khem Raj (in person), we came to the conclusion that we did want a
> way to permit
> people to modify the plural.y via a patch, otherwise someone could
> make a change
> and not realize it was ignored.

In that case they would need to add a dependency on bison-native in
order to get reliable builds.  Otherwise, if the build host happens to
not have bison installed, their change to plural.y will once again end
up being silently ignored.  I think it would be better to make it
consistent and deterministic.

p.


