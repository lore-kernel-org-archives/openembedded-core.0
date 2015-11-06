Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6243C75EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 10:54:11 +0000 (UTC)
Received: by igdg1 with SMTP id g1so33123094igd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 02:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=DShjjmpisGxV2HIGR2QlN1fPwdP0YUj0N1SoBDJRCfA=;
	b=XJDGWYcM1RcMrOWCwFAWHX96Jb4/IsHIW1WUxw8h2lXcGeCLI7AvAFC0TCGv3N0wDd
	gCy7J/TVvfGObJmuvUeUT3boPEajmRTpG86bISb3v2OweecWBqvtmFm5vh5n18YvFXSB
	l1nM3x3RIxRUWr1ohs25GVrkMzm5iYwVuPAJe9EU28hSFAykdMOkDXEOHjEMM1WFbyDQ
	vZ7pA84T7Y0B9kCPQ0ni7ENiH0vwRT1MD+uspN16nHUE72G0ncY1LyjjLjR99AEqbTws
	epM6Mk7sUh1I4tko+hi2e1BVN1UnWSkW60uSsdi57VyW5v8o/lp4INXDPLXZz0dTS4kc
	y4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=DShjjmpisGxV2HIGR2QlN1fPwdP0YUj0N1SoBDJRCfA=;
	b=MJ9Mv0EwIj42yR0s0nqFTNYNH2TvCkYrjXIvKbFvDX0i+wwqJ1FR7JtNfC4dmqA6Tt
	8byKgBTw89p3nokLd7hGD4MNTkg5725SpsxQovYTy+wlbKRUET+n2OTDBaOM60/G3YEb
	dAMN93g32vLa3Hl3QH21pPN00b+I7DiFTsXYruV0DXFlDVSHxXRjQjfm98bSqvjEmt4U
	MWMKoTb7QvhInXjzPCATt5HB30KOivmKUJ6di+jW9CRFREHuD+jhgDx5c24qvYIYGPCv
	qoeJ197P14S7g6bemdf7yNrC2WjUf2L+yV4g9rh2xo8Iz1XcT+7Uo27lEO445GRIRfFd
	DPjA==
X-Gm-Message-State: ALoCoQkXAa1yjXU6OTj8zYh4M1kAaEV5sGxPvhZEU16MWUkcQmrrwag7w9IZiiOGGhJzHlsLiyme
X-Received: by 10.50.60.6 with SMTP id d6mr8889254igr.54.1446807251725;
	Fri, 06 Nov 2015 02:54:11 -0800 (PST)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id np7sm260086igb.0.2015.11.06.02.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 02:54:10 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioc74 with SMTP id 74so54472251ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 02:54:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr5040025ior.28.1446807249829;
	Fri, 06 Nov 2015 02:54:09 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Fri, 6 Nov 2015 02:54:09 -0800 (PST)
In-Reply-To: <CAJTo0LYA78vJehCoLLeGu8DwQCrRF=bV7RKs=BvH4fY8SsmSZQ@mail.gmail.com>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LYA78vJehCoLLeGu8DwQCrRF=bV7RKs=BvH4fY8SsmSZQ@mail.gmail.com>
Date: Fri, 6 Nov 2015 08:54:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqpBeaHjWjsirLirO+cdSVtWF8XQAVKEbag7xods4b=bA@mail.gmail.com>
Message-ID: <CAP9ODKqpBeaHjWjsirLirO+cdSVtWF8XQAVKEbag7xods4b=bA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Fri, 06 Nov 2015 10:54:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 7:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 October 2015 at 16:05, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >
> > The U-Boot 2015.10 has been released at October 20th 2015. This also
> > removes the GCC workaround, for the inline behavior, as this version
> > properlu supports the GCC 5.2 as compiler.
>
> Breaks on the autobuilder:
>
> arch/powerpc/lib/cache.oarch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16':
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: multiple definition of `ld_le16'
> arch/powerpc/cpu/mpc83xx/traps.o:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: first defined here
> arch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16':
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: multiple definition of `st_le16'
> [and another hundred pages or so]
>
> http://errors.yoctoproject.org/Errors/Details/21468/

I am checking it; thanks for putting it into AB.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

