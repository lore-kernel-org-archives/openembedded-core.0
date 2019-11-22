Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8B07FA3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 04:20:40 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 88E3F539DC8DA91CBF14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 12:20:39 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 22 Nov 2019
	12:20:30 +0800
To: <openembedded-core@lists.openembedded.org>
References: <20191116141213.21526-1-zhengjunling@huawei.com>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <9abf4e58-4a29-3861-0135-3b08849a1144@huawei.com>
Date: Fri, 22 Nov 2019 12:20:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191116141213.21526-1-zhengjunling@huawei.com>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: Re: [PATCH v2] staging.bbclass: Fix wrong library paths in sysroot_strip
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
X-List-Received-Date: Fri, 22 Nov 2019 04:20:41 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

ping...

On 2019/11/16 22:12, Junling Zheng wrote:
> Do not reset libdir and base_libdir in sysroot_strip, and just pass crude
> paths as they will be reset later in strip_execs.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
> v2:
>  - Fix undefined variable error.
> 
>  meta/classes/staging.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index cca0b7e0d6..7e108950f5 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -75,8 +75,8 @@ python sysroot_strip () {
>  
>      dstdir = d.getVar('SYSROOT_DESTDIR')
>      pn = d.getVar('PN')
> -    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
> -    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
> +    libdir = d.getVar("libdir")
> +    base_libdir = d.getVar("base_libdir")
>      qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
>      strip_cmd = d.getVar("STRIP")
>  
> 



