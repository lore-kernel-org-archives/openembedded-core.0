Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE4427D19C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 16:02:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so32685101wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rAfULRsfJ2gMsY0/3uivBpueKZetiFSt9nXReS8YmXQ=;
	b=H7keWb4vUbhz/bAJ9B1IyPyozkoIi3bOFkOnOJZODDihn2m/9IVHFI6LuGsx/OOPnE
	f82j9BkHIAAYb1w2IFJ/33HwXEyl1J1p3XO6ceqjxN8DxTjBc1Kmtzs2GnuuN7YNVdPp
	sSbPgTAln6zT9ftVnAsSWdb1+9Qp5jp7DWjI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rAfULRsfJ2gMsY0/3uivBpueKZetiFSt9nXReS8YmXQ=;
	b=jvte3ko1gUOzY5ni8/pUI3nzlQBulNiKh0YBvN1BoChxGGxHw2PCSd+bzFFpC71oMR
	n03s4aeJ+gNamD0sJKx8msYaYbgj+yuwlmry0mFCFTere3Y2EHPVXBjrT1lvi83jxm7m
	ryNdrAx+dhSouBb155BxJSKOYNQP+8IubNMmtjUuTtpBsC7YjBq+HtwMsH0+ywklNZd9
	IfZNLBNWd7Q64AQfNsGGiY1u+QsbNUqt0T+9nZgN3AFoafXTNnwJpasEGe28sHAhNGUJ
	Vcq5RD0ldc0fCxhpRUx6IR9QN6f7+RlyFoVJFxVJKLYI+7UIgPoB+3GWtKuKt5MefZ8q
	xePg==
X-Gm-Message-State: APjAAAVnZkQa57vizbFPVIAjtudiQCX4oBRgyQCmp5QWvM7mGXBRux4b
	DFyj4IzHg8qOd8AmzpT7hihtXfZWOIo=
X-Google-Smtp-Source: APXvYqzhTgVnWE+eToBEaYG5XTWTdIWrqAAhNsrp7eXLpfjREFtLUCLzAJrk/r0RsOu1EUPIzVXcpw==
X-Received: by 2002:adf:e547:: with SMTP id z7mr61412344wrm.295.1555516942354; 
	Wed, 17 Apr 2019 09:02:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b9sm5324117wmc.9.2019.04.17.09.02.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Apr 2019 09:02:21 -0700 (PDT)
Message-ID: <00a17c56dfaf45dacd11aa5d0d36967509fa977f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 17:02:20 +0100
In-Reply-To: <20190417155947.24890-3-richard.purdie@linuxfoundation.org>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
	<20190417155947.24890-3-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] core-image-sato-sdk-ptest: Move to drop SDK components from ptest
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
X-List-Received-Date: Wed, 17 Apr 2019 16:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 16:59 +0100, Richard Purdie wrote:
> Move the ptest image to be based off core-image-sato instead of core-
> image-sato-sdk.
> 
> This gives a better test of the ptest package dependencies and
> reduces the overall
> image size so it only contains the things we need.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{core-image-sato-sdk-ptest.bb => core-image-sato-ptest.bb}  | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-sato/images/{core-image-sato-sdk-ptest.bb =>
> core-image-sato-ptest.bb} (95%)

Unfortunately its looking like I have to NAK my own patch as the ptest
statistics show a large number of regressions when not unincluding the
SDK pieces. This almost certainly means ptests have missing
dependencies but that needs to be fixed before this merges.

Cheers,

Richard


