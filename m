Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id E37AF60110
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2016 10:30:26 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3E16D68A019; Sat, 27 Aug 2016 11:30:26 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id B0C9368A019;
	Sat, 27 Aug 2016 11:30:25 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id B585767402AF;
	Sat, 27 Aug 2016 12:30:24 +0200 (CEST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <48a58ad6-9d18-2443-22f2-3eb07f6aa7b8@mlbassoc.com>
Date: Sat, 27 Aug 2016 12:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: pointercal-xinput?
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
X-List-Received-Date: Sat, 27 Aug 2016 10:30:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Is this recipe relevant any more (since pointercal was removed)?
   ${Poky}/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb

It, along with a .bbappend in meta-fsl-arm, is giving me runtime
errors:
   Using calibration data stored in /etc/pointercal.xinput
   Invalid format 42060
   unable to find device EETI eGalax Touch Screen
   Warning: error parsing geometry string - using defaults.
   Using calibration data stored in /etc/pointercal.xinput
   Invalid format 42060
   unable to find device EETI eGalax Touch Screen
   Warning: error parsing geometry string - using defaults.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

