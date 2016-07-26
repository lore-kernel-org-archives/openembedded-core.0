Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93AD0606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:35:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q9ZwnW022174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:35:58 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 26 Jul 2016 02:35:57 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1469521360-16641-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57972E6A.5000202@windriver.com>
Date: Tue, 26 Jul 2016 17:33:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1469521360-16641-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning
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
X-List-Received-Date: Tue, 26 Jul 2016 09:35:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this patch.

Verified gcc-5.4 and gcc-6.1 and it proves that no same warning exist.

Thanks,
Grace

On 2016年07月26日 16:22, mingli.yu@windriver.com wrote:
> WARNING: QA Issue: gcc-cross-canadian-i586-dbg: found library in wrong location:
> /PATH/sysroots/x86_64-oesdk-linux/usr/libexec/i586-oe-linux/gcc/
> i586-oe-linux/5.2.0/.debug/libcc1.so.0.0.0
>
> This warning is introduced by commit f6e47aa(gcc-target 5.1: fix for libcc1)
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core jethro rev: 62c51c4178fb66341498c71c74ce42652568c7fa)
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index ec1d281..1286179 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -83,6 +83,8 @@ FILES_${PN} = "\
>       ${prefix}/${TARGET_SYS}/usr/include/* \
>   "
>   INSANE_SKIP_${PN} += "dev-so"
> +INSANE_SKIP_${PN} += "libdir"
> +INSANE_SKIP_${PN}-dbg += "libdir"
>
>   FILES_${PN}-doc = "\
>       ${infodir} \
>

