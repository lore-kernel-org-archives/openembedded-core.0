Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70930703F9;
	Thu, 17 Jul 2014 22:11:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HMBJsO012929; Thu, 17 Jul 2014 23:11:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZjPGrk4ccVYl; Thu, 17 Jul 2014 23:11:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HMBDo1012925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 17 Jul 2014 23:11:15 +0100
Message-ID: <1405635068.26348.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jul 2014 23:11:08 +0100
In-Reply-To: <1405550821.3668.9.camel@ted>
References: <cover.1405440532.git.ross.burton@intel.com>
	<20140715165842.GN2433@jama> <1405550821.3668.9.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH 0/7][RFC] Remove enforced --foreign in autoreconf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jul 2014 22:11:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-16 at 23:47 +0100, Richard Purdie wrote:
> I made a quick test and the failures I spotted from meta-oe likely due
> to this patch were:
> 
> re2c
> libsdl-iomage
> claws-plugin-gtkhtml2-viewer
> claws-plugin-rssyl
> libsdl-tiff
> libol
> ode
> dejagnu
> memcached
> rp-pppoe
> ipsec-tools
> mtr
> hplip
> onig
> 
> Its probably not a complete list as I have a lot more failures than your
> world builds but it gives some idea of number and its not a massive
> list.

There were more efl ones once I sorted a fetch issue.

I've run out of time/energy today but I have about 20 fixes for various
build issues in meta-oe in:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/metaoe&id=bfb0ddc8c3d3f7c963c3529efc970b9ba8d8d788

Mentioning so people don't duplicate work. I'll try and split into
patches as/when I get time if nobody beats me to it.

Cheers,

Richard


