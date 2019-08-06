Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 981457ED17
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:48:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so84182860wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wdBbiizZvxjVvB66okSzPEngN/Js0td14HR3wwnfzYw=;
	b=CgQx+x+JiY9673Cyom6TAQTr7UukOUYK72hOTrjYoE6h54bZQF+lUGTdBRTjNpwNYR
	FL93qGYBJfA3HRNXqVHoLO4xKb9IGam9IkSWDSC9qu8JuFnrcoMTFXhTvm6/f/pIpb4k
	AkSQFztaMGq/TQv8G4lMsE7bwS1f4QteckV10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wdBbiizZvxjVvB66okSzPEngN/Js0td14HR3wwnfzYw=;
	b=jB7+7IcTfnV8qagNIAjxIqvXExU5EpmBp3SaycDUX/13m68cXiB8P6Eql7vrBKXNvu
	/LRvNZg4+Kb34BrmzItpU06xdRfgwd3nzSijTfkaLEgul+ZtnxBjHUKkm+SLRLixTD2x
	HkqzjDjN0gciVic0kLUtLvSqRCNxA4feZmpqFiyAnwo8R84Ucndqld9+07L1Nur2So+E
	/VNa1uXJpZ7kShheV7js9USvm3ZcIlbLAwRIXwnbjYRC7ePQjhxy+ymUjXogrPOhcLUy
	DxnCYk6/ocsLDnXiuntPonSgOwVBIiduP8rI7E/pqfRgn18rJjCFZyVoN8vlGJqpQCvt
	zPag==
X-Gm-Message-State: APjAAAX71n1WCEuivHC/r6KAMghYTU65SnzB1MnE243gIs9EnDCvHjK9
	zT2t8p19aTsEBI1XCLuehsmTSw==
X-Google-Smtp-Source: APXvYqy99NBHYXDf+RPJVPXtXR3ESOA+fM7WNaKkrenZocxwiLuXg04jIFDwEThXArgtGXF2TotIRw==
X-Received: by 2002:a5d:51c1:: with SMTP id n1mr4086650wrv.254.1565088529255; 
	Tue, 06 Aug 2019 03:48:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v23sm78061956wmj.32.2019.08.06.03.48.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 03:48:48 -0700 (PDT)
Message-ID: <542cb1bf478aac542ec319a84fb6c3b4a1be097a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2019 11:48:47 +0100
In-Reply-To: <20190804000313.34500-1-raj.khem@gmail.com>
References: <20190804000313.34500-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] musl: Update to master tip
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
X-List-Received-Date: Tue, 06 Aug 2019 10:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-08-03 at 17:03 -0700, Khem Raj wrote:
> Fix for RISC-V build regression
> 
> 64bit time syscall plumbing
> 
> Changes are here [1]
> 
> [1] 
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This didn't pass automated testing for qemux86 or qemux86-64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900

Cheers,

Richard


