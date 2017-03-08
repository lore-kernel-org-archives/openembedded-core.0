Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF61073288
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28HZcEI004731; Wed, 8 Mar 2017 17:35:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ub5d_9PbSphA; Wed,  8 Mar 2017 17:35:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28HZa5B004728
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 17:35:37 GMT
Message-ID: <1488994536.22968.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2017 17:35:36 +0000
In-Reply-To: <982f2830-f150-faa5-eebf-ff5ccb7972c5@windriver.com>
References: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
	<982f2830-f150-faa5-eebf-ff5ccb7972c5@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 17:35:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-08 at 11:28 -0600, Mark Hatle wrote:
> On 3/8/17 10:57 AM, Ross Burton wrote:
> > 
> > Cryptodev is a way for userspace to access the kernel crypto
> > drivers (and so,
> > hardware crypto).
> If the BSP does not support crypto dev, what is the harm in this?  It
> should fall back to standard behaviors.

Note that the implication here is that openssl depends on the kernel
building and many other pieces of the system depend on openssl so it
does bottleneck the build somewhat. 

It also means a kernel rebuild ends up triggering half the userspace to
rebuild which is annoying for users.


> > Not all hardware supports cryptodev so this is something that
> > should be enabled
> > in a BSP layer instead of in oe-core.
> This would make the package be machine specific, which I'm not sure
> is good for
> a package like openssl.  (Distro specific, I'm fine with -- machine
> I've got
> concerns.)

How commonly are kernel crypto drivers used?

Cheers,

Richard

