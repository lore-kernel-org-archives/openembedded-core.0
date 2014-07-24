Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5296ACE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:22:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6OLMqrg001714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:22:52 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 24 Jul 2014 14:22:30 -0700
Message-ID: <53D17916.8060704@windriver.com>
Date: Thu, 24 Jul 2014 16:22:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1406236178.27697.17.camel@ted>
In-Reply-To: <1406236178.27697.17.camel@ted>
Subject: Re: [PATCH] cross-canadian: Copy target_ definitions from cross.bbclass
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
X-List-Received-Date: Thu, 24 Jul 2014 21:22:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/14, 4:09 PM, Richard Purdie wrote:
> A while back we fixed the cross definitions to work better in multilib
> configurations, apply the same fixes to cross-candian.bbclass
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Tested this

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> diff --git a/meta/classes/cross-canadian.bbclass
> b/meta/classes/cross-canadian.bbclass
> index e536118..6da43fe 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -84,11 +84,12 @@ EXTRANATIVEPATH += "chrpath-native"
>   # Path mangling needed by the cross packaging
>   # Note that we use := here to ensure that libdir and includedir are
>   # target paths.
> -target_libdir := "${libdir}"
> -target_includedir := "${includedir}"
> -target_base_libdir := "${base_libdir}"
> +target_base_prefix := "${base_prefix}"
>   target_prefix := "${prefix}"
>   target_exec_prefix := "${exec_prefix}"
> +target_base_libdir = "${target_base_prefix}/${baselib}"
> +target_libdir = "${target_exec_prefix}/${baselib}"
> +target_includedir := "${includedir}"
>
>   # Change to place files in SDKPATH
>   base_prefix = "${SDKPATHNATIVE}"
>
>


