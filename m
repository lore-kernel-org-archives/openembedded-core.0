Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A53606C10F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 16:45:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g3so22825465wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=NRYIbY+pkqcy97UZYIUCqzSMFYN5Jf5zLZATQA3NY7w=;
	b=IVcsSKmAxqCWrN1jdOe0NkRHz6W33FNZh4arScKmcW3gYAL+JKfHvooeALpNsAyLCy
	nbg9Uh5qx0BItVl15EIRpA9vYXAkv1/uqMqNNjWXKxVEsKbuzck4FziyZjj/6z1sTBp9
	PUFbUzjZwRpd5KdkxF4diheDqmYNClAm5Y/dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NRYIbY+pkqcy97UZYIUCqzSMFYN5Jf5zLZATQA3NY7w=;
	b=BdY9y5AnvVHyQT/p3uktq6qCnSfcX4UTA4GHkpF4oy6bSxRWphmhDx0NMvdkUkws3K
	hUcTi+S0rSVL+JDAfSMfYqn/RpKAlogf4a+Ub1y8mlyEei50tfnQkM0dzc6hkxtJxl2k
	myKmcDHQGBwDXYxh5lIJ+ACTWQcz20H83euUnfnS8FNWtwYz/j0wkd+XoLC1dxsHrPjx
	cOJHl7LhqzM3H/Iiy1XlNV4vqBxGsmj1FVKPRBkn0Npnw8sBA/sVJoLSQ/Iq9hhi0uKB
	riP4/HnRVBteMwZJYgZ23AUcNo5YnMG5x7MmC6cSgjYNhucDBq6ih28CCs14POJTmRha
	9WYQ==
X-Gm-Message-State: APjAAAWPSQwde7zR8q/KfdwZnR17H0iDl9rESunWsgJCbw7WV9pICYdu
	W48nOGej0bnyitjTOSGbWOjzEA==
X-Google-Smtp-Source: APXvYqwUHLIx8OalSnJQn39bBG88dqLXFLURJNQh0zKiQMzr4p5EAeKLVgxPF8NES4pgFsRoD84dHQ==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr48648085wru.227.1555346734422; 
	Mon, 15 Apr 2019 09:45:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f15sm62962548wru.21.2019.04.15.09.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 09:45:33 -0700 (PDT)
Message-ID: <99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 17:45:31 +0100
In-Reply-To: <CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] package_ipk: handle exception for subprocess command
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
X-List-Received-Date: Mon, 15 Apr 2019 16:45:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> Ping.
> 
> On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <andrey.z@gmail.com
> > wrote:
> > When opkg-build command fails to execute, subprocess is returned
> > with
> > exception instead of printing to stderr. This causes the error
> > logging
> > not to be printed out, as the "finally" statement does not contain
> > any
> > bitbake error output.
> > 
> > One example of this behavior is when the package name contains
> > uppercase
> > character, which are rejected by opkg-build,
> > subprocess.check_output
> > would except and no error log would be produced.
> > 
> > This commit catches the exception subprocess.CalledProcessError and
> > produces bb.error output visible to the user.
> > 
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > ---
> >  meta/classes/package_ipk.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/classes/package_ipk.bbclass
> > b/meta/classes/package_ipk.bbclass
> > index d1b317b42b..f181f5b4fd 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname,
> > ipkver, d.getVar('PACKAGE_ARCH'))
> >              sign_ipk(d, ipk_to_sign)
> > 
> > +    except subprocess.CalledProcessError as exc:
> > +        bb.error("OPKG Build failed: %s" % exc.output)
> >      finally:
> >          cleanupcontrol(root)
> >          bb.utils.unlockfile(lf)

My main concern is why isn't the raised exception being caught and
causing its own error...

This feels like a workaround rather than fixing the underlying problem
which I suspect might be in the parallel execution code exception
handling.

Cheers,

Richard



