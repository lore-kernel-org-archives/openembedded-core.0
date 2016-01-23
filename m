Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 85A7A755F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 04:48:56 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z14so4712812igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wI3nOPNALpZTGryywt6PhDSYifOPvh0n5ulNHOdGOOE=;
	b=dDON93TIYZFylUoZK3D3o9Rm+IqnG0YThGIRMqcxzDMFDEFjLBGXv/Ge13gy2D8/u/
	qdp2vxgZ8clr6gLMdeX57fOXIWSTM9OL6t5mqHJX901C6QAnMUXglF1AXrppRMocqjH5
	kw1Ub184bTbU7NVwUiv9eoPTZipf1/Q/uFhJMQgCyfrWxEXMHHt6kKmm/exiME+cCSUY
	rFCUVONOb5OaYl79CnGXMeVUq8K9/S0YPesKGFImrYVi28L41IBWkQDwMOvzBGEU9Ly7
	UAdNsDmJdnw+Ss0QC0tSSGNuyxQ1GSqeIu3y9bAsoSr3vEgXWji8BI+x6gpoURQuv0+s
	Em6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wI3nOPNALpZTGryywt6PhDSYifOPvh0n5ulNHOdGOOE=;
	b=DTxG5FT1lJB/FrGnFK4t28P8uTznZCE76GqPyn3rGKUK1TUD6qa/oGPjFI5RGo4Vgd
	4+8jEOMUWErbUA+lb5pjQOYfvlmlFD7GMEvbF/QFC0Fin2h31iZ7GKMsOTEJ4vy0vUWB
	pkPTiYK0S6R1GORm+xaEAYHQYJ4xh/T4FFhEFKprp0/D/wQWJ+n0M79iDG/ivhawhcNV
	NqYKUrzDDUnBjPBt63gQaB+D8fN8oromvYvyPCnakiyuyhNEUpNwPIjEjXqACFPBnYn6
	to/ZamVRcMJMvDgl/h+FoaQUJ/32/T/1STL4q6yBMpEbWq67fwcgZ128hoQjkXz2Pg/h
	H3SA==
X-Gm-Message-State: AG10YOSLrilM0Jr6y17Vp5zoW4BNbQxJ/bM31HZlgWthH+9EL8gpAJ8bD4p4Sqc0qX3OOCtoF6g6JjWP6JmERQ==
X-Received: by 10.50.33.81 with SMTP id p17mr6445766igi.75.1453524537265; Fri,
	22 Jan 2016 20:48:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 20:48:27 -0800 (PST)
In-Reply-To: <1453497982-9859-1-git-send-email-armccurdy@gmail.com>
References: <1453497982-9859-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 20:48:27 -0800
Message-ID: <CAMKF1sq-mQQpBAa1YCcZFdQxEPOd=2DH-cm+oKKV2uD8_PPJ+A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bsd-headers: fix LICENSE syntax, && -> &
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
X-List-Received-Date: Sat, 23 Jan 2016 04:48:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 1:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/bsd-headers/bsd-headers.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
> index 12a2cca..1fd5b82 100644
> --- a/meta/recipes-core/bsd-headers/bsd-headers.bb
> +++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
> @@ -2,7 +2,7 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
>  DESCRIPTION = "bsd compatible headers"
> -LICENSE = "BSD-3-Clause && BSD-2-Clause"
> +LICENSE = "BSD-3-Clause & BSD-2-Clause"

This is already fixed in my tree. see
https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3671

>  SECTION = "devel"
>
>  SRC_URI = "file://sys-queue.h \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

