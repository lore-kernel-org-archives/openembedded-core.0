Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A79956067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:11:26 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q62so8714679qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LNY+n8w/PCFXQvNtiojZWBZOx+tYQym4h1Md4EyyQM8=;
	b=SxwRZkOQBtmsK9IpXM6ostXXoy1eavmrn7eICsgpYxj5smGDDUNlW9w7EuzI9wgm+C
	Pe3Yx66a4fFzjD2sggN12dMxXcUUQxJ/NdLCoc6yAPMoHoo/bG6IIOjU2tIwAwCD+d7f
	m+9+D6IbcBzF6i7LxMKhdMeq/KSentAC/J6yreMM3ppET/cek9riIaaFqL9FXPnoC2XI
	KRFgJSdr0rXP/1wOjMgvc2YjuEqT5WkGBD/vjH3N4HTVKacr+LJIIjmcqQzuTLsEvAZL
	rO5dZ2y0RrET4vPjjSYy6GJubfLbQt7pwdUapezbqK5fcSYBcCfPfe6e7L9EYd63NRcd
	OYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LNY+n8w/PCFXQvNtiojZWBZOx+tYQym4h1Md4EyyQM8=;
	b=XV7zxBA3Y0+8zFK0D/gisMItW0PcjWlnm3JQG2fbvjXtjv95n0my9c3pbAKtTVUD3m
	g+mwMe5ELxcmyjceus59Z0svyys88elOtfJNfWvyiw5TkO42036IG2vr7D+F6jHl/99a
	TVhvieDuVtfpBCGFx4ZkehCfndQtX3Yl88l1kxapYIKwicE1oDeh+fTUCGMEgzwb/z8R
	FzSj29pCY2yX8zwVmEMQEgMpPb5EUQWhC2KEM9s9xWFQBemBKYbnJ6Pbsu8rUvp+Etaj
	ES6Q1QcFGImFuUPW4LwaLCdO197ascvGqbZYjrDUb+is329CPpIfN9sCHciyR+0TIgoc
	tR7g==
X-Gm-Message-State: AEkoouv6drjMyRzCBs5Hm5QeCUD1i5DQvCJZ6sO35fbkACp2zTvoXCuxVJ81sma1cRo7ZT5oZTLgGMjlcV3Ppw==
X-Received: by 10.55.39.142 with SMTP id n136mr5049852qkn.149.1469196687057;
	Fri, 22 Jul 2016 07:11:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 07:10:57 -0700 (PDT)
In-Reply-To: <1469194596.6594.13.camel@ts.fujitsu.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2016 07:10:57 -0700
Message-ID: <CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Fri, 22 Jul 2016 14:11:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 22, 2016 at 6:39 AM, thilo.cestonaro@ts.fujitsu.com
<thilo.cestonaro@ts.fujitsu.com> wrote:
> Hey all!
>
> Hopefully this is no dumb question but I can't find any solution currently.
>
> I want to build my own dist and a sdk for it. The dist is working and is as expected by the DEFAULT_TUNE of "armv7athf-neon", hardfp.
>
> But the TARGET_SYS in the bitbake header always tells me, that the toolchain it uses is "...-gnueabi". Not "hf" in there?!
> Thats the first thing what I can't figure out.

We do not rely on target triplet. calling convention is determined by
-mfloat-abi switch that is what OE relies on.

>
> The other thing is, when I now use the sdk, after successfully populating it, the toolchain in there has the default -mfloat-abi=softfp ...
> But even when I compile with -mfloat-abi=hard, the executable which I get, segfaults on the target and ldd tells me "not a dynamic executable".
> But readelf (on the target or host) tells me, that "Tag_ABI_VFP_args: VFP registers" (which is detection for hardfp, right?).
> And I miss the "hf" at the gnueabi in the sdk toolchain.

Is target running the image build by you as well ? and prefereably
build in same sandbox as the SDK
if not then you need to figure out how the image was built.  what is
output of ls /lib/ld-*

>
>
> my program was the following and it compiled without any warnings or errors:
> ----------
> #include <iostream>
>
> using namespace std;
>
> int main(int argc, char *argv[])
> {
>         cout << "Hello World!" << endl;
>         return 0;
> }
> --------------
>
> I also tried Default tune to set to "cortexa8thf-neon" which had the same result.
>
>
> Any hints why the toolchain is softfp by default?
>
> Regards,
> Thilo
>
> PS: When I use the ubuntu arm-linux-gnueabihf-g++ with the sdk sysroot, the helloworld program works as expected.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

