Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D7F7B7CBB7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:09:31 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d18so21778890qtg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nK8L3Qwa+Tm8rRplqM8x+bFZuWT3ngplSbG4YyyF2Rc=;
	b=Kqv3ltB+wd2QVPPKZOWcXDLfTh4SQCZIrDtZktkKazJa8KgslXZv5eP8ZLIX07JaU8
	v0TkfYVxP2lAn3r7eyPxTEN1lMFIYeuEcvjRHz0id56liuEXx9JngBmH52iFUIdMA23n
	mBQ5Rkgd4mvIZkgYOf3txqrNocgG8XdIIJPU76Tx/lmVYYdKN7QTTvCzvDP80CjLRWWS
	3Me3rueh94rAS00nOttaz7cD7s1fnRuV+gZ0I4NoKO6PA/Ymh7JbBE+qs8jIo8awwJry
	46Tx+7omvre1PnREs34i6wHAybExicAKxdu0cwdaZzVtihZ1E03xeQ+bALgLcq0MEzBA
	pSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nK8L3Qwa+Tm8rRplqM8x+bFZuWT3ngplSbG4YyyF2Rc=;
	b=fBp+rIcjarDq3BJMTFlcVL6x0VfpO01g9OgqTAndeWdlhytMODSdKbu24/Zn+vdsYV
	WoJUW2TSM8rx/2sM3rpGIQT+fEjVftTwxCNfVAYIGPaj0e77fL1T6F8WTzypr1xHS2P8
	DkjHR2qobr47t2q3IRm/kjsi8hDvPwO7TZ/bJRzHGHKZ+etUU+E89PCFeSWFKgF4S096
	cl58HWOHciGSSIGTy+UN9YfxclYdHOhXJMcIcFbje7Y77Bj195HlTUO3XNorUSQpo3He
	N6OSlk7aiZ1CKt23G8Zz9/2FaiyB1m2U41XCa4YT9MUAxzqcHVaS3qpIYymV6TcQ+zhl
	KDoQ==
X-Gm-Message-State: AHQUAuYy/Lo7fiKcKId+9CcenaQUHDf4B10U4AbBGHZGUAtFLdcHtYea
	s7xQAgCd/tiGyAChLN26MfDkiArwvWTnPWsAToU=
X-Google-Smtp-Source: AHgI3IZchz5D5vf4OVjrm4/HwnNMSpt2iQADT3W6MYBCguv8FxQoHrthPc/pMHyOC8CWsfQq90TiR8k0Pw80BOHierM=
X-Received: by 2002:ac8:67d3:: with SMTP id r19mr31173081qtp.196.1550761772354;
	Thu, 21 Feb 2019 07:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20190220211034.27159-1-fabio.berton@ossystems.com.br>
	<451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
	<CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
	<CAMKF1srcbPFfGcEFWdNT+P=bmv+eweQN4d2uR_Cena8tvBvd1A@mail.gmail.com>
	<CANNYZj8v+j1r5pM_1kRS77PXzu6GkUCYkxYwg8zHmJjQvBRHsQ@mail.gmail.com>
	<CAMKF1spi6OhkAa7O0a7kVhovvsAn3MYBfwk=yA5Y51NBo3RoEQ@mail.gmail.com>
In-Reply-To: <CAMKF1spi6OhkAa7O0a7kVhovvsAn3MYBfwk=yA5Y51NBo3RoEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 07:09:06 -0800
Message-ID: <CAMKF1srBm-CjkLNy=3n+=mq6WrfiSiTUHs8Mk+itNZJHnWS_hQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [RFC][PATCH v3] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Thu, 21 Feb 2019 15:09:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 21, 2019 at 7:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 21, 2019 at 7:01 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Thu, 21 Feb 2019 at 15:56, Khem Raj <raj.khem@gmail.com> wrote:
> > > > still seeing errors when building for rpi3-64
> > > >
> > > > | checking for xrandr... no
> > > > | configure: error: Package requirements (xrandr) were not met:
> > > > |
> > > > | No package 'xrandr' found
> > > > |
> > > > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > > > | installed software in a non-standard prefix.
> > > >
> > >
> > > This is fixed with latest commit so we can move on but there is new one
> > > on aarch64/rpi
> > >
> > > https://errors.yoctoproject.org/Errors/Details/229582/
> > >
> > > seems to be due to this commit.
> > >
> > > https://gitlab.freedesktop.org/mesa/drm/commit/b541d21a0a908bf98d44375720f4430297720743
> > >
> > > probably a revert of the above patch is what can get us further.
> >
> > Shouldn't we rather add a dependency on the component providing the
> > missing include?
>
> fredreno build uses its own copy of libdrm IIRC and this might end up
> in unexpected results
> so revert would be safest
>

infact upstream has reverted it too
https://gitlab.freedesktop.org/mesa/drm/commit/e09f327765902f3b7d31874ccf0f45b783299bc0
> >
> > Alex

