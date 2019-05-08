Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7AF77DE43
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:06:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y2so151650wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=pa5DCRAdreVFCUBCSkBzf6QLMW4zvarLyaeKmQjMb74=;
	b=Cr5HnHxq5Ri8fQPWz3U/iBWuvsteABs+Bz/ViANM81r5HZ3wHRYuieRhc61n6kC6aM
	we4XnWrfeleWVpF1WNaNC0+nqdWA+EcaFCzPyKnGla0INHPc9Mnx/foKMRWCMpMup9Gp
	4pkbYiILJYfxbO4l8b2PWYmdNAB2P89EdeznY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pa5DCRAdreVFCUBCSkBzf6QLMW4zvarLyaeKmQjMb74=;
	b=A83pCb2vOqbLK9NOWNt7HhTFDEJOLde/tpwQzkZLlH2BIllC14WUZeI9EUJ1v1iM9D
	nsZl2cCu+AENYS5erlieAAuojNG7WW6RsPH4ZdNRiJ/f43GzJ4mmzd+4BZSSKy0/PIIc
	rw2U7di8p1i7QucJJGT0+1MYDxKBxL0FK9sOXwx5khj7hw1QNtd7LeUIxn6CXadyMXlO
	i8SCNer4MRS+ciz1uIftAmESgcaNFFGE5BfkJJjxdMbstne7edd2sq7uVcPLSVMiyVH/
	ji2vMaK4/6PbG7mX1a7Yvej2TRBWl9FQnS55kzGianjBusfl8ZENCZoXzpwhNnzmNOak
	nlXA==
X-Gm-Message-State: APjAAAXgxt6q8Bc1qY+Kq77FUmmwQCBuoEevTYvJVGgOWF43N3D9mrUY
	V4f3IQLsF1esUJJcB75cMb92hwW9qmw=
X-Google-Smtp-Source: APXvYqxLW8ML9zpsFrdAd947oO9QkTAkAkd9+ot0VQJN8sLYFyPw9W+X+lIA3cC5Uz7Kza4AmU1BqQ==
X-Received: by 2002:a1c:cb8f:: with SMTP id b137mr57325wmg.142.1557345981656; 
	Wed, 08 May 2019 13:06:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a125sm5713559wmc.47.2019.05.08.13.06.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 13:06:20 -0700 (PDT)
Message-ID: <2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2019 21:06:19 +0100
In-Reply-To: <20190507131151.31070-12-bunk@stusta.de>
References: <20190507131151.31070-12-bunk@stusta.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Wed, 08 May 2019 20:06:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> Remove the backported patches.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Unfortunately this seemed to cause:

https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/574

Cheers,

Richard




