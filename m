Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-08.prod.phx3.secureserver.net
	(p3plsmtpa08-08.prod.phx3.secureserver.net [173.201.193.109])
	by mail.openembedded.org (Postfix) with ESMTP id D31BE601F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:50:14 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-08.prod.phx3.secureserver.net with 
	id 5SqE1p0060BVjqb01SqEVm; Mon, 20 Oct 2014 07:50:15 -0700
Message-ID: <54452125.1080108@pabigot.com>
Date: Mon, 20 Oct 2014 09:50:13 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: viability of bluez5 in next OE development cycle?
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
X-List-Received-Date: Mon, 20 Oct 2014 14:50:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

There's this bugzilla entry: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5031

I see a NAKd patch set from about 26 Mar 2014 which tried to add 
virtual/bluez.  The outcome was that a rework would be done and tested 
and resubmitted latter. In the related discussion there was some concern 
that dependent packages were still not ready to move even though the 
last bluez4 release was in June 2012.

With a little local hacking I can get bluez5 working well enough for my 
BTLE needs on beaglebone (mostly s/bluez4/bluez5/g and a PROVIDER for 
bluez-hcidump).  Does anybody have plans to work this during the early 
1.8 development cycle?  It looks pretty straightforward, but Idon't use 
BT in enough variants and packages to be able to test the full set of 
required patches.

Peter

