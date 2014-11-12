Return-Path: <joshua.hernstrom@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 13CD862252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 18:06:03 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sACI63Ei020695 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 12:06:03 -0600
Received: from tyr.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014111212060379-990248 ;
	Wed, 12 Nov 2014 12:06:03 -0600 
Date: Wed, 12 Nov 2014 12:05:56 -0600
From: Joshua Hernstrom <joshua.hernstrom@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141112120556.629884d4@tyr.amer.corp.natinst.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/12/2014 12:06:03 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/12/2014 12:06:03 PM,
	Serialize complete at 11/12/2014 12:06:03 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.28,
	0.0.0000
	definitions=2014-11-12_08:2014-11-11, 2014-11-12,
	1970-01-01 signatures=0
Subject: Need help building debug kernel alongside default kernel
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
X-List-Received-Date: Wed, 12 Nov 2014 18:06:08 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hello,
I am trying to build and package a second kernel+modules (from the same source, but with a different kernel config) that is optimized for debugging. The end goal is to be able to easily switch to a debugging kernel through an 'opkg install' operation or something of similar ease.

I'm running into various problems using the example kernel recipe practices because it seems optimized (of course) for one kernel per image only.  Specifically, things like the naming convention on the kernel-module-* and kernel-firmware-* packages have been difficult to override cleanly and cause conflicts between my 'kernel' and 'kernel-dbg' recipes.

I did find this .inc file in the Angstrom project that is similar but not quite what I'm trying to do (and suggests that the packaging of the second kernel is problematic): https://github.com/Angstrom-distribution/meta-ti/blob/master/recipes-kernel/linux/multi-kernel.inc

Has anyone needed to accomplish something similar and have any suggested approaches or ideas on how best to structure two related kernel recipes under the same image build?

Thank you,
Josh
--
Joshua Hernstrom
National Instruments

