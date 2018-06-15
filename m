Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1CAC76025
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 16:53:48 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 14-v6so9378280oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EH2zuR4UJer5evXG3hNf7DtZBjrkky42muwG7JVaBqs=;
	b=rOuGLNBTjwohlD8kVwrJjJJxQazx/A/hegH45OH81SGKDcywe5OdLmsUgqCWFS1rVa
	ljoIDczL8o+G9IDHM54Flr9X/XYMiuJLugEfMncQ3YZr9ID+jL6970ZFcJI9SpDwqcy8
	XFNSQIaNAX75PVhDxkH6sc/HsfJFZC29v8p6F/v5c3Bpz0igIN55HbDpypRPnTBK2n8Q
	oHlJoxy9TxuCARo05ithTlCCoDXi5a5hDzF7YwzowDFktd9j8fFoUV2jZuGmgN2SQkM2
	kzuWoOO++PZbjrfLtgxQkQBKq+RkRF8sfjoEgnuSIbtTlfFIu+q+3ImubQJHtux0vcUN
	DROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EH2zuR4UJer5evXG3hNf7DtZBjrkky42muwG7JVaBqs=;
	b=QyH8U2Z9QHb7tCT15+m3xwTga4s6vu/c2MQZGm4X147pgiiKvLMoXeK4fKwVMg9LGk
	PBDPXt9oNiqQexL9JSU2awfMGV5nNTH55IikdHS88ile9L0O5qYesU+mTUwj7Wxv2FsZ
	sD9Mxk5kup9AdopMnEF/ymvh7+VE9bvBeRU35U3tg5nmRPfaqq+FYbRnIqLICG5CuwLm
	SW73NC1bbMuESKUEQO12MJLwWP1M9PFc8/OE66cMnglc5VwDCJ/kIT6if8oChgjBk19Y
	J+DHmii+L1K8w9qnqOdg9LxEToceGkgv15JMCqqLeHZoyHHOKNqiLw8KtLykrcN5BhSs
	sMZw==
X-Gm-Message-State: APt69E0mATBSX2oDetwIjPc7fCawNp3x55uZI5K4G6cDZxdSlcpKIQ1T
	pkjmIzijivayY97l8VJmP7ZsSvWqNK4kvaT0guEVdQ==
X-Google-Smtp-Source: ADUXVKJjOSeDtGmNfaDkdpIIPxAaDXQ8ijULSUTQ9yw4gftm80mlPY2HGKBj83sL99ZeQQ/FrOiI2WOhxSY/5Wc+g/I=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr1425320oig.102.1529081629391; 
	Fri, 15 Jun 2018 09:53:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 09:53:28
	-0700 (PDT)
In-Reply-To: <1527516680-22733-1-git-send-email-akuster808@gmail.com>
References: <1527516680-22733-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jun 2018 17:53:28 +0100
Message-ID: <CAJTo0Lb9tukB0NEpCG5SOU0g6coh06wLjorHVktJd3tCs99edg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v3][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Fri, 15 Jun 2018 16:53:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 28 May 2018 at 15:11, Armin Kuster <akuster808@gmail.com> wrote:
> [v3]
> Made formating and spelling changes per Martin
>
> [v2]
> Remove python3 in default PACKACKECONFIG
> include https://patchwork.openembedded.org/patch/148257/
> Because of the newly added dependency on meta-python, the python(3)
> packageconfig is no longer "default-on".

All of this should be under the scissors so it doesnt go in the commit.

> Requires python-ply package in core

Comment says use meta-python.  If the python code here is useful, we
can add it to core.

> removed:
> dont-test-on-host.patch, no longer impliemented

"implemented"

>                   --disable-devpoll --enable-epoll --with-gost=no \
> -                 --with-gssapi=no --with-ecdsa=yes \
> +                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \

Should we be adding PACKAGECONFIGs for these?

> +#
> +# If python3 is enabled you will need to inlcude the meta-python
> +# layer to include the dependency package python-ply
> +#

Conflicts with the commit message.  Pick one.

> +PACKAGECONFIG[python3] = "--with-python=${PYTHON}, --without-python, python3-native python3-ply-native, python3-core"

Just python3-core sounds unlikely as that's a subset of the standard library.

I tried to enable python3 and nothing was built.  Configure found the
python modules it was looking for, but nothing happened when it went
into python/.

Ross

