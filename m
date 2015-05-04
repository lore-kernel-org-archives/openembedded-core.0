Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id BDA897169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 20:23:14 +0000 (UTC)
Received: by iejt8 with SMTP id t8so139504464iej.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 May 2015 13:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=esPtqr/EBCatyGWSP5qwfmMlZ5j0c2IKIgpbHOSchcs=;
	b=Fz2dNb0GaWv1CjXqtc+Tpk7Yv8ER19GP/fT8WDib5/JHctrliIEa09erET57qQFScy
	ikqojBzj25y9T/RPlhcfWj10uxhwcAVw0d6D2C2PdxmrDSk/B2VAzzViKAoVpn4Oqzcb
	+0lokXusf2wnnhxPogoiEHF3QpvGPKTxH32xCRu0+iOtCIEwMR4dRXdd1LQLPwFsdtHE
	eRvyrWb0a8hh3tI8sRGkqf42TVzGjgr3g95NQZ/8JAT5wrdng4Ev6i3oBced6PeCAYBA
	LtHplP+svlBU6WbIwINQ3lwnL9N7ohMWxDSJ1h2Sb2EB6U80bSon6pxBUrTZ+9RFkVvb
	3/KQ==
X-Received: by 10.107.169.160 with SMTP id f32mr29875136ioj.83.1430770996141; 
	Mon, 04 May 2015 13:23:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Mon, 4 May 2015 13:22:45 -0700 (PDT)
In-Reply-To: <1430735858-6704-1-git-send-email-jussi.kukkonen@intel.com>
References: <1430735858-6704-1-git-send-email-jussi.kukkonen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 May 2015 13:22:45 -0700
Message-ID: <CAMKF1sr7joRJQMLsX4==4e6f185hzkgC9QdwBFhxSVsHjkz64w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: Upgrade 1.3 -> 1.4
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
X-List-Received-Date: Mon, 04 May 2015 20:23:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 4, 2015 at 3:37 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Looks ok. In future use git format-patch -M option to let git work
harder on detecting renames

> ---
>  meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb | 7 -------
>  meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
>  create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
>
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
> deleted file mode 100644
> index 4bd81cd..0000000
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require shared-mime-info.inc
> -
> -SRC_URI[md5sum] = "743720bc4803dd69f55449013d350f31"
> -SRC_URI[sha256sum] = "4fd49c8c7ca9ecb10c59845094a18dbb73b69c72b4bad3db5e864f2111cb323a"
> -
> -SRC_URI =+ "file://parallelmake.patch \
> -           file://install-data-hook.patch"
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
> new file mode 100644
> index 0000000..3797972
> --- /dev/null
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
> @@ -0,0 +1,7 @@
> +require shared-mime-info.inc
> +
> +SRC_URI =+ "file://parallelmake.patch \
> +           file://install-data-hook.patch"
> +
> +SRC_URI[md5sum] = "16c02f7b658fff2a9c207406d388ea31"
> +SRC_URI[sha256sum] = "bbc0bd023f497dfd75e1ca73441cbbb5a63617d9e14f2790b868361cc055b5b1"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

