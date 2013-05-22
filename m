Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9FA60984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 08:23:35 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id E80DF952B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 09:23:35 +0100 (BST)
Message-ID: <519C8086.8060702@r-finger.com>
Date: Wed, 22 May 2013 09:23:34 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-2-git-send-email-tf+lists.yocto@r-finger.com>
	<1369135176.6695.15.camel@phil-desktop.brightsign>
	<11605555.E9oYV9MnH1@helios>
In-Reply-To: <11605555.E9oYV9MnH1@helios>
Subject: Re: [PATCH v3 1/8] clutter.bbclass: helper class for clutter and friends
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
X-List-Received-Date: Wed, 22 May 2013 08:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/13 17:51, Paul Eggleton wrote:
> On Tuesday 21 May 2013 12:19:36 Phil Blundell wrote:
>> On Tue, 2013-05-21 at 12:04 +0100, Tomas Frydrych wrote:
>>>  meta/classes/clutter.bbclass |   23 +++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>  create mode 100644 meta/classes/clutter.bbclass
>>
>> Do we really need a new class for this?  Can it be merged with gnomebase
>> somehow, perhaps?
>>
>> If clutter really does need its own specialised logic then maybe clutter
>> and cogl should both stay in recipes-graphics/clutter and just share
>> an .inc file.  It seems a bit sad to clutter (no pun intended) the
>> global classes directory with this sort of thing.
> 
> Have to say I agree; given that this set has been merged we could take this as 
> an additional patch if it works for Tomas?

The clutter class is used by cogl, clutter and mx (only the version
parsing logic in the latter); it is also used by the mutter package in
meta-clutter. But if you prefer includes in oecore, that's fine by me.

Tomas

-- 
http://sleepfive.com

