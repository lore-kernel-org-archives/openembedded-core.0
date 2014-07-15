Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7B07022A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:40:48 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id tp5so4691892ieb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TfATC61PterraDhhUZNrX2r8iOoSu/qQeZPAF7v/qcA=;
	b=IgW/2sOxsLdPh1cAWt+WDmcIHWreGyFa+NZKgTAAjiNOwhTLBt4vLpQpnMO6TQAQDz
	NVDK6JfW0b7Bvl7XRFO10RrErEelGTDg2jgJxm7F/CJwKveZT1vmYKH6L+407X7aDqVq
	06n6RbvZ4Aryq14T1NdJcIHMDckXQjexf+VQYWRmanKsVN/wRiq8MrKL8F/bXMCDC7nE
	jYNa3RQN5I5WASGr5hb4LDcP1WzJlgp9J4nnkNztm+rnu6h6YQsOwhVBj62M1PLNHfnO
	DfD87ZqOPzQnQugJPhDLrzXjsCnImsTNVp3/8VG+Xane/9V7sZX5qB3L9+BPZz8wwI0M
	fdog==
X-Received: by 10.42.90.74 with SMTP id j10mr30821417icm.29.1405438849787;
	Tue, 15 Jul 2014 08:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 08:40:19 -0700 (PDT)
In-Reply-To: <c6ba65dc4b22e743a8aef32cf77b08c6eca388fc.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
	<c6ba65dc4b22e743a8aef32cf77b08c6eca388fc.1405433828.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jul 2014 08:40:19 -0700
Message-ID: <CAMKF1so50VJx-iL4dXbmR_RNpgvSPJYNOPkPGth7uTFmNL=VoQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/38] gnu-config: add perl to RDEPENDS_gnu-config
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
X-List-Received-Date: Tue, 15 Jul 2014 15:40:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 15, 2014 at 7:19 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Perl script:
> gnu-config/usr/bin/gnu-configize

will it impact native recipes too ?

>
> [YOCTO #1662]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../gnu-config/gnu-config_20120814.bb              |    2 ++
>  meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> index d67466a..af4afd6 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
> @@ -17,6 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
>  SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
>  SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
>
> +RDEPENDS_${PN} += "perl"
> +
>  do_compile() {
>         :
>  }
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> index 00fa759..d1b0a59 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -17,6 +17,8 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
>
>  S = "${WORKDIR}/git"
>
> +RDEPENDS_${PN} += "perl"
> +
>  do_compile() {
>         :
>  }
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

