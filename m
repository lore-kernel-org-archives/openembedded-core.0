Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 79B5460B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 05:41:14 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id uy17so1765861igb.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mkp3qeui8wv4jNOcay4p9dpSCzeTkgfnd/pErrCJTK4=;
	b=w/wR9J49I57e/aDKEftSp4SYSb3WYuS1vdveTYMKkzh63Yvi3hUEBYnXs1VI1zUYS5
	r/vAjMy2o/yWs8rVKla48eJaAg5lRDIe6ZVMJVNHC6napQL0i2MMWKjm3tFOMWbyy6r8
	qn0h2iXX93sxWCkb9CPgwGZ0Th3uXuGo4cE2I2SRM9y8M7dCmScUT/K2VUonwN5tOEtW
	bWuyi5QCWa/GzYw2IiRs3zUZeOf6sJ40fANjHJwW4C8eShJf4LEZg5yX0Bhm8u20s6Lo
	E900KEf4JZtTsr//CRXK2bMBnpB5mnMi1RftV7ycN4OY+KKc5QeM54e/B40hIb2oiKPS
	ycWA==
X-Received: by 10.50.49.109 with SMTP id t13mr7678690ign.2.1396676475503; Fri,
	04 Apr 2014 22:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Fri, 4 Apr 2014 22:40:45 -0700 (PDT)
In-Reply-To: <CAPphmgb9DTJ+K010b0CaqZM-_DCiOtWj7mhVPzMvArHczbyKLg@mail.gmail.com>
References: <CAPphmgb9DTJ+K010b0CaqZM-_DCiOtWj7mhVPzMvArHczbyKLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Apr 2014 22:40:45 -0700
Message-ID: <CAMKF1sp6J48rHgHGO1NetR9v5_J_eNUbEyW=s0VO7Bp-fXarqA@mail.gmail.com>
To: Jate S <jatedev@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] samba: remove talloc from DEPENDS
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
X-List-Received-Date: Sat, 05 Apr 2014 05:41:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 4, 2014 at 1:37 PM, Jate S <jatedev@gmail.com> wrote:
> samba: remove talloc from DEPENDS
>
> Samba has a DEPENDS on talloc, but the recipe runs configure
> "--without-libtalloc".

FWIW this should become PACKAGECONFIG which is disabled by default

