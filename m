Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id F271A6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 09:57:37 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4TA2-0005no-3j; Wed, 31 Jul 2013 11:57:38 +0200
Message-ID: <1375264657.8017.46.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Chunrong Guo <B40290@freescale.com>
Date: Wed, 31 Jul 2013 10:57:37 +0100
In-Reply-To: <1375258783-9009-1-git-send-email-B40290@freescale.com>
References: <1375258783-9009-1-git-send-email-B40290@freescale.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 09:57:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-31 at 16:19 +0800, Chunrong Guo wrote:
>     *If /etc/mtab is a symlink to /proc/self/mounts,
>      mounting fails because addmntent returns an error.
>      As a consequence, the Private directory is unusable
>      because /proc/self/mounts is read-only feature.

This looks like it will break anything with a READ_ONLY_ROOTFS since now
mtab won't exist and there will be no way for it to get created.  

I'm not quite sure I understand what problem you're trying to fix (since
I can't immediately think of any situation where calling addmntent() is
a sensible thing to do) but, whatever the problem is, I don't think that
unilaterally removing /etc/mtab is a good way to go about fixing it.

p.


