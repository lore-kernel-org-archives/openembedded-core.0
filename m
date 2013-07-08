Return-Path: <net147@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4246B03F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 14:11:21 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so4336194pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jeKv3idpRFnLMTew28kP/UrJ//VYlu7/bSX3kh1LBM4=;
	b=yR0V9/3+W0kiVWV4OJWuJA+HF2IFpAyne/+7oRtumt8DV4ebBtmtZbCpERjT0+Ecl8
	vvWCvB7xD5tndbcYIsXvEg6UEHp2uYJQOLtmMfx5L6bcYwpbMg6CaEfKbXXcaQQo2dGN
	MPEtvqN//KNAuOBgYsexvwKRzJ5trCSsvAXgMFCSpNcH1zq6/t+HppehEKknCNxdLfCQ
	/5GbJs7/o1Ek4YntoXBmx7R5sVvgMkfNjlwitGX4J4fghsaJGRXOEVwOXYlLq/P3WHQn
	Qx6artPLfY/vZHn7FSilpHXNSkcrY2q4UU9cpGAba7qfprqzTkOMKjxv7RSNqyVbERXS
	3GHA==
X-Received: by 10.68.113.194 with SMTP id ja2mr21550462pbb.65.1373292682381;
	Mon, 08 Jul 2013 07:11:22 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	bn10sm24402944pad.9.2013.07.08.07.11.20 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 07:11:21 -0700 (PDT)
Message-ID: <51DAC761.7070601@gmail.com>
Date: Tue, 09 Jul 2013 00:06:25 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
	<1373099962-19854-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1373099962-19854-2-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 2/2] subversion: explicitly disable sasl
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
X-List-Received-Date: Mon, 08 Jul 2013 14:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/07/2013 6:39 PM, Martin Jansa wrote:
> * cyrus-sasl is in meta-networking and isn't in subversion DEPENDS
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-devtools/subversion/subversion_1.6.15.bb | 1 +
>   meta/recipes-devtools/subversion/subversion_1.7.10.bb | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> index 244d7ea..2a072e8 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> @@ -24,6 +24,7 @@ EXTRA_OECONF = " \
>                   --without-berkeley-db --without-apxs --without-apache \
>                   --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
>                   --with-apr-util=${STAGING_BINDIR_CROSS} \
> +                --without-sasl \
>                   ac_cv_path_RUBY=none"
>   
>   inherit autotools
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> index 9d189fe..ded1788 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> @@ -22,6 +22,7 @@ EXTRA_OECONF = " \
>                   --without-berkeley-db --without-apxs \
>                   --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
>                   --with-apr-util=${STAGING_BINDIR_CROSS} \
> +                --without-sasl \
>                   ac_cv_path_RUBY=none"
>   
>   inherit autotools
I would prefer a PACKAGECONFIG for this as I depend on subversion with 
SASL support.

Regards,
Jonathan

