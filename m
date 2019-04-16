Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAE67D6BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:11:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h18so23748056wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Mvi5pSsmztJOaxn31aIJFoPnPoNj7a6KqxJG0xmQWDA=;
	b=W2idHMqIq71TpRWgtPoGQ8nU2x1sLNjWA0X32nWMGPa2Wa0v0JI5Xb8+ykrPZo8Nj9
	7PL4yfz9+ARf+mLXrkFceluO55e0+E0r63N1JEDJuIll68trgoBYD+GfGn54rEzgh33j
	dKP2aSY6LN3SCsDKw8fbJKfbTIOR+D9LKYS92mPjXRd+LLko9rcA7KbUkI5crqSt1NxA
	tQT9R1eWoLy41a8BcmGAMIhoqwFTt2ocfhZL7Tngr1wRVEErLQWPDqXGEnNxkvtrgioY
	4hsje+CuwDNHzdkIEEGCGC229IcHoqfvWN0laqwp3Y+oCJPrpFoFFQ35mKCpvfcXDXgy
	jQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Mvi5pSsmztJOaxn31aIJFoPnPoNj7a6KqxJG0xmQWDA=;
	b=ihGvsGC54WKSupYAzav/25/d0953BEtj8RZ8U993kxV4h8Stwde8Avr8aumR6txyUb
	jlekxzTY0fuT9riAFIa2rFyEtwdKRm9RNIM9UQggrIGPwKXJXNcLn427YDF8W5An3OxF
	qadJzht7TAH4J1PW2ARWq3R0pdHUW/UB3jtOJrdvD47mo/OZYfxtmYtMAgCcmxDp7yhJ
	QvClmAw6OMYr6ykZccQ5cNvtv+r1cqho8qtKYnCdvVV6SF5c+xcNdzrYKh70dlkjie02
	Mf5KBy+KKCvc3uXBzWhBS/yZl8Jmr28qJq7rMupiN1P+zSSISjCI7DUwUzeI+biTPPLK
	QByQ==
X-Gm-Message-State: APjAAAVYvZlZUznRbuupBeAXDL8H2IHjWcVSPGBnE3Mb/Wivd7mZp+u9
	zUcrU12fYgNKhWf+Wgl36We9xnDDh5vLJzagCgA=
X-Google-Smtp-Source: APXvYqxOQET+aGCObJ/1C5uDOiTaDVRomKoLep/znBowIBLAzk+yHGSQdnEIDV1B8U8BAQJElGX3NjwUAd0GV6Q+VhA=
X-Received: by 2002:a1c:ce:: with SMTP id 197mr25815681wma.105.1555398665272; 
	Tue, 16 Apr 2019 00:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
In-Reply-To: <99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 16 Apr 2019 09:10:54 +0200
Message-ID: <CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Apr 2019 07:11:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 15, 2019 at 6:45 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-04-14 at 16:21 +0200, Andrey Zhizhikin wrote:
> > Ping.
> >
> > On Thu, Mar 28, 2019 at 10:47 AM Andrey Zhizhikin <andrey.z@gmail.com
> > > wrote:
> > > When opkg-build command fails to execute, subprocess is returned
> > > with
> > > exception instead of printing to stderr. This causes the error
> > > logging
> > > not to be printed out, as the "finally" statement does not contain
> > > any
> > > bitbake error output.
> > >
> > > One example of this behavior is when the package name contains
> > > uppercase
> > > character, which are rejected by opkg-build,
> > > subprocess.check_output
> > > would except and no error log would be produced.
> > >
> > > This commit catches the exception subprocess.CalledProcessError and
> > > produces bb.error output visible to the user.
> > >
> > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > ---
> > >  meta/classes/package_ipk.bbclass | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/classes/package_ipk.bbclass
> > > b/meta/classes/package_ipk.bbclass
> > > index d1b317b42b..f181f5b4fd 100644
> > > --- a/meta/classes/package_ipk.bbclass
> > > +++ b/meta/classes/package_ipk.bbclass
> > > @@ -234,6 +234,8 @@ def ipk_write_pkg(pkg, d):
> > >              ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname,
> > > ipkver, d.getVar('PACKAGE_ARCH'))
> > >              sign_ipk(d, ipk_to_sign)
> > >
> > > +    except subprocess.CalledProcessError as exc:
> > > +        bb.error("OPKG Build failed: %s" % exc.output)
> > >      finally:
> > >          cleanupcontrol(root)
> > >          bb.utils.unlockfile(lf)
>
> My main concern is why isn't the raised exception being caught and
> causing its own error...

The raised exception is actually caught by a finally: statement below,
and the build gracefully terminates. The problem is that finally:
block does not contain any valuable output to inform user what
actually happened.
subprocess.check_output() would throw this exception every time the
command in sub-process is terminated with the error code, and since we
do tell it to dump stderr -> stdout - the error message would be
contained in the exception output.
This additional handling of the subprocess.check_output() exception
would extract the stdout from the failed process here and just shows
to the user the actual output from command processing, so that he is
aware what was wrong.

The case where I personally needed it the most is when the package
name contained upper and lower case characters, which were rejected by
the opkg-build command and until I introduced the handler - I just had
an erroneous build failure without any additional information on what
went wrong.

>
> This feels like a workaround rather than fixing the underlying problem
> which I suspect might be in the parallel execution code exception
> handling.
The exception from  subprocess.check_output() is actually expected and
perfectly handled, so there is no problem with that. This patch would
just deliver a bit more information in the output for user to react
proper.
>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Andrey.

