Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 878AB7F2F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 16:42:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x85Gg7DN001959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2019 09:42:17 -0700
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 5 Sep 2019 09:41:56 -0700
To: Peiran Hong <peiran.hong@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190905153846.11226-1-peiran.hong@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1704b70d-4336-f2e5-18bd-e7d7916ae7dc@windriver.com>
Date: Thu, 5 Sep 2019 12:41:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905153846.11226-1-peiran.hong@windriver.com>
X-Originating-IP: [128.224.56.214]
Subject: Re: [PATCH] diffutils: Add valgrind to support ptest
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
X-List-Received-Date: Thu, 05 Sep 2019 16:42:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/5/19 11:38 AM, Peiran Hong wrote:
> From: Peiran Hong <Peiran.Hong@windriver.com>
Drop this line please.
Was there some documentation that suggested it was required?

Otherwise looks fine so please send a v2.

../Randy
> 
> The test "strip-trailing-cr" for diffutils package is skipped since it requires
> valgrind to run. This commit adds valgrind to the run-time dependency of
> the recipe for diffutils.
> 
> Signed-off-by: Peiran Hong <Peiran.Hong@windriver.com>
> ---
>   meta/recipes-extended/diffutils/diffutils_3.7.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb b/meta/recipes-extended/diffutils/diffutils_3.7.bb
> index 7daeee3513..2d763633b6 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
> @@ -17,7 +17,9 @@ acpaths = "-I ./m4"
>   
>   inherit ptest
>   
> -RDEPENDS_${PN}-ptest += "make"
> +# Include valgrind since the test "strip-trailing-cr" requires it to run, although
> +# valgrind is a heavy package for diffutils
> +RDEPENDS_${PN}-ptest += "make valgrind"
>   
>   do_install_ptest() {
>   	t=${D}${PTEST_PATH}
> 


-- 
# Randy MacLeod
# Wind River Linux

