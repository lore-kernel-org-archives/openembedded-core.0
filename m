Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id D9C94755AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:33:16 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id k17-v6so5686458oih.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Wgr6W5EhjFZ2Un4qkXJ6yw3G88hHflUjYDSTXL15m5w=;
	b=cGlpGwwCT+5bjUEOYojbxvsuA7M24NbNgbYmm0WG5I44cnCmI+qbPp16M+dRaR1iTV
	6QnWo4SFmhEqUnh8ljsFYW+f2G9NndCTVWEqhfiLUQvTo5QeMZKglt55aO8ht4r8YZEH
	X8M6+YM9MynJAqYAz9q0qzkOWxkAmrMm2IBi1uhoqR2USzewzjCGwGvHIioRpeJ9HJTG
	XRCCfvu1i9bcAt4Z38KWRwp7s++gTbFHqSMbK05HOys/JYuS1RNNKdIWZauvgShQComN
	rIhNo27jhcvUVQ79xKG0HN1DSixpt5peai+OQmZVKR0s4X1nUiqL8ax84/270MzmSZvx
	MdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Wgr6W5EhjFZ2Un4qkXJ6yw3G88hHflUjYDSTXL15m5w=;
	b=sfk806LuRGT1Cs7bILUorFs2pJ+d+uw5PEgoUeeM/wyIaxHtw/P/y07lSQm83CEAaS
	YSD8EOO37Kw8rimi1nqRL7rhp/JaEqYuj0LdSn6FNaDjZGJnkXH3ZW8Hxxwb9k6W5OP/
	jnhDyQTKXhyHenX1Bm2s9TMx2JP4+OiOW6rQ6U2swsHXIHMUKGM2kbOF9/hn2E35TCfh
	ep+Cq+fmQhGguHRndoVBynui5CKfqo+iiZ3Cq6S0PAwtV/4Mo8Jye/dw5Nldg3iJnfEF
	DD5X+/Rw1rteOTq9SYWZBN0y1fN2W/BnE2Luw8RYiPY3kPsMbRK9nxQOl77f6YpyM86d
	BGcg==
X-Gm-Message-State: ALKqPwcuCcmLwsgvdU3Up6Mkyi1lIo6DHjyYfjXJsEnZA+ZjW4rIosyK
	IuKBmFmxUrlBEk81Rvj5DJYYPx/U
X-Google-Smtp-Source: AB8JxZp2L4K3XWREvmPtLE5ljuu4HI6HWtqVsmyryawFXMhoEJ/TC7jX0jhwC8Hg+qnU93kohc+8lg==
X-Received: by 2002:aca:5e82:: with SMTP id
	s124-v6mr61107oib.353.1526067197328; 
	Fri, 11 May 2018 12:33:17 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	v140-v6sm1957379oie.52.2018.05.11.12.33.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 12:33:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id p62-v6so5661938oie.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:33:14 -0700 (PDT)
X-Received: by 2002:aca:c443:: with SMTP id u64-v6mr88227oif.288.1526067194420;
	Fri, 11 May 2018 12:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da5:0:0:0:0:0 with HTTP; Fri, 11 May 2018 12:33:12
	-0700 (PDT)
In-Reply-To: <CAJTo0LZRrvYgu9Pthi+ZzsxQX76qW2j7VzXvxfjMuOFNr5JJiQ@mail.gmail.com>
References: <20180504174346.1149-1-otavio@ossystems.com.br>
	<20180504174346.1149-2-otavio@ossystems.com.br>
	<CAJTo0LZRrvYgu9Pthi+ZzsxQX76qW2j7VzXvxfjMuOFNr5JJiQ@mail.gmail.com>
Date: Fri, 11 May 2018 16:33:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpkqeqn=DpBGsAHMdHP94f=92P1tQL1VKTu+uk88UyhXw@mail.gmail.com>
Message-ID: <CAP9ODKpkqeqn=DpBGsAHMdHP94f=92P1tQL1VKTu+uk88UyhXw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wic: add ontrack DM6 aux3 support
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
X-List-Received-Date: Fri, 11 May 2018 19:33:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 12:41 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Somehow, these patches are causing selftest to fail:
>
> ERROR: Not supported fstype:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1051/steps/Running%20oe-selftest/logs/stdio

You forgot the parted patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

