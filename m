Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2147DA04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 14:51:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a12so7473679wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1MuGI3VgQg54l55yyFFz9ETpvWtNh4yfAqkK501wwmQ=;
	b=Qma4f45DVlvCcPjifxRv7bANDkEVUYC0t6kg4wxxYaL/uVDTO2YoyRxq7O7d8Yxh56
	6+1FHlzYqi7gc7UGI3WxSfPDWz1kNT29G/WrogGuKQTWMMrAm+e8dtSreVHO0KQ2fTpn
	io2dMGy4/3A98lxFWh7ZEJpwwdVuTmGWm0YZwr7ZvdKlNX5ZCcIZZ0k9BKboUoATnM22
	PPMRzEDEvtC8pmLul3+HhW2yH8p7nkUg3sGnd7qZya4WawDhNm5H5DQkwhwp79aVuTZD
	uboUh2SPT3agnpaSsBKsk7W9uEqM+MM6tOtPyA8LM3ZUgsv0QT4513LVl4nD0s7yg/tb
	cz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1MuGI3VgQg54l55yyFFz9ETpvWtNh4yfAqkK501wwmQ=;
	b=OaAhCMbca1W6c425gQ0qc1KnyOc5rl7kUQQMRp9VKqzaECWgfhbcdw18TOpDgAHpVV
	3T2R9C4sUPT4ABtbU37R5mLLXeYHqJ0xTJloDIKaFPVNYLj/mKq1fiI+In8/Iqpwz1t5
	92SSORE75QosPFskMD18D4uD5D6s3G2ERU44KUyq+X37rtSuMVl40IkEJENWX/pgYfLm
	ISJu0ZAWHqfIWYc/jc9Rk1YmgIw3s2JC5ZMLXpF6Z9tXZKVuMNJmCF4eqZjH2ZHX+LfF
	elL1orouy4lUjPinOeEwalYNXhrDwi0qCZjCDt5YCRI3ocIwKdOwgTIWl18pPSJUnSXG
	V1Kw==
X-Gm-Message-State: APjAAAWNWvzJeVpLNb0rR6YcR30/PrpbgKGI7GiNJZqnZYe18mig9QVR
	pMH10bjSEldZtmxIxTbhAxljUw8umQdo12ZFlyggF3tD
X-Google-Smtp-Source: APXvYqw7sdx3X2TI6cV/xXEXAyr8BO2VXICIxUUBsEVWIQBN3FPab6efKqyysgrWSfUI35bRTzyEqLX6W2zXB2/Kdv0=
X-Received: by 2002:a5d:5447:: with SMTP id w7mr6121495wrv.325.1556203872133; 
	Thu, 25 Apr 2019 07:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
	<854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
	<CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
	<2b52357c0d72676caa87be5f873520494a93bf6e.camel@linuxfoundation.org>
