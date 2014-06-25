Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF24607FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 01:58:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P1weto024695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 18:58:40 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 24 Jun 2014 18:58:40 -0700
Message-ID: <53AA2CCC.4020509@windriver.com>
Date: Wed, 25 Jun 2014 09:58:36 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1403612527-22722-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1403612527-22722-1-git-send-email-ming.liu@windriver.com>
X-Originating-IP: [128.224.163.186]
Subject: Re: [PATCH] kernel.bbclass: add task dependency between bundle_initramfs and package
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
X-List-Received-Date: Wed, 25 Jun 2014 01:58:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore the thread, I've sent a V2 with the updated commit messages.

//Ming Liu

On 06/24/2014 08:22 PM, Ming Liu wrote:
> To ensure the bundled image to be packaged kernel-image, otherwise, we
> may get a implicit result.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6ed1cb7..764a9ec 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -146,7 +146,7 @@ python do_devshell_prepend () {
>       os.environ["LDFLAGS"] = ''
>   }
>   
> -addtask bundle_initramfs after do_install before do_deploy
> +addtask bundle_initramfs after do_install before do_deploy do_package
>   
>   kernel_do_compile() {
>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE


