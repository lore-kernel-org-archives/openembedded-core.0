Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7758B7D132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:26:09 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id k64so3737263vke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OcdImPrwElSANWLerS9UGye6iYJKMY0UFLJsan3HtPE=;
	b=ry3j6HWYmOU3hbI8hBwpH6QtUStCmov7LB0n0a4Y2a08/9aXiRsUHvICuOwqOgARne
	BlSRm+Fp62/8cjsq+zq7WQcXZjAvOCv9u24voWDIU9NmAzRszJ7ck6veD86Qv2C+78hD
	FlTxGKwEFj9wrc1iHV+0qwGeDm1AkW9a7Qi49pVRTFCnqUW2on+Cuq9CryDBEVWO2jtO
	q/H2K0va3eDBQTPGgS3ZKRxgRiAZzOrBiTzVWrgmMwc5nUOGWlDYIr4cMzCDiY0Z2tDd
	SSjlvRiyk7MMocgeRybn/YAGsBy/txiuMtQnMGkCZ8tihtqyO7iJVOL7FUYKCOAsUcia
	QuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OcdImPrwElSANWLerS9UGye6iYJKMY0UFLJsan3HtPE=;
	b=E3aVnExFtU8s3wwrJjH1PN57uXrKdJlAgzy9R2nDZdYuMaMSlgmP0MUUEbVD7DjjUE
	aYqxIfAQW04Tp2SdZoKzUEW+CXl0PtNcPxqSATEP1snQHBHYP85zNxUWVkZ+KlrK7yJE
	/dzYrXvoAY8Rua8zJg+UL3UKZwC/xnZNi7vyt+wEqvzEfYCsPahJXEN2yQCNMBNrKAq+
	8jW6asTL7jk62pTjN5NdNFYSrt+dArrXSTsAFxuWi7c62KZo0zcJq9L0s3jNulJDjuVP
	PYhTFlUvhikX2iFRa9q3Ms/FEC8TEbqjW0onLW0bCN98Nbumm12qagZwDCsSD3V/F+FI
	mqJw==
X-Gm-Message-State: APjAAAUSrBxkfsidmouf25i+JHzLcNDuqMrcgEuAfV8stoXqqEBzlNDC
	FsCubML1nI9ygSee8A9q+Xg+l60uAeVMqGKsBG8=
X-Google-Smtp-Source: APXvYqzVmP5O6wPmVytF4gnMFtUmtu7EDOqMj595BXRXIrVPWVBCacbBAhXz9lVmU4oeHpGFwj+OnGPTJBMtCJA9CvI=
X-Received: by 2002:a1f:8052:: with SMTP id b79mr22749637vkd.46.1553700370516; 
	Wed, 27 Mar 2019 08:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <1553690811-26575-1-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1553690811-26575-1-git-send-email-vincent.prince.fr@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 27 Mar 2019 15:25:59 +0000
Message-ID: <CAO5Uq5TudhS3=eZGYS_M++VqV1kWc0sLhNccumu7VCQhn_Ht7w@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 15:26:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 27, 2019 at 12:47 PM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> libpcre2 is needed to enable grep option to journalctl.
>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_241.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
> index a12b9ab..9e05944 100644
> --- a/meta/recipes-core/systemd/systemd_241.bb
> +++ b/meta/recipes-core/systemd/systemd_241.bb
> @@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
>  PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
>  PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
>  PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
> +PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=true,libpcre2"

You've got "pcre2=true" in both arms of the PACKAGECONFIG.

>  PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
>  PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
>  PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

