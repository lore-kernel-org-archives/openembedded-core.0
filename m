Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB9226010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:36:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0Q4a48v024535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 25 Jan 2016 20:36:05 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 20:36:03 -0800
To: Denys Dmytriyenko <denis@denix.org>,
	<openembedded-core@lists.openembedded.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A6F7B2.8080203@windriver.com>
Date: Tue, 26 Jan 2016 12:36:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453779264-8652-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 04:36:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/26/2016 11:34 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> A clean room re-implementation and extension of the original stress tool.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> new file mode 100644
> index 0000000..2e92c53
> --- /dev/null
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A tool to load and stress a computer system"
> +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
> +SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
> +
> +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"

Why hardcode -O2, please ? It impacts the DEBUG_BUILD.

// Robert

> +
> +do_install() {
> +	oe_runmake DESTDIR=${D} install
> +}
>

