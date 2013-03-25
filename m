Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UK5IA-000214-B2 for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 12:10:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PB2X1f025148; Mon, 25 Mar 2013 11:03:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id El93MM7x4El4; Mon, 25 Mar 2013 11:02:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PB2lV6025215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 11:02:54 GMT
Message-ID: <1364208777.3097.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Mon, 25 Mar 2013 10:52:57 +0000
In-Reply-To: <e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
References: <cover.1364204199.git.kai.kang@windriver.com>
	<e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpng: add version 1.2 back
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
X-List-Received-Date: Mon, 25 Mar 2013 11:10:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 18:21 +0800, Kang Kai wrote:
> Current LSB 4.1 test suite still check libpng12.so, so add libpng 1.2.x
> back, and set it as default verison for linuxstdbase image.
> 
> [YOCTO 4015]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/conf/distro/include/default-versions.inc   |    3 +++
>  meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   21 +++++++++++++++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb

I'm not entirely happy about this :/ Lets put this into
meta/recipes-lsb4 along with the other stuff we just have around for
official compatibility. 

Cheers,

Richard




