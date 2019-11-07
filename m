Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B80907CE26
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:41:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b3so3496140wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=X4kFdLIrhwPwqcvB7JakDAzF91N3PkZwjCnsAEdGY3k=;
	b=Y2h9b1ESdqCxqdDLBijS4k/cNOWi27bYJSrhJbtUAdEOAYKlyJLKmSgUqFmAQwdqR0
	MjLJgFqfjH8hOqTz6F+NDQuI2akTNcVl3y05OTADEd5G5Wk3c4emfhbC+r7WNPy8WNCC
	+RFEdyapuir0pXQWm1vRBx+Uqq2X/rlR39ol1LaGdFhKVuLMPXi4lQtyl0oIRRCzSmeT
	EmT9MrL4HwCBOgdJSQ6t315HQJ3X+Kh0FhqF2Om6T4ODfnBXP6FhuvG4NFXN4zjlUk0W
	TrxDTKbvRvxGNF49lSWNN4ETyvIJ//P36HiiBkOhBpQfoE8Gv3Xz/J/EupEIrCs9A2a2
	P/wg==
X-Gm-Message-State: APjAAAV3ADAZIasil3iGxO78BOSGBDKN0aaO+xxHTxSCRj/KbFy3GiNZ
	gkGCMydAau/hckSsQH8Oi1k=
X-Google-Smtp-Source: APXvYqzsFwD4XX5Ktj4sUNE2tM/83Jmd0Sm8o7xe7jwGarpYZkVRJlsHs8dukOYkXQZdPYkjeKn+1A==
X-Received: by 2002:a5d:5050:: with SMTP id h16mr3840289wrt.380.1573141286685; 
	Thu, 07 Nov 2019 07:41:26 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h124sm3024122wmf.30.2019.11.07.07.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 07:41:26 -0800 (PST)
Message-ID: <9a596cbde910fd63d5fdb4344403bd2b63243fe0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Thu, 07 Nov 2019 15:41:25 +0000
In-Reply-To: <d3db0ce8182373d0f4e76427de741e93d839a3d1.camel@linuxfoundation.org>
References: <20191107094033.33950-1-git@andred.net>
	<CANNYZj_Ph4M_cVFQXaWpgPExhnkjntYUOm_8Zio7APmtkP_Tgw@mail.gmail.com>
	<8002dca6398624337867ed88608e7156e6f943e4.camel@andred.net>
	<d3db0ce8182373d0f4e76427de741e93d839a3d1.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 15:41:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-11-07 at 14:08 +0000, Richard Purdie wrote:
> On Thu, 2019-11-07 at 14:01 +0000, André Draszik wrote:
> > On Thu, 2019-11-07 at 13:26 +0100, Alexander Kanavin wrote:
> > > I would rather keep the option to disable openssl, but simply
> > > switch it on by default
> > 
> > Why complicate things, what's the use-case? If libevent_openssl.so is
> > not
> > used by anything, that library will not be pulled in, as it is a
> > separate package now.
> 
> Build time dependencies and hence build speed?
> 
> It sounds trivial but all these inter-dependencies do mount up so if we
> don't need it, keeping things minimal has advantages.
> 
> If there is a security issue in openssl, its one more thing that would
> have to be regenerated if a CVE fix were added too...

What about helping make network connections more secure by enabling ssl
by default? Is yocto really advocating the use of unencrypted connections?

If build time is the argument, why is stack protection enabled by default
in the compiler?
Why do other packages have OpenSSL support enabled by default?

I could go on, but I don't care enough, v2 sent :-)


Cheers,
Andre'



