Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U6rmz-0006qz-5K for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 01:07:42 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GNvOnx012735; Sat, 16 Feb 2013 23:57:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CWqv3GKc-J6a; Sat, 16 Feb 2013 23:57:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1GNvEDk012732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 16 Feb 2013 23:57:19 GMT
Message-ID: <1361058650.31795.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 16 Feb 2013 23:50:50 +0000
In-Reply-To: <511F1B8E.90707@linux.intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
	<511F1B8E.90707@linux.intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/4] Allow xserver-xf86-config to ship no xorg.conf
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
X-List-Received-Date: Sun, 17 Feb 2013 00:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-15 at 21:39 -0800, Saul Wold wrote:
> On 02/15/2013 05:09 AM, Ross Burton wrote:
> > Hi,
> >
> > Same as V1, apart from changing package_deb to have the same check on conffiles
> > as package_ipk.
> >
> 
> Unless I got the wrong set, this still seems to have trouble with the
> hardware BSPs for routerstation and MPC machines.
> 
> Maybe you need to build those.

I can't see the package_deb change in the branch which would explain the
failures.

Cheers,

Richard



