Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 210817E1FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 14:38:58 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u16so305986wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QSI6PhBh9PfwqWtCI2mfGlFvLuxInN1uT9pUsKGnNU0=;
	b=eAEGzYQkJ3CekgXOPq0SY+9soW9VJsLyMCi2dYNu55BYtX9hIwfPGiBif7n9R/ZT5F
	c2y+/LvfFTsBdD5Fvs8Eug4vO3JJZE/B7yhqKW7M5G7VNbf+DStYdKVYe1hxd2xtQqHd
	0tOllVTPSYOE0RpxyTGVwGESZv5X0vSVZti2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QSI6PhBh9PfwqWtCI2mfGlFvLuxInN1uT9pUsKGnNU0=;
	b=GrFzJxpDwwsyQlemVMeFjdMmmI7MYQrrxVwabGrZBrx8nFSIdkb7roNYCLFtHAkkhM
	9OxsuQr5D/JjSDgTYexGsyZAyaq0nfeeSpSUoXSepXTCgAmr2ODSCpO2e+apieJBtxmd
	Ee03FM/G349PXG6eIXoghrdsNmuOxBJU9SdoOJOZmzZnwVwGdQZAv0w5h8EE6fbcX+up
	a/pxwsCmEtpyLM1PBfOasnXMMc+32mhTeRiWzd6xAw+TMx5o0W/BdpGoimdlaaQzCVXf
	T7j62YhhMr+TJTbtphTt8nJrPGqJBsqjM20LNNOANWgKreenjf8ynjYM0sPt7udI5fAK
	SWBQ==
X-Gm-Message-State: APjAAAW1k+L1g1v1ULVkb+MLwPtjk/PLGAiVB5gGsLu626bMvTWcWxXs
	4DJdh1rf/DpfmeZPg9E3KklqAQ==
X-Google-Smtp-Source: APXvYqzKFhA4b3B53Ry4hVm4kIGbz/vZiPKY8yBAgDoiacG1FEWHdVe786rvzTVa/zZ9mO2IJhzu1A==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr47173119wrr.105.1565793539304;
	Wed, 14 Aug 2019 07:38:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d1sm4020040wrs.71.2019.08.14.07.38.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 07:38:58 -0700 (PDT)
Message-ID: <f860d0823bb97bdc818095b369af276f170b7433.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 15:38:56 +0100
In-Reply-To: <1565787413-8109-1-git-send-email-mikko.rapeli@bmw.de>
References: <1565787413-8109-1-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] stress-ng: provide stress
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
X-List-Received-Date: Wed, 14 Aug 2019 14:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 15:56 +0300, Mikko Rapeli wrote:
> Since stress-ng replaces and is compatible with stress,
> provide stress to be compatible with the old recipe
> and binary packages.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> index e800040..64e0928 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
> @@ -14,6 +14,10 @@ SRC_URI[sha256sum] =
> "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa52
>  
>  DEPENDS = "coreutils-native"
>  
> +PROVIDES = "stress"
> +RPROVIDES_${PN} = "stress"
> +RPROVIDES_${PN}-dev = "stress-dev"
> +

Isn't that going to need RCONFLICTS and RREPLACES too?

Cheers,

Richard


