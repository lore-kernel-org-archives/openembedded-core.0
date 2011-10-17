Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFmTl-0005Rs-Cd for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:39:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCeaJ0008118 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:40:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Lk-h0ykDdLhP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:40:36 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HCeVsC008114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 13:40:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 13:33:45 +0100
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318854834.21775.5.camel@ted>
Mime-Version: 1.0
Subject: Re: [v2 -CONSOLIDATED PULL 00/14] Updates and World Build Fixes
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
X-List-Received-Date: Mon, 17 Oct 2011 12:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-16 at 13:17 -0700, Saul Wold wrote:
> Richard,
> 
> This is version contains additional comments and fixes based on Khem's
> notes, I also fixes the Upstream-Status to have correct capitolization.
> 
> Sau!
> 
> The following changes since commit d1b12b92439805ec9ca5d031d34d264acd0cab3b:
> 
>   mesa-dri: Enable swrast only by default and intel drivers only on IA platform (2011-10-15 00:41:12 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Dmitry Cherukhin (1):
>   qt4: Added support for QtMobility 1.2
> 
> Dmitry Eremin-Solenikov (1):
>   default-provider: also define a default provider for gconf-native
> 
> Paul Eggleton (2):
>   pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
>   bluez4: disable hidd, pand & dund
> 
> Philip Balister (1):
>   cmake : Disable building ccmake.
> 
> Saul Wold (9):
>   bind: update to 9.8.1
>   resolvconf: Update to 1.61
>   glib-2.0: Add nativesdk depends for libffi
>   qmmp: Fix QA Packaging Errors
>   libomxil: Fix QA Package Errors
>   Distro Tracking: Fix dates
>   sysprof: remove duplicated patch
>   mktemp: Add patch to fix parallel make install
>   screen: Add patch to fix parallel make install

Merged to master apart from the qmmp change, thanks.

Richard



