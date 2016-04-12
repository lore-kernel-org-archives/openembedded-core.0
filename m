Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id C65166FF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 13:34:32 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id c20so14083516pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=+e6L5eSAvcpYDSWQyD2OJ7BYQn0yvhTNTF0TWkYocNQ=;
	b=yZ9y/qnMy49iOJavOIRLJIho9l8gjJR6RsldYspm4yDwIOSm4YlPNCA8kxSQxcqS/x
	vPFPnmzexScgxVPMY99aBNAoXpfm6r78vWY9qV3lNrSBHEGJ08SZLXHXjhwTAplrfvMR
	hIWQ8rPEbyqin3KkhKfi0eVTgTo11QkDfH31aCy0LekMT08AlMLxdnet3Kx0xMwtDP0L
	up/Me5/OI63opBM9CstBqJO8Z/88zBGMQJdNde+3nuheXZyhX+RpJm7BU5Fqlu2vVIqz
	PiPjP9Vfx0eRxrkHBHsIu4k6u5pQJLOVEgxO8jKlzeBEq2KxwPenmoKeNmJamAAtyID2
	R3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=+e6L5eSAvcpYDSWQyD2OJ7BYQn0yvhTNTF0TWkYocNQ=;
	b=hEIRyigG1215uO5qnwAP7qnSUKBAKIiqQZxss907X8QxHGl6Jo+yduyekB+rBqHUdX
	YEn4dpw2lzVEex6C+25G7AQ2JKSpLPhnetBFN0yy9HNlJWErihIU/mUrNsSdW4qSrnXu
	Ulm+/U7qnCksmjiDGmiGKYPpFYEunS9HGFSfqicyDnHptjNZx1jegaopqyE9yz7THYzL
	5nG7/uGRW55d3K/RFpulebVn2Cc3bYQ5p1ByBFiZQLZYbPpfYm8fjL8jrYZPi7Wcm6GT
	pdkJQ+Myu33aHrpNgNp57YoPZkBmj/g8s24UQNSl2iGbKurLkNXxcVUItIxsSczo6Ud8
	0k2A==
X-Gm-Message-State: AOPr4FXi3d3qANaxZIZHYFiVfL89mq5OZjGvaGZBfNhgXAR8Xb8DWtIA+cVRLJRrZi6bWQ==
X-Received: by 10.98.33.91 with SMTP id h88mr4703750pfh.54.1460468072141;
	Tue, 12 Apr 2016 06:34:32 -0700 (PDT)
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com.
	[209.85.220.46]) by smtp.gmail.com with ESMTPSA id
	k65sm43905072pfb.30.2016.04.12.06.34.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 06:34:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f46.google.com with SMTP id td3so13796948pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:34:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.157.194 with SMTP id wo2mr4758833pab.128.1460468070054;
	Tue, 12 Apr 2016 06:34:30 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 12 Apr 2016 06:34:29 -0700 (PDT)
In-Reply-To: <7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
Date: Tue, 12 Apr 2016 10:34:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpcrPAh8P=rVn8Z=2oTdcw3Wk=i-gP6xVo+6nRmJY0EBg@mail.gmail.com>
Message-ID: <CAP9ODKpcrPAh8P=rVn8Z=2oTdcw3Wk=i-gP6xVo+6nRmJY0EBg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Tue, 12 Apr 2016 13:34:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 10:18 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Removal of users/group when cleansstating a recipe as implemented here
> totally breaks when multiple recipes install the same user/groups.
>
> This reverts commit b5304ce438666a7418746f4ddd32703ae3188089.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

