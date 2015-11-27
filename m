Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id EBA8E60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:20:56 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so112839203pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=+aX+Ew+Ip0FZRkKZuOqFvMoUaMEIBh/KGQCvYitNjtc=;
	b=K9u6a3Pf5aIhegsjQgbQYwSdHbwr+TqqN6JMzQaanxdG7Ut5hsRVG5yLZ9xc5zKD7M
	6EA4nP3lKvCv7cA3xrL7ihYK5MYJqh/uldo7043VI8cjrgKZDpZEKPm8eaIygdzhXiPV
	LAl73F6xMTBaS9tMwcatgKjp4mMIxbJfjMXTp66/n/iCQtkKK1rlvu2qr+2MR/p+Ynoz
	O7qLVov5SvJaNoYkHOXmv3CVDwE1oHgK/81IlqeYEqWzGCx9DBUGvTIXXxunJPYDWUaY
	2Kb9rXCODKKINDXRBhnsgaoOpQahnubFiaxfj0QjT1I24umNzejKUawnhfQITqZeDf95
	r2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=+aX+Ew+Ip0FZRkKZuOqFvMoUaMEIBh/KGQCvYitNjtc=;
	b=PKzWTX0fBxDkrz38bGsC2XNfs/YwXNqRxyQJuNYUmmDQCONF+o5hC8xREyCFu9/QqW
	tvTHKH/WRyuiCdiyWW5as3lCVltQ2gLHYXYAyIQRsaWjEFOd8ov8Ka5z00iqaTtk/B5O
	RzGDCwGBy2YD6QuEPVJ2SqQDe3MCedpgnP6iZ2Q1j+9Ns+vKDcHRCetltaP4CMUXXE79
	TfvPI7+E3KOtbIxcA4kaGE/jfR68fSTB5HXr6Wg66DI5MehgWAMXqBF4Bzxq0hrqm84F
	XVRYSt10Q6BxL/966jxG5Ts+z1E6bN0SM9UgIbCccLVt+m5XpZzdcyRmyl2WdoBUon+j
	0OJg==
X-Gm-Message-State: ALoCoQlRimAXDYq6yBhbzz4M69/uSnegVC+CKp+PfXLujvGN8hY0rChU7xXzKUf7QpDIAPFok3KF
X-Received: by 10.66.153.139 with SMTP id vg11mr67285976pab.118.1448623257280; 
	Fri, 27 Nov 2015 03:20:57 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	r26sm33456443pfa.45.2015.11.27.03.20.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 03:20:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padhx2 with SMTP id hx2so112925287pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:20:55 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.68.201 with SMTP id m70mr47385913pfi.101.1448623255463;
	Fri, 27 Nov 2015 03:20:55 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Fri, 27 Nov 2015 03:20:55 -0800 (PST)
In-Reply-To: <1448605638-4581-1-git-send-email-rongqing.li@windriver.com>
References: <1448605638-4581-1-git-send-email-rongqing.li@windriver.com>
Date: Fri, 27 Nov 2015 09:20:55 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrzv+Rocscvh6wLf81d=zXcaGpY4eubhFknNGcTc3CgMQ@mail.gmail.com>
Message-ID: <CAP9ODKrzv+Rocscvh6wLf81d=zXcaGpY4eubhFknNGcTc3CgMQ@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: enable systemd support
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
X-List-Received-Date: Fri, 27 Nov 2015 11:20:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 27, 2015 at 4:27 AM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> 1. inherit systemd, and add two unit files
> 2. auto load soft dog kernel module
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

The ping service conflicts with the main one. Could you highlight why?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

