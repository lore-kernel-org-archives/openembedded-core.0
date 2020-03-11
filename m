Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C21361B8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:38:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so1736438wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+IiysIVBeuf9KgnpzKkvWK36a0cc7wGARkBfRBxe1UE=;
	b=C/4Fjy8oQ5pMdMiS4EQdcwuyrmRDf3MmBkKztVrBL+cjRbihxL8Wyk0bV0TlrOTi4D
	gmMcYseKYdSc+uq5yceRm0OzUhDdh7YCZZUvXeMmPG28DJoG300xx/4Lz2E4Zhw3fA/n
	EiaXVQZcqaPiB3sKduaFvWkxRUZfQJJQSEbY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+IiysIVBeuf9KgnpzKkvWK36a0cc7wGARkBfRBxe1UE=;
	b=tpdGVoRFMudC/mpcCuiDl4q0SbQJV1yBV4WvUdTHRBpxaXtdKD2imcbufkjT8vbuXB
	APNDO6a7GkWF6ZKfZEkEUNMDRF687ghX5q9q0M63Mc8DCXhRzQg7ZyVDyhAKPdIN25KY
	sesMVbhVEAfjzasYk7YK0x2coEN7sOw+XTe4CokIlbg9ucifUKfctpCNZNOlPFluiy5v
	MBhoV49D6qjSUswyap0U8esrO02/YlwhCGY5xKak580/emo0BBceh3h5gU1xMZ4s8adI
	zO9KMMBdTRg3/dGfB/gekbcScmB6wK3nS1e5LFluZbGxQ7ft7WpFg994Sc8g9nTJxWkm
	Df+Q==
X-Gm-Message-State: ANhLgQ0wWfO6iwCdZidMmT01FgiouRTwuOFw/n3Q8eMlIX29iFLq6WYv
	sgPRl5EVjfdjppx+NAvPjylk+rm5sxw=
X-Google-Smtp-Source: ADFU+vsRSTWoYtQgL6ukrd3y6FF4jetaBkQnl9oINYP8c1A3KOvUvtj9z7fCDNyWryns8y6cEu2bWw==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr3313122wmj.61.1583926726012;
	Wed, 11 Mar 2020 04:38:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	39sm24455595wrc.76.2020.03.11.04.38.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:38:45 -0700 (PDT)
Message-ID: <1d5f679e2c28e2858b098fde142760edcf0c2708.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>
Date: Wed, 11 Mar 2020 11:38:44 +0000
In-Reply-To: <20200311113122.48437206@ub1910>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-2-pbarker@konsulko.com>
	<e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
	<20200311113122.48437206@ub1910>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] archiver.bbclass: Handle gitsm URLs in the mirror archiver
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
X-List-Received-Date: Wed, 11 Mar 2020 11:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-11 at 11:31 +0000, Paul Barker wrote:
> On Tue, 10 Mar 2020 23:16:38 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:
> > > To fully archive a `gitsm://` entry in SRC_URI we need to also capture
> > > the submodules recursively. If shallow mirror tarballs are found, they
> > > must be temporarily extracted so that the submodules can be determined.
> > > 
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > ---
> > >  meta/classes/archiver.bbclass | 31 ++++++++++++++++++++++++++-----
> > >  1 file changed, 26 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> > > index 013195df7d..fef7ad4f62 100644
> > > --- a/meta/classes/archiver.bbclass
> > > +++ b/meta/classes/archiver.bbclass
> > > @@ -306,7 +306,7 @@ python do_ar_configured() {
> > >  }
> > >  
> > >  python do_ar_mirror() {
> > > -    import subprocess
> > > +    import shutil, subprocess, tempfile
> > >  
> > >      src_uri = (d.getVar('SRC_URI') or '').split()
> > >      if len(src_uri) == 0:
> > > @@ -337,12 +337,10 @@ python do_ar_mirror() {
> > >  
> > >      bb.utils.mkdirhier(destdir)
> > >  
> > > -    fetcher = bb.fetch2.Fetch(src_uri, d)
> > > -
> > > -    for url in fetcher.urls:
> > > +    def archive_url(fetcher, url):
> > >          if is_excluded(url):
> > >              bb.note('Skipping excluded url: %s' % (url))
> > > -            continue
> > > +            return
> > >  
> > >          bb.note('Archiving url: %s' % (url))
> > >          ud = fetcher.ud[url]
> > > @@ -376,6 +374,29 @@ python do_ar_mirror() {
> > >          bb.note('Copying source mirror')
> > >          cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
> > >          subprocess.check_call(cmd, shell=True)
> > > +
> > > +        if url.startswith('gitsm://'):
> > > +            def archive_submodule(ud, url, module, modpath, workdir, d):
> > > +                url += ";bareclone=1;nobranch=1"
> > > +                newfetch = bb.fetch2.Fetch([url], d, cache=False)
> > > +
> > > +                for url in newfetch.urls:
> > > +                    archive_url(newfetch, url)
> > > +
> > > +            # If we're using a shallow mirror tarball it needs to be unpacked
> > > +            # temporarily so that we can examine the .gitmodules file
> > > +            if ud.shallow and os.path.exists(ud.fullshallow) and ud.method.need_update(ud, d):
> > > +                tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
> > > +                subprocess.check_call("tar -xzf %s" % ud.fullshallow, cwd=tmpdir, shell=True)
> > > +                ud.method.process_submodules(ud, tmpdir, archive_submodule, d)
> > > +                shutil.rmtree(tmpdir)
> > > +            else:
> > > +                ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
> > > +
> > > +    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
> > > +
> > > +    for url in fetcher.urls:
> > > +        archive_url(fetcher, url)
> > >  }  
> > 
> > I can't help feeling that this is basically a sign the fetcher is
> > broken.
> > 
> > What should really happen here is that there should be a method in the
> > fetcher we call into.
> > 
> > Instead we're teaching code how to hack around the fetcher. Would it be
> > possible to add some API we could call into here and maintain integrity
> > of the fetcher API?
> 
> This is gitsm-specific so the process_submodules method is probably the
> correct fetcher API. We need to call back into an archiver-supplied function
> for each submodule that is found.
> 
> I guess process_submodules could do the temporary unpacking of the shallow
> archive and then this code would be simplified. Is that what you had in mind?


Nearly. The "operation" here is similar to "download" or "unpack" but
amounts to "make a mirror copy". Should the fetcher have such a method,
which would then have the fetcher implementation details in the
fetchers themselves?

Cheers,

Richard


