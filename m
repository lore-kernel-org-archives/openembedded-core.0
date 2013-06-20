Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7344E619DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 08:46:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5K8qQhT025537; Thu, 20 Jun 2013 09:52:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l6xeOHwpeORh; Thu, 20 Jun 2013 09:52:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5K8qL2a025533
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 20 Jun 2013 09:52:23 +0100
Message-ID: <1371717958.20823.218.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Thu, 20 Jun 2013 09:45:58 +0100
In-Reply-To: <1371716874-42538-1-git-send-email-sona.sarmadi@enea.com>
References: <1371716874-42538-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash ptest: Sed away the Makefile dependency to remove error messages.
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
X-List-Received-Date: Thu, 20 Jun 2013 08:46:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2013-06-20 at 10:27 +0200, Sona Sarmadi wrote:
> From: Björn Stenberg <bjst@enea.com>
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  meta/recipes-extended/bash/bash-4.2/run-ptest |    2 +-
>  meta/recipes-extended/bash/bash.inc           |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

I'm sure this is a good change but could you expand a little on what it
does and why? Which error message is getting fixed? As well as the
summary, commit messages should have a description.

Cheers,

Richard

> diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-extended/bash/bash-4.2/run-ptest
> index 66f1eee..8dd3b99 100644
> --- a/meta/recipes-extended/bash/bash-4.2/run-ptest
> +++ b/meta/recipes-extended/bash/bash-4.2/run-ptest
> @@ -1,2 +1,2 @@
>  #!/bin/sh
> -echo Makefile: | make -f Makefile -f - -k THIS_SH=/bin/bash BUILD_DIR=. runtest
> +make -k THIS_SH=/bin/bash BUILD_DIR=. runtest
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index c619f82..2f4519c 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -40,6 +40,7 @@ do_install_append () {
>  do_install_ptest () {
>  	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
>  	cp ${B}/Makefile ${D}${PTEST_PATH}
> +        sed -i 's/^Makefile/_Makefile/' ${D}${PTEST_PATH}/Makefile
>  }
>  
>  pkg_postinst_${PN} () {



