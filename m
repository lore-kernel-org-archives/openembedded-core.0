Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D10D7D904
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:41:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k16so718918wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8Ko0lgPbodY+Z0RU1P20NXUoqS2rAaMkYxkfKDImny0=;
	b=FW2K4lYzB2G/T7k5TTXHrgm8l5T4kV2cf9phNnMdB9yL+4FAX3O0Tb4+IlD7d/RzRZ
	tploF/XHnvsKVnbYFBkoNLyXkFuqRChqbih3JlsqujaoxDDsQ87Qvr6YK4PTajorOeXK
	b3FBg11644VjbgWD4kQGQyRlesM6wlkupqqbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8Ko0lgPbodY+Z0RU1P20NXUoqS2rAaMkYxkfKDImny0=;
	b=I4mvn4Fs/zn0h7Roq/vsGk298Plh0GkG6og2CxKlEjCeJTAwR6cSPskgx+bdCCjgWX
	UcS8b5x93JqET7KEdsdl4QSR5sZ13hUAtZuePZGbRctDkZ2uM0hIi2lAfWJNmGNd99W/
	6cG6dzJ7uFbaK7B9ce1E7gTgdWfDJxMqgQxK0/qzu11o4w50lYhbg2kkBZXBTJpdQlnX
	UWPapwffSvuSYSveOymreOofjxMoVIgW/tp7M8hEKqqP8MlzGf7hGOhp4u0wLVD3xST4
	EEZr0gwcWT5Q7bCBNWBGfHE/zgsbqym0PbwpndH9mHtv9v+uSb+CG9084Qpfm8W35oWT
	8maw==
X-Gm-Message-State: APjAAAVismQGr+Me99fH5WvQTpd6zT/zt6i4WwCQHvXr9mMqHRxOJnOr
	OOFP/iowSNJXg0dcmcurpumCBg==
X-Google-Smtp-Source: APXvYqyrDmugnAASJOMJV2cODX2PxaoM9U16s5Fe0IHEFs+rXNkLyoVnABFtzc1Pznk0HGpyS/PcCg==
X-Received: by 2002:adf:db8a:: with SMTP id u10mr13209674wri.82.1556199681842; 
	Thu, 25 Apr 2019 06:41:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r9sm21376276wmh.38.2019.04.25.06.41.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Apr 2019 06:41:20 -0700 (PDT)
Message-ID: <2b52357c0d72676caa87be5f873520494a93bf6e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 25 Apr 2019 14:41:19 +0100
In-Reply-To: <CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
	<854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
	<CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Apr 2019 13:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-16 at 11:12 +0200, Andrey Zhizhikin wrote:
> On Tue, Apr 16, 2019 at 10:24 AM <richard.purdie@linuxfoundation.org>
> wrote:
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
> > > > > > exception instead of printing to stderr. This causes the
> > > > > > error
> > > > > > logging
> > > > > > not to be printed out, as the "finally" statement does not
> > > > > > contain
> > > > > > any
> > > > > > bitbake error output.
> > > > > > 
> > > > > > One example of this behavior is when the package name
> > > > > > contains
> > > > > > uppercase
> > > > > > character, which are rejected by opkg-build,
> > > > > > subprocess.check_output
> > > > > > would except and no error log would be produced.
> > > > > > 
> > > > > > This commit catches the exception
> > > > > > subprocess.CalledProcessError
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
> > > > My main concern is why isn't the raised exception being caught
> > > > and
> > > > causing its own error...
> > > 
> > > The raised exception is actually caught by a finally: statement
> > > below, and the build gracefully terminates. The problem is that
> > > finally: block does not contain any valuable output to inform
> > > user
> > > what actually happened.
> > 
> > This isn't how python works. The exception should be "re-raised
> > after
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
> Can you please advise whether there would another "raise" statement
> be
> needed after bb.error in the patch, so that in addition to the
> subprocess output user would get an entire callstack (like in the
> case
> when subprocess.CalledProcessError was not handled). Currently, with
> this patch user would receive the build error with the error string
> output from subprocess.check_output().

My worry is that we're making a special case fix and for example the
other package back ends could have a similar problem (or any other
users of multiprocess_launch).

I already think subprocess in python is a bit broken as it should share
e.output if its present in an exception. We already special case that
in bitbake, the problem here is that our special case code doesn't
catch this.

Whilst still ugly, perhaps a better fix might be:

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index a4fd79ccb21..59251810d43 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -324,7 +324,12 @@ def multiprocess_launch(target, items, d, extraargs=None):
     if errors:
         msg = ""
         for (e, tb) in errors:
-            msg = msg + str(e) + ": " + str(tb) + "\n"
+            if isinstance(e, subprocess.CalledProcessError) and e.output:
+                msg = msg + str(e) + "\n"
+                msg = msg + "Subprocess output:"
+                msg = msg + e.output.decode("utf-8", errors="ignore")
+            else:
+                msg = msg + str(e) + ": " + str(tb) + "\n"
         bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
     return results
 

which I think from some local testing gives better output and would
solve your concern and some of mine?

Cheers,

Richard




