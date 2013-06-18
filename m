Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3226007B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:07:40 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uoqx2-00041W-Pm; Tue, 18 Jun 2013 10:07:40 +0200
Message-ID: <1371542851.5066.1.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: rongqing.li@windriver.com
Date: Tue, 18 Jun 2013 09:07:31 +0100
In-Reply-To: <b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 08:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 15:19 +0800, rongqing.li@windriver.com wrote:
> -           ${libdir} ${sbindir} ${datadir} \
> +           ${libdir} /usr/lib/locale ${sbindir} ${datadir} \

This is bogus for a number of reasons.  If the only reason for having it
is for lsbtest, can't it go in some LSB recipe?

p.



