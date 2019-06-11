Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFED7E638
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:49:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s7so10104928iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a255fX6QK0uBQJRm7keTQuwu0IlZv+Hk/w5jZfZ8YDU=;
	b=AEEv4aGiq8T1AMnj01Cr1efnCBha+zjuuzzw5CNqONYsKSpc9E7XAEv0rpUxkLZevN
	rrAdESY9yuwhwwWSS7mDukuyrH6ACFu2pQfEGrBK3u7F4DaD02phj+RBJuF3xLuKUsfH
	KFRcoTipiA2gm196LSFckew0KGHqqjKhLy0IazpPcYC2c3l86GTuyJCoJHU8oLizdNCC
	jZ7g3/IDt4owotDAtlZBVAToV5HdQXJMzelnYzojGec9o8DYlp7XMwm6aipyjoNh1W9N
	OZZs4m6PrinnpX12FGgdyQaeJirU5Q5KbQSZT4Q7wuhhNybZuJQEauZxSv72JU8Y5lf2
	g9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a255fX6QK0uBQJRm7keTQuwu0IlZv+Hk/w5jZfZ8YDU=;
	b=UALUoktYJYq93tueGFNdw+oL1V0QsWiYe8pcz5+AcD52VyZxFyiHIKjfleOhjtyK1F
	fqSfaXnD4Zok2VPF+00lHQnerRPDp5P2bGwTfvtiKRM0WFYzDxwZzhgEb/bYuwd8ROgV
	GlkbmVPO9sMBuK5elJ7KoQHnoxmlhHRk1m/S0V1TUq0lXbwpAe0ud/Ky43kk2lWYwWLk
	g5jDo5OCWwXE7FFj9rV621lcp7PAk4unVgG+0biUjlBdx3fXJLEaO1aYhXA5pERAmxU6
	VlLww0uoTgmMG0obTBZsq8jUnA5Fy4DtcrpmIIn8JQs0TO0d54sGPwmk6NeZYLO8FoWH
	wQ2w==
X-Gm-Message-State: APjAAAVsSDfr54LoBMCcNQ76k2RkpQnIxrKoivGGPVCySwbZhnpasydH
	L0w4ZUeT5OiYo0NEa/b59IzIE1WEEvYnzHg9mepdVYfJ
X-Google-Smtp-Source: APXvYqxIw8AY3vcs+1rUMXEKcymEcjaQjxhDcttUQoPyKbKAZYMFWhjWX73Tsrul5eUGwmMgKe8sQgdyv+yQEdG+rC0=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr44766550ioh.261.1560264582553;
	Tue, 11 Jun 2019 07:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
In-Reply-To: <20190611142607.18038-2-quentin.schulz@streamunlimited.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2019 15:49:31 +0100
Message-ID: <CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Adrian Bunk <bunk@stusta.de>, andriy.danylovskyy@streamunlimited.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:49:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2019 at 15:27, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
> +from oeqa.core.decorator.oeid import OETestID

This was removed a while ago, can you rebase the patches on top of
master please?

In this case you can just remove the import, but please verify the
behaviour with master.

Ross

