Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 625176B512
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 21:13:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p17so660223qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UfEuZgsRtn9ovPNESLn0P5J/yQaEgHNlIVukiEZW8FE=;
	b=XDru3vXXV3zq7gIcUZ3zlqkTXkl2HQVsf7uwR7HNzUI/fbNwFf9QgyX0VFmG8uaF45
	uyC6fm4rHhR5tdVzQlS59h7h2KTl3OQHysh2M0wM5kLY5m767YfkSFGzZ9JM3l2PsBSx
	hKTHwYv+upbG6W27FLv8l5Mp7HgqwglaDUeGR30c7LmKN9kJvhnMhsV8Za4d7Fz/hPMz
	7wsHoDTlYF8Tm0n7p562yL+Z0wdMR+CdWrs4psinafKkfgsdkHrjvGgJrmKc06biKQW1
	ghKFUGPtYKJsZOh8nxxXAQaBFRWmF1S8Tz3y3ekHBQMRTX09TED1iD4wMZ0S/NfJ6tR9
	8DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UfEuZgsRtn9ovPNESLn0P5J/yQaEgHNlIVukiEZW8FE=;
	b=C2epvL9yevgV/FnFD8HQaPpFrZ13EUc1P2GYC4ED+Qm7lKLgI2b1DNXWcuJCVUvbc4
	oAMfnA/oWzSmgCpC8GRBRxyIbp6og+vkG2sbmCDpL38UCEbdmA4fUYRUEbIwR9MzxbHe
	vRnz2eMuhctlbszwGkv7EY/1DhSMES9u7FIZGhFBcOnwyxLxj4i4IgEnZoXkPT9yKOWa
	1qZfyuweiixq+G60EyqYqwWXV0S7XT8flTOFt+bSDNCOm9hgdqDaQAFjcaSOUCTqvYhk
	m0XbCSJ8CGh3fRMqnZBkCOAn+P0s6jYf/drFTNVbyaaNPQoDafVOw6lTaubf+cGqVCJZ
	wSNw==
X-Gm-Message-State: AJcUukcv+lRoAa7JSxAIkUDVxZ3vOduj5dnSYsOY56rJKOzUzcqg0k1U
	aa5TrROWHjPCQ01tm2P7q+YXmuS5Atfly2mHKfo=
X-Google-Smtp-Source: ALg8bN6y0aLjTIHqBLINT43c/3kGsbQeHWBgMDcNe947zQST9lr+bJ8U2+PI3zzVasATZtB05uvOO5azmwtElGbYIO4=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr377855qtn.254.1547500404124; 
	Mon, 14 Jan 2019 13:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20190111125014.34593-1-abrodkin@synopsys.com>
	<CAMKF1soxmbmcHx4ZQkyx4aqoNYSApjU0wGTEntfsTm08Rg4Y8A@mail.gmail.com>
	<4881796E12491D4BB15146FE0209CE64681C58B2@DE02WEMBXB.internal.synopsys.com>
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681C58B2@DE02WEMBXB.internal.synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2019 13:12:58 -0800
Message-ID: <CAMKF1spk7gEf17DAiyETbRsjsVDXfTCfi+=Y9o3Q40=0X+gBXg@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] webkitgtk: Enable building for ARC architecture
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
X-List-Received-Date: Mon, 14 Jan 2019 21:13:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 14, 2019 at 12:45 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Friday, January 11, 2019 6:32 PM
> > To: Alexey Brodkin <alexey.brodkin@synopsys.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>;
> > Richard Purdie <richard.purdie@linuxfoundation.org>; Ross Burton <ross.burton@intel.com>; linux-snps-
> > arc@lists.infradead.org; Alexander Kanavin <alex.kanavin@gmail.com>; Hongxu Jia
> > <hongxu.jia@windriver.com>
> > Subject: Re: [PATCH] webkitgtk: Enable building for ARC architecture
> >
> > On Fri, Jan 11, 2019 at 4:50 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > >
> > > For that we need 2 things:
> > >  1. Disable JIT in JS as it's not supported for ARC.
> > >
> > >  2. Compile with "-mlong-calls" so relocations with
> > >     offsets larger than 25 bits are used, otherwise
> > >     linker fails to link final binaries.
> > >
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Cc: Hongxu Jia <hongxu.jia@windriver.com>
> > > ---
> > >  meta/recipes-sato/webkit/webkitgtk_2.22.5.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-
> > sato/webkit/webkitgtk_2.22.5.bb
> > > index fc56822f7a..56f69c7a30 100644
> > > --- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
> > > @@ -69,6 +69,13 @@ EXTRA_OECMAKE = " \
> > >  EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
> > >  EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
> > >
> > > +# Javascript JIT is not supported on ARC
> > > +EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
> > > +# By default 25-bit "medium" calls are used on ARC
> > > +# which is not enough for binaries larger than 32 MiB
> > > +CFLAGS_append_arc = " -mlong-calls"
> > > +CXXFLAGS_append_arc = " -mlong-calls"
> >
> > perhaps adding to CPPFLAGS is going to be enough for both c/c++ cases
>
> Just tried that (only CPPFLAGS_append_arc = " -mlong-calls") and
> I don't see "-mlong-calls" used during compilation at all
> (I'm looking at .../oe/build/tmp-glibc/work/archs-oe-linux/webkitgtk/2.22.5-r0/temp/log.do_compile).
>
> So I may guess webkitgtk doesn't copy CPPFLAGS to CFLAGS and CXXFLAGS.
>

yes its possible. Thanks for additional verifications

> -Alexey

