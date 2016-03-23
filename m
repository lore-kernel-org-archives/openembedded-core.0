Return-Path: <uol@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6AF62132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 08:47:42 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <uol@pengutronix.de>)
	id 1aieS6-0004F1-E2; Wed, 23 Mar 2016 09:47:42 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.86_2)
	(envelope-from <uol@pengutronix.de>)
	id 1aieS6-0004n9-4e; Wed, 23 Mar 2016 09:47:42 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 23 Mar 2016 09:47:39 +0100
Message-Id: <1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
References: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Wed, 23 Mar 2016 08:47:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

On Tue, Mar 22, 2016 at 06:34:08PM -0600, Dan McGregor wrote:
> On 17 Feb 2016 3:48 a.m., "Ulrich Ölmann" <u.oelmann@pengutronix.de> wrote:
> >
> > Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
> > 'nfs-statd.service' instead but forgot to update the mount.nfs helper
> > 'start-statd' accordingly.
> >
> > Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> > ---
> >  .../files/bugfix-adjust-statd-service-name.patch   | 34
> ++++++++++++++++++++++
> >  .../nfs-utils/nfs-utils_1.3.3.bb                   |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch

[...]

> I just got bit by this in jethro. Can it be backported?

Backporting should be fairly simple, I assume you didn't give it a go.
Try the patch that comes in my reply to this mail. It is untested as I don't
have the time at the moment, hence please report back if it works.

Regards
Ulrich

