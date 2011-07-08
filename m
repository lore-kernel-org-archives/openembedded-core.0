Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfD9r-0001qi-D3 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:39:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fa77T021364
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:36:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:36:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fa1d9021358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:36:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d851796fdf475882423cc97929d0242f7fcaf75e.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<d851796fdf475882423cc97929d0242f7fcaf75e.1310132765.git.otavio@ossystems.com.br>
Date: Fri, 08 Jul 2011 16:35:23 +0100
Message-ID: <1310139323.20015.890.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 7/8] cmake: update to 2.8.5-rc3
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
X-List-Received-Date: Fri, 08 Jul 2011 15:39:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    7 -------
>  meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |   12 ++++++++++++
>  .../cmake/cmake/support-oe-qt4-tools-names.patch   |   14 +++++++-------
>  .../cmake/{cmake_2.8.3.bb => cmake_2.8.5.bb}       |    9 +++++++--
>  4 files changed, 26 insertions(+), 16 deletions(-)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
>  rename meta/recipes-devtools/cmake/{cmake_2.8.3.bb => cmake_2.8.5.bb} (76%)

What is the reason for moving to an -rcX release? When is the main
release likely to be made?

Cheers,

Richard





