Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 578147C427
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 19:30:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so39618951wms.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 12:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GaMopCkHUNPAJSVnYjvpAvZw2L4uX9vB5nbDeCobSTo=;
	b=EqR1NfSHCO9FHEi2r1vqkBIwQodlmc1pI4ST69N/3dsfDbFofbVST7uN5gQGHpKi6B
	tYCBGKCEWHVvs4zyKjRsFsrFt8WnmgDkzrmp3hoD+JcICar8k1BauruRHbt8h4By6WyC
	0aO7HbAhgJEKna457UCdv7vYoDdVhFAR3s580=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GaMopCkHUNPAJSVnYjvpAvZw2L4uX9vB5nbDeCobSTo=;
	b=kSKw4w8eB/8cKibEQgAc3Gq03fBtXK5deLR7xtO2PFoqUa2q1n7PXvagF8ZghftuiA
	QB8ZruP/uqI6cQa9LQnCrSDYjbLhFe8zQc6vo6KtY/y+Uvp4sgKfhnzx7EGJak0RtaAk
	gEE8PKmkjIunhYuL+qgdP9sie6bv7RdC5pk+bMv3aMk0MIWyL9vEaEYHtW97T7e58KBw
	wmmZG1OhhEZfwSgxGh5QkjGU58eQtvZkr5YMCTmzjxKOPb9d20upYW+uMxbE3lVB8+Ni
	Kp5UoN+seNGjUvpE5ibnU2Wn8FxwvsKMZ2j1/PFAvahbU8SRDhyF7GgphDfs2Yuppawx
	1X0g==
X-Gm-Message-State: APjAAAUg6V/jHTsJwgCuqvRcGg6FJGtxurcT+1hHcxEFCHx7MJlGa7gv
	ELGDxDaOHuIlsS1WaRDJ5osjSw==
X-Google-Smtp-Source: APXvYqzILq9iKl1O1ATmWHjrkW2cS0mT7Z9inJ83xcM2zg25d90y61omwlOGgj0RxCRNvaTj/3uKVA==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr70411003wmi.38.1563910244823; 
	Tue, 23 Jul 2019 12:30:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h133sm46533713wme.28.2019.07.23.12.30.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 12:30:44 -0700 (PDT)
Message-ID: <71422bd44cac604f8a076b30a5d353669cc0b314.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "Kai.Kang@windriver.com"
	<Kai.Kang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2019 20:30:43 +0100
In-Reply-To: <73fdb42fa63f84e7ed6ec52a183bff73edc4272b.camel@intel.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
	<a3ee2977ee2d63f1908f110d9273352815ba7d35.camel@linuxfoundation.org>
	<8d6b156e-7d68-e4b8-8688-2c897ebf228a@windriver.com>
	<73fdb42fa63f84e7ed6ec52a183bff73edc4272b.camel@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Tue, 23 Jul 2019 19:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-22 at 23:26 +0000, Mittal, Anuj wrote:
> On Mon, 2019-07-22 at 09:37 +0800, Kang Kai wrote:
> > I just run oe-selftest -a with this patch after you updated the
> > patch
> > in 
> > oe-core. But I met some (>15) errors
> > 
> > ERROR: Unable to start bitbake server (None)
> > 
> > But I think it should not be related with init manager changes and
> > will 
> > change a build machine to test.
> > Do you have test it again in autobuilder and any failure found?
> > Thanks.
> 
> Not sure if these have been reported but there are some failures in
> runtime tests which look related to this change:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/855/steps/8/logs/step1c
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/852/steps/8/logs/step1c
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/856/steps/8/logs/step2c

I did a back to back build comparision with and without the init system
change.

Basically every failure in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/297

seems to be due to the init system default change so we have some
issues in there to resolve before we can change the default.

Cheers,

Richard


