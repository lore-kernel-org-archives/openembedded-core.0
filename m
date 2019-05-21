Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2546C7E207
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 16:41:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d9so6436349wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TVN4TF7pe94+s9tB8iIGyOARxqsQGxZU4pjo+kHuBvk=;
	b=b6CNIyp9pkytALAYD72MvV0DUiP2KNR+eB4RY6MXJapRWiFj+WoN13lRRrQ4CyyXaa
	M7XlfkSOZ6nXt8crMC4vdL9wEB60XRW87eH2fflkE46InhKVb8dn4qZhtB1okn3COdAY
	ZBpQVptDR1gDVB87XjsocCWG+54pKlNU3EFl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TVN4TF7pe94+s9tB8iIGyOARxqsQGxZU4pjo+kHuBvk=;
	b=t+lb1wT4TFjecz2Tqt2KZSwiJfDiVSffMJqTQzAeN8wK5FAwKmmYsQl6DZsy1AeUOA
	lREp2kEjOk13aLl+0Cm6oc/HRlcGd0rMrdi45gkeemcxdX5/I10MRKNyTdXD9KvYWtbV
	yjYCi7y7z+uIZ3eNYwu6foXY13gLIJZFBalVFH+lk3Z26ewobi+OEcxKlRdEfv4wbSQl
	mT+TN87lIGHK7CxlwezNPOmNPfDH4WR4ZnLuGO6XphSGqIHTXzVgq+VX63QukkUbZfs/
	ZH5P14x25bs4Uj2BUnSfpwRRyuSpQEhq2eP1M4+hZePPvQqDevj5qUrocWa83Os27Aab
	KygA==
X-Gm-Message-State: APjAAAUmVKN/GNqC6Adc5B3s68ak6QrTxACR5WB1tSRangHPthOamXkG
	aGfaBiUi0wbASAdwc2L6PolS/Q==
X-Google-Smtp-Source: APXvYqzVUGb1mURzxoz1Azr+NS5iLL7AEdVu6CfQbSvP1vVVRwqxyZgFmo2Jr8s6JuczJghbnxN63w==
X-Received: by 2002:adf:f250:: with SMTP id b16mr19120354wrp.24.1558456917713; 
	Tue, 21 May 2019 09:41:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j28sm38277907wrd.64.2019.05.21.09.41.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 09:41:57 -0700 (PDT)
Message-ID: <03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 17:41:56 +0100
In-Reply-To: <20190521090032.14859-2-schnitzeltony@gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 16:41:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-21 at 11:00 +0200, Andreas Müller wrote:
> Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for its
> configuration. Currently python(2)-six lives in meta-python and it
> could be
> moved to mozjs's home meta-oe but that would be just further clutter.
> 
> Once applied here patch to meta-python will be send.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python-six_1.12.0.bb
> 
> diff --git a/meta/recipes-devtools/python/python-six_1.12.0.bb
> b/meta/recipes-devtools/python/python-six_1.12.0.bb
> new file mode 100644
> index 0000000000..9075745d74
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-six_1.12.0.bb
> @@ -0,0 +1,2 @@
> +inherit pypi setuptools
> +require python-six.inc

Can it not use python3? Python2 is rapidly running out of time at this
point and I'd not expect new dependencies on python2 to be appearing...

Cheers,

Richard


