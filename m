Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBF4M-0001Ua-NG
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 02:10:42 +0200
Received: by yxj17 with SMTP id 17so1070817yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 17:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Ab1i1Mm3U6hiWG0zofKwxwerAozGvleSsXAzwtjQN7Y=;
	b=IECuQy99tqkx15nCFAghgnECHcZzoXs1Iaf6KjRy+LfPIL9cCb+WuXpg2+3/z6nn6d
	AiLTmBFaBpbd799QImaUziVlQtIV26EjhC484fuzXWLYuuV90wrOuipO/e10nIe3aI6/
	Fo+WiTZz1r7bBse8u87zw/OiGryPiIhE418vM=
Received: by 10.150.145.18 with SMTP id s18mr1812771ybd.293.1317773104993;
	Tue, 04 Oct 2011 17:05:04 -0700 (PDT)
Received: from [172.23.2.168] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id e10sm27285718ani.8.2011.10.04.17.05.03
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 17:05:04 -0700 (PDT)
Message-ID: <4E8B9F2C.5030706@gmail.com>
Date: Tue, 04 Oct 2011 17:05:00 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
In-Reply-To: <1317765787-19127-5-git-send-email-msm@freescale.com>
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 00:10:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/2011 3:03 PM, Matthew McClintock wrote:
> sysprof will not build properly without this defined
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
> No comments on original patch sent
>
>   meta/recipes-kernel/sysprof/sysprof_git.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
> index 10bde04..271b5d8 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -16,6 +16,8 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
>   SRC_URI_append_mips = " file://rmb-mips.patch"
>   SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
>
> +export CFLAGS_append_powerpc64 = " -D__ppc64__"
> +

this is a gcc built-in define I wonder why you need to add it explicitly

>   S = "${WORKDIR}/git"
>
>   inherit autotools



