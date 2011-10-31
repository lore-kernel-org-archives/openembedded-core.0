Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RL09S-0001cR-FJ for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 23:16:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMADqW022186
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:10:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21770-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:10:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMA3q3022174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:10:04 GMT
Message-ID: <1320099003.15599.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 22:10:03 +0000
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-core 0/7] Python upgrade
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
X-List-Received-Date: Mon, 31 Oct 2011 22:16:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-31 at 18:41 +0100, Martin Jansa wrote:
> Based on Nitin's latest version in poky/contrib and with added 
> fixes to build extra modules and PR bumps to rebuild stuff which 
> is in /usr/lib/python2.6 
> 
> It's good to check that sysroots like this are empty after build:
> sysroots/om-gta02/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la
> sysroots/x86_64-linux/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la
> 
> The following changes since commit ff13e06892f102d915855cde50896349b07b3717:
> 
>   clutter-gtk: add LIC_FILES_CHKSUM to include file (2011-10-31 10:46:59 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/python
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/python
> 
> Martin Jansa (5):
>   python: update generate-manifest for 2.7 version and regenerate it
>   python-2.7.2: fix build issues when additional modules are linked
>     against host or native libpython instead of target
>   recipes: bump PR after python upgrade
>   python-dir: change PYTHON_BASEVERSION to 2.7
>   bitbake.conf: update STAGING_PYDIR to 2.7 version
> 
> Nitin A Kamble (2):
>   python, python-native: upgrade from 2.6.6 to 2.7.2
>   update python 2.7 manifest

I've merged this to master with the exception of the bitbake.conf change
where I think it makes sense just to drop the variable.

Thanks for everyone who's worked on getting this pulled together!

Cheers,

Richard



