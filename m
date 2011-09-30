Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9bBp-0005he-9r for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:23:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBOU9A013298 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:24:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8PUZmQpEphMh
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:24:30 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBOQRg013284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:24:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:18:00 +0100
In-Reply-To: <f41a6c82d5061f433c35439d29997e395e1c3002.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<f41a6c82d5061f433c35439d29997e395e1c3002.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317381487.12332.160.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 13/13] mesa: upgrade to 7.11
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
X-List-Received-Date: Fri, 30 Sep 2011 11:23:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 ++++++
>  meta/recipes-graphics/mesa/mesa-common.inc         |   48 +++++++++++++-------
>  .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 +++++++++++
>  .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 -----------
>  meta/recipes-graphics/mesa/mesa-dri.inc            |   27 +++++++++++
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +
>  meta/recipes-graphics/mesa/mesa-xlib.inc           |    5 ++
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 ++
>  .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
>  meta/recipes-graphics/mesa/mesa_7.11.bb            |    6 +++
>  10 files changed, 120 insertions(+), 43 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
>  rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa_7.11.bb
> 

This is an upgrade, repackaging, changes in code layout. It all needs to
be split up please.

Cheers,

Richard



