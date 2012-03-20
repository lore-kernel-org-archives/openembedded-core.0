Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1S9znD-0000OT-GC
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:12:07 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C0420223264B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:03:16 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 81505223263E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:03:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052067032.adsl.alicedsl.de
	[78.52.67.32]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:03:15 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 83C213C4C0; Tue, 20 Mar 2012 15:03:12 +0100 (CET)
Date: Tue, 20 Mar 2012 15:03:12 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120320140310.GA14747@rhein.zuhause.netz>
References: <20120319215934.5336A206060@gemini.denx.de>
	<20120320004345.GG15554@denix.org>
	<20120320113348.D4362202A50@gemini.denx.de>
MIME-Version: 1.0
In-Reply-To: <20120320113348.D4362202A50@gemini.denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: specific version dependenciews - was: Linking two recipes
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
X-List-Received-Date: Tue, 20 Mar 2012 14:12:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 20, 2012 at 12:33:48PM +0100, Wolfgang Denk wrote:
> What would these be?  Is there any documentation about such details?
> I searched the bitbake, poky and yocto docs but could not find it...
> 
> Best regards,
> 
> Wolfgang Denk
> 

Hi Wolfgang,

we do not support version bounding in the recipes directly. You might have to
go with the PREFFRED_VERSION prefix for the recipes in the machine file.

Bye Henning


