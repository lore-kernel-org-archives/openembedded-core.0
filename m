Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9594660E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:03:17 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so2046542vbg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 08:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=BEXFCM5WFRmsDWzpHZETC76StZyjSh20DQVZqFyNkY4=;
	b=d730iuf1wz8GeWkGGQmoryV0i0l8kMYzrLtRDCg3EnSt6NhvMDdNVdhMPV07toMgjb
	P+nc9drir1Z6y2qbw53QhSc1J7SqRc0xWuN6ZtwM8edHOuw0eToshzhV/S9pFC/pxq/v
	67PWJ6n2WbB1EIuZ/9V6qDqIxTZcEeOqoLmbpSDquAqo9rPinQ2KuWTdDOw8c38NTViQ
	y5ftEqkMzjfdtkilIIvkhS1fOsEaGW8ADl5zixkcHFIo/R+rDfsds6WuYJU9yzuqFdZv
	ZyEPoljoRJhHym3THGYXRfkszpTo9fhTVy4ix2kTUVuF4f8lFMeLu7TP+BAo8yg/uqnt
	glLA==
X-Received: by 10.52.29.106 with SMTP id j10mr327956vdh.77.1371481398320; Mon,
	17 Jun 2013 08:03:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 17 Jun 2013 08:02:58 -0700 (PDT)
In-Reply-To: <1371481023.20823.105.camel@ted>
References: <1371481023.20823.105.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jun 2013 16:02:58 +0100
Message-ID: <CAJTo0LY4BXQ2CSj6FhE_y-uKBDoWa0xeroF58gjHvWidOnDgaQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnTZ/CdDl9Lv3UD1K4zOK/rsPIo28ZS1+2tQ/Y7AGL2LIxyAhLZtnlOXqUEFNu8IHFZPyU1
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Tweak create_wrapper
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
X-List-Received-Date: Mon, 17 Jun 2013 15:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On 17 June 2013 15:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently the full path is specified to exec however this may incorporate a
> build path which in the nativesdk case, is not transformed to a target system
> path. This leads to failures due to incorrect paths.
>
> This patch ensures the full build path is not encoded into the wrapper script.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Ross Burton <ross.burton@intel.com>

