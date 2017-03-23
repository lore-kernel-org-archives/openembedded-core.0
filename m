Return-Path: <prvs=0255d8ba8c=mike.looijmans@topicproducts.com>
X-Greylist: delayed 16346 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Mar 2017 13:40:40 UTC
Received: from mx36-44.antispamcloud.com (mx36-44.antispamcloud.com
	[209.126.121.60])
	by mail.openembedded.org (Postfix) with ESMTP id A7A9F77AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 13:40:40 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx36.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cqyhx-0005Fu-3p for openembedded-core@lists.openembedded.org;
	Thu, 23 Mar 2017 10:08:15 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Mar 2017 10:06:59 +0100
To: <openembedded-core@lists.openembedded.org>
References: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <bca89655-d4fd-d6ea-74c7-9f6050473b89@topic.nl>
Date: Thu, 23 Mar 2017 10:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNClF
	+ZA3+2Q5NKWP5lQdP2gH4ZOQKh6Lj2tUX7/fClwFSB9vhIbrpdC1yI/MLxBAZWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/ttI+5uNYlio18PhwYAI3KFjI0DemMnj
	X6/AHZrydiX+6L3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeUTMKkbMlXz2JUArHA+14szgKKlg5rRfJw9pxA0+9OX6RKm353ztx8x
	waw1cKnsBGyxcEIKVJg0J7erdcW8mf2rcxw3qqhc+N6cuEg4XWh5Fgb/MuIXu+2kk2WrDexOHyU7
	WKxT4LlSKLDfp/19yPrhJ3Hzrrl0oVtjq6fTF9Jl0KmxVEE6gtF+B/lEIPzms76tk/3XLTmRwzit
	RAMwkvBlOAbafFWolSz8SP6cor7doMIclqURQOfTUwDe+Ri01fKK+Cycbw9+K8eJsPoj5lo/GFYM
	cVhzpcLQdqKp7LlvQx6beeRpmwmn73M0kjMKSZNhE0K4g0gX9R2hqKQ2Vgyd
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] native.bbclass: clear MACHINE_FEATURES
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
X-List-Received-Date: Thu, 23 Mar 2017 13:40:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 22-03-17 23:47, Andre McCurdy wrote:
> Try to avoid native recipes accidentally being dependent on
> MACHINE_FEATURES. This simple change doesn't prevent MACHINE_FEATURES
> set via MACHINE_FEATURES_BACKFILL sneaking through, but it's better
> than nothing.

Maybe this would work:

MACHINE_FEATURES_BACKFILL_CONSIDERED =3D "${MACHINE_FEATURES_BACKFILL}"

>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/native.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 6becf82..1919fbc 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -112,6 +112,7 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] =3D "1"
>  LIBCOVERRIDE =3D ""
>  CLASSOVERRIDE =3D "class-native"
>  MACHINEOVERRIDES =3D ""
> +MACHINE_FEATURES =3D ""
>
>  PATH_prepend =3D "${COREBASE}/scripts/native-intercept:"
>
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






