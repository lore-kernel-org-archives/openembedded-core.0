Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DBDC96B1EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:36:10 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V3pUY-0003Oa-3j; Mon, 29 Jul 2013 17:36:10 +0200
Message-ID: <1375112169.13247.44.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 16:36:09 +0100
In-Reply-To: <51F5E948.4070107@cn.fujitsu.com>
References: <51F5E863.9010406@cn.fujitsu.com> <51F5E948.4070107@cn.fujitsu.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/6]qemuarm.conf: provide a common qemuarm machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 15:36:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 12:02 +0800, Bian Naimeng wrote:
> qemux86.conf: provide a common qemux86 machine configuration, 
> so developer/distributor can customize their specific one.
> 
> Although, we can modify the meta/conf/machine/qemux86.conf to customize our 
> configuration, but it's uncomfortable for developer/distributor maintaining
> their branch.
> After applying this patch, developer can tell poky using their machine
> configuration by prepending their layer to BBPATH(Of course,
> the bblayers.conf should be adapted to it).

I don't really understand the purpose of this patch.  Surely there is
nothing to stop you from shipping an overlay qemux86.conf in some other
layer today, right?  What exactly is the advantage of this extra
indirection through an .inc file?

Also, as a side note, your patches 1/6, 2/6 and 6/6 all said
"qemuarm.conf" in the subject lines but only the last of them actually
contained changes to qemuarm.conf.

Also also, the patches in this form are quite hard to follow.  Did you
use "git format-patch -M" when creating them?

p.



