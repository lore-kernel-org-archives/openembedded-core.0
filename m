Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED08E61B98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:50:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n2so1773279wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=xj8pqVsMT5AaA4/Us2GXNdFawed47qZFuGcyz2s7K1c=;
	b=LkOv0ip8+yusT4eixWZKZqBAYpLL2mCIw10tVctZWH9eEsPvR4CvcHNUvqGZKUCMCP
	Bp2ICOABTqlPEpzjMJ7ImKzeo4BPJPABp8VPd9qapesHIByqRgqk4DrvLUNszFcxHEvc
	lZD1gePHe0/xb3OHwHLryIgdrJiYw8rLOAUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xj8pqVsMT5AaA4/Us2GXNdFawed47qZFuGcyz2s7K1c=;
	b=Y6ijEoNBY10ikZLmqCD9zq9Tp83Jl4sloZ2IN20CiMDq67pZi308So7f5tpuUUjo6z
	HSpJgyz720dEO5IxLoaHJWk2fnpBrWCqBc2vKiFsjT95pXRPwKuSse+twnXmFSgEqXQC
	3ofG3OSzsgmWmMF++zFAd7pr7NeXHx83TKNDgxoWd9A8c6z7S/Rb0L8LWSjpzxjU/nIr
	KDk6wrrBjkKB1l7VUJOaxGmE1YvVcnw5S0N90PR3gXyIPElO5gyC36l7h1gurzi0gIoR
	Ml/T0yRMJdZIY5YhpFEZJjomcBJ8QpydOOlQUyFutGEjt4y06Y0MYw6+ZNRuISomzDcH
	LQYg==
X-Gm-Message-State: ANhLgQ14ENTh6LSoCCzxAFoMoLM4h8lsQ7sBbRyxJ1QilxJdJ9E6YFz0
	BM9YBewzfrYjtTgOv6vFUIvsrQ==
X-Google-Smtp-Source: ADFU+vsmm4ZdpyeKGjEBI/4JcFmSVEqBbeWN2xn5GHn84cFfCIOXYCoCx19haVv3EylChnJ/A6H+wQ==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr3352053wmi.184.1583927428280; 
	Wed, 11 Mar 2020 04:50:28 -0700 (PDT)
Received: from ub1910 ([213.48.11.149]) by smtp.gmail.com with ESMTPSA id
	a186sm8097004wmh.33.2020.03.11.04.50.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:50:28 -0700 (PDT)
Date: Wed, 11 Mar 2020 11:50:25 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200311115025.56045856@ub1910>
In-Reply-To: <1d5f679e2c28e2858b098fde142760edcf0c2708.camel@linuxfoundation.org>
References: <20200309142139.15741-1-pbarker@konsulko.com>
	<20200309142139.15741-2-pbarker@konsulko.com>
	<e3d926c01221fdbfe47df3d3b05a54015f3564ca.camel@linuxfoundation.org>
	<20200311113122.48437206@ub1910>
	<1d5f679e2c28e2858b098fde142760edcf0c2708.camel@linuxfoundation.org>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
