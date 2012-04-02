Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SEY5x-0008Ll-RU for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 05:38:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323TA3O004636
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Apr 2012 04:29:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27688-06 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2012 04:29:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323Svim004630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Apr 2012 04:29:00 +0100
Message-ID: <1333337337.647.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Apr 2012 04:28:57 +0100
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] dexuan: more build appliance patches: [Apr 1, 2012]
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
X-List-Received-Date: Mon, 02 Apr 2012 03:38:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-02 at 00:10 +0800, Dexuan Cui wrote:
> BTW:
> I added a "Upstream-Status: inappropriat" into every patches to genext2fs.
> 
> With the patches, I only spent about 10~15 minutes to create a 4.5GB
> .rootfs.ext3 file by genext2fs.
> 
> 
> The following changes since commit 8691a588267472eb5a32b978a0eb9ddfd0c91733:
> 
>   cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:59 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib dcui/master
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dcui/master
> 
> Dexuan Cui (5):
>   genext2fs: support large files and  filesystems without using large
>     amounts of memory
>   self-hosted-image: improve do_populate_poky_src
>   self-hosted-image: renew the poky src's SRCREV that's installed into
>     the target
>   builder: uncomment the settings for BB_NUMBER_THREADS and
>     PARALLEL_MAKE
>   self-hosted-image: fix indentation: 8 spaces --> Tab

I've merged these to master, thanks. Whilst I'm reluctant to do so at
this point in the release process for such major changes, I think in
this case it does make sense since the genext2fs changes seem to fix a
number of problematic issues.

Cheers,

Richard



