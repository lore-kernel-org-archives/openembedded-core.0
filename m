Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F93D601EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:01:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z12so8306854wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=reK0gOShzuk+81WQ1hRyx9bgelo4m1xQcHuOeYqgDKw=;
	b=ASfUIZb0wDp/Txd/O/Y75I33oeVhVdFqGKtGxJa3dztGgyPm07r4+oLholiyrZ+jdV
	1WBKpMPieOrYFKCrXmKaqFmXPYX6KFis7vASvnNWmqN5kELe1Wi2XglxnUE7gnNTtpq6
	fYxOlYafdP/76rPplIyIEiJ3tH33FsXl14Eh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=reK0gOShzuk+81WQ1hRyx9bgelo4m1xQcHuOeYqgDKw=;
	b=CJ8UwVUBYJZfQDz5kpxMVxJaPb6NNbTTQdyfGdpYYGHTpqTmu1gdy/oqFuF7ebFuJN
	Kz1iRrCgpd8xA07mHxHW741zVBeyDzC2fnASsaXuZZOTdAMyxP7aZABJ8RzaUj88H1+V
	o4sWA2T1WGjE+pQEdwi2Ushx01vnFM0TkjpgJ9CVxlO9UkgNYYOltFoZTp5erjlffBvY
	wd6IBd09Lnl7RbyXhorMv9twD/0JHLcobmiUs+KVO0yals+d0l44t27ap0qnxA/hoaJP
	D0+7zZFScWIgfj2lMQMeMSeJFgEe7SNL0j2ONcrBr2ANnDpQxrk6jsIduO5XWRn2w3N3
	xzMw==
X-Gm-Message-State: ANhLgQ31t9rHj3dwTzPdaTVnxAhYj3IOvO3Vs6tG3+SbRTzYJhpgpTcd
	srx4iDpL8aWVAGGI3/GNcEmPsw==
X-Google-Smtp-Source: ADFU+vuIDJtQfLSOfR5WFHCIUUwPInnIngRr3bTsUrR5nsiwjUdNYGYV8y2aStDY8xLAafAfXQuziw==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr26677838wmc.24.1584356508299; 
	Mon, 16 Mar 2020 04:01:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b202sm4662411wmd.15.2020.03.16.04.01.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 04:01:47 -0700 (PDT)
Message-ID: <f1026c8fbd01e72648f487e024ce3b18e09581cb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2020 11:01:46 +0000
In-Reply-To: <CAMRc=MdcU5UTt6iLcpjUDxs5JkwD3db7QP--b2xjXBpqiHfguA@mail.gmail.com>
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<CAMRc=MdcU5UTt6iLcpjUDxs5JkwD3db7QP--b2xjXBpqiHfguA@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Guillaume Pain <gpain@baylibre.com>, Jerome Neanne <jneanne@baylibre.com>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Mon, 16 Mar 2020 11:01:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-16 at 11:48 +0100, Bartosz Golaszewski wrote:
> There has been no relevant feedback, but I've been experimenting with
> various things. I think that the best approach would be to make image
> artifacts installable into dependant recipes' sysroots (in
> /usr/share/images/). This way the initramfs recipe could calculate
> the
> dm-verity hashes from the resulting ext4 image before it gets
> deployed. We could also modify the kernel recipe to not fetch the
> initramfs image from the shared directory but instead have it
> installed in its sysroot.
> 
> For this I tried to re-enable the do_install task in image.bbclass.
> Unfortunately either I'm doing something wrong or standard tasks are
> subject to different rules when it comes to dependencies. I've been
> so
> far unable to make do_install depend on any image tasks (i.e. make
> do_install depend on do_image_ext4/wic etc.) no matter if I use
> do_install[depends] or addtask or appropriate helpers from python.
> Unfortunately I've been unable to find any information on that in the
> manual.
> 
> Is there some trick to changing the dependencies of standard tasks?

I don't know how exactly you're configuring the system but it should be
possible to have the main rootfs built first, adding in the signing,
then have the initramfs depend on that.

I can understand some circular dependencies could creep in as many
configurations have the initramfs as part of the main image but if you
don't configure that, you shouldn't see those dependencies.

I do fear your "re-enable" do_install route isn't going to get you
where you want to be.

Can you give a simple example of how you reproduce the circular
dependencies with standard poky or oe-core? That might let others give
comment more easily.

Cheers,

Richard


