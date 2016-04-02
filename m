Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 85F0477038
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 11:21:11 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id tt10so109640951pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Apr 2016 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/v/F0uaV7TqTYlBeEG214niux1sXu+0PV6JWhZ1q0OI=;
	b=avfprw7mVJOkpgUBXZOEwJXxMWtX14kkss3IH63oix/RacAxZf5LFAox+F6HZewzOZ
	f6qL6JeTk+nUgzQW1qn9E5pP8TMSiwlDqDVDiLC+UHNDeW7p+FKuwTrQdvAhnGOROQyA
	RFzIub/xBMSte+s+tXz495ETEyKpTSJ2eckoCHUZqd29Ps3k0j8UqFGUgOq7qhAHh5sK
	OLOicB4EDv3dGQPn1zOkfLUVHwVOlYVryJUFBPe70kpFxAfws1kuxDgEegTCHEQY/Mz/
	4nNWliOXDab9AWEWoBsYgms4++Np0S2YjFV3w5n0coyiq3MZhjQ+sufmLnmY9iiCTj33
	27Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/v/F0uaV7TqTYlBeEG214niux1sXu+0PV6JWhZ1q0OI=;
	b=dFHDRebCJGO3CXDPAdZpUFJGyJgV+V5qp9sMv4aUoyBEoGGUI+A5wc/4J2hZBe7fIo
	Rcz8HTX0eFVUcnMEWA7FXvsXz6oxreCxkcZiGU5ei623K25z0NlUCDqPBs5d7Nllj3P1
	xhBXYDvlEQzqb9Rt72+bnQfuWO/juR+R1h/ZGDJeKPYOZue0dy0GcrTnEsKJraFJobYW
	dd1s2qBrzM8polnGfkJ7LfduWHKB5YMCr3wcggQmChbZQ9ARw7RCSEK9V/eHgG5rRDt6
	9VX7ugnjT/rpgQ/oHWV+3Z+iXFivBPHA7AOy2DghREsID1O+nclNBQ+jgK2rDRP+2JiY
	mrdQ==
X-Gm-Message-State: AD7BkJLwQapuQ/V+7kNw46ETzkhoZG5PAygt9aJuKkWhTg2H/XNRgOjSM8YvAe3pMinljg==
X-Received: by 10.66.118.166 with SMTP id kn6mr10533065pab.33.1459596072702;
	Sat, 02 Apr 2016 04:21:12 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	w27sm26279692pfa.67.2016.04.02.04.21.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Apr 2016 04:21:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f41.google.com with SMTP id tt10so109640565pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Apr 2016 04:21:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.251.10 with SMTP id zg10mr38043674pac.1.1459596070606;
	Sat, 02 Apr 2016 04:21:10 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Sat, 2 Apr 2016 04:21:10 -0700 (PDT)
In-Reply-To: <CAJ86T=VQxvgYomwYScxG3Ht__bnJT5nysJeAiKVKWSeJ_6=NDw@mail.gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
	<CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
	<CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
	<CAJ86T=VQxvgYomwYScxG3Ht__bnJT5nysJeAiKVKWSeJ_6=NDw@mail.gmail.com>
Date: Sat, 2 Apr 2016 08:21:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqfv40aWk-hTief9_v7pVsi6f-kLsjiaHpDe9W_d+TVaQ@mail.gmail.com>
Message-ID: <CAP9ODKqfv40aWk-hTief9_v7pVsi6f-kLsjiaHpDe9W_d+TVaQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Sat, 02 Apr 2016 11:21:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 1, 2016 at 7:03 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The floor is still open for discussion for 2.2. One initial question
> seems to be whether we're aiming for a point solution for armv8a or a
> wider ranging cleanup?

I think we ought to work on a solution for armv8a and basing on that
we can clean up the other things.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

