Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB9D65CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 11:02:24 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id z60so2180536qgd.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wgAbT2aZoSLQmzPc0+0YdqhG08Ua1gq0QWt3V04VYzE=;
	b=nojdx1bONIKuMGwhsOUGy2CQ+wyMU7eOdxDL9uGqBYhoWOkd+t5C23MPjxwpP+xHDS
	J6OLtLUmHi4PDczFUB4HxkwTN2d5VBG1nNk3Qj/SCYBO4TGdebgLNja0pKvvIUGTcW8a
	xbdhSjXTJEnVSF0wYpZsAqJpLhOw69xLCykOkH1n3XZwfbQVz/VX3jG1v4VqBcl8ZZG3
	a9802SiK33ezLdZnQN5Qs/3TfHC5jb+rWU2Z9Np0nfaK0ubXLZ8hD5yN2uVJse9wLaww
	PIcz0JL0zQnGTPGsg519E+tX69a9bD61uy/LUdxI1HO7UPtwdMTqyW0qwe0bAPA7O9Xn
	Apeg==
X-Received: by 10.224.120.3 with SMTP id b3mr3529094qar.9.1415358145315; Fri,
	07 Nov 2014 03:02:25 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Fri, 7 Nov 2014 03:01:45 -0800 (PST)
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 7 Nov 2014 11:01:45 +0000
X-Google-Sender-Auth: lf166CHXvIp4-zCSainLGBRxiOU
Message-ID: <CANyK_8eJXjkRzPNsEnvbj6ve=DQ-8YkXUnG9uTE5RqmG-GEF+Q@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Fri, 07 Nov 2014 11:02:25 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 08:51, Kai Kang <kai.kang@windriver.com> wrote:
>   gcc-4.9: redefine default library install directory

>   Revert "gcc-4.9: redefine default library install directory"

Can the original commit just be removed from the series rather than reverted?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

