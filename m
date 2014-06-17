Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id E9DDD6FF70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:39:31 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 131so5286305ykp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=llBKVSh6Zj1quwUADChCvsFdPNLxJ/dRuYlTiyvfgmU=;
	b=nsRwgQ62tlwU1Rfd8WRhJQAJFOQIqzCkjtkH3Ys1qxVLTFL4oo43xP3nv2pb1B7ud/
	s/oqh1Sppp8cGKWAzW8kHaGBxxuKDXDnYCGaid1uZJtZ3g4bWv2R4YZzUoLEAZ5K1Gjy
	vrqmfmK6+yhOD+sDUBSQa2nAR/bqg79zKagN3oflZ8JxucVRH+YC5M4tzVAZR30zKTtB
	U/vrHhTdohesOWrW44URdzyt22x+FDvyCDyRhHPfletqs9Kf1nkLmwvU95EJKqmbmDpD
	mGDZnOiPsUt6O3COVQJQ7/rlpT1adzrMOQWSYREXVzJ3nIlT7WtcxZbxFugH8FkMqEMT
	PIhg==
MIME-Version: 1.0
X-Received: by 10.236.207.225 with SMTP id n61mr4633236yho.148.1403015972701; 
	Tue, 17 Jun 2014 07:39:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Tue, 17 Jun 2014 07:39:32 -0700 (PDT)
In-Reply-To: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
Date: Tue, 17 Jun 2014 11:39:32 -0300
X-Google-Sender-Auth: iVi9Cd6RJTTR1WsITK5vlajc9E4
Message-ID: <CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Dennis Meier <meier.dennis@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Tue, 17 Jun 2014 14:39:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 17, 2014 at 10:16 AM, Dennis Meier <meier.dennis@siemens.com> wrote:
> Signed-off-by: Dennis Meier <meier.dennis@siemens.com>

I do like the idea but how portable is it?

For example in my envinronment it does not work as I use zsh.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

