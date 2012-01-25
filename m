Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq43Y-0003T5-KK for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 15:42:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PEYo7q010781
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:34:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09446-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:34:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PEYhQf010775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 14:34:44 GMT
Message-ID: <1327502084.19643.232.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 14:34:44 +0000
In-Reply-To: <cover.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Various updates
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
X-List-Received-Date: Wed, 25 Jan 2012 14:42:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 15:26 -0800, Joshua Lock wrote:
> The key patch in this series is the linux-tools change. With builds that don't 
> include GPLv3 licensed packages the linux-yocto kernel was being skipped due to
> it pulling in perf and perf requiring binutils.
> 
> The short-term fix is to not build perf if GPLv3 is in INCOMPATIBLE_LICENSE,
> long term there's a bug open to move perf to a separate package.
> 
> Cheers,
> Joshua
> 
> The following changes since commit a4a98b6d6273d4e716afbff0880d0ac2ff7be0a9:
> 
>   gcc-common.inc: Fix comment (2012-01-24 14:38:31 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/stuff
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff
> 
> Joshua Lock (4):
>   clutter-gst: update to 1.4.6
>   linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
>   cogl: update upstream status for build_for_armv4t.patch
>   distro-tracking-fields: update entries for clutter-gst-1.8

Merged to master apart from linux-tools which I think can be improved
slightly.

Cheers,

Richard



