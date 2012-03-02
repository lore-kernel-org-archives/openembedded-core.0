Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Uao-0003pT-2p for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 16:40:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22FVqjV002287;
	Fri, 2 Mar 2012 15:31:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01088-09; Fri,  2 Mar 2012 15:31:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22FViDB002280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Mar 2012 15:31:45 GMT
Message-ID: <1330702308.309.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Zhai, Edwin" <edwin.zhai@intel.com>
Date: Fri, 02 Mar 2012 15:31:48 +0000
In-Reply-To: <20120302063339.GB1450@edwin-gen>
References: <20120302063339.GB1450@edwin-gen>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib build failure with shadow-sysroot:do_populate_sysroot_setscene
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
X-List-Received-Date: Fri, 02 Mar 2012 15:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-02 at 14:33 +0800, Zhai, Edwin wrote:
> RP,
> I have image-sato multilib build failure with following error:
> 
> "ERROR: Task do_package_setscene depends upon nonexistant task 
> /distro/edwin-working/poky/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb:do_populate_sysroot_setscene
> Summary: There was 1 ERROR message shown, returning a non-zero exit code."
> 
> After removing "shadow-sysroot:do_populate_sysroot_setscene" from 
> USERADDSETSCENEDEPS in meta/classes/useradd.bbclass, I can pass the build.
> 
> Why does it become nonexistant task in multilib building? Any possible fix for 
> it?

Totally guessing but does replacing:

shadow-sysroot:do_populate_sysroot_setscene

with:

${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene

work better?

Cheers,

Richard





