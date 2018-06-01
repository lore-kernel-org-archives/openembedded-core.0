Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id F037971A88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:08:16 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id m194-v6so3515387itg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xAdy3o/ajywz28QDfjH0+7r4xWBbQv/80NVLXxv5Pl8=;
	b=fD8l9sgk4xlnQRBKMZ4YFXScFr+8bv6LVpi9saQ7u+DrkiPr73cQN59DSr4BIEJAqP
	LgkJ28qoMOdea16jUJDDlWyNKyQMWM0JPRtzKVdu8OOlVQSneT6jAMo7IIjH3qIU9E2o
	yirB/Vfq53fkLa19yd8buFFxO/uUKm8AkEo/aiD+I2jAv/PasfPNslg0/6gMiCEZ8NFz
	dnZn/Kpz7ARsNNT15CeLHYvAMJzi5B2Vnah2E6BTqfyscmEFDWt5vWpd+NsHLIAvyNQq
	46AbjuodUEAs2vdnPnQwMQTkUHP4uzrp15lmETgCIiLLKu/5eUg0fNe/nNJ1btTutGv8
	WTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xAdy3o/ajywz28QDfjH0+7r4xWBbQv/80NVLXxv5Pl8=;
	b=ixIwC/y8pGCBW+1bVHPuZbPRMJXJJrNOL85LHrlkqfontPO5Tpr3St/ztdIwWAy+AZ
	dWh1iiS4PGo4V7stiIIqrY/J5uc2F1Dp4sX85SCIh/jNURdSa/9WSLvd1ngSvMOtJC1r
	Nqw1pvXmTxk6X62rV7kbTtCOuTGr/5uU2+txGT9DNXTbNN6mpFVW+ZAyaeD7FPRZxTA7
	3rVTc4Mb5tpYjYVeo2K+LAU0I341A8HeAnYDZBvU9dFLejnGROIkrQsGhOVs0tljYE6T
	CuXRu8HdSMw2FXvKGgH50hcQJzc1mda/KPZeDsBd6D7UF8dn/xyIZC4jLQUPvfQHhRUV
	E0lg==
X-Gm-Message-State: APt69E3eZeYgDoEdFUKp/0H3Rcg5r3YAIXuw+beP6OQUi8VkyWpVs/BW
	+K235pqhn7pvJ+nX4kjQUhg=
X-Google-Smtp-Source: ADUXVKLKCbW961gvH348lMjwQBCaKqOVyAF3GFcAGGwRLUWXhoJW+k3mQrThI35ymqn7H919+1fgXw==
X-Received: by 2002:a24:4516:: with SMTP id
	y22-v6mr6072417ita.109.1527890897852; 
	Fri, 01 Jun 2018 15:08:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	k4-v6sm1751479ioc.15.2018.06.01.15.08.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 15:08:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Date: Fri, 01 Jun 2018 17:08:16 -0500
In-Reply-To: <20180601210240.14969-6-mkelly@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Fri, 01 Jun 2018 22:08:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
> It's useful for the post-relocate scripts to be able to see the SDK
> environment, for example to see the values of CC, CXX etc. in order
> to
> dynamically generate toolchain files.
> 
> To enable this, source the SDK environment script prior to calling
> the
> relocate scripts.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/classes/toolchain-scripts.bbclass     | 17 +++++++++++++----
>  meta/recipes-core/meta/meta-environment.bb |  5 +++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass
> index ae7bbef034..5f99fd8c03 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -118,11 +118,20 @@ EOF
>  }
>  
>  toolchain_create_post_relocate_script() {
> -	script=$1
> -	rm -f $script
> -	touch $script
> +	relocate_script=$1
> +	sdk_script=$2
> +	rm -f $relocate_script
> +	touch $relocate_script
> +
> +    cat >> $relocate_script <<EOF
> +# Source the SDK env script in case it is needed for the relocate
> scripts.
> +. $sdk_script

I had originally done something similar to this when I added support
for the post-relocate scripts with icecream. However, it is insufficent
because there can be multiple SDK environment scripts that need to be
sourced. In order to get a fully correct environment, I had to do:

 # Setup environment
 for env_setup_script in `ls $1/environment-setup-*`; do
 	. $env_setup_script
 done

see meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-
setup.sh


> +status=\$?
> +if [ \$status != 0 ]; then
> +    echo "\$0: Failed to source $sdk_script with status \$status"
> +    exit \$status
> +fi
>  
> -    cat >> $script <<EOF
>  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
>      for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
>          \$s "\$1"
> diff --git a/meta/recipes-core/meta/meta-environment.bb
> b/meta/recipes-core/meta/meta-environment.bb
> index 09f757a087..74c0600c3d 100644
> --- a/meta/recipes-core/meta/meta-environment.bb
> +++ b/meta/recipes-core/meta/meta-environment.bb
> @@ -51,12 +51,13 @@ create_sdk_files() {
>  	# Setup site file for external use
>  	toolchain_create_sdk_siteconfig
> ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
>  
> -	toolchain_create_sdk_env_script
> ${SDK_OUTPUT}/${SDKPATH}/environment-setup-
> ${REAL_MULTIMACH_TARGET_SYS}
> +	sdk_script="${SDKPATH}/environment-setup-
> ${REAL_MULTIMACH_TARGET_SYS}"
> +	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${sdk_script}
>  
>  	# Add version information
>  	toolchain_create_sdk_version
> ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
>  
> -	toolchain_create_post_relocate_script
> ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh
> +	toolchain_create_post_relocate_script
> ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh ${sdk_script}
>  }
>  
>  do_install() {

