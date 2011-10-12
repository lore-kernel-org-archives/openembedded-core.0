Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RE6yy-0007Lt-HL for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 00:09:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CM9t9K025881 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:09:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a2-PvKiNNhwC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:09:55 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CM9nGX025875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:09:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 23:03:07 +0100
In-Reply-To: <461d8d90b6867c179cf5cfac8a5f5a2dd9347e26.1317648041.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
	<461d8d90b6867c179cf5cfac8a5f5a2dd9347e26.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318456996.23801.182.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCHv2 29/30] mesa: add new version 7.11
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
X-List-Received-Date: Wed, 12 Oct 2011 22:09:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 15:29 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 ++++++++++
>  .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 ++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 +++
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 +++
>  4 files changed, 51 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb

I've been seeing a ton of different issues after the xserver upgrade
with mesa/driver mismatches. In order to try and get some stability back
to master, I've merged just enough of the mesa upgrade to 7.11 to get
things building again.

Looking at the rest of the patch, I have worried about "machine
specific" elements in something which is not machine specific. The rest
of the pieces are likley going to need more thought (per arch default
config?).

We should be able to sort through the remaining changes in this patch
series as I like moving things to the common include, it just needs to
be split from the version upgrade and the machine issue resolved.

I've also bumped the video-intel driver version and merged a fix to get
things to build.

Cheers,

Richard





