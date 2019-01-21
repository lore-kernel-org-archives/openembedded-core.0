Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9CF6BE0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 02:17:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q8so11461519qke.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 18:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lrXePiwj0QsJpBIQcFC85O9+9ITUsQiAnZMnxoHAcXs=;
	b=fK/52TP2BSGWjbp5NqeJt3u61zQU/pVubxuLPeL4i5nHBfqR0LTgc3gE8vab5WZGld
	90O/KfpG1VnWmsZZ/I6CVFbw3kXXxDQSR6vu3242trxfGlOMcrHNI8kvEDQcEHucVYNv
	Xqcq381sMRcDoQbpr+/oLkPVQCZS7G/FRzR6H2jD6DEUYRu2ff3Nryznhcdemr4B5LiV
	i69fN9R43nwaUxtAFQeJ8sm5BN/DPk7TSJzU/0Xj1ZoF7vjfX5EX46qrPp3BhJsHmsgo
	Q+fN6+p5OZ0Oz64TTW3F0R1klNtqY2cuORZXnc9uirUv17ZxCRVLCHuXrzPwtA0mfiin
	GcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lrXePiwj0QsJpBIQcFC85O9+9ITUsQiAnZMnxoHAcXs=;
	b=Ape4xziCPykIANDrrcEr/EeQgsta9kg+k+GVh9dxuiyPzLaBhoIxiQSzmfKFD4Ou5k
	Cg/VIAYa1Fuxr1aZo1gQ47Q8t1NR8nAPQLqalRfMYRZhKGzpcbNuW9WPj8Au+ali6nQ4
	JIRukArjle0K6Or1FdXTZegVSiJEQZjVs6C5vqNKdBR7BVI/tCuLZN7E1OIGTYp1GS22
	zhvtV2L4PxWjrI1ISxfcOA6vd686kv8+L1N/i74c5cPClbcy87lvTSdpFzLA4cbdM0jL
	ABpS7OiiOegxCh6txhG1Goq1haNCN24uADUrVLkErnYHdvt3GHQsd2gOAehxp5dWtAxh
	OLCg==
X-Gm-Message-State: AJcUukdt5nh/uLvfWospqlZoGlrZZgwLcdxs33MUzKqCHPKVLPSrg2Ic
	RWkmRCOgOIL+6Yz1A7P5CKEmH7W+JqfzKGYXIB8=
X-Google-Smtp-Source: ALg8bN6URRWoSRjk7lz05M0BnD3c3EhNqP42uerWrB0grxVzHOHu+RrAa0wqR3P1CID49zKHfaLDIGC7Woqz9TIxFmQ=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr23803447qke.2.1548037064705; 
	Sun, 20 Jan 2019 18:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
	<CAJTo0Lb-wU6Mre2uqg6e2x=_FAAr21s4sqP_oj-saQznQQsNbA@mail.gmail.com>
	<CAMKF1sots+CQU4CucnE7VfQbVsJzh-urOCWZbnQ_whbMP93WHA@mail.gmail.com>
	<63eaa7eb-17b1-0b26-f28a-b4dd811eef31@windriver.com>
In-Reply-To: <63eaa7eb-17b1-0b26-f28a-b4dd811eef31@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jan 2019 18:17:18 -0800
Message-ID: <CAMKF1sqvEN+-_9uU6ZzX=+G=0dp3fKmOBWQ8o1CVXxeLJ_pwYQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Mon, 21 Jan 2019 02:17:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 20, 2019 at 6:12 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/1/19 =E4=B8=8A=E5=8D=884:54, Khem Raj wrote:
> > On Fri, Jan 18, 2019 at 12:43 PM Burton, Ross <ross.burton@intel.com> w=
rote:
> >> On Fri, 18 Jan 2019 at 17:55, Khem Raj <raj.khem@gmail.com> wrote:
> >>> I am bit concerned about using -ffile-prefix-map here, its gcc only
> >>> option so will cause clang to fail
> >> It's almost like we need a toolchain override so this can be gcc-speci=
fic...
> >>
> >> I've been meaning to do that for about a year now :(
> >>
> >> Until then, couldn't meta-clang just override the value from the layer=
?
> > yes it can, but one by one there are many changes to keep and core beco=
mes
> > tied to gcc. We should be conscious about it.
>
>
>  From the link https://reviews.llvm.org/D49466 pasted by Dan, we know
> that clang will support option '-ffile-prefix-map'.
> I prefer to override DEBUG_PREFIX_MAP in meta-clang and remove it when
> clang support for '-ffile-prefix-map' implemented.

Thats ok, not worried about clang at this point. But the patch itself
was not working last time on gcc either. So if that is fixed we can conside=
r it.

>
> Regards,
> Kai
>
>
> >
> >> Ross
>
>
> --
> Kai Kang
>

