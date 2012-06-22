Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Si5Cj-0004vz-Ui for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:51:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEeZIK002511
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:40:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01932-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:40:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MEeTTE002505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 15:40:30 +0100
Message-ID: <1340376030.394.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2012 15:40:30 +0100
In-Reply-To: <20120622143121.GN9352@jama.jama.net>
References: <1340373998.394.36.camel@ted> <20120622143121.GN9352@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf/abi_version.conf: Update to use BasicHash signature generator
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
X-List-Received-Date: Fri, 22 Jun 2012 14:51:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 16:31 +0200, Martin Jansa wrote:
> On Fri, Jun 22, 2012 at 03:06:38PM +0100, Richard Purdie wrote:
> > This switches to use the hash based signature generatior and update
> > layout_abi to match stamp file layout changes.
> > 
> > Angstrom, SHR and Poky did this a while ago. This brings the OE-Core defaults
> 
> SHR didn't (except my testing), but I'm fine with this change.. I'll override it 
> in back to OEBasic in meta-shr layer (at least until we get faster
> official feed builder..).

Sorry, I thought you had switched, my mistake. I'll fix that commit
message before merging.

Cheers,

Richard



