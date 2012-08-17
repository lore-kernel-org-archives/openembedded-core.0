Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2JCl-00084Q-N5 for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 11:50:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9d2Xs007297
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:39:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06335-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:38:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7H9cqlo007291
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 10:38:52 +0100
Message-ID: <1345196331.14667.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 10:38:51 +0100
In-Reply-To: <92d6de11744098c3431309c5abc2f3217e166dac.1345174354.git.laurentiu.palcu@intel.com>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
	<92d6de11744098c3431309c5abc2f3217e166dac.1345174354.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] adt-installer: add support for relocatable SDK
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
X-List-Received-Date: Fri, 17 Aug 2012 09:50:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 06:44 +0300, Laurentiu Palcu wrote:
> Since we made the SDK relocatable, we have to add this functionality to
> adt-installer too.
> 
> Other:
>  - Changed tabs to spaces in the recipe file too.

Shell functions use tabs, python uses spaces. The OE TSC has thought
long and hard about this and that is the decision. Its not perfect but
the alternatives will cause more problems than any benefit is worth.

Cheers,

Richard




