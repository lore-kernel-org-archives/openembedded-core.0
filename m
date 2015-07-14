Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0679975F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 21:56:06 +0000 (UTC)
Received: by obbha12 with SMTP id ha12so1034810obb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Saaoq1VXE0hUycZHPL9ATnRRVeY32Zm13Qb6ymbgVoQ=;
	b=eEVtkpCGRwdk9bSg8ifpJNy25/SHJJ8h7iq8+zBINS+V9DNS9VfBMgbGdgnJckkRpw
	2RD0DVviMoEWG5A73j8BpMLUxSSS6Pup2vLU7vY0T6F8MgU/BdubpiBmRxOd89+hBBrQ
	2kCCvjOt0wiAeflMGSyPdqs8MXlFO6ZBA/wwaDnGiq3xnuSJRBXBZeo97pzPEOwl/FxC
	DjSdXaGGjwvACqfLLbkMmaP5CXMpHjpXDFVBAJk6bT/wqTGp1EIqwFMd6bAviyxl1vaJ
	8qXm78zqw06H2EtBI34PsW8bVZ5UTAKbDPOZmTBQ+TTWQQFyRIZwMPl/gIDlxvStERJt
	S/aA==
MIME-Version: 1.0
X-Received: by 10.202.81.3 with SMTP id f3mr606389oib.29.1436910966065; Tue,
	14 Jul 2015 14:56:06 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 14 Jul 2015 14:56:06 -0700 (PDT)
In-Reply-To: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
References: <261F5389-C495-4B05-B79E-309AE0E0F0CA@gmail.com>
Date: Tue, 14 Jul 2015 14:56:06 -0700
Message-ID: <CAJ86T=VE7a7rUMZMB8LTX0emuqkLOE=E_PvARh4JcQwZuJ+WCw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] glibc 2.22
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
X-List-Received-Date: Tue, 14 Jul 2015 21:56:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On Mon, Jul 13, 2015 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> glibc 2.22 will release end of this month. For some time I have put together the update here
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=02e73ea526d94f21c7ef82eb96b062eff8ebb825
>
> It works pretty well for machines I have tested it on ( arm/x86 ) but would be interested if more wider trial could be carried
> out and issues reported between now and release can be addressed.
>
> Please give it a try if you have spare cycles

This was building OK yesterday, but today
"0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch" is
failing to apply due to this upstream change:

  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=edcfe9eab03ea3dd1b3e04b6056a7663c40265c4

>
> Thanks
> -Khem
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>

