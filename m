Return-Path: <sm0ketst@stigmatedbrain.net>
X-Greylist: delayed 547 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Apr 2016 21:21:51 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1196E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:21:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id ACA2F486246
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:09:48 +0200 (CEST)
Received: from mfilter44-d.gandi.net (mfilter44-d.gandi.net [217.70.178.175])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 65573A80D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:09:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter44-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter44-d.gandi.net (mfilter44-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024) with ESMTP id KxblL-p6A8ba
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:09:43 +0200 (CEST)
X-Originating-IP: 84.198.60.41
Received: from [192.168.1.124] (d54C63C29.access.telenet.be [84.198.60.41])
	(Authenticated sender: sm0ketst@stigmatedbrain.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B4469A80DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 23:09:43 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <E88D0531F83F3744B03D1A909A2B070F5C52C7@ORSMSX110.amr.corp.intel.com>
From: "J.J. Garcia" <sm0ketst@stigmatedbrain.net>
Message-ID: <571E8724.2060308@stigmatedbrain.net>
Date: Mon, 25 Apr 2016 23:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <E88D0531F83F3744B03D1A909A2B070F5C52C7@ORSMSX110.amr.corp.intel.com>
Subject: Re: textinfo failure
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
X-List-Received-Date: Mon, 25 Apr 2016 21:21:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi!

I think I'm having the same issue with the dummy makeinfo.

--> assert arg[0] != '-' or arg[1] == '-' or 'E' not in arg or \

According to
http://lists.openembedded.org/pipermail/openembedded-core/2014-June/093459.html

The pathname contains '/OE/...' and mine contains /disk/WDCWD10EAVS/...

The 'E'.

?

JJ







