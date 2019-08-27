Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 306CC7ECF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:41:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v15so3819605wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=j3ZAQidn9yg1MP3ThbPcAAKihazoWP0WCnOaCuifY6U=;
	b=R4cLRmp1iCOD58C2N7lhdGdv8f9WlB3yM4BcWROm+geT8uMhyxIV+zy/heUxFR4R0K
	Po2+Y+7gKvPBsS0yHwu8Jt4j2lH8Q/qC52byzyux9WCmry2di/490dHaNSp5FNQ5sExX
	gwdtv/GIS4DCQLoP4oM5Lm9zxpJPloqmoyn8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=j3ZAQidn9yg1MP3ThbPcAAKihazoWP0WCnOaCuifY6U=;
	b=TpXi6kZC4tIGOw7B4f/yBy9YX174lnLdQOvkBShmcMkz8cVjafE/96cmqt3hdLkjX2
	yDx7App84qsN1WJ7Smrg8Z03gcfXHq9EJYbkYkOl3J0lZywIBWrC+VVYPGN216SOKPSr
	Y0b2jg81+ouI1PaPoQfNpU8Rr5r3BsjWv3RTCXLpuBDNlTPvcfiSHcRV7SiQyE2KSExc
	WObYDl9Jkg4uX0Djo5SSlRwCC8JNHthPCht4SSKctOZMHuX5JBtBbWU7poWgbsN+dCEX
	xH3/pObWa6POk0IuB2o0h/tSQ/zcHLTN4mmTCAxGk9WJAwdVCeZtoIxG1Nh2TAqPBjxi
	Bf1w==
X-Gm-Message-State: APjAAAU/3Ns+J1h7Bej2Ery+RYYZnnmsZvBsnYeS9E2kAQTK3PmBPA9u
	C9e2ZVSVrv7e6dKAa5W5K+Yhuw==
X-Google-Smtp-Source: APXvYqya/Qr+ffvyIMNggquyQpis42mztiX6M+DTVaBR+1378EFku/lzupTwcHUZtHWGk/1Y66uUdQ==
X-Received: by 2002:a1c:9889:: with SMTP id a131mr12656969wme.22.1566924096841;
	Tue, 27 Aug 2019 09:41:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f7sm20698253wrf.8.2019.08.27.09.41.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 09:41:36 -0700 (PDT)
Message-ID: <287a87d493bfea06b4f8dafbb219f0d390646d0f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Joshua Watt
	<jpewhacker@gmail.com>
Date: Tue, 27 Aug 2019 17:41:34 +0100
In-Reply-To: <CANNYZj92UK7HsdezbX_X3mWRrasUbTLfDMhnxLf_paRDuzmFZQ@mail.gmail.com>
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
	<CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
	<de80b1e5-dc0e-cabc-409a-0c8c84bc8ef2@gmail.com>
	<CANNYZj95TRH_+XELYLHGaBrg5gFfgOrpV+pvL5EjfQiXXWavEA@mail.gmail.com>
	<9a4134dd-dbf3-929f-379b-4ea8e3e098ee@gmail.com>
	<CANNYZj92UK7HsdezbX_X3mWRrasUbTLfDMhnxLf_paRDuzmFZQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 16:41:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 18:16 +0200, Alexander Kanavin wrote:
> On Tue, 27 Aug 2019 at 18:12, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > It's not populated just once. Any task can add things to the RSS as
> > the 
> > build progresses. However, the RSS is only cleaned out at one
> > specific 
> > point early in the build, which I can't recall ATM.
> 
> Can you point me to a specific example of tasks adding things to RSS
> please? I'm fairly sure I haven't seen this happen yet, so would
> like  to know the mechanism and use cases.

It definitely does happen. An easy example is quilt-native for
do_patch. Another would be file-native or rpm-native for do_package.

Cheers,

Richard


