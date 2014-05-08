Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9B6B365F67
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 13:30:54 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 8 May 2014
	15:30:54 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id B1C4C28C881;
	Thu,  8 May 2014 15:30:54 +0200 (CEST)
Date: Thu, 8 May 2014 15:30:54 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140508133054.GA5005@sestofb10.enea.se>
References: <1399322542-21516-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1399322542-21516-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [PATCH] bzip2: fix ptest execution failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 May 2014 13:30:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ping.

On Mon, May 05, 2014 at 10:42:22PM +0200, Maxin B. John wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
> 
> This patch fixes the bzip2 ptest execution failure:
> 
> root@qemux86:/usr/lib/bzip2/ptest# ./run-ptest
> make: *** No rule to make target 'runtest'.
> 
> (This is also applicable for daisy branch)
> 
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index e9d745d..9dd9e6a 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -11,7 +11,7 @@ PR = "r5"
>  SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
>             file://configure.ac \
>             file://run-ptest \
> -	   file://Makefile.am"
> +           file://Makefile.am"
>  
>  SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
>  SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
> @@ -35,6 +35,7 @@ do_extraunpack () {
>  addtask extraunpack after do_unpack before do_patch
>  
>  do_install_ptest () {
> +	cp -f ${B}/Makefile ${D}${PTEST_PATH}/Makefile
>  	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
>  }
>  
> -- 
> 1.7.10.4

