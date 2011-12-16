Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RbbpE-0006AT-QS
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 18:44:05 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A5EAD110018A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 18:37:06 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CC55C11000B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 18:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g229045197.adsl.alicedsl.de
	[92.229.45.197]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 18:37:05 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9BFCE3C49C; Fri, 16 Dec 2011 18:37:04 +0100 (CET)
Date: Fri, 16 Dec 2011 18:37:04 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111216173704.GA3744@rhein.zuhause.netz>
References: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMvUbCzceL3owJH51JnUYYC90ExEHkbEOcd4887sjWAKEV83=A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: after modifying source code in work/, how to rebuild package?
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
X-List-Received-Date: Fri, 16 Dec 2011 17:44:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2011 at 08:55:05AM +0100, Leon Woestenberg wrote:
> Hello all,
> 
> 
> after modifying source code in the work directory, what is the set of
> commands to rebuild the package (from the compile stage and further)?
> 
> Under classic OpenEmbedded, I removed the compile, install, package stages
> stamp files and ran bitbake. However, shared staging "broke" that workflow.
> 
> Is there an equivalent approach with OpenEmbedded Core?  Possibly disabling
> 'sstage' on a per build, or per package basis?
> 
> 
> Thanks,
> 
> Leon.


try the devshell

bitbake -c devshell

and 

than tmp/run.do_compile

Bye Henning


