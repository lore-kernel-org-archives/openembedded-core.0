Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4575574E36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:57:42 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id l25-v6so8932975ioh.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J02Gdtkbrg8bra1K2ta/iySTRLhpppq0xycQNiMmQQc=;
	b=CMRl/7Ngj12A3BSdZMtEXjji4jb5IxMM+JqaBd0iFvfptXgtR7D+HL5z9ihYAuvH7Z
	dfRznaUvR/SORFzjQ8t5YA42jb9AHFPpZhXgcR9cei7TFv0ptYt+GTV8SLzzNXPbSKX7
	MZHhEM1BvgEgoluh55pzUCvhvKVLXa7L5F/NS/AaldCw1Kwp8dMXWCntnjF+BN1BMszv
	nEy6Sjmm4Dmd+u9A+FrhTrluCLoN0soP/lK32sYdBYQfxjEzNClKlLIbn0z1jNHrUix6
	/mGKKQS+Uja1zlmIS3gt3oXC4aeLp254HR/X4MPH3O+YFBxrSlmbslmjlVZHUz/RNyjh
	npqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J02Gdtkbrg8bra1K2ta/iySTRLhpppq0xycQNiMmQQc=;
	b=oIiCqyvtGk5igv5BXqLQrU8bRNaoDqyHpCE0670NeJRCQSh/mULU608oyEiMFMOMYy
	UKh4kJTjkEfGar4lEEoyB/O3JOkzfYCiDadKGZYHt49hKaigFC+R3rdBTs0DDVHj+fgf
	CL7t2zGbcw7JEmJQ07k+a6381FHG4C4OQlad8W+JFXlpKsRjpLmSGeElPEbUvN8p0Hyb
	Snjvz8GQRWoyKsZId8sZWb3YiXrJx2bJ0oFTq0EDroDVw/ctayrd57sEe9yHy04jBL64
	MZHHmEdJIsH4iHlRFV7WGIKnGqEtjT2DGRU9RRoNhFXZvRxjfDBrFkpDyvWrIUd3BZjr
	CsSA==
X-Gm-Message-State: ALKqPweYrCzzUrxLdiFJm1nNmB4wLE+YEx77tN5SqBTZtamkpUOAI81g
	zRaIW3hKRUtSbDlKhl6inNI=
X-Google-Smtp-Source: ADUXVKKVL4gaHxbpK3bndapDQ4Slz33XxLJA6Lh+Y/aZU1IaFBPioyFAhoOBV6CtPVhRBzQ7IMKXFw==
X-Received: by 2002:a6b:d312:: with SMTP id
	s18-v6mr12178619iob.284.1527890263830; 
	Fri, 01 Jun 2018 14:57:43 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	s185-v6sm1677278iod.25.2018.06.01.14.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 14:57:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <7168144860e220ae47cefe9df0af760e095d62c9.camel@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Date: Fri, 01 Jun 2018 16:57:42 -0500
In-Reply-To: <20180601210240.14969-5-mkelly@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-5-mkelly@xevo.com>
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH v2 4/7] toolchain-shar-extract: print post-relocate error
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
X-List-Received-Date: Fri, 01 Jun 2018 21:57:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
> Currently, if a post-relocate script fails, it fails silently. We
> should
> be louder about this, as it likely indicates a broken SDK.
> 
> Print a message if a post-relocate script fails.
> 
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass
> index cbba07838a..ae7bbef034 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -126,6 +126,11 @@ toolchain_create_post_relocate_script() {
>  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
>      for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do

Perhaps worth adding:

 [ -x \$s ] || continue

?

>          \$s "\$1"
> +        status=\$?
> +        if [ \$status != 0 ]; then
> +            echo "post-relocate command \"\$s \$1\" failed with
> status \$status" >&2
> +            exit \$status
> +        fi
>      done
>      rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
>  fi

