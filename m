Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D12517C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:24:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v14so14593527wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=5OnnMesH/B98ZvokqAWzPKchKzzxhH7/d7G7/gitSjw=;
	b=gtD5b0JXY36lA2MXVUbKcHAzOi3i069+Qwebg+9I88zv7InAAU11RrKu5UX0UiNXz8
	QNgeQ99sM/8pczCwM43VPE/0XZA9MVrU7BRRRhH8FSm3S7zxr7AHcQuEcpsAH+rBcuC6
	xZ9uwvfufeDJmetN4/1NrTW6e0g3a20HbR8Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5OnnMesH/B98ZvokqAWzPKchKzzxhH7/d7G7/gitSjw=;
	b=quP5tIUxmgMg5BGyYHdAtGZP0cvb7chAgKoDjwm4vSo42PQaR9IfNjr0/61Ui8M4b9
	Ec6odhiQC5YmVWYxdwFnZoR8YbGevl98nlCZwLRY52gx5RLegNbrpQfYFog8AytIMg2s
	fhrJ0JIb2tZ0ZPu09h0uS35dej7JLmcRsVepLvRd6UbBTitesJm/M1dmtIq6AjEnrMSA
	DSsLkIvj41b64jzNgWGW1y34EUVzHSC9ET1EDSAMIj+amxHgrAlZ1VqLTDSXz2N5cwJx
	0fv3RhmlcEKx8GlbxOGEFKECMsuCKgZh42tPNrXqs3pQYWQWIW7p199whRnGaWzwBrvh
	jekQ==
X-Gm-Message-State: APjAAAV4SXMVYcF7dMQG4Ad3j85+rmL2F9BJ+KdlZdWd07iUEE25gInn
	0VtA1a9E01ui8VKFYpTYOKsyMQ==
X-Google-Smtp-Source: APXvYqwH4kIaWlTp+DDiP54rMQSOgNPxO5xJQP25iVVM3MGqZgYVMrXtte/PA12NhYPOTAQp9vDmIQ==
X-Received: by 2002:adf:eecf:: with SMTP id a15mr34314105wrp.354.1561393491613;
	Mon, 24 Jun 2019 09:24:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r12sm12494089wrt.95.2019.06.24.09.24.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 09:24:51 -0700 (PDT)
Message-ID: <5512c7f141dc10c8db23cd68fc2250f6f9043eb7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 17:24:50 +0100
In-Reply-To: <CAJTo0LbjqwN689jCZS6uG96E_vDVNCtYU8dJwC5PKzX1Z2rwGg@mail.gmail.com>
References: <20190624111324.8921-1-ross.burton@intel.com>
	<20190624111324.8921-2-ross.burton@intel.com>
	<f3e5e0a4cfa0892ce122342361f9ab881ba68287.camel@linuxfoundation.org>
	<CAJTo0LbjqwN689jCZS6uG96E_vDVNCtYU8dJwC5PKzX1Z2rwGg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Mon, 24 Jun 2019 16:24:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-24 at 17:21 +0100, Burton, Ross wrote:
> On Mon, 24 Jun 2019 at 17:09, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > -        features += 'RUNTIMETARGET_append_pn-gcc-runtime = "
> > > libquadmath"\n'
> > 
> > Please don't remove that. We need to check libquadmath builds.
> 
> From gcc-runtime.inc:
> 
> RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic
> ${RUNTIMELIBITM} \
>     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
> 'libquadmath', '', d)} \
> "
> 
> So this is redundant?

Yes, that was indeed fixed properly.

meta/conf/local.conf.sample.extended needs the same fix.

> > >          self.write_config(features)
> > > -
> > > -        bitbake('gcc-runtime libgfortran')
> > > +        bitbake('fortran-helloworld')
> > 
> > Doesn't this stop testing libgfortran builds too?
> 
> Possibly.  I admit I don't know what libgfortran is for considering
> my test builds apparently without it. :)

That maybe but I'd still like to test that it builds given it was added
due to problems where it stopped building and people got upset...

Cheers,

Richard



