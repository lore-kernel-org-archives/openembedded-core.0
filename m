Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D50867D723
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:55:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s17so14286768wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=HcwkFkjR0cbNYIczTbA4RlLurIZkKnQlao0UBaAOyDY=;
	b=R3q9scqEks3TVVjhg25QhvxvRxmfkqnuuJ+rz0uaP2A62YKo2rK8jmeuDSBY484EN1
	3VcCr4MHGiRiejvR+DEp4ZG58quiSLiIjvhM5t5orTBuFYfFyRJYbkGBOstNr0e6PJ40
	IVIo1g08t7dCFdcDCESQHyYFZYs0v6nQGB/Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HcwkFkjR0cbNYIczTbA4RlLurIZkKnQlao0UBaAOyDY=;
	b=VtYYILHFTPdOj7E19cr4VybGEfK6u2T0YYUzBvRCy/+CK5QC2dsBNmnhfw5+1Phmak
	mOPeyS2rbPh7Cj3RDgzcGt/KaAO62KlEDpiJsIBnTLd6DhQe1B65RG0pPMiZ5PMwA0hr
	GDEZ9HQr+xZuzlkkvc+CN1uHsT2pheFd+Lt0V8vaECiu6Jk104v2djstoFfjXG0n76ua
	w31R0f8SRIGi9Xtj76Y4E0YVi40mCreLhnoIvRNZzISQYBRRksECobbqS0isBhcKtlyn
	uUnNTiFYL9KiD7XU+oMtQE4ID+ek8a1MwzKS7gY8IC0Hjkl77tf1Lz8kYL7gAjguO9VG
	wLrQ==
X-Gm-Message-State: APjAAAX2olicKIeWJbbv4PK8P/piHUJYwUzvMShCJcqklOv/M7ExM6Re
	l1VVqyp2EUe+Irwxt2yoVeAAIQ==
X-Google-Smtp-Source: APXvYqwvBq8NM3J2EtoIIfe2Qx7dj/mQ9aGzWpkHRr9XBbrT+e419L/eckYEUkERWoHA6FzyGSyi0g==
X-Received: by 2002:adf:f741:: with SMTP id z1mr45389461wrp.14.1558353332490; 
	Mon, 20 May 2019 04:55:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s3sm33401711wre.97.2019.05.20.04.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 04:55:31 -0700 (PDT)
Message-ID: <1448604b61e334191648073b44d0f4ce0d773859.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 12:55:30 +0100
In-Reply-To: <1558213634-6468-1-git-send-email-liu.ming50@gmail.com>
References: <1558213634-6468-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] alsa-utils: replace hard-coded alsa-utils with PN
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
X-List-Received-Date: Mon, 20 May 2019 11:55:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-05-18 at 23:07 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> This is mandatory to support multilib build, and also to avoid being
> redundant with plenty of hard-coded alsa-utils references.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>

Doesn't this break the alsa-utils-scripts recipe?

Cheers,

Richard




