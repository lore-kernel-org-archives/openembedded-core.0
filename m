Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDC26EDDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:02:33 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EB46322320A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:02:29 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F16BC22320A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:02:28 +0100 (CET)
Date: Tue, 11 Feb 2014 09:02:22 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20140211080222.GA27801@mail.itconsulting-heinold.de>
References: <20140121155032.GA21712@mail.itconsulting-heinold.de>
	<E32137DE-8B3E-42C9-BF29-487777BC4EE7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E32137DE-8B3E-42C9-BF29-487777BC4EE7@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: strange directories inside sdk build with with dora
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
X-List-Received-Date: Tue, 11 Feb 2014 08:02:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2014 at 09:46:47PM -0800, Khem Raj wrote:
> 
> On Jan 21, 2014, at 7:50 AM, Henning Heinold <henning@itconsulting-heinold.de> wrote:
> 
> > Hi,
> > 
> > I build a sdk with latest stable dora and in includes some x86 directories in the arm sysroot:
> > 
> > pwd
> > 
> > /opt/poky/1.5.1/sysroots/armv5te-poky-linux-gnueabi
> > 
> > find | grep "/opt"
> > 
> > ./opt
> > ./opt/poky
> > ./opt/poky/1.5.1
> > ./opt/poky/1.5.1/sysroots
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chsh
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/passwd
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/opkg
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chfn
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/groups
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin/chpasswd
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/su
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/login
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vigr
> > ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vipw
> > 
> > Are the really used or are the just got wrongly included?
> 
> This seems wrong. firstly file a bug so it can be tracked. Secondly, seems
> prefix has gone wrong for some nativesdk package 
> 

I have filed a bug.

Bye Henning

