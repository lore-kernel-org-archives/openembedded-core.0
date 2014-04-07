Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21A8A6AE14
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 22:48:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s37MmcCl024954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 15:48:39 -0700 (PDT)
Received: from [147.11.119.84] (147.11.119.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Apr 2014 15:48:38 -0700
Message-ID: <53432B43.1010709@windriver.com>
Date: Mon, 7 Apr 2014 17:48:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1396908301-27124-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1396908301-27124-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] openssl: Address CVE-2014-0160
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
X-List-Received-Date: Mon, 07 Apr 2014 22:48:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/14, 5:05 PM, Saul Wold wrote:
> This was the suggested fix for those unable to update to the new 1.0.1g version.
> Since we are so close to our release, we should hold of on the update until 1.7
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.0.1e.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> index 618ba68..874aa21 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> @@ -4,7 +4,7 @@ require openssl.inc
>   # if they are available.
>   DEPENDS += "cryptodev-linux"
>
> -CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> +CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_NO_HEARTBEATS"
>
>   PR = "${INC_PR}.0"
>
>

Between 1.0.1e and f there are 3 CVEs.  'g' adds two more.

This is a very low risk change, as the API and other components are stable.

--Mark

