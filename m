Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8E2B6619E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 14:41:03 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UiQVr-0003VB-8C; Fri, 31 May 2013 16:41:03 +0200
Message-ID: <1370011262.8846.63.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Date: Fri, 31 May 2013 15:41:02 +0100
In-Reply-To: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Fri, 31 May 2013 14:41:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-31 at 16:11 +0200, Marcin Juszkiewicz wrote:
> Next one can be ldconfig which is ~600KB.

There's already an option to turn that off: you can set USE_LDCONFIG=0
in your distro configuration (which micro does, for example).
Converting that to be a modern DISTRO_FEATURE would be a fine thing.

On the udev thing I guess my initial reaction would be that if you want
the smallest rootfs you probably don't want to be using udev at all.
But if it's installing files that are totally unnecessary then that does
seem a bit extravagant and I agree that it should be curtailed.

p.



