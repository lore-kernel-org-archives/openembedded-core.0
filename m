Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROTnZ-0004aY-TS for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 13:32:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACPnam028749
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:25:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28033-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:25:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAACPhYG028743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 12:25:44 GMT
Message-ID: <1320927946.1165.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:25:46 +0000
In-Reply-To: <cover.1320839130.git.paul.eggleton@linux.intel.com>
References: <cover.1320839130.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] RPM/upgrade fixes
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
X-List-Received-Date: Thu, 10 Nov 2011 12:32:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 12:05 +0000, Paul Eggleton wrote:
> This is the fix for the problem Anders reported on the Yocto mailing
> list (now filed as Yocto bug #1760). I've checked through usage of
> postrm/prerm in oe-core and meta-oe and it looks OK to me, but it
> would help for others to double-check it. 
> 
> I considered whether or not it would be worth bumping PR on every
> recipe that uses prerm/postrm, however this is a *lot* of recipes.
> 
> Also included is another fix for a minor issue I discovered when
> uninstalling busybox.
> 
> The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:
> 
>   python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/rmscripts
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rmscripts
> 
> Paul Eggleton (2):
>   classes/package_rpm: disable uninstall scripts for upgrades
>   busybox: add grep to temporary links during uninstall

Merged to master, thanks.

Richard



