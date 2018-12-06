Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A69126B51A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 02:55:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB62skse026185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 18:54:56 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 18:54:35 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1542971171.git.liezhi.yang@windriver.com>
	<85fe4df7c0ce3e3c8017fbf410d98498669f7363.1542971171.git.liezhi.yang@windriver.com>
	<CA+chaQegPbZ05LK3ZMNNHDYdjsi4ba-kp4=m3BBj6EbzbaHf8A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <01bf1405-68d4-59c1-bb14-c12e7d75cd7b@windriver.com>
Date: Thu, 6 Dec 2018 10:59:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQegPbZ05LK3ZMNNHDYdjsi4ba-kp4=m3BBj6EbzbaHf8A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Thu, 06 Dec 2018 02:55:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Martin,

On 12/5/18 10:40 PM, Martin Jansa wrote:
> I wish we could have the same warning for shell code as well :).
>

According to oe's Format Guidelines:

https://www.openembedded.org/wiki/Styleguide#Format_Guidelines

- Python functions must be four space indented - no tabs.
- Shell functions in OE-Core usually use tabs for indentation, but other layers 
usually use consistent indentation with 4 spaces (in shell functions, python 
functions and for indentation of multi-line variables)


So I think that shell code can use either spaces or tabs as indentation.

> Can you please take care of meta-gplv2 as well?
> WARNING: meta-gplv2/recipes-core/coreutils/coreutils_6.9.bb 
> <http://coreutils_6.9.bb>: python should use 4 spaces indentation, but found 
> tabs in coreutils_6.9.bb <http://coreutils_6.9.bb>, line 95

Thanks, I've sent a patch for it.

// Robert

> 
> I've sent patch for meta-oe issue:
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-December/197803.html
> 
> 
> On Fri, Nov 23, 2018 at 11:51 AM Robert Yang <liezhi.yang@windriver.com 
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     Use 4 spaces to replace a tab.
> 
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>       meta/classes/uboot-sign.bbclass | 16 ++++++++--------
>       1 file changed, 8 insertions(+), 8 deletions(-)
> 
>     diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
>     index 0e5e1b1..03100b8 100644
>     --- a/meta/classes/uboot-sign.bbclass
>     +++ b/meta/classes/uboot-sign.bbclass
>     @@ -93,14 +93,14 @@ do_install_append() {
>       }
> 
>       python () {
>     -       if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
>     d.getVar('UBOOT_PN'):
>     -               kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
>     +    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
>     d.getVar('UBOOT_PN'):
>     +        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
> 
>     -               # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
>     -               d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' %
>     kernel_pn)
>     +        # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
>     +        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
> 
>     -               # kernerl's do_deploy is a litle special, so we can't use
>     -               # do_deploy_append, otherwise it would override
>     -               # kernel_do_deploy.
>     -               d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
>     +        # kernerl's do_deploy is a litle special, so we can't use
>     +        # do_deploy_append, otherwise it would override
>     +        # kernel_do_deploy.
>     +        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
>       }
>     -- 
>     2.7.4
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

