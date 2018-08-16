Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24CC57923B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 01:17:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7G1HwIG016130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Aug 2018 18:17:58 -0700
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 15 Aug 2018 18:17:56 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1534151172-28001-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <2162b18d-afa7-1c4c-66bb-2f52f2c8abba@windriver.com>
Date: Thu, 16 Aug 2018 09:14:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534151172-28001-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.149]
Subject: Re: [PATCH V2] nfs-export-root: add it to nfs-server FEATURE_PACKAGES
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
X-List-Received-Date: Thu, 16 Aug 2018 01:17:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.


On 2018年08月13日 17:06, Dengke Du wrote:
> When we enable nfs-server feature, we should add the required file
> /etc/exports installed by nfs-export-root.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/classes/core-image.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index a9a2cec..9ea6d89 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -42,7 +42,7 @@ FEATURE_PACKAGES_eclipse-debug = "packagegroup-core-eclipse-debug"
>   FEATURE_PACKAGES_tools-profile = "packagegroup-core-tools-profile"
>   FEATURE_PACKAGES_tools-testapps = "packagegroup-core-tools-testapps"
>   FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
> -FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
> +FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server nfs-export-root"
>   FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
>   FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
>   FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"


