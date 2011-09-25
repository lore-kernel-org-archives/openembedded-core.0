Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1R7vAL-0000QS-BZ
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 22:19:09 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D598B1100113
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 22:04:38 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0C28E1100104
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 22:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052064157.adsl.alicedsl.de
	[78.52.64.157]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 22:04:37 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id CF2FB30001; Sun, 25 Sep 2011 22:04:36 +0200 (CEST)
Date: Sun, 25 Sep 2011 22:04:36 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110925200436.GB29890@mail.familie-heinold.de>
References: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
	<1316979467-687-3-git-send-email-heinold@inf.fu-berlin.de>
	<23ABBF2D-E135-408C-BCA1-05E48436743F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <23ABBF2D-E135-408C-BCA1-05E48436743F@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 2/3] feature-arm-d16.inc: add feature for arm cores which do not have a neon unit or no support for it in the kernel
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
X-List-Received-Date: Sun, 25 Sep 2011 20:19:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 25, 2011 at 09:53:08PM +0200, Koen Kooi wrote:
> 
> Op 25 sep. 2011, om 21:37 heeft Henning Heinold het volgende geschreven:
> 
> > * call it d16 because of the -mfpu=vfpv3-d16 gcc option and
> >  avoid naming conflicts with vfp feature
> 
> That's a highly artificial seperation to be honest. Is there really any demonstrable real world use to it?

Hi Koen,                                                                                                                           
                                                                                                                                   
do you mean it's really useless gcc option at all or did you mean how to use it in machine.inc file?                              

Bye Henning                                                                                                                        
                                                                                                                                   
PS: Sorry for posting it twice.  


