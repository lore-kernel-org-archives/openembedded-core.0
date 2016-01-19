Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C483C6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 09:29:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0J9TuEb004656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 01:29:56 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 01:29:55 -0800
To: "Maxin B. John" <maxin.john@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1448873637-23617-1-git-send-email-maxin.john@intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <569E021D.3070501@windriver.com>
Date: Tue, 19 Jan 2016 17:30:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1448873637-23617-1-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH] kexec: update supported architecture list
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
X-List-Received-Date: Tue, 19 Jan 2016 09:29:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年11月30日 16:53, Maxin B. John wrote:
> Now, kexec is supported in mips, aarch64 and most of the machines within
> powerpc family. So, remove those architecture specific restrictions.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> index 95b3988..acbae11 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> @@ -11,13 +11,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   inherit packagegroup
>   
> -# kexec-tools doesn't work on Mips
> +# kexec-tools doesn't work on e5500-64b yet
>   KEXECTOOLS ?= "kexec"
> -KEXECTOOLS_mips ?= ""
> -KEXECTOOLS_mipsel ?= ""
> -KEXECTOOLS_powerpc ?= ""
>   KEXECTOOLS_e5500-64b ?= ""
> -KEXECTOOLS_aarch64 ?= ""
>   
>   X11GLTOOLS = "\
>       mesa-demos \

May I ask why this patch didn't be merged?


-- 
Regards,
Neil | Kai Kang


