Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1S7jvl-0005HZ-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:51:37 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id F02832232636
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:35:11 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 54A612232635
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g229045138.adsl.alicedsl.de
	[92.229.45.138]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:35:11 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A3E623C4B9; Wed, 14 Mar 2012 09:35:09 +0100 (CET)
Date: Wed, 14 Mar 2012 09:35:09 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120314083509.GA22878@rhein.zuhause.netz>
References: <4F5FF91F.5010407@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F5FF91F.5010407@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: gdb 7.4 and libexpat
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 08:51:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 14, 2012 at 02:49:19AM +0100, Andreas Oberritter wrote:
> Hi everybody,
> 
> in our rootfs, when debugging remotely with gdbserver on mips32el, gdb
> 7.4 fails to find symbol names for use in backtraces. gdb 7.3.1 works
> well. One of my colleagues ran git bisect and discovered the culprit:
> 
> gdb git revision 22d678fdfdfc56ec75555f8f44ae5f0c4fc97e9a
> http://sourceware.org/ml/gdb-patches/2011-11/msg00103.html
> 
> We haven't found out why this patch breaks symbol lookup. However, we
> found three options to fix backtraces with version 7.4:
> 
> 1.) Revert the changeset, possibly without understanding it fully.
> 2.) Enable expat in gdb, dragging libexpat into the image.
> 3.) Disable expat in gdb-cross, possibly losing functionality.
> 
> It seems that if one side is compiled with expat and the other is not,
> then gdb and gdbserver now have problems communicating with each other.
> 
> Which way would you prefer?
> 
> Regards,
> Andreas
> 

Hi,

option 2 is my favourite.

Bye Henning


