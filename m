Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQaW7-00014f-ID for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:11:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9N8vsfJ014644;
	Tue, 23 Oct 2012 09:57:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12174-09; Tue, 23 Oct 2012 09:57:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9N8vhWH014638
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 23 Oct 2012 09:57:44 +0100
Message-ID: <1350982663.22340.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Date: Tue, 23 Oct 2012 09:57:43 +0100
In-Reply-To: <1350974753-519-1-git-send-email-giuseppe.condorelli@st.com>
References: <1350974753-519-1-git-send-email-giuseppe.condorelli@st.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: do_install_basefilesissue error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 09:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-23 at 08:45 +0200, Giuseppe CONDORELLI wrote:
> Fixed error in do_install_basefilesissue, printf is now replaced by echo.

What kind of error?

Doesn't this change have issues about how newlines are handled?

Cheers,

Richard


> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index ba355ee..766b0e5 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -117,11 +117,11 @@ do_install_basefilesissue () {
>  
>  	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
>          if [ -n "${DISTRO_NAME}" ]; then
> -		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> -		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> +		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> +		echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
>  		if [ -n "${DISTRO_VERSION}" ]; then
> -			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> -			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
> +			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> +			echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
>  		fi
>  		echo "\n \l" >> ${D}${sysconfdir}/issue
>  		echo >> ${D}${sysconfdir}/issue




