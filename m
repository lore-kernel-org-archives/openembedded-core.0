Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1336079E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:10:17 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id b5so279664iti.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZpzDWkFomhJvErSswuP8aIhgrSH1X2rwEWr8Rt5c5Pg=;
	b=MCrK0Mq6xN902wTrMdSOEMdh2WghsMme3W9MLQxsu4RAEQiMo1Wierm0nSpqqY28/x
	JHorsQAi3Vc1CpxaGPHI6v5qh+plJgoUExqn3NtbcdR0UKxbx41NImSk6CaL2+uaXUjx
	37oeSKO2EBdEnijWE81Ymq4IrFhRdmMe1zgl6dL8WQNuUnPZGYNIgqkfQu+azTUMiozc
	KIKPfv87hMZysQMeRl+WFhWSfoBNGMBagt2tRbzZA+1l/fbY6KkLF+EwrkwRP9e/PsS9
	tR9FLefrsZHLuVwfH3WOCjcqipCOZKqwAyESKWjzwOOMJkEBF8C5ShMaru7hqp+n/iWK
	so7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZpzDWkFomhJvErSswuP8aIhgrSH1X2rwEWr8Rt5c5Pg=;
	b=tkWZJGSHB26YfNbk/YTMV8HxIZkSbExbUh95+JM5vUK3Rvj1eE9ASpQ1xwP/hG13dX
	i2drKa2qn8DrT8bXjYaZ36yC1Qs3dwUqtHYXaL9CqFoLBqLt9CWywkpCseIlZ3mz1jcg
	pSVZM9nwreNFeeGoEAEShbfDcqa2UQbZ3aZSRC4N9EWKCp3e5k7Ya7shZMgB0zeuQkYU
	1yokzKY1ywgHvIBkWT9B5QY/dQjV3uk0TDSA6ZvldycMiJwypyAijoDf7o678x6oDcB9
	XBcfNuRDcIRud8SK8LyJ63Iknve4p4UyQ5yEWWAw0ub0djyNCJyM9rBuS0C0e0FALekM
	k9XA==
X-Gm-Message-State: AA+aEWbwIfi7ie96psyMfcdg3cARqe8lG7zKpTjXY5vYFjsaskVJB16g
	e/5PP/X74aYop4oKENT8u2aRajXzXFZnBzUXt9Krmg==
X-Google-Smtp-Source: AFSGD/XqJLJSpht9hXvqVKZRU5tOGFyxPr9h3eD79/bQscgwBppYQO2zYG2SjsQke7gu/j62ZtO43a/sEGJZfGCigUc=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr13291117jal.31.1545070218393; 
	Mon, 17 Dec 2018 10:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20181217180651.16040-1-jed.openxt@gmail.com>
In-Reply-To: <20181217180651.16040-1-jed.openxt@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2018 18:10:06 +0000
Message-ID: <CAJTo0LbWf7cWdwCqXGOfr+dcqWEeP9ZE7cS-AK6x++uUp8gG0g@mail.gmail.com>
To: jed.openxt@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk3: enable wayland banckend
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
X-List-Received-Date: Mon, 17 Dec 2018 18:10:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Dec 2018 at 18:07, Jed <jed.openxt@gmail.com> wrote:
> It is disabled by default, and required for things like mutter to
> be able to run under Wayland.

From the recipe:

PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl
wayland x11', d)} \
${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)}"

PACKAGECONFIG[wayland] =
"--enable-wayland-backend,--disable-wayland-backend,wayland
wayland-protocols libxkbcommon virtual/mesa wayland-native"

It's enabled if the 'wayland' DISTRO_FEATURE is enabled.

Ross

