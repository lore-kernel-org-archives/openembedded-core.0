Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id CC1FA731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 22:14:16 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g203so45816675iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 14:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/86736Yj7w1gMzzgbvumGePucelzjInxEk1G7w8I9lo=;
	b=jxMsyL4vOfkTLvSgan7JWHW1x0Sfk6f+ioIkI8yqluWu8xCOGFe5aOfBR3AkOKK7iu
	lpFY8+yT09qbsWEEqsTcX/yF6cZgxJWgz6VM0aPzfh4yF+dnhVI2tV8vNrLnF8tbzGu4
	0Zigehq8Zw/tfcbUdPOlWlidf2WxD136pQhKBgkJjO3EB5a31wrbXRm4rLkku2TjFNXB
	cbRErbbN9mo/hZHJ93DenFnzf/Uk8i3/ymWSg4ko844kKzCL97Z8IBx7fCc32e/qXzbk
	wG58wHhKumpEH5INY618x7XbWKdLSnLRFJc11YegQcpQ2uk9u2zjoru3Gfb/fniKvYin
	6S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/86736Yj7w1gMzzgbvumGePucelzjInxEk1G7w8I9lo=;
	b=afKLaf2B43FY97LKa+BlXCN9NjNXi4FLZpEck1Jw9WrA8RMiXrdN73l7I8dQhwclZM
	T7ozL/thZ7wioosQjIqku0oYJrgbpwl4uHmeuxYZCrC1lA3cZICOTB3zM+ZlyknN3XIX
	Daru/WCjEM8nD/3+yiICzquVo6ujSQaebhVd0uC8LyXrg5RHqpuhaLFe1btTv0MTAm3m
	i2EQ+AVsrTWV1pUYVCUIjhtSqVHVQZkuDDKvQD9zkRAvWmhClcj42x9G6r+cwJjfz1Ez
	vo93UBwLKuHxnSXjZaukBlkw1Usb6OD7Fkv095jU/MiAEKsJOY8hIbVXgqBCq64+54x2
	hiWQ==
X-Gm-Message-State: AG10YOQO91KDAMlFQXVuqyGP4syaxQtLoelzOrKDVhzUva05b3l+uoECiICTk5r4c3qIAg==
X-Received: by 10.107.156.14 with SMTP id f14mr56232549ioe.0.1455228856830;
	Thu, 11 Feb 2016 14:14:16 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	vf11sm12882221igb.20.2016.02.11.14.14.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 14:14:16 -0800 (PST)
References: <56B922B3.9070604@gmail.com> <56BAB9F8.4000106@gmail.com>
	<A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
	<56BCC3F8.9000908@gmail.com> <20160211192024.GD2595@jama>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56BD07C2.8090601@gmail.com>
Date: Thu, 11 Feb 2016 17:14:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160211192024.GD2595@jama>
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
X-List-Received-Date: Thu, 11 Feb 2016 22:14:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/16 14:20, Martin Jansa wrote:
> Did you add ld-is-gold to DISTRO_FEATURES?

Yes, it's the only way I know of to build an image with gold instead of 
bfd. And no other thing that gets built has any problems finding and 
running the linker.

I'll post my chromium recipe shortly, although it's not that much 
different from the upstream version 40 (other than having stripped out 
all the wayland-specific stuff).

