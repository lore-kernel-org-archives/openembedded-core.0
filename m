Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A9AB377C3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:52:35 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l7so8985624ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=soHxGfP8qBAg5ECumKPL/fRSqhKlZlll0XD5n6Qe7PI=;
	b=PUyw7dsddm3MyV2DZbia9aPWx+E+qXJjMxm7D3lUm9f/ZlxLwkFYGzsIU/HQZj07lO
	8xehx+7xat8UqE4/Rxmld0yOVN0oasCyNVWBL4yA8vKmhgZEIb+hnCHZ9fMWOacdVlof
	Jbjw5YhrgsTI8tFTW4tAneS6qEbcfXyOIGwBnvmU9tHrEG9QYz3tkIlno547Sdx9u/He
	6phaVhmx2hOzkXmlPPW7FSrEIctrBqqWrS0tn7jkKcsl1/Vk9auoaZ3EVV8ZURbqZPjh
	Zjxro95+0zczH4qTESHWciaFXM/HEoTmkqa2Y/5VRDXWVS6h995G5O5DcKhfruJ7BYvD
	AenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=soHxGfP8qBAg5ECumKPL/fRSqhKlZlll0XD5n6Qe7PI=;
	b=oCa/PVkcnohsAeazQA/PX7vgAR3evDnv6FDkhP8KGYnUaT/FR60VkTLbpwMTEYEd2d
	phPCBP8F+leUZYeJLkPFeoZVRzYUGyNtBi369jypm7HV7r2keqkjD7KNhngqAD8fLRnE
	Y8oZObNZ1XNXszrWiuhtgSK8X+Przk5jOqa+C2as3sy9SDHPXFV/UBR3MQ7T8SYFV10f
	bKsKAtKG/1JYCb1V9oCW3h+GmCJKH/YmlUICwZpU/Sb2AqD4sF6UiXcQncIrlPIX/JCS
	XbyeRLaxJOP5xLWdGPYUAewRx4gbvFjby/pbyFkMdM1kTgNVDOWEUlySrIpHDisGHNaG
	0v2Q==
X-Gm-Message-State: AFeK/H1k3puKGCDj7sloyqSiMLES437C4qm52eo6XRx4/W4ZdokEXzKSK/mgpJwaZ9VQk1EO
X-Received: by 10.107.181.87 with SMTP id e84mr59029955iof.156.1491929556546; 
	Tue, 11 Apr 2017 09:52:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D3A2.dip0.t-ipconnect.de. [93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 9sm1127103itm.12.2017.04.11.09.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 09:52:35 -0700 (PDT)
Message-ID: <1491929552.10884.199.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2017 18:52:32 +0200
In-Reply-To: <CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
References: <1491828558.10884.112.camel@intel.com>
	<1491928471.10884.196.camel@intel.com>
	<CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Tue, 11 Apr 2017 16:52:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-11 at 09:39 -0700, Khem Raj wrote:
> On Tue, Apr 11, 2017 at 9:34 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Mon, 2017-04-10 at 14:49 +0200, Patrick Ohly wrote:
> >> Hello!
> >>
> >> I'm currently extending the yocto-compat-layer.py so that it can detect
> >> invalid signature changes when changing MACHINE. go-cross-x86_64 shows
> >> up as broken when comparing signatures for MACHINE=intel-corei7-64 and
> >> MACHINE=qemux86-64.
> >>
> >> Both machines share the same go-cross-x86_64, but that DEPENDS on
> >> libgcc:
> >>
> >> meta/recipes-devtools/go/go.inc:# libgcc is required for the target specific libraries to build properly
> >> meta/recipes-devtools/go/go.inc:DEPENDS += "go-bootstrap-native libgcc"
> >>
> >> And libgcc itself depends on the tune flags for the target architecture
> >> and thus is different for these two machines:
> >>
> >> $ bitbake-diffsigs -t go-cross-x86_64 do_prepare_recipe_sysroot -s 563f419e3854c2351e2cbbf33a9025f6 64e378fd9853a6cd6a4e7f684f52d2fc
> >> Hash for dependent task gcc/libgcc_6.3.bb.do_populate_sysroot changed from afb6b55c0e2b7d2e816b3d2d214a7326 to 208fac5ae428b07a4aa491b130879e4a
> >>   Hash for dependent task gcc/libgcc_6.3.bb.do_multilib_install changed from 596e1612d7b84b7a9c1b409ee78cca89 to d41e2e835d0abe7646e53e3d63ce00cd
> >>     Hash for dependent task gcc/libgcc_6.3.bb.do_install changed from 9ca4126c69fcceb410253a0603c3d76b to cb0c49687a91ea17f1027c6394baacab
> >>       Hash for dependent task gcc/libgcc_6.3.bb.do_compile changed from ab80902424c73af49257cc3f6fe049aa to 436f978a703476968bd5ae1c1915ee5a
> >>         Hash for dependent task gcc/libgcc_6.3.bb.do_configure changed from eb0c36d87f32ce1ceb7d1e42609578fb to f62c98806faf3a28c2144919b89d3460
> >>           Hash for dependent task gcc/libgcc_6.3.bb.do_prepare_recipe_sysroot changed from b037b950e346bef71a4f8fd2c6a2195c to d4564b5730941279392932e3c670a5a5
> >>             Hash for dependent task gcc/libgcc_6.3.bb.do_fetch changed from e64cd9e029ed63ba3a09e5fe085b7057 to ea4d3f9d10544219ceb8591d5a5a4041
> >>               basehash changed from 8744593af2eddb60244788f2b9476e2d to dabeb22478ef501e35311af75119a2cf
> >>               Variable TUNE_CCARGS value changed:
> >>               " -m64 [--march=corei7 -mtune=corei7-] {+-march=core2 -mtune=core2 -msse3+} -mfpmath=sse [--msse4.2-]"
> >>
> >> Does this fix look correct? It turns go-cross into a package that is
> >> specific to the tune flags for the target.
> >
> > [...]
> >
> >> The alternative would be to drop the libgcc dependency, but I have no
> >> idea whether that would work at all.
> >
> > Besides Bruce who pointed out the implications on recipes depending on
> > go-cross-${TARGET_ARCH}, Richard also had concerns about making go-cross
> > tune-specific, so I ended up testing the libgcc removal approach. It
> > happened to build okay, so the patch that I ended up proposing (see
> > "go-cross: avoid libgcc dependency") just removes libgcc from DEPENDS
> > for go-cross.
> >
> > I need to revise the method how its done (i.e. not with DEPENDS_remove),
> > but besides that, can anyone explain whether such a change might hit
> > some problems somewhere? Khem?
> >
> 
> I think TUNE_PKGARCH is the granularity it needs for setting GOARM
> anyway.

So you are saying the patch that I had proposed initially in this mail
thread (go-cross-${TARGET_ARCH} -> go-cross-${TUNE_PKGARCH}) is the
right solution?

Just want to be absolutely sure, there's not much time to resolve this
for 2.3.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




