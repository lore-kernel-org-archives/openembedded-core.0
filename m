Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5E5160272
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 10:18:06 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b18so4825029otq.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t1BnY46StCHf88IskFcujfK4R/5XacC78TAFef/dyOU=;
	b=I2zvb6Yc85GsUg/u1iW0HVW+hniMDbmhRpBsGtpjbKKSto0+o6K010cvYYL2Ab7mQx
	JURzJe4We+ZKjc+uJ0eBa9tqa8I1KoyMfX2l1fgiUsQwK4rJSbOWOqLe+IDvRl1MSgcC
	msqUkH6Jw5D/97ezy9VNI5zbB7dWN1gpIiK6KXjaQ6cb6avVLufgY4Jhot7YQn3/+DKh
	vp3ug3x1bHJJ8U+2XcXKdCav139DT24SMCF5CDO6pjpfNrSdfHZaIALvjrvfwacw3KSp
	D27qoaJennQFT21wDXKugVU0fZHH7xmsbCk52KCxLp/Rq6nfjEGWlSqrXRPOGJWxcI5G
	mm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t1BnY46StCHf88IskFcujfK4R/5XacC78TAFef/dyOU=;
	b=VLEpdKcXBtxnwb/imBXhh2rPOCp2tir9qIZYrQ1L/62FbF7E8gYtowc29CbJm6+M46
	bdrLSC9BH/Syfq+kmqzVlQ3WErY+jcdToN+8aFjuQiY9WK/c0PbY9VVSmkYA9TxFkWuu
	QUey2d458N0utQm/Wwk2yOjIgcO+0nQd7V+3D/5fn5AtTs2I0ErVcQKZloS4T5qO27pI
	Kx+MkbyAYh6lT5id2NRtN1MekjWfUPg5h7LhR071ltyD29NOENvlxvL7rOBdKtqXygY7
	NYwBnoBJMIBwlfYeSnT/5UlNzZ8qt9stsZ3/qfcgAzfXeRjjIsuAba0cLr7D92BgOjG9
	uIAQ==
X-Gm-Message-State: APjAAAVpgMA+kv+4Ezfgk9ta/EfYIMsjBpG7bk5L6mjrlRzANv0VfkHR
	OJYOoQrJWkrvQRLFqezzt0fefgDwMpWVg1MfWOxq3lzqBIQ=
X-Google-Smtp-Source: APXvYqwcZ+NP2sZTDH5A8niL+lP3wLiwTAO5W/QFYp1chnIyxs3lhuysQPXV6uA89ddakFaAwSxdf/Rcs4BZmdUNtHA=
X-Received: by 2002:a9d:6209:: with SMTP id g9mr729441otj.153.1556878687719;
	Fri, 03 May 2019 03:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
	<20190502180916.32114-5-m.felsch@pengutronix.de>
In-Reply-To: <20190502180916.32114-5-m.felsch@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 May 2019 12:17:56 +0200
Message-ID: <CANNYZj-4tB-if4kC3NZ8UOAujCMDOa-9ePH=j50-9BzOU_OwLg@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] mesa: make gallium virgl optional
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
X-List-Received-Date: Fri, 03 May 2019 10:18:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 May 2019 at 20:09, Marco Felsch <m.felsch@pengutronix.de> wrote:
> Same as for the swrast target it isn't a good solution to enable the
> target per default since we compiling for embedded targets most the
> time. Make this target optional to save some memory.

This will probably break virgl oe-selftests as they expect target mesa
to be configured with virgl.
Try 'oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk'
and 'oe-selftest -r
runtime_test.TestImage.test_testimage_virgl_headless'

You can address this by setting PACKAGECONFIG_append_qemuall = " virgl".


> Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]

This is not necessary. It is only used for patches to the recipes that
live as files in the layer tree.

Alex

