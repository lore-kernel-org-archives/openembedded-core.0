Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DC79F610DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:01:45 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VOqb5-00022D-Gu from Muhammad_Shakeel@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Sep 2013 08:01:47 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 25 Sep 2013 08:01:46 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Wed, 25 Sep 2013 16:01:46 +0100
Message-ID: <5242FB37.6030104@mentor.com>
Date: Wed, 25 Sep 2013 20:03:19 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1379595818-6019-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1379595818-6019-1-git-send-email-muhammad_shakeel@mentor.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 25 Sep 2013 15:01:46.0934 (UTC)
	FILETIME=[27B62D60:01CEBA00]
Subject: Re: [PATCH] openssl: Add ca-certificates in RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Sep 2013 15:01:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2013 06:03 PM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> In some situations ca-certificates are required along with openssl
> to communicate securely, i.e. curl trying to fetch contents through https.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 78ff7ae..cf60d4b 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>   
>   DEPENDS = "perl-native-runtime"
>   
> +RRECOMMENDS_${PN} = "ca-certificates"
> +
>   SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             "
>   S = "${WORKDIR}/openssl-${PV}"

Any feedback on this?

Thanks,
Shakeel

