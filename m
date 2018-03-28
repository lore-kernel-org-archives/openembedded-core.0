Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 69DA06069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 18:55:55 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id a11so1421026pff.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrklhbNuPcE6uG/WzvWsIrYIWQbjjTuB/NuEdQ2iarg=;
	b=DOrzHdQdI2ldXFAoLUSylaolriH63zyAs9TOBOYxGzK2R0s3urwF5tIk/ZXZ0xxfL0
	fSXCrVNCwgcEFnEHlsrU0NK4dVSh0C1TEOK+ysZmNiu3EyK4rUzEtrKZmd0uDPlppqqx
	kTKIbvmbVAEIP+AmsS2vjitxp8IZa34EJly1SXUQLEq7P8p2D1AL+oQaC0BvEN6F0JCO
	JmetKUaYuq3WA14vnDFddD92/9zs4LRcQB0nP+XrkoXTf/Y2EIVGaQx/6a6SmbaCDqWI
	mtb3KeSl+AXRodEPaxjgAleiox6tn3w8p4ZFyZJ8OncPYlXqvU477nDS+zX4e1Ir0Nor
	uhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrklhbNuPcE6uG/WzvWsIrYIWQbjjTuB/NuEdQ2iarg=;
	b=pcknSQUrfpMD4zqKDfujXtOw3yBAqEFavI86A5HwSfonG/UhcDbCocx8BFm6TlviST
	CbUMUrJmZ6fSxr/geuimcglf/UeOgJ2DOdu4/ZO8NU/qNxQbt6OjyTv7469KTPe9imOY
	OMDGUbD06w1L4zuBi+EcyeEhBWZniTFa55rsZr3A6CZwVVcJzlQCDBwGaysw/Pg6JCLg
	1FbB7xI6i07TvtZVZCDNANO5W1IfhCHdFJCm8+xQ6qjXafcqaV8Eu3Mf4aYR8rnozPSZ
	jilSwzuI+/CuXYeg4GJ9PM+l1lpIZo4mKzx/wR7MK3WL+dOBzojWAfR08UalyaXh2xXR
	kSdg==
X-Gm-Message-State: AElRT7HuAiDPCzOvFKMNTfNsrz9Vofjl36Xa0V85tr1sE6u/09fdENgL
	0s1ZTyn5VrNh8pXLznOAXe0uSh0DW5hucJiET4s=
X-Google-Smtp-Source: AIpwx48Bza4r/TPB9HZqvG7NHGu/imtodGaLZ9MglZpobVCsmSoumiMUPOoR6MMCi2DDKT/1ZznMbNqjOI8LP5GfJFQ=
X-Received: by 10.101.99.66 with SMTP id p2mr3249939pgv.384.1522263356289;
	Wed, 28 Mar 2018 11:55:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.227.8 with HTTP; Wed, 28 Mar 2018 11:55:25 -0700 (PDT)
In-Reply-To: <20180328175605.GA3400@linux-uys3>
References: <20180328152809.GA11111@linux-uys3>
	<20180328175605.GA3400@linux-uys3>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Mar 2018 11:55:25 -0700
Message-ID: <CAMKF1sqthTwR+RB58NbZ=jVUP4jFMbet8_bBNkOVMUiN9deKjw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: host kernel BUGs while building
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
X-List-Received-Date: Wed, 28 Mar 2018 18:55:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 28, 2018 at 10:56 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Wed 2018-03-28 @ 11:28:09 AM, Trevor Woerner wrote:
>> Since this past December (December 18, 2017),
>> ...
>> Looking through my logs
>> they appear to have stopped Mar 23 2018.
>
> Reviewing my distro's package installer logs (/var/log/zypp/history):
>
>         # 2017-11-19 20:39:29 kernel-default-4.4.92-31.1.x86_64.rpm installed ok
>         2017-11-19 20:39:29|install|kernel-default|4.4.92-31.1|x86_64|4348:ruby|download.opensuse.org-oss_1|5ab33a00bdccd653b2f1fa1a31d4e4339911e0295a67f177ccf3f898b3b564f3|
>         # 2017-12-18 10:01:05 kernel-default-4.4.103-36.1.x86_64.rpm installed ok
>         2017-12-18 10:01:05|install|kernel-default|4.4.103-36.1|x86_64||download.opensuse.org-oss_1|7fb7db4fe0c291b02e4e6fd3c637a8f6de51afb8f916f68d9a91474ea8eebc4b|
>         # 2018-01-05 09:01:32 kernel-default-4.4.104-39.1.x86_64.rpm installed ok
>         2018-01-05 09:01:32|install|kernel-default|4.4.104-39.1|x86_64||download.opensuse.org-oss_1|43b2353f01ce8a5b026c9088861eecf65c5311f9f4b595c047c48d43e67c2003|
>         # 2018-02-09 11:28:56 kernel-default-4.4.114-42.1.x86_64.rpm installed ok
>         2018-02-09 11:28:56|install|kernel-default|4.4.114-42.1|x86_64||download.opensuse.org-oss_1|8c30a670135d89de0bd9a253909b9d97954e443aa232de199196984f631f7f5c|
>         # 2018-03-23 23:51:47 kernel-default-4.4.120-45.1.x86_64.rpm installed ok
>         2018-03-23 23:51:47|install|kernel-default|4.4.120-45.1|x86_64||download.opensuse.org-oss_1|ecb140c1d5c05476926799cae0abbf83e53c8698383ac43afb5b05bc732dbd3a|
>
> So I see that at 10:01am on Dec 18 my host's kernel was updated from
> 4.4.92-31.1 to 4.4.103-36.1; later that same day the BUGs started.
>
> On Mar 23 my last BUG occurred at 4:30pm, at 11:51pm my host's kernel was
> updated from 4.4.114-42.1 to 4.4.120-45.1; I haven't seen any BUGs since.

voodoo magic.

