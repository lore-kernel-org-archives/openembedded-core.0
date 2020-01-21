Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDD457FB78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 20:22:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so4829476wru.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=AZ2zOX/YCBhEIrWo7qiDNqmIVMzXiwxw0FfHjlLX0es=;
	b=aZ6Y6mC8DbqBpPDsEkgmsCaiKVgQNKyk7ejrHWI9tvyDto1M9ILobjNWof+KZNsAhL
	p3IsXE5eHoUGiLSU0vsrOHYwuDAqznfpMJblXTPsuBV+WM6wxj/O2/lQjVwbtOcg1XYq
	rD3vGR8BWSookTu3m9nIXeCxL+U/Ku/ISO6Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AZ2zOX/YCBhEIrWo7qiDNqmIVMzXiwxw0FfHjlLX0es=;
	b=KT/AY7JolpxnmsylhlsakLIVg8w6dqGR9EJMJAm+ZXQYEvTCzdG2zOr0GkYqUAp3GT
	4AU2aOOREiRwkhAWeeE1XzAtK9JLkhAoqwBwDYkWTr16yXfCNjrCxycypQSRPGSLqxGn
	X64aTAl80CMi9G2PxRIGZ7JnawWXuWYx6/XFoOgOk0PJO8I+jXNLblnPEWcg5+QaeOsP
	vcXb8UMRZdFiOw+lgK69NKOQGUpRX0eMVOroS7Vj32Af7RAMqY/EC7f7ntlYNCP9/xFc
	CfUR29Y3BPwmZsZjT0ejcbGVX5ixTelCBDLg999ppLtpX7Fyeq0ZXqBWDgVeNDog2JFz
	oHWw==
X-Gm-Message-State: APjAAAW39DTTpC+3uHburDoBA3Yxu/aOfY9SfWN3fdEjomJxKtGNHL1j
	+2wWlgtpxNVPofa/CunHFE/60w==
X-Google-Smtp-Source: APXvYqy3Ng70QIyTknwlYoH7Rz569TupOLZCkBdrIdEpeSu2O7JVzqY44/fKdwM5KValaoCWEH265Q==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr7300315wrc.175.1579638148308; 
	Tue, 21 Jan 2020 12:22:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm53170110wrt.1.2020.01.21.12.22.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 12:22:27 -0800 (PST)
Message-ID: <1776d7f035ce96fa5a1b3759e83fdd6c611dca15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 20:22:25 +0000
In-Reply-To: <CAMKF1srhnkkSETdWK0Jb0V8OV-4bwpCLJ7MhJuJ9dOx5T3VzUQ@mail.gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
	<CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
	<1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
	<CAMKF1srhnkkSETdWK0Jb0V8OV-4bwpCLJ7MhJuJ9dOx5T3VzUQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 21 Jan 2020 20:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-21 at 11:35 -0800, Khem Raj wrote:
> This is failing on qemuarm btw
> 
> http://errors.yoctoproject.org/Errors/Details/307410/

That is odd as it passed testing on the autobuilder. It must be
something tune specific :(

Cheers,

Richard


