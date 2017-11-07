Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B57171AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 00:32:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b189so441337wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ms+m1b5YVIpMUJvO0T0ESYhX6pLclmOFdooH7+skpRA=;
	b=XCpmlqLfj0TJqJVZQxz96Qu26jcKa2qDZkwpe1FJNj1XqKMDHWZKTlgyIu5McRtsQs
	xThyRrJPmqbNH6xMgrXwL2f73AjccQ/qRTfGWedG6qJF6V/PgNP7MWkb4zNFhHKya6tC
	VkbXZu7bYpA1UvYfxsW2SmlRTpQpA4DCOyFsEgjhRSLymua+cyYGZ6LD+OCTNO7mWlzv
	vh4w4K6FxK3nhT9TiPdXM1gb+KCd+who+oEn2oG+zeTNJCsVSFumly17bWH7QtJOmtBq
	qvBN1FWKEKy/RPMLGqY8BaF3YbRo1vTg1T4o5YxM6QatNThmx7E4D3tBcCS7uncQBrVR
	YdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ms+m1b5YVIpMUJvO0T0ESYhX6pLclmOFdooH7+skpRA=;
	b=oZC2pP6TQ6yyEy/rM5Y1AtxGJnDLSPMt96ZYeQ0SWYDoM9+sVWR4/IGrmByrIt0NXp
	/s1YZ/qEakeIlqs+nx4PHw2J1ldzUbQ5UGpiGo94vbWjXwZGc3XZygOPWFpR4bndhILY
	jwoHAAm0xdL5Ru8sBWhNmXgzy97oTlG18Op00rCJjJ/3TuHFduD2yKpKRoiGif8JOrOU
	nAyp31yI4xVn2Ag+6YttTC5wlf8T857HETXC1d7iZpzU/VQ7tzrNk9IVRX+ph8RXPZZP
	c+GmZTa+4YXb/U0NsOinfHWrAOu6ZIKEmmIDCsZEJp/7OmqNfWe8Nb9ZJlEdwNWZ7hZN
	Wj/Q==
X-Gm-Message-State: AJaThX5nRkuvdIevCekwb9Z5KX+BdEm9ZXKy78YY/6cHxAU5PTzYpDZu
	PHE4YVREmYHiZfOgzEd8andT6lONNAUy1O8NGWA=
X-Google-Smtp-Source: ABhQp+TRnuObokNJ0SBI8/JIoTpHIIOty5JL5GVeDVEsqiKofOmJNyA1lnOHOz3mjIvbseZMEUwrDn7oBhFuBHEgtAo=
X-Received: by 10.28.54.89 with SMTP id d86mr6290453wma.101.1510014766814;
	Mon, 06 Nov 2017 16:32:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Mon, 6 Nov 2017 16:32:46 -0800 (PST)
In-Reply-To: <1507893976-31129-1-git-send-email-liu.ming50@gmail.com>
References: <1507893976-31129-1-git-send-email-liu.ming50@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Nov 2017 16:32:46 -0800
Message-ID: <CAJ86T=UYWBq1SfqAU8znyfpZ1NgLWDTy6YMc2RhrcBK=W+2V8w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Tue, 07 Nov 2017 00:32:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 4:26 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
> the default terminal, when I run any of the tasks:
> bitbake busybox -c menuconfig/devshell/devpyshell
> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>
> I got a error as follows:
> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"
>
> Seems the environment of the process calling Popen is not passed to the
> child process, this behaviour is a known issue in Python bug tracker:
> http://bugs.python.org/issue8557
>
> It could be fixed by using an absolute path instead per test.

Ping.

A similar fix is also needed in pyro and morty (where Ubuntu 14.04 is
still an officially supported host).

Using an absolute path here seems like a reasonable thing to be doing
anyway, so unless there's an obvious problem with this change, I
suggest merging to master first and then backporting rather than
making the fix morty specific.

> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/lib/oe/terminal.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 9eb19a2..94afe39 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -224,7 +224,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>      import time
>      pidfile = tempfile.NamedTemporaryFile(delete = False).name
>      try:
> -        sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
> +        sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>          pipe = terminal(sh_cmd, title, env, d)
>          output = pipe.communicate()[0]
>          if output:
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

