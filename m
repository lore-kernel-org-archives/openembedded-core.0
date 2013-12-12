Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4C82E6CEEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 23:34:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBCNXqYA011348; Thu, 12 Dec 2013 23:34:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y6A6WGScIIJ7; Thu, 12 Dec 2013 23:34:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBCNY8up011358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 12 Dec 2013 23:34:09 GMT
Message-ID: <1386891243.504.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 12 Dec 2013 23:34:03 +0000
In-Reply-To: <52A95C72.3030605@windriver.com>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>
	<52A95C72.3030605@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Thu, 12 Dec 2013 23:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-12-12 at 14:49 +0800, Robert Yang wrote:
> > That leaves the following we need to investigate:
> >
> > + 20c0a87c19cf51bcd849fb4de91421cae0f97ae4 mdadm: Disable the RUN_DIR check
> 
>  From OE-Core master rev: d62882794890eeee8e8d5c9ba4837ec77a58d787
> 
> > + cc225f0e74865623714461cd38bec3b6557c6df7 mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
> 
>  From OE-Core master rev: d3caab6eb03264b4f4d744f914598022299011ba
> 
> > + d912ce035beb0da28d83719920a2cebfda8b3073 ethtool: Fix ptest compile
> 
>  From OE-Core master rev: 5dd8653fdcda5e0e8b4f3c37a46f357bc97ec66c

Thanks, these are all fine.

> > + 1cff575511f32935a69ec1c9ef966311ad409e2f gdb-7.6: fix cygwin check in configure script
> 
> This one is sent by Steffen, for dora only.

I took a closer look at this. Whilst the version of gdb in master is
different, the issue still exists. I've ported the patch to master and
merged it there. We can now backport it.

Please don't take anything into dora until we have something equivalent
in master.

> > + 5a13d607954fb2099a82c5f1f4135be6cb6ca4d3 dpkg: Fix a build error for dpkg-native on CentOS 5.8.
> > + c37ab9c220b8f1d2045b1aaf9cd03c1f9a899390 dpkg: Fix a link problem for dpkg-native on CentOS 5.8.
> 
> They are sent by Mark for dora only.

These were sent as an RFC for compliance purposes. They're not in
master, they can't go into dora. I've dropped these.

Other than the patches I've mentioned, things should be merged in the
dora branch. We've found some build issues. I've pushed a fix for the
qt3 one, we also have one with lttng-modules which we don't have a fix
for yet.

Cheers,

Richard


