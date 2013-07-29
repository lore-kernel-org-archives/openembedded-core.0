Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6928E60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:00:19 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V3kFX-0003B0-CJ; Mon, 29 Jul 2013 12:00:19 +0200
Message-ID: <1375092018.6324.176.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laszlo Papp <lpapp@kde.org>
Date: Mon, 29 Jul 2013 11:00:18 +0100
In-Reply-To: <1375082184-14871-1-git-send-email-lpapp@kde.org>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:00:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 08:16 +0100, Laszlo Papp wrote:
> This is necessary to get the build going, for instance with older Code Sourcery
> compilers.

You seem to have inadvertently sent a patch to busybox.inc as well as
the defconfig change that's described in the commit message.

p.



