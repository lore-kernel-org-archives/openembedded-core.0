Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1612E7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 23:34:40 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aHK4m-0001td-ER; Fri, 08 Jan 2016 00:34:40 +0100
Message-ID: <1452209673.2002.125.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 07 Jan 2016 23:34:33 +0000
In-Reply-To: <1452205752-6353-3-git-send-email-armccurdy@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-3-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 23:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>  EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
>  EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
> +EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"

Please add a comment explaining why this isn't --with-arch=armv7ve.

p.



