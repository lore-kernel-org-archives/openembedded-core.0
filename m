Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id D9F447949C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:38:49 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id t68-v6so9404167oie.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lkr0hyAs8sYW8T0nZoG8OIBHhhckb6sDKJkJb+CyhPs=;
	b=EYNgO7lT1TwGkEJ1sYZ2lLQpHw8auDy/Qzi1eMpz7dtlA6PgRJwDkEtUYIyaR1VVT+
	+CZ31JY5qow8drmvzCVEizv7OOKmb17FhBp/4bs/P3AhmBlC3/Vb4Slgl3iCJRMoL09u
	bLgEgKgq9cnp2Me5FALRhoyAESj9HKpJ/OeJDY35cjMeZIu8e2vHLa9F/xAo4u2gh/G7
	5F17jzOmc2ff45AxRI38YA8ztTX+4kjcBkU0K4fBg+5iRm/Khs5CR9C6Adtwl1UFVi43
	vy4YZ9GM03WinhBFQDnQARsT0CITl8AIWxkUmwr8LeTYscGs1l74YJ0Lu3V8p8K7UF/n
	/4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lkr0hyAs8sYW8T0nZoG8OIBHhhckb6sDKJkJb+CyhPs=;
	b=jThme2at56LlRQzilhnfZPXlmoj4qdxiC2wSi0qN6YMiszVsPE+ZZe4GePmXn4Q9fN
	ehgt863EHFL2lOUP/M0bPGVTpbT5TFeFKEMIU2G/5qmPvzN7hywMnAhQ1RY2abdta/Pe
	3SbYzE04m1bU1ggnR4Uf5oTf4/9VH74/W2M07SKO0P6NPDbtmFz2qhkFYqcSP/ie//2X
	w3xSWMl5sApbUOuTd9H5sBk5JPxK4c4hmvYRME/YKZT06huowX+38Tmo+4uhf5RljdG9
	PCcZYcISEMHF2Ia3nem7V1Ggn7UGZoNpBmGCVT9bMB88ZqmesMgyHbQbYdXC2GJogCZP
	A0Jg==
X-Gm-Message-State: APzg51AjjPh40hM8NYgD++H/D5KgDpNqRUJ2H/qMkRnISEAi/iUJvHpf
	VODqHMivAOzjjcc3NMbdFltm2aN2ZhARELHTrV6xlA==
X-Google-Smtp-Source: ANB0VdZH7vrC/vyG9dhYaSb8gGxHJiYTJ0HA7oEojCFSYargvYFsOpUGO9waOAiqxW86gBmaZZigCwIa7vNOR6mIrjk=
X-Received: by 2002:aca:3ad4:: with SMTP id
	h203-v6mr5703033oia.294.1535218730849; 
	Sat, 25 Aug 2018 10:38:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Sat, 25 Aug 2018 10:38:50
	-0700 (PDT)
In-Reply-To: <55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Aug 2018 19:38:50 +0200
Message-ID: <CANNYZj87uFtRDxVrX_-jmWq4A_9scGpMgH=9xgKYGE2jRkWHzw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Sat, 25 Aug 2018 17:38:50 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-25 19:13 GMT+02:00 Kai Kang <kai.kang@windriver.com>:
> Packages which inherit fontcache.bbclass call postinstall script
> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache
> by qemuwrapper. When multilib is enabled, both packages foo and lib32-foo
> will call ${bindir}/fc-cache and one of them will fail to run obviously.

Do other postinst-intercept scripts need similar fixing?

Alex

