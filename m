Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id E00D86D73C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 09:12:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v14so24278250wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bMNYimg6Gf2iSWEdx/xuYi4E9Vb8QjnOc7MWcxI/XF4=;
	b=ZFBmEj5QLlIhpM0CqZhctPgecgklW8bjRn/yVIM/jgktzO1pn1wL4osUVYHd7c1MJb
	lYZSthwIhuytVbKjPTPQnxJkUuK0ReVdWnP0JpsVl/kPoqNiGDE9LM7TstsPd7HRRdPU
	E1R17W5Jcquxgl5sdn4ElVUtLCmc5ar97uV2jFBmTWihRwMnN8fu2hjbA9cw+XTsve3O
	sFNHYjci4x8mfN8WVNJYHnf43az0TPu9c7agpdiYbPhzMqy1gPmin7e2T+ve/eEpGPSM
	u78Xu+xmxXHCR/lXDIF6umCFA66HB8UgsCA/u3aFA9+ULwd8hVlUzmlgVkjr7WyV/Xhe
	PvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bMNYimg6Gf2iSWEdx/xuYi4E9Vb8QjnOc7MWcxI/XF4=;
	b=YbL5v4gwFl50cPP9G7pjmzpNEqYChHatOXt7dMzKcXBFji1qBnIinNXTNQTfy4k9tS
	RY+LzUMYKZmJHPFd00/pMC67qxbbHdVL8g9M5bA9SN0rwSACySy3o/l8DrIq5gygSQ8s
	Ew2Rn4Mv3vqJCTUrHTkMqv/5l5H/bOYAOFAYMCDjQmMh1OewS7ev7fvDpqytwuheVhtb
	QQ9G9WE1FZRdLrlym2hMuHzgt/3+m6ss0oukvgTCV+rChfanqo/0fVmDAAehwe/b/8n1
	6ANuw589wkt2Vq5EKJy+z3n3BSPterITvEvhcKxCq0maPds50fVuAjS9734EZbjrLK8U
	Fymg==
X-Gm-Message-State: APjAAAX9p2eE+hrW/Q0GR0JA2KEosxzJoSInXkMFnOHpQRfUoCzDF8Jk
	gflsa6qlHpKO/EchieYPGHjGj1HESb5arMCYpKn9e2Fm
X-Google-Smtp-Source: APXvYqySnuXxoYk5NghhaXpieDz5uh8PaMgHv4klCcr8EUjMCA/G7cQkf3IjNPuAHFcTCQn7DewRJ0H/AdwxS2YrwJ4=
X-Received: by 2002:a1c:6783:: with SMTP id b125mr25763217wmc.41.1555405970548;
	Tue, 16 Apr 2019 02:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
	<854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
In-Reply-To: <854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 16 Apr 2019 11:12:39 +0200
Message-ID: <CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 16 Apr 2019 09:12:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 16, 2019 at 10:24 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-16 at 09:10 +0200, Andrey Zhizhikin wrote:
> > On Mon, Apr 15, 2019 at 6:45 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> > > > Ping.
> > > >
> > > > On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <
> > > > andrey.z@gmail.com
> > > > > wrote:
> > > > > When opkg-build command fails to execute, subprocess is
> > > > > returned
> > > > > with
> > > > > exception instead of printing to stderr. This causes the error
> > > > > logging
> > > > > not to be printed out, as the "finally" statement does not
> > > > > contain
> > > > > any
> > > > > bitbake error output.
> > > > >
> > > > > One example of this behavior is when the package name contains
> > > > > uppercase
> > > > > character, which are rejected by opkg-build,
> > > > > subprocess.check_output
> > > > > would except and no error log would be produced.
> > > > >
> > > > > This commit catches the exception subprocess.CalledProcessError
> > > > > and
> > > > > produces bb.error output visible to the user.
> > > > >
> > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > ---
> > > > >  meta/classes/package_ipk.bbclass | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > > b/meta/classes/package_ipk.bbclass
> > > > > index d1b317b42b..f181f5b4fd 100644
> > > > > --- a/meta/classes/package_ipk.bbclass
> > > > > +++ b/meta/classes/package_ipk.bbclass
> > > > > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> > > > >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir,
> > > > > pkgname,
> > > > > ipkver, d.getVar('PACKAGE_ARCH'))
> > > > >              sign_ipk(d, ipk_to_sign)
> > > > >
> > > > > +    except subprocess.CalledProcessError as exc:
> > > > > +        bb.error("OPKG Build failed: %s" % exc.output)
> > > > >      finally:
> > > > >          cleanupcontrol(root)
> > > > >          bb.utils.unlockfile(lf)
> > >
> > > My main concern is why isn't the raised exception being caught and
> > > causing its own error...
> >
> > The raised exception is actually caught by a finally: statement
> > below, and the build gracefully terminates. The problem is that
> > finally: block does not contain any valuable output to inform user
> > what actually happened.
>
> This isn't how python works. The exception should be "re-raised after
> the finally clause has been executed" to quote the python manual:
> https://docs.python.org/3/tutorial/errors.html#defining-clean-up-actions
>

Sorry, I guess my previous reply was a bit confusing.. I agree, the
exception would not be blocked by finally: statement, and this is why
the build gracefully shuts down. What the finally: block does not
contain is an bb.error() which would provide more information about
the source of error return from subprocess.check_output(). In case if
this patch is applied - exception would be handled and not propagated
further.

Can you please advise whether there would another "raise" statement be
needed after bb.error in the patch, so that in addition to the
subprocess output user would get an entire callstack (like in the case
when subprocess.CalledProcessError was not handled). Currently, with
this patch user would receive the build error with the error string
output from subprocess.check_output().

Thanks a lot!

> > subprocess.check_output() would throw this exception every time the
> > command in sub-process is terminated with the error code, and since
> > we
> > do tell it to dump stderr -> stdout - the error message would be
> > contained in the exception output.
> > This additional handling of the subprocess.check_output() exception
> > would extract the stdout from the failed process here and just shows
> > to the user the actual output from command processing, so that he is
> > aware what was wrong.
> >
> > The case where I personally needed it the most is when the package
> > name contained upper and lower case characters, which were rejected
> > by
> > the opkg-build command and until I introduced the handler - I just
> > had
> > an erroneous build failure without any additional information on what
> > went wrong.
> >
> > > This feels like a workaround rather than fixing the underlying
> > > problem
> > > which I suspect might be in the parallel execution code exception
> > > handling.
> > The exception from  subprocess.check_output() is actually expected
> > and
> > perfectly handled, so there is no problem with that. This patch would
> > just deliver a bit more information in the output for user to react
> > proper.
>
>
> See my comment above, the finally should not be blocking this exception
> from being raised...
>
> Cheers,
>
> Richard
>

-- 
Regards,
Andrey.

