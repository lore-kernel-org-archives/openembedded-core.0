Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SyRIJ-0002Xy-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 19:40:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q76HSwxb010014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 10:28:58 -0700 (PDT)
Received: from msp-dhcp47.wrs.com (172.25.34.47) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 6 Aug 2012 10:28:58 -0700
Message-ID: <501FFEE0.5060503@windriver.com>
Date: Mon, 6 Aug 2012 12:29:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<1344182057-15981-12-git-send-email-javier@dowhile0.org>
In-Reply-To: <1344182057-15981-12-git-send-email-javier@dowhile0.org>
Subject: Re: [PATCH 11/30] lsb: use ${base_bindir} instead of /bin for packaging
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
X-List-Received-Date: Mon, 06 Aug 2012 17:40:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/12 10:53 AM, Javier Martinez Canillas wrote:
> It is considered good practice to use the build system provided
> variables instead of directly specify hardcoded paths.
>
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> ---
>   meta/recipes-extended/lsb/lsb_1.4.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
> index 15dbeaa..5734c5c 100644
> --- a/meta/recipes-extended/lsb/lsb_1.4.bb
> +++ b/meta/recipes-extended/lsb/lsb_1.4.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/lsb-release-${PV}"
>
>   do_install(){
>   	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
> -	mkdir -p ${D}/bin
> +	mkdir -p ${D}${base_bindir}
>   	mkdir -p ${D}/${baselib}
>   	mkdir -p ${D}/etc/lsb-release.d
>   	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}/etc/lsb-release
>

This is another case with the lsb, that lsb-release (and a few other things) are 
documented to me installed into /bin.

Not objecting to the change, just explaining why it was implemented this way.

--Mark


