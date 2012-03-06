Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S51dz-0000iB-0O
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 22:10:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E54843159D1D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2012 22:01:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id J+PJ9p+vNNdh
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2012 22:01:21 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf39a.pool.mediaWays.net
	[89.12.243.154])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 561423159D1C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2012 22:01:21 +0100 (CET)
Message-ID: <4F567B1E.5060003@opendreambox.org>
Date: Tue, 06 Mar 2012 22:01:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331053126.git.sgw@linux.intel.com>
	<b00d6f957a3ac9bcdab9dda1e887ad36b3bab852.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <b00d6f957a3ac9bcdab9dda1e887ad36b3bab852.1331053126.git.sgw@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL 17/20] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Tue, 06 Mar 2012 21:10:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06.03.2012 18:03, Saul Wold wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
> 
> As usual, this creates problems for upgrade paths, but splitting out the lib is worth the short term hassle

Sorry, if I'm missing the obvious, but how is this different than the
patch I submitted to do the same thing with bzip2 and libbz2, which got
rejected by Koen?

See http://patches.openembedded.org/patch/22015/ .

Regards,
Andreas

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
> index bae71ec..e8f96b6 100644
> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
> +++ b/meta/recipes-extended/xz/xz_5.0.3.bb
> @@ -14,8 +14,15 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
>  SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
>  SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  inherit autotools gettext
>  
> +PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
> +
> +FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
> +FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
> +FILES_liblzma-staticdev = "${libdir}/liblzma.a"
> +FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
> +
>  BBCLASSEXTEND = "native"



