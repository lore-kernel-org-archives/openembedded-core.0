Return-Path: <holger@moiji-mobile.com>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Feb 2015 20:58:43 UTC
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 311957066B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 20:58:43 +0000 (UTC)
Received: from sangmingze-mail.local (ip5b41c286.dynamic.kabel-deutschland.de
	[91.65.194.134])
	by mail.sysmocom.de (Postfix) with ESMTPSA id D3302A8E8C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 20:48:49 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.84)
	(envelope-from <holger@moiji-mobile.com>) id 1YMjdK-0001sy-5p
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Feb 2015 21:48:10 +0100
Date: Sat, 14 Feb 2015 21:48:10 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150214204810.GA4776@xiaoyu.lan>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: udhcpc 50default/simple.script and standard metric
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
X-List-Received-Date: Sat, 14 Feb 2015 20:58:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I want to use the multiple defaults route feature of the
kernel but I want to install some routes that are more
important than the link managed with dhcp. The only way
I can think of is to change the "metric=0" to a "metric=10"
in the mentioned file. For normal applications nothing has
changed but it allows me to add another default route that
is listed before the other default.

Is there any objection to change the default metric to 10?

kind regards
	holger


