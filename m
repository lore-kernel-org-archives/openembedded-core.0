Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id CBC9160DBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:50:41 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4C08F22331C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:50:40 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3DCCE22331BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (p5099b351.dip0.t-ipconnect.de
	[80.153.179.81]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:50:39 +0100 (CET)
Date: Tue, 21 Jan 2014 16:50:33 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140121155032.GA21712@mail.itconsulting-heinold.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: strange directories inside sdk build with with dora
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
X-List-Received-Date: Tue, 21 Jan 2014 15:50:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I build a sdk with latest stable dora and in includes some x86 directories in the arm sysroot:

pwd

/opt/poky/1.5.1/sysroots/armv5te-poky-linux-gnueabi

find | grep "/opt"

./opt
./opt/poky
./opt/poky/1.5.1
./opt/poky/1.5.1/sysroots
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chsh
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/passwd
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/opkg
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chfn
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/groups
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin/chpasswd
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/su
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/login
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vigr
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vipw

Are the really used or are the just got wrongly included?

Bye Henning

