Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 46E456C0B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 16:44:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v19so193218wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Ee8myUSpf9+byfPcPvJ6OdjWFjvefEy4LPqKBkCbKcg=;
	b=Mkz8BZ0TVaiMYwQrkwjc9uPh/7EZ3srBnn1kgBeIOiidRwvhvB2LMLn5fiISiKdKBH
	2Luacrkxd3uw7fEv5g43In1yegftp9NN//E+zdKOS6DGtOQXVye7EHEQ37caSW4nbj9E
	71XdJeh0mcsDVenRKw7RjBbYT45nTjVeUswa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ee8myUSpf9+byfPcPvJ6OdjWFjvefEy4LPqKBkCbKcg=;
	b=SLawG1tylv6l14m45VhdV9Uy7wGS1b2TI30wGIcSvsnARC7yhm6j5drbZwMzecIRsx
	/JR056emmT9TxJDaMUs8wYwZYlho79drT5dmTvjD73XbdBZ3yV1DhjS09GAtSY0Op5Of
	9yWwhrjbjENEIvAkmLetRBaVPpVaKmGfzdG3Xhg0LEfP3Ndf0MjWJjZancwemyOmb0Ho
	dg6MK6k9+r71hDF6mpNFV4Z0DkKkiCWf9mICDed361dUQVJYTS0gnGak+5KRvolL2iCL
	pBCzc8A/IYoUj/9iGlZ6J48rZ1FH51nhG5XxX4QlMz5kjFSaIOIIMK/H9HyIiqEfXjnh
	+kcQ==
X-Gm-Message-State: APjAAAWKmVyGWCxn/opDqrMTzGAzTJLUAwvW0n6/6MUm2o8FK4h5sDMR
	+y5URrP+FIlQfb/Ntg6IR833NA==
X-Google-Smtp-Source: APXvYqypFe0I42IoRreWAfmNXKvFyW3e4YDW9QPpQHOAJuFzVJ33Jnvj9UIH9pu7lTFfbIHTnFNh7Q==
X-Received: by 2002:a1c:cfc7:: with SMTP id f190mr16756200wmg.85.1562604280991;
	Mon, 08 Jul 2019 09:44:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q7sm16124693wrx.6.2019.07.08.09.44.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 09:44:40 -0700 (PDT)
Message-ID: <8643d7f6b4e05903340c8c080775f3cde83e0280.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Chen Qi <Qi.Chen@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2019 17:44:39 +0100
In-Reply-To: <bb6b7bb9-6e78-0b0d-62cd-2a67d86e13b8@gmail.com>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
	<bb6b7bb9-6e78-0b0d-62cd-2a67d86e13b8@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 16:44:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-08 at 08:55 -0700, akuster808 wrote:
> 
> On 7/8/19 12:37 AM, Chen Qi wrote:
> > For build-sysroots.bb, the xmlcatalog would not be in its
> > staging directory. Causing the following error for eSDK.
> > 
> > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command
> > '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-
> > docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status
> > 127.
> > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function
> > failed: do_build_native_sysroot
> > 
> > The problem could be reproduced by the following steps.
> > 1. Add in local.conf:
> >    IMAGE_INSTALL_append = " btrfs-tools"
> >    DISTRO_FEATURES_append = " api-documentation"
> >    INHERIT += "testsdk"
> > 2. bitbake core-image-minimal -c populate_sdk_ext
> > 3. bitbake core-image-minimal -c testsdkext
> 
> should these steps be added to eSDK tests?

api-documentation is only tested in a single build in qa-extras and
esdk is only tested in the standard config.

There are many different variants we don't test, its hard to tell which
ones we should be adding and are worth the extra build times...

Cheers,

Richard


