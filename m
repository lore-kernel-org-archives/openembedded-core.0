Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E6D476BDDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 23:51:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t15so319122wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=BDV6gQm7OKXoxCX8pp8MOQ6Qv4vEjv72pK+SDcNbD58=;
	b=UemYWPSEFNNp4y8iEeg2MuHSYgTV3EaL7sZ0whXoG3/ccQUCFVkH83d3sHrYEy/B8c
	YED29E1bg5I+uUxs7uT3jEdThgroE+vhv0boAwNZKNu4p+1zQAxg5aq9P664WIsuu8Rv
	scRNtFY4C2Vjc6ZxDcI8wTylPLMVrHc0dtpmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BDV6gQm7OKXoxCX8pp8MOQ6Qv4vEjv72pK+SDcNbD58=;
	b=n/LtCfNdgILgG7nhXkqfivqXCrHz5CeVnhWFfs65L4TihWg3GwPTj+JqnXja58nNI+
	9/JzbLKryOwBr/7/CnzuXRFUPvJmgFosuppoEjHhyOt/0R8aAb5tR9R8Y1af4e+a+zzB
	q1L3b0FsjhrmSpIguMohb8PA9KSoyx8HyFWGdXg2+pvlTKSMCYG9L7BZNJJRz9HtoVKI
	krFrRh3IiNfmHNIP4oVg6bfNNqmnbyxhWTusolIGZd2SbjY+FPkjTy7finc6Sr/6A69h
	6c4PqO6ECzLrjpajlB+DLRW8WD/eoLIpruuJ6ZLSk/MqT1qfWeS/cbuiVQylHT1QJnAc
	qNXg==
X-Gm-Message-State: AHQUAuZQw4OP/JvZ0ceV4tuWzcvhEvSa/qONdLdDe5k1mg36WmMF3TeB
	d7qKBW7onU0dvVlTxj+fyC7e+w==
X-Google-Smtp-Source: AHgI3Ib1YuLuIuw3h9YLcNCIuvdRcy9Yt3/ks+9we2NXQO5QSYN5oGf/FCLRjQepisi7/EVOVIkCCA==
X-Received: by 2002:a1c:ca01:: with SMTP id a1mr559694wmg.124.1550793076574;
	Thu, 21 Feb 2019 15:51:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h142sm521902wme.33.2019.02.21.15.51.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Feb 2019 15:51:15 -0800 (PST)
Message-ID: <6673aa01794a9a5466969fa4a39d28b46649173d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Persaud <persaur@gmail.com>, Mark Hatle <mark.hatle@windriver.com>,
	Ross Burton <ross.burton@intel.com>
Date: Thu, 21 Feb 2019 23:51:14 +0000
In-Reply-To: <6F7B3258-B781-465F-AF58-E4E8EBA88012@gmail.com>
References: <CAJTo0Lb9Aspc0Nu+H3eRzbQcOLDevn40hJ5Jnib1DKo8k4R2cA@mail.gmail.com>
	<20734cff-3215-7a9d-8bc1-87d7238876fb@windriver.com>
	<6F7B3258-B781-465F-AF58-E4E8EBA88012@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Incorporating deploy artefacts from one multiconfig in another multiconfig
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
X-List-Received-Date: Thu, 21 Feb 2019 23:51:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Multiconfig is meant to support this workflow. Unfortunately there are
open bugs and people haven't the time to work on it so its stalled.
That said, the key pieces are already there.

A picture is worth a thousand words. I thought a demo might interest
people and "prove" this can work.

To make it work you need four patches:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=b896b2238c100d486e7c43992b49001150749d04

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=e5ef6b008e85f42b5e4ffd72fae7036dd68b2ea5

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=5d2bd43d14315ef3212e0d09a16446bd74305a2f

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=abdb83576b699448b76293294809aaa04b8e853b

The first two are fixes from Alejandro which haven't merged as they're
not right. The third patch was me hitting the fixes and bitbake to make
the demo work. That proves they're not right and hints at where we have
some problems in bitbake too. We can get those issues sorted fairly
easily and I'm going to block 2.7 M3 on them.

The final patch is the interesting one.

It adds a layer, meta-multiconfig-example layer with a README about how
to configure it. Basically you create two multiconfig configurations,
"musl" and "tiny".

The demo is to run "bitbake core-image-full-cmdline".

The result is a core-image-full-cmdline image with a tiny qemux86 image
and a musl based qemux86-64 image installed into /var/lib/machines/

The way it does this is creative, having a recipe called image-packer
which creates virtclass variants of itself which depend on the
appropriate multiconfig. It pulls in the images and creates a package
containing them which the bbappend to core-image-full-cmdline can then
install. It'd be very easy to turn this into a list driven piece of
code rather than the two values currently listed.

Its late here, some of the above code is horrible. I have rushed this
but hopefully it shows this is possible! :)

I've love to turn this into an oe-selftest, that is my ultimate 
intention for this code.

As things stand today you can't query one multiconfig from another. As
this demo shows, that doesn't need to stop you making interesting
things though. We will do something with such querying eventually to
make things easier but until then, much is still possible.

Cheers,

Richard



