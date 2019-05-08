Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62BC47D589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 12:48:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w12so13598311wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=J4g6988Xvmh+XTUk49O3ulfdrRrfqHpHuAZUm9Z7grU=;
	b=GJKveR8pQ5UCbqG14UZmltpzZ/N1D3igqb+XZD3LSvibSsTQAK99/HgxkVajdNb15q
	FxF56IVXQ5FbvWSd3WHNmd9mxzvoc+smX8o4HK6T4O9dLwHlk7ftdy14dSKtxuTfS9ux
	QACanaiupZuGCoiIsxIzOvZ/IH0ae5xwZ8dT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J4g6988Xvmh+XTUk49O3ulfdrRrfqHpHuAZUm9Z7grU=;
	b=Uf2cmihKcu9xTQdy10CIwrb+Nb1CtoS2s+QnyxEIRTl61063Dy3Ioj2NA2IXe5zE5I
	TU2iJQttNRo+/4IbWy90rcS7UE1/is/9g/E7nlQ6K/UPRRC2ocTjEv4UTa4om0Dwq5u7
	O44hFb/bn78kWZl4hpf6aErEohZgIyW87bn8Iccg9S5KqE0Zyc+TEb4fwiTqic1qtjYJ
	DGmz8U2RxS5UxHnx+80YdZ4c3o6uP/JW8zipQduTmkK0zSsGGZyyT83sf2l7RBmEIKtn
	2ajApeJ1EPF9fByCFg4zHZLjVoah6OYzE/pKNNX8F16b5yG9IaF7FZch7oKJqXj+WzOE
	jLUw==
X-Gm-Message-State: APjAAAX3ZaPkkWEM6WCiexG7gWQuD2fwWOmo4152tZScZIVX+KpBeycN
	zo+sN+evZetLrzGzZrWdnDdGmp6dlKU=
X-Google-Smtp-Source: APXvYqxNx/Cl94+YheI9Os546z/tqMfLc0/KvAWVL+EVpfWR186oQ5GlyMAv/2PjR/UIwOpAp8epjQ==
X-Received: by 2002:adf:9c87:: with SMTP id d7mr147011wre.68.1557319699063;
	Wed, 08 May 2019 05:48:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k1sm1510031wmi.48.2019.05.08.05.48.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 05:48:18 -0700 (PDT)
Message-ID: <9e94caa227eac98a7a48a6433c722e2a309663de.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2019 13:48:14 +0100
In-Reply-To: <ac92e6664c5856848367f40fddbdc53391f0388a.camel@linuxfoundation.org>
References: <20190507131151.31070-3-bunk@stusta.de>
	<ac92e6664c5856848367f40fddbdc53391f0388a.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Wed, 08 May 2019 12:48:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-08 at 13:32 +0100, Richard Purdie wrote:
> On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > Remove patch applied upstream.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../ofono/ofono/use-python3.patch             | 27 ---------------
> > ----
> >  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
> >  meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
> >  3 files changed, 8 insertions(+), 36 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
> > python3.patch
> >  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
> >  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb
> 
> A local build of this failed with what looks like a race:

Also on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/570

I also confirmed that rerunning the compile did succeed confirming it
is a race of some kind.

Cheers,

Richard


