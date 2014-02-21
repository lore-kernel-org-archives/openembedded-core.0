Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 207C86E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 19:06:56 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rq2so3862373pbb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 11:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=WP7GQYvDcXfgykgdqjhevsNdS8spOX/e4fw2BBk9rVc=;
	b=IbvoUE8M8eppATDfs5I6WSH/0JQiZqwxxXTr+WTZzdUzWa+WH9Vpom5+nB/BlmOyMG
	Dee3Ph64SB8mlIjYLP1vpxQFHMSWXApojRzpX9WUBwKvQrXwmaroRwfQpeZFRwC+Pj0q
	C/urp3hYaHstkwEVtLH5i+RE3GI3RYTwMKV1D1Az+Xxpe64wC/a8MB4KY5KAyL9OJvpT
	awRc8ViyoeRPl6h2LtEKK5e+PrOwfsy4seeYDT8QOaCMpj2qFijfjcE6BnTW8jpJwVly
	y4JeyCI46nZjiK32GnpZptU0LPiQOpfDR82kihuK89LuwEczWAEB7c3ED82n3Nd5Vw71
	ZJwg==
X-Gm-Message-State: ALoCoQmI7iMchGfQvmEwGoAO5ZbuB44cfOsH/aDWVsmeU2nAmzPfCHHYjJACWukpFVwgDXAI6Ir/
MIME-Version: 1.0
X-Received: by 10.66.66.202 with SMTP id h10mr10919525pat.70.1393009616462;
	Fri, 21 Feb 2014 11:06:56 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Fri, 21 Feb 2014 11:06:56 -0800 (PST)
Date: Fri, 21 Feb 2014 19:06:56 +0000
X-Google-Sender-Auth: mU17965_FP4akZQt1eVnJlZFJjQ
Message-ID: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Conf notes
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
X-List-Received-Date: Fri, 21 Feb 2014 19:07:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have just put a conf notes file into my own layer, but when I source
the oe-init-build-env script, I am still getting the notes from Yocto
rather than my customized.

What am I doing wrong? I see this in the ./scripts/oe-setup-builddir file:

TEMPLATECONF=${TEMPLATECONF:-meta-yocto/conf}

and other references, but I have not pin the issue down just yet.

Cheers, L.

