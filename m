Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7lNr-0003g8-Hf for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 11:52:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8P9rJvE003997; Sun, 25 Sep 2011 10:53:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xDbFLCd0FEbe; Sun, 25 Sep 2011 10:53:19 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8P9rG8D003975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 25 Sep 2011 10:53:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 10:46:53 +0100
In-Reply-To: <1316807201-22623-3-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
	<1316807201-22623-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316944021.8185.0.camel@ted>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 03/10] bash-completion: new recipe
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
X-List-Received-Date: Sun, 25 Sep 2011 09:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-23 at 23:46 +0400, Dmitry Eremin-Solenikov wrote:
> Add a bash-completion recipe. Largely based on the one from oe-dev repo.
> Changes:
> 1) Version bump to most recent bash-completion upstream tarball
> 2) Dropped custom profile.d script in favour of upstream one.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../bash-completion/bash-completion_20060301.bb    |   28 ++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/bash-completion/bash-completion_20060301.bb
> 
> diff --git a/meta/recipes-extended/bash-completion/bash-completion_20060301.bb b/meta/recipes-extended/bash-completion/bash-completion_20060301.bb
> new file mode 100644
> index 0000000..9e8ede2
> --- /dev/null
> +++ b/meta/recipes-extended/bash-completion/bash-completion_20060301.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Programmable Completion for Bash"
> +SECTION = "console/utils"
> +RDEPENDS_${PN} = "bash"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +PR = "r0"
> +
> +SRC_URI = "http://www.caliban.org/files/bash/bash-completion-${PV}.tar.gz"
> +S = "${WORKDIR}/bash_completion"
> +
> +do_configure() {
> +	:
> +}
> +
> +do_compile() {
> +	:
> +}
> +
> +do_install() {
> +	install -d ${D}${sysconfdir}/profile.d
> +	install -m 0755 bash_completion.sh ${D}${sysconfdir}/profile.d
> +	install -m 0755 bash_completion ${D}${sysconfdir}
> +	install -d ${D}${sysconfdir}/bash_completion.d/
> +	install -m 0755 contrib/* ${D}${sysconfdir}/bash_completion.d/
> +}
> +
> +SRC_URI[md5sum] = "9bca1cf97e8f8c73e3ef560cc9dead21"
> +SRC_URI[sha256sum] = "29b78834b975b29810f0bf1f15e5d3a6c003a137cfac7fea671bfaf8f58f5c0d"

We might as well put an "inherit allarch" into this recipe...

Cheers,

Richard




