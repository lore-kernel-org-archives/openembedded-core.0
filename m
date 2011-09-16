Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4bTR-0000Rw-0a for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 18:41:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGg2PJ030314; Fri, 16 Sep 2011 17:42:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BPgNg+SHbw4M; Fri, 16 Sep 2011 17:42:02 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGfva6030298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 16 Sep 2011 17:41:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:35:45 +0100
In-Reply-To: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
References: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316190953.20858.32.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/3] icecc-create-env: a tool to create icecc toolchain tarballs
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
X-List-Received-Date: Fri, 16 Sep 2011 16:41:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 10:55 +0400, Dmitry Eremin-Solenikov wrote:
> IceCC needs tarballs with toolchains to work correctly. This is a
> version largely based on one from org.openembedded.dev, plus a patch to
> support recent compilers, LTO, etc.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../icecc-create-env/icecc-lto-update.patch        |  103 ++++++++++++++++++++
>  .../icecc-create-env/icecc-create-env_0.1.bb       |   29 ++++++
>  2 files changed, 132 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-lto-update.patch
>  create mode 100644 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb

Merged to master, thanks (along with patches 2 and 3)

Cheers,

Richard