In-Reply-To: <2b52357c0d72676caa87be5f873520494a93bf6e.camel@linuxfoundation.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 25 Apr 2019 16:51:00 +0200
Message-ID: <CAHtQpK4eHaZ4dSPmXCOQe8ETXHTB0PnYWoAB3Zqx=PmQKbd0eA@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Apr 2019 14:51:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 25, 2019 at 3:41 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-04-16 at 11:12 +0200, Andrey Zhizhikin wrote:
> > On Tue, Apr 16, 2019 at 10:24 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > On Tue, 2019-04-16 at 09:10 +0200, Andrey Zhizhikin wrote:
> > > > On Mon, Apr 15, 2019 at 6:45 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> > > > > > Ping.
> > > > > >
> > > > > > On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <
> > > > > > andrey.z@gmail.com
> > > > > > > wrote:
> > > > > > > When opkg-build command fails to execute, subprocess is
> > > > > > > returned
> > > > > > > with
> > > > > > > exception instead of printing to stderr. This causes the
> > > > > > > error
> > > > > > > logging
> > > > > > > not to be printed out, as the "finally" statement does not
> > > > > > > contain
> > > > > > > any
> > > > > > > bitbake error output.
> > > > > > >
> > > > > > > One example of this behavior is when the package name
> > > > > > > contains
> > > > > > > uppercase
> > > > > > > character, which are rejected by opkg-build,
> > > > > > > subprocess.check_output
> > > > > > > would except and no error log would be produced.
> > > > > > >
> > > > > > > This commit catches the exception
> > > > > > > subprocess.CalledProcessError
> > > > > > > and
> > > > > > > produces bb.error output visible to the user.
> > > > > > >
> > > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > > ---
> > > > > > >  meta/classes/package_ipk.bbclass | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > > > > b/meta/classes/package_ipk.bbclass
> > > > > > > index d1b317b42b..f181f5b4fd 100644
> > > > > > > --- a/meta/classes/package_ipk.bbclass
> > > > > > > +++ b/meta/classes/package_ipk.bbclass
> > > > > > > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> > > > > > >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir,
> > > > > > > pkgname,
> > > > > > > ipkver, d.getVar('PACKAGE_ARCH'))
> > > > > > >              sign_ipk(d, ipk_to_sign)
> > > > > > >
> > > > > > > +    except subprocess.CalledProcessError as exc:
> > > > > > > +        bb.error("OPKG Build failed: %s" % exc.output)
> > > > > > >      finally:
> > > > > > >          cleanupcontrol(root)
> > > > > > >          bb.utils.unlockfile(lf)
> > > > >
> > > > > My main concern is why isn't the raised exception being caught
> > > > > and
> > > > > causing its own error...
> > > >
> > > > The raised exception is actually caught by a finally: statement
> > > > below, and the build gracefully terminates. The problem is that
> > > > finally: block does not contain any valuable output to inform
> > > > user
> > > > what actually happened.
> > >
> > > This isn't how python works. The exception should be "re-raised
> > > after
> > > the finally clause has been executed" to quote the python manual:
> > > https://docs.python.org/3/tutorial/errors.html#defining-clean-up-actions
> > >
> >
> > Sorry, I guess my previous reply was a bit confusing.. I agree, the
> > exception would not be blocked by finally: statement, and this is why
> > the build gracefully shuts down. What the finally: block does not
> > contain is an bb.error() which would provide more information about
> > the source of error return from subprocess.check_output(). In case if
> > this patch is applied - exception would be handled and not propagated
> > further.
> >
> > Can you please advise whether there would another "raise" statement
> > be
> > needed after bb.error in the patch, so that in addition to the
> > subprocess output user would get an entire callstack (like in the
> > case
> > when subprocess.CalledProcessError was not handled). Currently, with
> > this patch user would receive the build error with the error string
> > output from subprocess.check_output().
>
> My worry is that we're making a special case fix and for example the
> other package back ends could have a similar problem (or any other
> users of multiprocess_launch).
>
> I already think subprocess in python is a bit broken as it should share
> e.output if its present in an exception. We already special case that
> in bitbake, the problem here is that our special case code doesn't
> catch this.

Agree, I was also puzzled why there is no valuable output from
subprocess in case exception was raised.

>
> Whilst still ugly, perhaps a better fix might be:
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index a4fd79ccb21..59251810d43 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -324,7 +324,12 @@ def multiprocess_launch(target, items, d, extraargs=None):
>      if errors:
>          msg = ""
>          for (e, tb) in errors:
> -            msg = msg + str(e) + ": " + str(tb) + "\n"
> +            if isinstance(e, subprocess.CalledProcessError) and e.output:
> +                msg = msg + str(e) + "\n"
> +                msg = msg + "Subprocess output:"
> +                msg = msg + e.output.decode("utf-8", errors="ignore")
> +            else:
> +                msg = msg + str(e) + ": " + str(tb) + "\n"
>          bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
>      return results
>

Thanks a lot, I'll definitely give it a try! Would you be willing to
take this further in into the master branch?

>
> which I think from some local testing gives better output and would
> solve your concern and some of mine?

That would definitely solve my issue and adhere to my original intention.

-- 
Regards,
Andrey.

