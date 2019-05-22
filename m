Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21E137E3CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:08:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f204so1786322wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KZN9XR15leWaUYqE6spIyeGhiTXb3JG3ifVillQOpJY=;
	b=Y/YW7fYz+f26eBFtzeBP058ldq9/Zj+l1uVY7B+VVW/EWDgO7lNXke+kc1a+43p/Ot
	qKOWMgKkSAJE9aAZ/82ZhNk8ssY1vI5FfFvUmFK28bmYlPS9TLRfq3lmSIFXW/s6j8NC
	kH12hMSstC4sukvxdB3hZ8+beBtQCKlg2CiDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KZN9XR15leWaUYqE6spIyeGhiTXb3JG3ifVillQOpJY=;
	b=fZbUwV8zo9hl3MNCugfW8aeEKfWcvReDU8+4aXJxHM69l/mCBhLdRistcve0fUlAYY
	JsMw1SMVYM/VlWb0PQLtgI5VCwsKy63fl8Cgev+cblSusbOZoL7g2tPZWm9iwwV+ehAr
	ec511EblNYC4i5P0hVNIvKIBJ9ctkpM1cpKji4hZUxU8MxH+PQt/l0AVCRKM7Il6KWUb
	XCoCJ51+bCT/sVhImTQrvYxf9/DrH/AfBMg2UzDNSL84q3dintAl214EkxrbOVVq14ra
	N2bvKkUdga73/MqZGsJxzQwZFToSy7HcMA5Mz57wAGenl5RxOn32qIcsQ0gI9sItCRq6
	VEzg==
X-Gm-Message-State: APjAAAXIpYjfsmwCIhrI/VvrHVqMRnh074QKIY84TtsZvPCATmh3df8P
	rBmiDmrNWrQXWQBx2vgaXwvCRX/qYrs=
X-Google-Smtp-Source: APXvYqzlfWhPZQd85r3AvB2GybRb7O4yj7od7Ao7ccvc1qHIofuaeN5i0KkNBCAmCz1lyLISnyqbvg==
X-Received: by 2002:a1c:cb0e:: with SMTP id b14mr6722321wmg.61.1558523309888; 
	Wed, 22 May 2019 04:08:29 -0700 (PDT)
Received: from hex ([85.255.234.137])
	by smtp.gmail.com with ESMTPSA id o4sm7212808wmo.20.2019.05.22.04.08.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 04:08:29 -0700 (PDT)
Message-ID: <33700e11097f8b98ea98acfce06977e24c3bfb8d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 12:08:21 +0100
In-Reply-To: <CANNYZj8cSb0_7fRhG=bbizctTnaQg53hVwSzOu5WoWr9ywbMKQ@mail.gmail.com>
References: <20190521161158.45329-1-alex.kanavin@gmail.com>
	<CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
	<CANNYZj8cSb0_7fRhG=bbizctTnaQg53hVwSzOu5WoWr9ywbMKQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Wed, 22 May 2019 11:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 12:28 +0200, Alexander Kanavin wrote:
> On Wed, 22 May 2019 at 04:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > +
> > > + pkg.generate(
> > > +-    libraries : modulemd_v1_lib,
> > > ++    libraries : '-l:libmodulemd.so.1',
> > 
> > shouldn't it be generating a separate package for v1 ?
> > hardcoding linker paths seems a bit hackish here, is it going
> > to generate a .pc file with .so.1 version ?
> 
> The problem is that both v2 and v1 are installed into the sysroot; we
> don't have a mechanism to choose one or the other via DEPENDS (unlike
> desktop distros where you can install -v1-dev or -v2-dev package for
> your build).
> Then both v2 and v1 .pc files (without this patch) refer to
> '-lmodulemd' which in our case always resolves to v2 library.
> 
> Wth the patch the generated v1 .pc will look like this, while v2
> continues to use the original '-lmodlulemd' in Libs:
> 
> prefix=${pcfiledir}/../../../usr
> libdir=${prefix}/lib
> includedir=${prefix}/include
> 
> Name: modulemd
> Description: Module metadata manipulation library
> Version: 1.8.10
> Requires: glib-2.0, gobject-2.0
> Libs: -l:libmodulemd.so.1
> Cflags: -I${includedir}/modulemd

FWIW I think if there were two different recipes we could select which
was in the sysroot through DEPENDS?

Cheers,

Richard


