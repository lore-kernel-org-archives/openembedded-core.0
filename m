Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56D1672EA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 12:48:03 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6QCm2cP000355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 26 Jul 2018 13:48:04 +0100
Message-ID: <4dc8f36e3667d46e4df740f35c4a47349b25541f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Clark <christopher.w.clark@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 13:48:02 +0100
In-Reply-To: <1532562394-27081-1-git-send-email-christopher.w.clark@gmail.com>
References: <1532562394-27081-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] binutils : enable x86_64-pep for producing EFI binaries
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
X-List-Received-Date: Thu, 26 Jul 2018 12:48:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-25 at 16:46 -0700, Christopher Clark wrote:
> From: Christopher Clark <christopher.clark6@baesystems.com>
> 
> On EFI architectures (arm/x86/x86_64/aarch64) add the x86_64-pep
> emulation support to the linker to enable production of Portable
> Executables for EFI binaries.
> 
> Enables building the EFI variant of the Xen hypervisor.
> 
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc
> b/meta/recipes-devtools/binutils/binutils.inc
> index 37813dd..b3efbad 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -69,12 +69,19 @@ python do_package_prepend() {
>  
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>  
> +def enable_efi_targets(d):
> +    translated_arch = d.getVar('TRANSLATED_TARGET_ARCH')
> +    if translated_arch in ["x86-64", "i586", "i686", "arm",
> "aarch64"]:
> +        return "--enable-targets=x86_64-pep"
> +    return ""

Just to double check, is "x86_64-pep" the right value even on arm?

Cheers,

Richard


