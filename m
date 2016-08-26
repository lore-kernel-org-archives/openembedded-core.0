Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 115446FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:42:38 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f65so272955694wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P1AEIzct6exaCT9FIvzDv/lIDXY9lUSMUv7EB8Oz2LE=;
	b=GwpAIOtxrWf8EryJ21gxPc2t2y/rsYJz9PEue2G+uv/pBlJERcCCx7nCBSU8nqBsVv
	nHNWJk48e1ygqvB0lkL5Xa3X3G+i7laA7G2acIaHipWlCKBfxkdn4X7qQObz7ki9cr5x
	BdLc66cFi9qeu1N9VPX2sbTdP8yqwKq1WpZFI0B/v0dPvfFrbVIYo//kuKb2KtAxTlrm
	wAJy6VTNF5rsi6AQpHQ0oq75l48XMvVmAysIoHP/XsqOFowORTG8xyuX/bxoonDA1olO
	JmFN1pBSTLzI+p3pJ007ys4wfOxHC36Q5oIciM797IofMm6+3qnjyU/4dLNq2zN7u+HY
	BSXA==
X-Gm-Message-State: AE9vXwOieOeg5ypLvkRcjT2BnSXoKCHWUg9mK5OOrkfA1XZe0Npkr18avijDYICe6+k0Sw==
X-Received: by 10.194.39.35 with SMTP id m3mr3451566wjk.51.1472208158699;
	Fri, 26 Aug 2016 03:42:38 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	ly9sm19355447wjb.44.2016.08.26.03.42.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Aug 2016 03:42:37 -0700 (PDT)
Message-ID: <1472208154.19220.12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2016 11:42:34 +0100
In-Reply-To: <7A51C236-FD8D-424C-9468-5796F4E54E10@gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
	<1470986810.4987.8.camel@andred.net>
	<CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
	<1470987751.4987.13.camel@andred.net>
	<7A51C236-FD8D-424C-9468-5796F4E54E10@gmail.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Fri, 26 Aug 2016 10:42:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sa, 2016-08-20 at 07:51 -0700, Khem Raj wrote:
> Thinking more on this, there is an alternative to use strerror_l() rather
> than strerror_r(), that will avoid the non-confirming versions issue,
> moreover
> strerror_() is now recommended by posix to replace strerror_r() usage.
> 
> see
> 
> http://austingroupbugs.net/view.php?id=655
> 
> I think this is going to be a better solution since its portable.

done:
http://lists.openembedded.org/pipermail/openembedded-core/2016-August/125733
.html


