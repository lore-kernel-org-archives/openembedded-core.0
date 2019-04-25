Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5F3D7D8F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:09:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b1so18920810wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YCQzHcYeHBHh2v8ay70aCM5b20tXUGhEhIRW1NpPtw4=;
	b=BajsdfBGr5PLBSLvGeKPQkcPTjKGtyAX7FHdnAMesuGszcnr2ZaxviL6M1NPKioh/f
	PHs8h7MYCcEeTfA+0UnUaySt1Z6nzz3sa9M2lF2LaEG0ocjK52kJ/qPzCsVk4lZPWjTp
	80SEUYxq9Y+DpviEXYofoPIWYaVkcTucJnuYPnK0dEpNq8n2peq+P9rVNi1PJWVmqzvK
	QBfrT7mzro94B2zg6L17Z3FM//38oi8y6+BU8G7MlZlviUqI120XRYr4AQXr1wzfwBhy
	BUhrCORSzhk+xOxsO9SE27ljzizjelgsKSGsJ3xyBe3xPzfIKKBEvIRJut/PiVBkcYAD
	IRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YCQzHcYeHBHh2v8ay70aCM5b20tXUGhEhIRW1NpPtw4=;
	b=jxvkN/FW6/JqVhYPZc9NZLQCAQx4/4u3H9sqhVaUDYw41mJkEpEQ/+N3X1M6q3O0i2
	atOELCJN6phdbVNeu27Bm01pbMJLW3e5PAFopL8LOkTYqILJu5bcLZuH+OA9FT2qgRKv
	+h7vGw3ss3FST9731DViZMJ08ONbtvTD8oIeM4ktT1numxAF5wmOgHh8awdUD4gn1CJi
	ACORxVNdHYiuCds8AVEClu0a2blODJ1Ek8Rtn6jA45Y9t+PZ7ljMj/E66XlPHwKxip5H
	xi8biI0vIJvFRnYzZkC9Qx5qlcSdinaRwp0B7In3fwQzvOONFyyLlazwgdp1kPwCWpJP
	zbHg==
X-Gm-Message-State: APjAAAUE6TKalYhJ7D3OGPX1l5BgkcpRnAhOSMsVkgIhHVUrAr0f1PIS
	US9PQqRUxPBgsSAyzk3t2QfUWYFDUc9pLSqVh9k+Xa20
X-Google-Smtp-Source: APXvYqz7mFUnrgRoMcD5JTOFH5Te32nJstQ6u4l+2dYHCpNeVo/4Pi+EVm6H35YTm/ldost8h4XBN3CMjjHoQFKYxrA=
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr760905wrv.210.1556197770286;
	Thu, 25 Apr 2019 06:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
	<854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
	<CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
In-Reply-To: <CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 25 Apr 2019 15:09:19 +0200
Message-ID: <CAHtQpK7-Oq-YuyATqU61JDA96P0Sz5QMF253wsH74XcgWj7=+g@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Apr 2019 13:09:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Tue, Apr 16, 2019 at 11:12 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Tue, Apr 16, 2019 at 10:24 AM <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2019-04-16 at 09:10 +0200, Andrey Zhizhikin wrote:
> > > On Mon, Apr 15, 2019 at 6:45 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> > > > > Ping.
> > > > >
> > > > > On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <
> > > > > andrey.z@gmail.com
> > > > > > wrote:
> > > > > > When opkg-build command fails to execute, subprocess is
> > > > > > returned
> > > > > > with
> > > > > > exception instead of printing to stderr. This causes the error
> > > > > > logging
> > > > > > not to be printed out, as the "finally" statement does not
> > > > > > contain
> > > > > > any
> > > > > > bitbake error output.
> > > > > >
> > > > > > One example of this behavior is when the package name contains
> > > > > > uppercase
> > > > > > character, which are rejected by opkg-build,
> > > > > > subprocess.check_output
> > > > > > would except and no error log would be produced.
> > > > > >
> > > > > > This commit catches the exception subprocess.CalledProcessError
> > > > > > and
> > > > > > produces bb.error output visible to the user.
> > > > > >
> > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > ---
> > > > > >  meta/classes/package_ipk.bbclass | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > > > b/meta/classes/package_ipk.bbclass
> > > > > > index d1b317b42b..f181f5b4fd 100644
> > > > > > --- a/meta/classes/package_ipk.bbclass
> > > > > > +++ b/meta/classes/package_ipk.bbclass
> > > > > > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> > > > > >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir,
> > > > > > pkgname,
> > > > > > ipkver, d.getVar('PACKAGE_ARCH'))
> > > > > >              sign_ipk(d, ipk_to_sign)
> > > > > >
> > > > > > +    except subprocess.CalledProcessError as exc:
> > > > > > +        bb.error("OPKG Build failed: %s" % exc.output)
> > > > > >      finally:
> > > > > >          cleanupcontrol(root)
> > > > > >          bb.utils.unlockfile(lf)
> > > >
> > > > My main concern is why isn't the raised exception being caught and
> > > > causing its own error...
> > >
> > > The raised exception is actually caught by a finally: statement
> > > below, and the build gracefully terminates. The problem is that
> > > finally: block does not contain any valuable output to inform user
> > > what actually happened.
> >
> > This isn't how python works. The exception should be "re-raised after
> > the finally clause has been executed" to quote the python manual:
> > https://docs.python.org/3/tutorial/errors.html#defining-clean-up-actions
> >
>
> Sorry, I guess my previous reply was a bit confusing.. I agree, the
> exception would not be blocked by finally: statement, and this is why
> the build gracefully shuts down. What the finally: block does not
> contain is an bb.error() which would provide more information about
> the source of error return from subprocess.check_output(). In case if
> this patch is applied - exception would be handled and not propagated
> further.
>
> Can you please advise whether there would another "raise" statement be
> needed after bb.error in the patch, so that in addition to the
> subprocess output user would get an entire callstack (like in the case
> when subprocess.CalledProcessError was not handled). Currently, with
> this patch user would receive the build error with the error string
> output from subprocess.check_output().
>
> Thanks a lot!

Can we follow-up on this patch? I'd really appreciate if you can
comment on my points here...

Thanks a lot!

>
> > > subprocess.check_output() would throw this exception every time the
> > > command in sub-process is terminated with the error code, and since
> > > we
> > > do tell it to dump stderr -> stdout - the error message would be
> > > contained in the exception output.
> > > This additional handling of the subprocess.check_output() exception
> > > would extract the stdout from the failed process here and just shows
> > > to the user the actual output from command processing, so that he is
> > > aware what was wrong.
> > >
> > > The case where I personally needed it the most is when the package
> > > name contained upper and lower case characters, which were rejected
> > > by
> > > the opkg-build command and until I introduced the handler - I just
> > > had
> > > an erroneous build failure without any additional information on what
> > > went wrong.
> > >
> > > > This feels like a workaround rather than fixing the underlying
> > > > problem
> > > > which I suspect might be in the parallel execution code exception
> > > > handling.
> > > The exception from  subprocess.check_output() is actually expected
> > > and
> > > perfectly handled, so there is no problem with that. This patch would
> > > just deliver a bit more information in the output for user to react
> > > proper.
> >
> >
> > See my comment above, the finally should not be blocking this exception
> > from being raised...
> >
> > Cheers,
> >
> > Richard
> >
>
> --
> Regards,
> Andrey.

--
Regards,
Andrey.

