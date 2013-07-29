Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B64D46A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:20:53 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V3kZS-0003Bw-3P; Mon, 29 Jul 2013 12:20:54 +0200
Message-ID: <1375093253.13247.5.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Laszlo Papp <lpapp@kde.org>
Date: Mon, 29 Jul 2013 11:20:53 +0100
In-Reply-To: <CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 29 Jul 2013 10:20:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 11:01 +0100, Laszlo Papp wrote:
> No, that was intentional. That is why the change has been updated.
> 
> 
> I can update the commit message if that is what you wish?

As a general rule yes, please always make sure that the commit message
describes what the patch is actually doing.

But in this particular case, your new patch seems to have more serious
problems since it will cause rfkill to silently disappear for many
people who do currently have it.

If your distro selects a toolchain which doesn't contain the necessary
bits to support rfkill then it seems as though the appropriate course of
action would be to either:

a) patch rfkill so that it does build with your headers; or

b) introduce a PACKAGECONFIG option for busybox to turn off rfkill even
if it would naturally default to on, and set this in your distro
configuration; or

c) just add your own .bbappend for busybox to do what you want.

p.




