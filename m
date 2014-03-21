Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 72B736F9F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 14:37:55 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oz11so2635048veb.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=OUHw56LLjRW7Z/8iCpwbSiS6US4OnEVCVLP2gPKA7YY=;
	b=yR5s+Ax3fAMHh1dYF9Ir8hY5nxmRsaRGfcy7P2XgmTqjzVlYwF+8B+1jCCnYBmDKCX
	EPc2DtBVGGzM0SW2ZGIwHpoAwzWduzTw4+oEXh4XxUc/ml1AzAgpNjf4wkIOTGWf2fIL
	aQoLcvu/lc8W4DxeoxKZBmCKSIGVaC4Ux/F1qY9fJNe6R7rxrLzsvlmX0B/ztTiVOOEB
	rJWL7lFs2Pp+OlOIVfiFuE2+aeVvLl1VbwOb5hIZ6/2GW1n/wtDkM6P9NijHLYbjbdg7
	VrnHk7YuENmegrWc3ajUdKk+9PjWD82IWJODiMjDGZqwAekMkARW81n3eoS8X2oZ5H0n
	gI9A==
X-Received: by 10.58.252.8 with SMTP id zo8mr474842vec.55.1395412676374; Fri,
	21 Mar 2014 07:37:56 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 21 Mar 2014 07:37:16 -0700 (PDT)
In-Reply-To: <CAJTo0Las0o_JcsvW-X+L=EQAvUf3yVVQBunoCi=cAzR=3y2DrA@mail.gmail.com>
References: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
	<CAJTo0Las0o_JcsvW-X+L=EQAvUf3yVVQBunoCi=cAzR=3y2DrA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 21 Mar 2014 14:37:16 +0000
X-Google-Sender-Auth: oTTkBivbKNAb9oxrEuga-_zVSnw
Message-ID: <CANyK_8c2Vvm3cpdHts+ORCOFizsvKYk7trMVHTBfr2wPecV4QQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded and musl-libc
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
X-List-Received-Date: Fri, 21 Mar 2014 14:37:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 March 2014 13:10, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 March 2014 12:34, Paul Barker <paul@paulbarker.me.uk> wrote:
>> I'm currently very busy between various projects so I don't have time
>> to hack together a musl-libc recipe myself but I should have time to
>> help test it.
>
> I saw that yesterday too and thought it could be interesting for
> Yocto.  I'm curious as to why it's better than uclibc though
> (genuinely curious, I know little about uclibc beyond "it's smaller").
>
> Ross

Looking at what they say: Better standards compliance, different
license, better for static linking, full UTF-8 support, strong
fail-safe guarantees.

I am taking that at face value as I haven't really done my own
comparison of glibc/uclibc/musl. I've been following the news of musl
development for a while though and I like the direction they're
heading in.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

