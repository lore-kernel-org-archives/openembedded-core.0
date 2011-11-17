Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RR5QP-0003sl-VO
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 18:06:59 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 01706110018B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 18:00:34 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 28B691100182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 18:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g230119040.adsl.alicedsl.de
	[92.230.119.40]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 18:00:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id F08573C49D; Thu, 17 Nov 2011 18:00:31 +0100 (CET)
Date: Thu, 17 Nov 2011 18:00:31 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111117170031.GE15601@mail.adw-basketball.de>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
	<1321547193.12103.5.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1321547193.12103.5.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 17:06:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2011 at 05:26:33PM +0100, Paul Menzel wrote:
> Dear Henning,
> 
> 
> Am Donnerstag, den 17.11.2011, 10:48 +0100 schrieb Henning Heinold:
> 
> > with the setup now in useradd.bbclass, at least dbus-native depends
> > on the base-passwd from target. I think this is not wanted.
> > My patch resets the DEPENDS line for native packages similar to
> > nativesdk.
> 
> why do not you use that as the commit message? That would be very
> helpful for me at least. ;-)

Becaus it is not rocket science.
 
> 
> Thanks,
> 
> Paul

Bye Henning


