Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TF0aP-0004Di-NR for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 12:35:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LAN1Oa018069;
	Fri, 21 Sep 2012 11:23:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11861-09; Fri, 21 Sep 2012 11:22:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8LAMoQ6018063
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 11:22:52 +0100
Message-ID: <1348222970.10108.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Fri, 21 Sep 2012 11:22:50 +0100
In-Reply-To: <a10d0e1b4dc0667b04f1cfa906378ce9094449ae.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
	<a10d0e1b4dc0667b04f1cfa906378ce9094449ae.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/6] SDK: relocate symlinks too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 10:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 16:48 +0300, Laurentiu Palcu wrote:
> The directory usr/libexec/ in the SDK sysroot contains the default
> symlinks to the toolchain binaries and these, too, need to point to the
> correct toolchain path.
> 
> [YOCTO #3090]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/populate_sdk_base.bbclass             |    5 +++++
>  .../adt-installer/scripts/adt_installer_internal   |    5 +++++
>  2 files changed, 10 insertions(+)

I've merged this since it definitely improves the situation but I am
left wondering if we shouldn't generate relative symlinks in the first
place for the toolchain...

Cheers,

Richard





