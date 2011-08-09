Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qqmtn-000825-Sd for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:03:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79Dwlig013961
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 14:58:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13359-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 14:58:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79DwdDA013955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 14:58:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
References: <032728F4-C51D-4298-B50C-B1C2C7050E22@kernel.crashing.org>
Date: Tue, 09 Aug 2011 14:58:06 +0100
Message-ID: <1312898286.14274.298.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: meta-toolchain-sdk failure
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
X-List-Received-Date: Tue, 09 Aug 2011 14:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 08:45 -0500, Kumar Gala wrote:
> Seeing the following when trying to do a meta-toolchain-sdk build w/latest git.  Guessing we're missing a depend of some sort:
> 
> | error: Failed dependencies:
> | 	telepathy-python is needed by task-core-standalone-gmae-sdk-target-1.0-r13.ppc64e5500
> 
> I think the reset of this is noise:

It is, yes.

Did telepathy-python build at all (you can check if any stamps are
present)? Are there any packages generated (in the deploy/rpm
directory)?

I'm trying to work out if this wasn't present because it didn't build,
because it did build but didn't package correctly or whether the rootfs
code just isn't seeing the package...

Cheers,

Richard



