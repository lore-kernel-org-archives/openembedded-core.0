Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F062F65C5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:42:23 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id n1so46681704pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=QjEYIUPTJWjUsd9PFSWJwtbS0Ri8EWH6uJfX/YtiQdo=;
	b=iF9iHBBPa1V5B4/lprbVYh7+6NtCJESttN4A56Td6R4AFuc5nG47wuN/EG150TZAl7
	9V0RobkUIsz5dlTOOk5ZRoofle9TQYAvJLpANiit+TVWVJylMpR0nlnhWmFmcYahnHd/
	fylh0EFB5zGcUpsd1aVX6htjS6qFSl8rNx+sogMykQSRPC5w6KkcV5mnuBD4X4HnuwB1
	2wH+kbZyTfTcTiUYqMUO7OKGJ1gnpsPIdRp4gKq5/2DM8MuRBAPkoqRe0TaVJNmGq0Jj
	BUMrz6QPs2wXlml/RYBblMVp6EQWGorCYJHNbrcQQuEEmWMGlnJYvdwjw/Zd9cDBUtMv
	cmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=QjEYIUPTJWjUsd9PFSWJwtbS0Ri8EWH6uJfX/YtiQdo=;
	b=NLD48KvvrBsV4cUNHb2s5PrraGA1aRsHBAMqLoTurXKbkFepnxd3y3LxUIqrasdqgn
	SEFq+IBzzlhvQTJ02CDn351REAaLi7xdLV5A0St06cfNmV7P3EsTu0hm4LeglQgkzaeo
	l5rMl7dDYJCJs+KbHju8d+032pCGEk2hxuXTxyUtgZUjwZLht1PcrfZ+PHMVjEwUPhi4
	VcNLZbrC8oxFLaaC09g/l4l6i3FJtSrPygKraYoqbSqkTkvC7DFXyYc9zZMRNAFjaVc0
	VMkzJ5tgpHYLG7FBDRAPegKcNG9ax7ABSWTjKL8XY4t8iRY5nqxiECr6BWj+aMvRD618
	6+ww==
X-Gm-Message-State: AOPr4FXelNEYjQECGINhneFABn0DX8XadnaBDhroLihX5eGtWAjiGAh+/OsTC49qTW7i2g==
X-Received: by 10.98.89.22 with SMTP id n22mr21690634pfb.55.1460644944574;
	Thu, 14 Apr 2016 07:42:24 -0700 (PDT)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	ba9sm58584319pab.24.2016.04.14.07.42.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 07:42:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f173.google.com with SMTP id c20so46676105pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:42:23 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.67.139 with SMTP id l11mr21652526pfi.112.1460644942824;
	Thu, 14 Apr 2016 07:42:22 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 07:42:22 -0700 (PDT)
In-Reply-To: <1460638266-19801-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460638266-19801-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Thu, 14 Apr 2016 11:42:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoDY+xq7VvsVY+ycQUbKBK7nF5jaCPkuh5L7WMno7+CjA@mail.gmail.com>
Message-ID: <CAP9ODKoDY+xq7VvsVY+ycQUbKBK7nF5jaCPkuh5L7WMno7+CjA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: Enable update-rc.d service
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
X-List-Received-Date: Thu, 14 Apr 2016 14:42:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 9:51 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> do_install_append function installs init scripts but to enable this
> service we need to inherit update-rc.d class and set INITSCRIPT name
> and params.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

