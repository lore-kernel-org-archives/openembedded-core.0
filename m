Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id DA3856D1D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 20:59:57 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id m15so19546022itl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 12:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fiRpU0L8hgJmH0rMgNnvlOtMRah4Uwtq7EjI3OIIVYU=;
	b=ugiy8rc6XPhAONjdLfdMF+fl2gIHJ0ycmGrroGonjTMo1u60b1XxJaDHYFP7u4/48+
	duSX55d+CrjBZWBZMTKh34mZx2wsMmteYREmWUzs8uruvzv+Yoo+OaC2qsLlGAMEK8n8
	6VjuzZAhj4uWAHe7kofYFVqSg71z4w8Un5JLnEawnpHE5UUWBPk6bt8DrvHH1RAysZoH
	pxY3hFiWZo+klEOwI/jhInUmzbnDApaKA8p9nct55SUQTgN5gnc/SB0Q8hppQd7NpV5h
	0aFithMRLtP4lwnPAjAFjCAL+JEFASZTJlNhhqsfMLVQb7mqtuv13AbyNur3t02pf9cP
	FukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fiRpU0L8hgJmH0rMgNnvlOtMRah4Uwtq7EjI3OIIVYU=;
	b=Ek4xzaFhHWrvZId8CCYKqQFyeQdYoXdzKxE8Jn6Mt+0ZuL1uk46w5USwFJD/Ttsx5M
	Vb7V9YKLbrTqKWAeuX0H/GYBp2Rga9TtaxB8ghaa5mfP+dFmv0uMYml7GN7YAaV+sskv
	J70WIln5JQkrBP16RU5lebqUfkbQ0XProg7seTAdw8FJZW8byur1jczty7NSmMujSCzA
	KufXVWhw/l3ZzDlAIC78juLAkC7SyiKhIveOoogLmUY3eAQPRd5Y+vi2zrtLsGEclxjY
	gNPoYkD9hBlXfWM1HYwGd3rEuU0h3qB9zmJx2359ooeOk1cTGgafhbyOnwGjla5MhcnF
	GrZw==
X-Gm-Message-State: AGRZ1gKCDA8+GRmPOrIwsarbJy5xt7nzMEGYyaciDgCWYRCey/hDCC6C
	jk/XRZyg5vLzd3ZpHW2ve5mbmunlyPGU60M6pOwnaQ==
X-Google-Smtp-Source: AJdET5dSpwYGhFQWOOZUxoP+b7cgp8XxaEuM5XNyTKgf0DJ6O66PPTaw3V9BAJ2KkB7ReFhPPtEuAFZxYOPXOSiZPxk=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr15738101ite.130.1543006798897; 
	Fri, 23 Nov 2018 12:59:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542778410.git.Qi.Chen@windriver.com>
	<dc2278cac296d5ad9af04e0de849d0f9e0a0884e.1542778410.git.Qi.Chen@windriver.com>
	<CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
	<e88d097c-c9f2-2c07-b307-cf5a522fb3ed@windriver.com>
In-Reply-To: <e88d097c-c9f2-2c07-b307-cf5a522fb3ed@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Nov 2018 20:59:47 +0000
Message-ID: <CAJTo0LamPO9ouU8vOxXnkUuoPEr61tDmhV3NN4hmGka=oL=yrw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] busybox: remove three hostname test cases
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
X-List-Received-Date: Fri, 23 Nov 2018 20:59:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Nov 2018 at 02:12, ChenQi <Qi.Chen@windriver.com> wrote:
> >> 2) hostname may set to some value, e.g. qemux86-64, which is not an entry in /etc/hosts
> >>     This results in lookup failure when using `hostname -f' as there's no entry in /etc/hosts.
> > Let's fix the hostname setup so hosts is correct too.
>
> OK.
> Currently, we set hostname to ${MACHINE}. To ensure it's also an entry
> in /etc/hosts, it seems that we have to default it to 'localhost'. I'm
> going to test with this change. If you have other candidates, please let
> me know.

What I mean is when we change hostname, we should update hosts so
${MACHINE} is an alias for localhost.  Like my local machine has:

127.0.0.1 localhost
127.0.1.1 flashheart.burtonini.com flashheart

Ross

