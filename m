Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCC52-0004pH-Cr for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 17:11:20 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97FCFd1013154 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 16:12:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HsIaWDKFhaOc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 16:12:15 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97FCDvQ013149
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 16:12:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 16:05:34 +0100
In-Reply-To: <e27a2c33117539c39c8c9961d0e16ca5c0bdff89.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
	<e27a2c33117539c39c8c9961d0e16ca5c0bdff89.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317999942.8533.5.camel@ted>
Mime-Version: 1.0
Subject: Re: [WIP][PATCH 8/9] glib: upgrade to 2.30.0
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
X-List-Received-Date: Fri, 07 Oct 2011 15:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 17:43 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 ----------
>  .../0005-glib-mkenums-interpreter.patch.patch      |   25 ---------
>  .../60_wait-longer-for-threads-to-die.patch        |   24 +++++-----
>  meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 -
>  .../glib-2.0/remove.test.for.qsort_r.patch         |   53 ++++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   23 ---------
>  meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |   41 +++++++++++++++
>  7 files changed, 106 insertions(+), 90 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb

> +DEPENDS += "libffi python-argparse-native"
> +DEPENDS_virtclass-native += "libffi-native python-argparse-native"

Just to be clear on the status of this, the above dependencies present a
problem for OE-Core :(

Cheers,

Richard



