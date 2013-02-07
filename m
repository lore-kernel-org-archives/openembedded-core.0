Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U3aOC-0002Ua-Be for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:56:21 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17Mjj4R002589; Thu, 7 Feb 2013 22:45:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j6aGfYDOyqzy; Thu,  7 Feb 2013 22:45:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r17MjZZx002442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 7 Feb 2013 22:45:38 GMT
Message-ID: <1360276802.10722.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 07 Feb 2013 22:40:02 +0000
In-Reply-To: <20130206233409.GJ3271@jama>
References: <20130206093802.16EA32097@opal> <20130206115620.GT3271@jama>
	<511247C9.2010505@intel.com> <20130206211710.GC3271@jama>
	<20130206233409.GJ3271@jama>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : add fontcache.bbclass
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
X-List-Received-Date: Thu, 07 Feb 2013 22:56:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-07 at 00:34 +0100, Martin Jansa wrote:
> On Wed, Feb 06, 2013 at 10:17:10PM +0100, Martin Jansa wrote:
> > On Wed, Feb 06, 2013 at 02:08:41PM +0200, Laurentiu Palcu wrote:
> > It fails only on some machines I'm building (3 machines from 6) and only sometimes (last run it was only on 2 from 6)
> > 
> > Now I was running it manually and got nice error finally:
> > Running intercept scripts:
> > > Executing update_font_cache
> > readelf: Error:
> > '/OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/rootfs/usr/bin/fc-cache':
> > No such file
> > ERROR: intercept script "update_font_cache" failed!
> > 
> > So something is pulling interceptor without runtime dependency on
> > fontconfig.
> 
> In the end it wasn't fs-cache missing, but
> /usr/bin/crossscripts/qemuwrapper in some sysroots
> 
> bitbake -c cleansstate qemuwrapper-cross
> for each MACHINE and building it again resolved that..

The sstate package for this recipe was corrupted. There is a fix in
master for this and a few other issues this patchset raised.

Cheers,

Richard



