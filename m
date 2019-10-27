Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 160857F953
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 11:48:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 22so6203902wms.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 04:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5Ig0VOyAClFhpnmZtrCqSaA/QWBF1DWF+P+1SD4pJ1E=;
	b=fKikzOWW7+dIfgQoO7yYVIBgICBNTrVZYbFRYXUQhUlNdAcsKqRopuJSOT7+KbD+Z/
	bzQNieF8W2a1QLydA6aMTNZrYXRwqsOfj90PMs0dZBHYrOOods3tfJ5ZkXyL7aDgglmR
	lPEwDdXwnxva68Z/DIwBWWrhSdalAvLN5mqsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5Ig0VOyAClFhpnmZtrCqSaA/QWBF1DWF+P+1SD4pJ1E=;
	b=Jg9epJV+y6lOm9nG94xDPxXZr8k1y45re4qJSbBZpEnxr6BkhkQIGEEmT2Wqyu8WT1
	vHu75w2PwDKJx90UHk/H6kK3B9+p2dgsdMkxPB3auxFvBeMZOIDwQitD3TmIWfloVcES
	EJ+5Wp7kdTK9nKwDvTalwE0dCkKaD9z1hxlCv1eni/3ShVCNbS9QFMAfp9ZfdwwlMv3B
	N9DtnD7jlya1/9QyxTBOmKKRCqaON/wOKgbNv8sBweoqChkg6Givx3MYwwYFAnEDJ1gS
	L/X+WmB5/kw2M8D9vZrbEwZ65WBuvM/viyGRlAA+0rfkqHQ0DCuRu/jeELf///RsRRFx
	MYiA==
X-Gm-Message-State: APjAAAVBenPijXllUdiVMLvCn83uYfRSK0lLrqzsSsjQDV0d0oQ8IkmD
	W3AtkkivFHQ28yTTZK8rG0b9o8TSJOs=
X-Google-Smtp-Source: APXvYqxsh8k8Yzoyz8XdrBp+tubFULfGRdMGOuCPcO9G7sgaimNIcX2fGprrCRwacPLxD78Y7I18Og==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr10700138wmh.102.1572176927655;
	Sun, 27 Oct 2019 04:48:47 -0700 (PDT)
Received: from hex ([176.12.107.140])
	by smtp.gmail.com with ESMTPSA id o6sm7977271wrx.89.2019.10.27.04.48.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 04:48:46 -0700 (PDT)
Message-ID: <692a8a3168c76b755d96c5db51f2da0ee91f555d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 11:48:38 +0000
In-Reply-To: <20191026204216.9298-1-bunk@stusta.de>
References: <20191026204216.9298-1-bunk@stusta.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gnu-efi: Upgrade 3.0.9 -> 3.0.10
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
X-List-Received-Date: Sun, 27 Oct 2019 11:48:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-10-26 at 23:42 +0300, Adrian Bunk wrote:
> Part of patch fixed upstream removed.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../gnu-efi/parallel-make-archives.patch       | 18 ----------------
> --
>  .../{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb}    |  4 ++--
>  2 files changed, 2 insertions(+), 20 deletions(-)
>  rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.9.bb => gnu-
> efi_3.0.10.bb} (95%)

I think this caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1402

Cheers,

Richard


