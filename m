Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 20A4E731D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:36:19 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fe3so89559401pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=s8/bt71D2bH104lXJcbEp3D2TvX9NbIykzuFJSQQk0Y=;
	b=zZRxYiKbrSt6FEYKA/T676xCAhnkS/DpXdIDD0pN9t9b8KRs6Nb+SL5x2W5nwaiEI1
	3vB6pS1q+yAFWgqOV6UGzY2PtrRT+InC1jYc0p1NgKGFyijYvRpwXNfOGE25Nu/vhOlc
	JcIplWIGqygNw2iN0I+lXEjCkj6STdaMEIDKwRzzzeGuohqnAAA+pCqjmNm5uTPsmW25
	AbukOxWY5hZXcHpGlV4Fxg1M33TnepnGcz2AhMYKhF/ffB2SRYs9l7XjmwgCq8eyvNm0
	sFQUghaGxAM4+Egn3IiJUrcdGm7gq5IdaQ82zEs/nQnHMr+6vGAxYiaf13rejBa7VByS
	KEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=s8/bt71D2bH104lXJcbEp3D2TvX9NbIykzuFJSQQk0Y=;
	b=LqMVmLEkbF70BXSltCk9Eq5+GxSpiE3C0HmCG/cOUvobvoOTzrTTlvDspgJdjE7fK0
	Rd87TCnpbtkG5zvf3HfBQX3fKux41I4sY7hr5ucqS0TW7RF0rpu+AhEmbo1eGY4Vy0gc
	4aEGm5ZNkXchHpiUi2IPeQaofaRGH+MFth30nsG6OR5iyI/qt6yPUzkN67g2QSUGvT2b
	oNY9BabKW1DqMURpTkhG3zoy3eanXlbu4LwUeN2W9SEV2rQUn2Z98qRDGwPQ8cJ0OBX7
	33xmw9shdxvsToAPSG21whazQ9nQPp5Ny/5IQtUtnVGmtqUBizHte53Un6FJ6rwruzc4
	9IOg==
X-Gm-Message-State: AD7BkJLmB03wc4cixr1BHkGX2m6EWFDzwdMP1xMMMVM75cFA9Oj5CYJhQ9XWEFHoBRQzZQ==
X-Received: by 10.66.249.41 with SMTP id yr9mr17984743pac.86.1457721380161;
	Fri, 11 Mar 2016 10:36:20 -0800 (PST)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	f66sm14592808pff.8.2016.03.11.10.36.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 10:36:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id td3so78774433pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:36:18 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.176.10 with SMTP id ce10mr17436749pac.68.1457721378141;
	Fri, 11 Mar 2016 10:36:18 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 11 Mar 2016 10:36:18 -0800 (PST)
In-Reply-To: <1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
Date: Fri, 11 Mar 2016 15:36:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq7iKp=TQ2tzBW4K4bCEGEeTmjMNR=hVRcen+xc7_hPBg@mail.gmail.com>
Message-ID: <CAP9ODKq7iKp=TQ2tzBW4K4bCEGEeTmjMNR=hVRcen+xc7_hPBg@mail.gmail.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Fri, 11 Mar 2016 18:36:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 2:58 PM, Daniel Dragomir
<daniel.dragomir@windriver.com> wrote:
>
> This patch adds tunes for 32-bit armv8a platforms. The user can select
> little or big endian, hard or soft float, the vector floating-point
> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
> extensions.
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>

As we were in touch and testing this together I am confortable to give:

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

