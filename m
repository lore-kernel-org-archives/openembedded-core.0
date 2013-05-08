Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ua6V6-0006fa-R4 for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:41:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r48FQBiU003817; Wed, 8 May 2013 16:26:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lurZUnIKVoxX; Wed,  8 May 2013 16:26:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r48FQ8OR003810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 8 May 2013 16:26:09 +0100
Message-ID: <1368026618.27116.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Wed, 08 May 2013 16:23:38 +0100
In-Reply-To: <518A6B25.5000108@r-finger.com>
References: <518A6B25.5000108@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 08 May 2013 15:41:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-08 at 16:11 +0100, Tomas Frydrych wrote:
> I think it would makes sense to move clutter related packages from
> oe-core into a dedicated layer:
> 
> * AFAIK nothing in oe-core requires cogl/clutter/mx,
> 
> * The packages in oe-core are effectively unmaintained, several upstream
> releases behind, and pretty much unusable,
> 
> * The somewhat random nature of clutter and cogl releases makes it hard
> to sensibly manage these packages within the oe-core release cycle, but
> a dedicated layer could follow the upstream developments.
> 
> 
> I have started work on new clutter and related packages for use by
> meta-guacamayo at https://github.com/Guacamayo/meta-clutter, but I'd be
> more than happy for the layer to live somewhere else and become the
> canonical location for clutter-related bits and pieces.

I have no idea why you've always felt the need to maintain the clutter
pieces in your own layer rather than interacting with the ones in
OE-Core instead which I'd love to see better maintained. I'm not aware
of any barrier that has prevented that.

I can't help feeling this is an artificially created problem :/.

Cheers,

Richard