X-List-Received-Date: Wed, 11 Mar 2020 11:50:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Mar 2020 11:38:44 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-03-11 at 11:31 +0000, Paul Barker wrote:
> > On Tue, 10 Mar 2020 23:16:38 +0000
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >   
> > > On Mon, 2020-03-09 at 14:21 +0000, Paul Barker wrote:  
> > > > To fully archive a `gitsm://` entry in SRC_URI we need to also capture
> > > > the submodules recursively. If shallow mirror tarballs are found, they
> > > > must be temporarily extracted so that the submodules can be determined.
> > > > 
> > > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > > ---
> > > >  meta/classes/archiver.bbclass | 31 ++++++++++++++++++++++++++-----
> > > >  1 file changed, 26 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> > > > index 013195df7d..fef7ad4f62 100644
> > > > --- a/meta/classes/archiver.bbclass
> > > > +++ b/meta/classes/archiver.bbclass
> > > > @@ -306,7 +306,7 @@ python do_ar_configured() {
> > > >  }
> > > >  
> > > >  python do_ar_mirror() {
> > > > -    import subprocess
> > > > +    import shutil, subprocess, tempfile
> > > >  
> > > >      src_uri = (d.getVar('SRC_URI') or '').split()
> > > >      if len(src_uri) == 0:
> > > > @@ -337,12 +337,10 @@ python do_ar_mirror() {
> > > >  
> > > >      bb.utils.mkdirhier(destdir)
> > > >  
> > > > -    fetcher = bb.fetch2.Fetch(src_uri, d)
> > > > -
> > > > -    for url in fetcher.urls:
> > > > +    def archive_url(fetcher, url):
> > > >          if is_excluded(url):
> > > >              bb.note('Skipping excluded url: %s' % (url))
> > > > -            continue
> > > > +            return
> > > >  
> > > >          bb.note('Archiving url: %s' % (url))
> > > >          ud = fetcher.ud[url]
> > > > @@ -376,6 +374,29 @@ python do_ar_mirror() {
> > > >          bb.note('Copying source mirror')
> > > >          cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
> > > >          subprocess.check_call(cmd, shell=True)
> > > > +
> > > > +        if url.startswith('gitsm://'):
> > > > +            def archive_submodule(ud, url, module, modpath, workdir, d):
> > > > +                url += ";bareclone=1;nobranch=1"
> > > > +                newfetch = bb.fetch2.Fetch([url], d, cache=False)
> > > > +
> > > > +                for url in newfetch.urls:
> > > > +                    archive_url(newfetch, url)
> > > > +
> > > > +            # If we're using a shallow mirror tarball it needs to be unpacked
> > > > +            # temporarily so that we can examine the .gitmodules file
> > > > +            if ud.shallow and os.path.exists(ud.fullshallow) and ud.method.need_update(ud, d):
> > > > +                tmpdir = tempfile.mkdtemp(dir=d.getVar("DL_DIR"))
> > > > +                subprocess.check_call("tar -xzf %s" % ud.fullshallow, cwd=tmpdir, shell=True)
> > > > +                ud.method.process_submodules(ud, tmpdir, archive_submodule, d)
> > > > +                shutil.rmtree(tmpdir)
> > > > +            else:
> > > > +                ud.method.process_submodules(ud, ud.clonedir, archive_submodule, d)
> > > > +
> > > > +    fetcher = bb.fetch2.Fetch(src_uri, d, cache=False)
> > > > +
> > > > +    for url in fetcher.urls:
> > > > +        archive_url(fetcher, url)
> > > >  }    
> > > 
> > > I can't help feeling that this is basically a sign the fetcher is
> > > broken.
> > > 
> > > What should really happen here is that there should be a method in the
> > > fetcher we call into.
> > > 
> > > Instead we're teaching code how to hack around the fetcher. Would it be
> > > possible to add some API we could call into here and maintain integrity
> > > of the fetcher API?  
> > 
> > This is gitsm-specific so the process_submodules method is probably the
> > correct fetcher API. We need to call back into an archiver-supplied function
> > for each submodule that is found.
> > 
> > I guess process_submodules could do the temporary unpacking of the shallow
> > archive and then this code would be simplified. Is that what you had in mind?  
> 
> 
> Nearly. The "operation" here is similar to "download" or "unpack" but
> amounts to "make a mirror copy". Should the fetcher have such a method,
> which would then have the fetcher implementation details in the
> fetchers themselves?

I structured things this way after the discussions we've had previously about
not wanting to add too many new code paths to the fetcher. I'd also like to
keep the logic in a bbclass as much as possible so that it can be more easily
carried as a local backport to earlier Yocto Project releases.

I do see your point though, this is liable to grow warts over time as special
cases are added for different fetchers.

The cause of the warts here is that the gitsm fetcher downloads and creates
mirror tarballs for sources which aren't listed in SRC_URI. The archiver
would be simpler if we could assume that all sources are included in SRC_URI.
Perhaps the solution is not to add a "make a mirror copy" API but instead add
an "expand SRC_URI with any dependencies" API that the archiver can call
before it iterates over the list of sources.

-- 
Paul Barker
Konsulko Group

