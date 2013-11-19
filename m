Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 331566CFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 02:20:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAJ2KRoN028608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 18:20:27 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 18:20:26 -0800
Message-ID: <528ACAE4.1060901@windriver.com>
Date: Tue, 19 Nov 2013 10:20:20 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384827264.git.hongxu.jia@windriver.com>
	<4e295b4e41dca18db1acab845627396eddb39633.1384827264.git.hongxu.jia@windriver.com>
In-Reply-To: <4e295b4e41dca18db1acab845627396eddb39633.1384827264.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 1/1] libpthread-stubs: add ALLOW_EMPTY_${PN} = "1"
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
X-List-Received-Date: Tue, 19 Nov 2013 02:20:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2013 10:15 AM, Hongxu Jia wrote:
> There was an image build failure while installing libpthread-stubs to rootfs.
> ...
> Failed to buld rootfs image for fsl-b4xxx-standard-glibc-std after adding
> multilib package lib64-libpthread-stubs.
> ...
>
> The libpthread-stubs was empty and the package didn't exist by default. Add
> ALLOW_EMPTY_${PN} = "1" to create the empty libpthread-stubs fixed this issue.

In libpthread-stubs recipe, the PN-dbg and PN-dev existed,
so the PN should also exist.

//Hongxu

>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> index ad046d1..f4264b4 100644
> --- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> +++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> @@ -22,3 +22,4 @@ RDEPENDS_${PN}-dev = ""
>   RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +ALLOW_EMPTY_${PN} = "1"


