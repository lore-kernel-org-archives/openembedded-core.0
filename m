Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E23B777241
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 11:38:47 +0000 (UTC)
Received: from localhost ([127.0.0.1]
	helo=[IPv6:2001:67c:1810:f051:fa2f:a8ff:feb0:ae33])
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aPTrZ-0007Av-92; Sat, 30 Jan 2016 12:38:45 +0100
Message-ID: <1454150158.7421.5.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <89d0983784390cce5fd975199443c874ee1b1295.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<89d0983784390cce5fd975199443c874ee1b1295.1454088695.git.hongxu.jia@windriver.com>
Date: Sat, 30 Jan 2016 10:35:58 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.12.9-1+b1 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] glibc.inc: do not immediate expand SELECTED_OPTIMIZATION
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
X-List-Received-Date: Sat, 30 Jan 2016 11:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-29 at 12:35 -0500, Hongxu Jia wrote:
> We need to expand SELECTED_OPTIMIZATION later, so
> do not immediate expansion, and do the work in
> anonymous python function.
> 
> It is reasonable to give an error for -O0.

I applaud the general idea of this patch, but...

> +        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")

... can't you just use CFLAGS += -Wno-error rather than fiddling with
SELECTED_OPTIMIZATION here?  -Wno-error is clearly not an optimization
flag.

p.



