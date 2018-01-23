Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3C5F7827D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:16:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f3so4352817wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 12:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d/AsVQYfioKdJ//QjI7cmgxYJqLc2kGr89pkGd/xE0Y=;
	b=XhTHrm6umKlzKPRwLE+cnMyEFuU7oiBDkL+0mjKUTVnAWvYz4Fy9+9Z35hr3UIpzMS
	nbFuE9Oxpj+eoYpRUyuNXdiUD7sfijNMlMXVcKqWnOr/ZRdKUTD6W9kU4W2MnuyxfPRh
	wj1Hk0d7T1pqdDQciauntpf0mFoTRVkd5IhAdiiqkINCCkLsT8J/b0Hf4MhH44dDgzWp
	UR/m5K6nheBlVNQHQT/0YersCO7/z8xyHtOBh1RXn11Hq+Zi/7zrGXT6PCsWrZKJ4d+q
	6wfP91CSjqq/VlOwy9XIfOotrQdVFWw9N2KUJ1bdlm7aWzvkBQcE69RGWNuloZvs7ZN8
	fYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d/AsVQYfioKdJ//QjI7cmgxYJqLc2kGr89pkGd/xE0Y=;
	b=USWJWEr6mzOi+zeuUH1iC3Q7nA4csbgzrT9y8nPx6YgEpjNrH9G1buOToWQ+HhfUVz
	ArXsTlXb2Rz50JKmT/nQCud48InFP7ZVrgYVwrepi+72u0hhwkO6NMsD4ZI07/aamS7T
	DUxYvr1SVFIR05qe+IbgYJYaJQqP15AZ714anCqqYayh3iuis06iG4+WDyWntY+byU4X
	F+anoUA1LZnYhW8nEVdWfKr5H25GDi4ZbZICK6B/eQb/fq0HD0jkmBZfjAKVG5c+Ioor
	eAbXnbYqHbiOMEJk9qknHcenGvgsvNpLiXhpRslqqpjBfpu2OxIyIkoQDVrzMyy6TT6K
	GZCg==
X-Gm-Message-State: AKwxytcWXxbI6fyucTb4NK4l6bL+jRZNtQpA/gKh6fwS94P3wAwswVve
	b27fYpTOwLk4L49lr6qghJQ4sGc2JLfJrW6X/mQ=
X-Google-Smtp-Source: AH8x227vhSkimBYQyXa7R+1j9Vx7BpMjL0N02BBTUzkPmxgcJDQFbBOKsRPklkhb0mG+7pw52zUozdgwwgDSGZpto9o=
X-Received: by 10.28.53.130 with SMTP id c124mr2597843wma.110.1516738588292;
	Tue, 23 Jan 2018 12:16:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Tue, 23 Jan 2018 12:16:27 -0800 (PST)
In-Reply-To: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Jan 2018 12:16:27 -0800
Message-ID: <CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Tue, 23 Jan 2018 20:16:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
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

> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2117c148ef07d84bc605768e3b3671b0126b9337)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/lib/oe/terminal.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 3c8ef59..df4c75b 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -67,7 +67,7 @@ class Gnome(XTerminal):
>          import tempfile
>          pidfile = tempfile.NamedTemporaryFile(delete = False).name
>          try:
> -            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
> +            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>              XTerminal.__init__(self, sh_cmd, title, env, d)
>              while os.stat(pidfile).st_size <= 0:
>                  continue
> --
> 1.9.1
>

