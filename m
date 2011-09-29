Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9HbO-0002be-5K for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 16:28:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TETbVh001217 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:29:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IQ4d1fbVyXsZ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:29:37 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TETVXo001190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:29:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 15:23:06 +0100
In-Reply-To: <8dd692d309ecfbd969a6e01969e03d203f670dbe.1317254761.git.sgw@linux.intel.com>
References: <cover.1317254761.git.sgw@linux.intel.com>
	<8dd692d309ecfbd969a6e01969e03d203f670dbe.1317254761.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317306193.12332.88.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] python: fix sqlite RPATH issue
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
X-List-Received-Date: Thu, 29 Sep 2011 14:28:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 17:07 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../python/python/remove_sqlite_rpath.patch        |   12 ++++++++++++
>  meta/recipes-devtools/python/python_2.6.6.bb       |    3 ++-
>  2 files changed, 14 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
> 
> diff --git a/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
> new file mode 100644
> index 0000000..350151e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
> @@ -0,0 +1,12 @@
> +Index: Python-2.6.6/setup.py
> +===================================================================
> +--- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
> ++++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
> +@@ -1079,7 +1079,6 @@
> +                                   include_dirs=["Modules/_sqlite",
> +                                                 sqlite_incdir],
> +                                   library_dirs=sqlite_libdir,
> +-                                  runtime_library_dirs=sqlite_libdir,
> +                                   extra_link_args=sqlite_extra_link_args,
> +                                   libraries=["sqlite3",]))
> +         else:

Looks reasonable to me but no patch header? ;-)

Cheers,

Richard



