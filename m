Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SlcdX-0002xF-KW for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 11:09:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q628weNx029628
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 09:58:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26131-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 09:58:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q628wVA0029622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 09:58:32 +0100
Message-ID: <1341219516.23146.184.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 09:58:36 +0100
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FE50D39@SHSMSX102.ccr.corp.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FE50D39@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/20] Kernel Updates and other fixes
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
X-List-Received-Date: Mon, 02 Jul 2012 09:09:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 01:01 +0000, Lu, Lianhao wrote:
> Hi Richard,
> 
> > Lianhao Lu (3):
> >   classes/image: Allow openssh empty passwords login.
> >   image/core-image: Handle conflicting IMAGE_FEATURES.
> >   task-core-tools-debug: Added openssh-sftp-server.
> 
> I saw only the first patch "openssh empty password" was merged. What's the status of the other 2 patches?

Sorry, I'd meant to reply about this. We need to use something other
than SkipPackage when there are conflicting options. I've replied to the
patch.

Cheers,

Richard



