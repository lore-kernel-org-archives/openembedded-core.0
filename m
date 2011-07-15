Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhrFf-0006z5-2M for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:52:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FMmtbi025021
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:48:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24824-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:48:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FMml5X025015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 23:48:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
Date: Fri, 15 Jul 2011 23:48:43 +0100
Message-ID: <1310770123.20015.1259.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:52:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 15:03 -0700, Tom Rini wrote:
> These are 'side ports' of current oe.dev versions.  PR is kept in sync
> but we drop out the target recipes in order to punt on potential perl
> problems.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../help2man/help2man-native_1.36.4.bb             |   26 ++++++++++++++++++++
>  .../help2man/help2man-native_1.38.2.bb             |   24 ++++++++++++++++++
>  2 files changed, 50 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
>  create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> 
[...]
> diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> new file mode 100644
> index 0000000..5612eda
> --- /dev/null
> +++ b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Program to create simple man pages"
> +SECTION = "devel"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +DEPENDS = "autoconf-native automake-native"
> +PR = "r2"
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "426671c6fe79e5ef2233303367eab5a6"
> +SRC_URI[sha256sum] = "952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1"
> +
> +inherit autotools native
> +
> +EXTRA_OECONF = "--disable-nls"
> +
> +# We don't want to reconfigure things
> +do_configure() {
> +	oe_runconf
> +}

At the very least I'd like to know why we can't do this. Its a great way
to hide bugs (such as libtool rpath injection issues, admittedly in the
target case).

Cheers,

Richard



