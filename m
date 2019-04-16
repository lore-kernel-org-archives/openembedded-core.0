Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE5917D5AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:24:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k17so21029723wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eksODbC49S0YmPUsZv+mSk/isd3NLxLrpWYa0V8PKDs=;
	b=Nki5p+hYyOrHjFKUwJkT7dOkkBRrnbdddclCBpvmYut6WlfwDQZRchF+loEuY9S2FP
	St4jz1KhX8kJgJunZ8vtFaND3eYyw91H7cHjVpUsuT8vEHfYlzaagW4CMvrU8yOwznYR
	R4sxhQC8tPG3/wv5RgLUKmAgxaj1xURscfy40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eksODbC49S0YmPUsZv+mSk/isd3NLxLrpWYa0V8PKDs=;
	b=E+IrXdK7dyFiiyY3oU1tp2YxEngO5xCfDp9gEtSNQQCvbn/nYXIW0Q4V/F6t/Q20zN
	X4Ny6aWLXsNRiecTGs8wtKLv3xDYQw6soxrOZksemcgmCUmAKWfKC6+sfn3rT0+JLoGw
	0aQacA3r346AfmwqrRyAXpFluTeJprKJAxOqf2j1pT/JNRuL9fRs+MuqAz4lyNGRM556
	RptBFzwHk7g9/90XhBwItfpr9YHbMMRcE1xHMdQqCQw103sFj0x/lntLdccXn+KdaQ8w
	qA0669mH8xTyoShNKPmkx8GraR7PJIFMFNlRfJONfjZYWGzErWfk8+GkT9fFOOwbTGYO
	uy6Q==
X-Gm-Message-State: APjAAAWqYvVXM9iB5pL+n2yEA8KXLEAeJlU6Ub4B47X0VrELgyDNrxpE
	qZfWkprYVnFZuMPDlkyjR9Bqkg==
X-Google-Smtp-Source: APXvYqzVCk9FeZd5JaBT4CVllDTiQ6tPLSctgbQwBF+4MxnBl4AjfqyT3sNKQFMN4/Uh7I97ZO5qrQ==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr51700958wru.130.1555403092468; 
	Tue, 16 Apr 2019 01:24:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a187sm26181902wma.32.2019.04.16.01.24.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Apr 2019 01:24:51 -0700 (PDT)
Message-ID: <854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 16 Apr 2019 09:24:50 +0100
In-Reply-To: <CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 16 Apr 2019 08:24:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-16 at 09:10 +0200, Andrey Zhizhikin wrote:
> On Mon, Apr 15, 2019 at 6:45 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> > > Ping.
> > > 
> > > On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <
> > > andrey.z@gmail.com
> > > > wrote:
> > > > When opkg-build command fails to execute, subprocess is
> > > > returned
> > > > with
> > > > exception instead of printing to stderr. This causes the error
> > > > logging
> > > > not to be printed out, as the "finally" statement does not
> > > > contain
> > > > any
> > > > bitbake error output.
> > > > 
> > > > One example of this behavior is when the package name contains
> > > > uppercase
> > > > character, which are rejected by opkg-build,
> > > > subprocess.check_output
> > > > would except and no error log would be produced.
> > > > 
> > > > This commit catches the exception subprocess.CalledProcessError
> > > > and
> > > > produces bb.error output visible to the user.
> > > > 
> > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > ---
> > > >  meta/classes/package_ipk.bbclass | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > b/meta/classes/package_ipk.bbclass
> > > > index d1b317b42b..f181f5b4fd 100644
> > > > --- a/meta/classes/package_ipk.bbclass
> > > > +++ b/meta/classes/package_ipk.bbclass
> > > > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> > > >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir,
> > > > pkgname,
> > > > ipkver, d.getVar('PACKAGE_ARCH'))
> > > >              sign_ipk(d, ipk_to_sign)
> > > > 
> > > > +    except subprocess.CalledProcessError as exc:
> > > > +        bb.error("OPKG Build failed: %s" % exc.output)
> > > >      finally:
> > > >          cleanupcontrol(root)
> > > >          bb.utils.unlockfile(lf)
> > 
> > My main concern is why isn't the raised exception being caught and
> > causing its own error...
> 
> The raised exception is actually caught by a finally: statement
> below, and the build gracefully terminates. The problem is that
> finally: block does not contain any valuable output to inform user
> what actually happened.

This isn't how python works. The exception should be "re-raised after
the finally clause has been executed" to quote the python manual:
https://docs.python.org/3/tutorial/errors.html#defining-clean-up-actions

> subprocess.check_output() would throw this exception every time the
> command in sub-process is terminated with the error code, and since
> we
> do tell it to dump stderr -> stdout - the error message would be
> contained in the exception output.
> This additional handling of the subprocess.check_output() exception
> would extract the stdout from the failed process here and just shows
> to the user the actual output from command processing, so that he is
> aware what was wrong.
> 
> The case where I personally needed it the most is when the package
> name contained upper and lower case characters, which were rejected
> by
> the opkg-build command and until I introduced the handler - I just
> had
> an erroneous build failure without any additional information on what
> went wrong.
> 
> > This feels like a workaround rather than fixing the underlying
> > problem
> > which I suspect might be in the parallel execution code exception
> > handling.
> The exception from  subprocess.check_output() is actually expected
> and
> perfectly handled, so there is no problem with that. This patch would
> just deliver a bit more information in the output for user to react
> proper.


See my comment above, the finally should not be blocking this exception
from being raised...

Cheers,

Richard


