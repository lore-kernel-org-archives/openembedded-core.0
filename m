Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U0ZHJ-0001W9-IM for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:08:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UEvXaj012686; Wed, 30 Jan 2013 14:57:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 345tPvmAD5H0; Wed, 30 Jan 2013 14:57:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UEvPU6012680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 30 Jan 2013 14:57:28 GMT
Message-ID: <1359557557.28244.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ian Geiser <igeiser@devonit.com>
Date: Wed, 30 Jan 2013 14:52:37 +0000
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
	<c9683f65462fdbe2c0f3034f1740fd6bad721bf4.1359554291.git.richard.purdie@linuxfoundation.org>
	<B57A220D1EE1644685BA9AD5C790D20526BE045DD5@SOUTHSIDE.devonintlgroup.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] directfb: Explictly disable mesa
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
X-List-Received-Date: Wed, 30 Jan 2013 15:08:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-30 at 09:43 -0500, Ian Geiser wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: Wednesday, January 30, 2013 9:01 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 17/17] directfb: Explictly disable mesa
> > 
> > Without this, directfb might build with mesa enabled if present.
> > 
> Is it possible to make this tunable?  We use directfb with the mesa
> dri drivers for opengl.  Maybe enable it only if the distro features
> contains opengl?

I'll take patches to make it controlled by PACKAGECONFIG, probably with
the default of mesa disabled for now.

For the immediate build failures it was causing I pushed a patch to make
the configure options match DEPENDS.

Cheers,

Richard



