Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E4C4262137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:17:58 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id f81so9670135iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 20:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=o/k8KrkeI10Va3xEEPUID8fghfiFjsZlPPSuA7mzNAg=;
	b=qznEiV7Jw/kI1zPGOsJYDFIQyXIRbWqyy6tl7074ZOn5w2gWSqD/oKZ60bG3kNdEU/
	qI/s5eMDNp3B2X1JItA9CkAg3oT1+teWr2mB1w6Vz5KkUjMPYoscPhB1kssKtMWX8d0b
	5iKsNZ3APxBK43xSasMsGccbJmQ84AHUUIyAS6UvyKyCI6lPjE4iCooGqqZ9+5CDEGvd
	A++uJWFj7NQj0rDExx4hbIoYpo5soRg97wNaB4RfV2pykB1Zfqr4HsP/hhHd5oCXHMPN
	IraxDjcpsMN5NVaqlaCHe82yCNUqAgOkvV7IekamJLd8adYp/YiEFj/aR1D1N7ykbJZ3
	sb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=o/k8KrkeI10Va3xEEPUID8fghfiFjsZlPPSuA7mzNAg=;
	b=d8V8C/cgi+pcYrvHU7p81a2/eHjXROKOjJPzFvD5pG720RQwUatS14ZDSXbtWSuZdC
	08boJkYXxtGG69nG+wOKyekEj8bQbiWeTEcwGYIcr7lskYBHIfwpC4w79ot3LQB0KPKl
	mS/m0dI8dyu3sljUyCOezfIjXv/QBHc1B4FF75MX7wz2yb9ML+uMkbHlQJOcf53l4bHR
	Qhd3ZXHf/S2aS/adQTU0gxIBQs8yyGXFPLsBDx/UqXApPCRItb/nyZSAS0g3q088NenY
	Wjyd8/cPrFKu7lC3Yx1wVFmyDHX46R42ZWSr9Ge58KMPjAyfbgYfF10WJxQXeO78N8Pe
	52yw==
X-Gm-Message-State: AG10YOSBK6dsYo8vt5YVUJKxVoOZI/DJ2zqBogEudyKmlaV7XmsqrTZn8soLX+8L7CEJSg==
X-Received: by 10.107.134.137 with SMTP id q9mr41775936ioi.143.1455077879546; 
	Tue, 09 Feb 2016 20:17:59 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k16sm978413igf.0.2016.02.09.20.17.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 20:17:58 -0800 (PST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <56B922B3.9070604@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56BAB9F8.4000106@gmail.com>
Date: Tue, 9 Feb 2016 23:18:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56B922B3.9070604@gmail.com>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Wed, 10 Feb 2016 04:18:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've tried every combination I can think of and no matter what I try, if 
gold is the linker the chromium build always errors out with:

     collect2: fatal error: cannot find 'ld'

