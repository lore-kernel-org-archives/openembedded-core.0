Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oF5-0006Ao-Lo for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:27:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDJ6F2007992
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:19:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06829-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:19:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDIut8007986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:18:57 GMT
Message-ID: <1331731136.18586.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:18:56 +0000
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] Misc build failure fixes
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
X-List-Received-Date: Wed, 14 Mar 2012 13:27:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 00:36 +0000, Paul Eggleton wrote:
> The following changes since commit 81379dc141e245307ca391a02b7490b199128991:
> 
>   dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/fixes14
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes14
> 
> Paul Eggleton (6):
>   scripts/bitbake: ensure user is in build directory
>   pulseaudio: add X library dependencies
>   gst-plugins-bad: disable directfb in configure
>   mx: add dependencies
>   ncurses: fix build when ENABLE_WIDEC is not set
>   linux-yocto-tiny: add dependency on xz-native

Merged to master, thanks.

Richard



