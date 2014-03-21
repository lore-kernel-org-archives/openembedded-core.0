Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 41E446FA24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:11:17 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id i8so2657983qcq.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 06:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cRnaAVv08L4GLW7daRYm+epX/Pi0eevv/2jULjY/Jdk=;
	b=XVprqlz5j6cqZy/Gq96LL54l61CAkjUGnvL/VJwVEHGLq6yO7j01uglnYDj/Wn8p8l
	pTO9fc+Alx2Gbv0/IOECgo7MqhAGAlFET4gMZmfUlyWWnfxksS2gt/KGwbYZ/p81Yt6w
	Zicvt1mu5h31q22IJWHejk1WkSpjO5HpbeLd32phvyh3HCtDFCqP39FKUzEH2ViOPAuC
	VedAy9uk2fTvX0yXGXghdJThGKccPDcT/3zAjYAmvah7RSCJNRVMt7juSirwUWZnQwV9
	n2ZQUrPgYnBshGwlIE40p9JURtLQ8yTCtiAPVbUYdiJXxFkImVyUpYVKBQG5aaHVXLOe
	Krfg==
X-Gm-Message-State: ALoCoQl07LEZHUlE2AcNoBl5b4GHaCUMSoa700+b1V8gst52uRPQZ7Zo+bmL50ktzkYCbmZoZpU9
X-Received: by 10.224.45.197 with SMTP id g5mr57316528qaf.52.1395407478090;
	Fri, 21 Mar 2014 06:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Fri, 21 Mar 2014 06:10:58 -0700 (PDT)
In-Reply-To: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
References: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Mar 2014 13:10:58 +0000
Message-ID: <CAJTo0Las0o_JcsvW-X+L=EQAvUf3yVVQBunoCi=cAzR=3y2DrA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
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
X-List-Received-Date: Fri, 21 Mar 2014 13:11:22 -0000
Content-Type: text/plain; charset=UTF-8

On 21 March 2014 12:34, Paul Barker <paul@paulbarker.me.uk> wrote:
> I'm currently very busy between various projects so I don't have time
> to hack together a musl-libc recipe myself but I should have time to
> help test it.

I saw that yesterday too and thought it could be interesting for
Yocto.  I'm curious as to why it's better than uclibc though
(genuinely curious, I know little about uclibc beyond "it's smaller").

Ross

