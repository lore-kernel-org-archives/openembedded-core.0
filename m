Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A2E2D77250
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 11:43:48 +0000 (UTC)
Received: from localhost ([127.0.0.1]
	helo=[IPv6:2001:67c:1810:f051:fa2f:a8ff:feb0:ae33])
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aPTwQ-0007BE-Tu; Sat, 30 Jan 2016 12:43:47 +0100
Message-ID: <1454154224.7421.7.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Sat, 30 Jan 2016 11:43:44 +0000
In-Reply-To: <bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Sat, 30 Jan 2016 11:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-29 at 12:35 -0500, Hongxu Jia wrote:
> +If option gno-record-debug-prefix-map used, it does not
> +record -fdebug-prefix-map to gcc command line switches
> +in DWARF DW_AT_producer.
> +
> +Upstream-Status: Inappropriate [oe specific]

If you consider this to be oe-specific and inappropriate for upstream,
wouldn't it be better to make the new behaviour default to on and not
have to add an extra option to the CFLAGS?  (You could still provide a
switch to restore the old behaviour for those who want it.)

Alternatively, if the new behaviour defaults to off, there doesn't seem
any reason that this patch couldn't and shouldn't be sent upstream.

p.



