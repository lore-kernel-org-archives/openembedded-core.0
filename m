Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 393027D5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:36:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d9so6489873wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vxgJdxH1nmiYPIah131QDPd/2L8zWGMAPNCdFqUCCig=;
	b=gWfss2cMeUPjMOsj1/UN+F+owWgsqiHuR7X5gWNi8TehKT2P+jxRcj26owsuSpC3kO
	B6fjt1VWC2/7K+TdniMpmc8vxmz/MbGINuYaYAwtqOvR5x74QZypdRPrqp7INm5u8REn
	TwIdvqrIrod91E0i2GO7iWUf7UleI7QgjmcN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vxgJdxH1nmiYPIah131QDPd/2L8zWGMAPNCdFqUCCig=;
	b=cBHZMLJch+qQCzF4uai8bCOvjUducwsxba5sNjH0Y6ghLmEJw5CJQJNsCCmwWUbn4b
	E/+v0F80R69KrFpmdlRFRnND+kz4AXjqNxNTsi3aMt/O/XXQ/mPdl2FJETObNS5/l71y
	HtJlhHWLvtccNFjbh89JfKNA8P1uY89pVADI8dWOP8kQ3WWtkaWXdazqrrTb6SURfeqN
	x/EjekDeNZanD/+sVHgOJ+H2/CVlueoBsNfzSo6wDPr6uWk6685yHlZ0vFXd8l0AoJ/2
	dA4EXMHBTaj+j3lUEB0rCUTKpCnVSAjznPF3UOaIsrO8lFaRftMIDSoqcqL1fKOo+huf
	toPg==
X-Gm-Message-State: APjAAAWACWLDP83/wh9o5AHrdat9k6+UBo+U9TIOh03PI7KY9Ua0oCBe
	arpBDZbHq2Sjzrw4496aKob4Ww==
X-Google-Smtp-Source: APXvYqxkzAeulB1BWGsSLOh6hOJbjrkbfYLhaiuHsLHU97uKFwinJaDhgIvKGOKaqP8IplUkZ/k1dQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr11141651wrw.56.1557747418968; 
	Mon, 13 May 2019 04:36:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x6sm2131157wru.36.2019.05.13.04.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 May 2019 04:36:57 -0700 (PDT)
Message-ID: <000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 12:36:56 +0100
In-Reply-To: <20190508135459.84886-3-alex.kanavin@gmail.com>
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
	<20190508135459.84886-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Mon, 13 May 2019 11:36:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-08 at 15:54 +0200, Alexander Kanavin wrote:
> Add a patch to address a missing format string error.
> 
> Disable the recipe on 32 bit x86, as SSE2 is now required
> unconditionally.

Unfortunately this isn't quite that simple since just disabling it
triggers:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/445

(errors in world builds)

It might be time to optimise qemux86 slightly more which would help
avoid this?

Cheers,

Richard


