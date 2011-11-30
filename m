Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVsZw-0000qJ-1f for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:24:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMHtuV006276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:17:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05846-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:17:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMHkKS006269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:17:47 GMT
Message-ID: <1322691475.17484.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 22:17:55 +0000
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] [Dexuan]: upgrades for 7 recipes
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
X-List-Received-Date: Wed, 30 Nov 2011 22:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 22:12 +0800, Dexuan Cui wrote:
> The following changes since commit 00d121aad3a4263bc0e3a004a3a479e6352e063d:
> 
>   clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0 (2011-11-30 22:06:00 +0800)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/master
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
> 
> Dexuan Cui (8):
>   pixman: upgrade from 0.22.0 to the latest stable 0.24.0
>   libxrandr: upgrade from 1.3.1 to the latest version 1.3.2
>   lzo: upgrade from 2.05 to the latest version 2.06
>   libxfont: upgrade from 1.4.3 to 1.4.4
>   libxcursor: upgrade from 1.1.11 to 1.1.12
>   xcb-util: upgrade from 0.3.6 to 0.3.8

I merged these, thanks.

>   inputproto: upgrade from 2.0.2 to the latest stable 2.0.99.1

I was a bit worried about this one - is 20.0.99.1 stable or a prerelease
version? Should we just wait for the final release of that one?

>   distro_tracking_fields.inc: update the info

This failed to apply. Could you rebase and resubmit please?

Cheers,

Richard



