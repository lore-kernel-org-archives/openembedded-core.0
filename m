Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 801767002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:28:52 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b14so110166078wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IZz9HVEEm019bWPQ6GPCfEYfs2COPserbwGLvCvH84M=;
	b=ROvOg0KgXR7jzMy+6ItwefNQGpp6hKr7lo20zOUbURuDgTI8ntmOwRn7IB0jjfRvWD
	/lM33QcmBhGN9N0/gSEZLyOirfiRXKbOgl9KWHh1Fix5vXbBrzifqs/BORt0dudq2uYx
	pkvfcVGaH3sopXvhk51dzsfAQmfA7TXADHG1SW0c0Qf3wlQRbSkyJCSOKey1uTmZfTYI
	YjsLrE4pkBXUKtsiU8D60uiWhhHdhvohK7YKhOB69BL+5LGooiNmnS/YqkpG93jAzn9z
	XoJxNu4wN5TbD57PzcSCqav+eyVwmLKbB7GGVT0vSwpEKlFLMV4ztycTjpxeE9sOQQnj
	DVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IZz9HVEEm019bWPQ6GPCfEYfs2COPserbwGLvCvH84M=;
	b=Junyrsvbv3fpn2keeeg13A1wOi3R7tEyYnhG2TmDoFAlgEPprV6vOBmMDun6uYB8Jb
	aOWheilQ9eqb9Gymep3FdbHXiSJrnVhaXV9H4c7ZeI8DUPABM3DueRVsLqJiHFIbEOOe
	eqE2cCiPASM1UMBVG/xshNVn1pIelncNFFsAVkwjO7Y2hDq6jQYRVqY+M58nP0mmDOvS
	HHZ/CI/R7MqWsNf5oIXIhIc11Xm25OqxIzhRQhOiZjMOOen0cSoN1/Vo7Nc9QQRqDjeV
	iPWop6pf6bfrMT2EK1WAmI3C9IsAh7XtGlep4NBbnGd1UYGT1xt/pHhugclPKb0DTMzB
	Zydg==
X-Gm-Message-State: ALoCoQkw4VgwTaMUKOMRtpq2ZJOZE7Ko0xNKIDikLgEVkcTMUBOpAcHyf1q1cCdrly3Nx+CVhmcT8r4AZ4F7TE8Mro61IJbw5w==
X-Received: by 10.194.116.71 with SMTP id ju7mr26402037wjb.2.1453105732393;
	Mon, 18 Jan 2016 00:28:52 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	75sm14620442wmo.22.2016.01.18.00.28.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 00:28:51 -0800 (PST)
To: Koen Kooi <koen@dominion.thruhere.net>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de> <56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <569CA241.20805@dresearch-fe.de>
Date: Mon, 18 Jan 2016 09:28:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Mon, 18 Jan 2016 08:28:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.01.2016 15:29, Koen Kooi wrote:
>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> het volgende geschreven:
>> It seems that all machines based on armv5e are affected.
> 
> FWIW, I'm seeing the same problem. The last time it happened it was due to the fixup angstrom does for broken arm BSPs

What commits do you talking about ("last time it happened")?

https://github.com/Angstrom-distribution/meta-angstrom/commit/7f3d898930077710dfa42150882bce60d437af7d ?
https://github.com/Angstrom-distribution/meta-angstrom/commit/4b2e8ecb9a82109022727f6d80b8db56ae493fe8 ?

Or something else?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

