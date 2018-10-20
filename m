Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5C7579CF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 14:08:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q40-v6so41577764qte.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ecQQGBIvdgCz+gvI+Yqxcj5IFYzolsriNOu9l1JwTdA=;
	b=NGrrO0m/Y6UsR4oc/3p7Gzgnhp43uZD87N48JxKHph6Px9KjPXuA8KM9otlS4OcVhK
	0ONScI7MOIcobGARYBsV2UXGJ3E/tFb72Ev7i4VuWDjrv5CAYj2+cxiNIumeLbDBtKrG
	P6055NAu4ZqexwYOLfsyIGCKJ4V8TpID5XgjNiANlEDhWVTNiZvJ1OcVCWTev8IzVRHz
	Yt6SX3hJ1VLiTUI1b7G5oeP3oLCuQ4QvbbZGNe8wm/gRXhcVEITpjDAEdh5p/aU49I/6
	iOLrFGyyNJ0uSOCSsXPnINT+hhGN4HnHSmKxyWx2NjoY88vP8fUXOPecXqtdQhtxqatt
	Vf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ecQQGBIvdgCz+gvI+Yqxcj5IFYzolsriNOu9l1JwTdA=;
	b=gninVts3PwpuFcrH/O2TPGRYc4cGlpjryUfq1XA8zUI0SFoOhnRp6lXqlJM/sy90Gw
	SvSbZDMzxTIqx7UKl9tzGmiNHcDMfBJ3Qc3Wq88eo8JKL37PJp2Vc2QTjmvEOVYKWjGI
	2HaaMOcOOUXUnmY69RjWCt6SblCRdwHCOIm4muG3VdGq1ZFhvrcVXHhtlZ7UoM8Thflg
	JxXtvFTfGbnt50dwy3y9kCSVOmRHJ4WXTmdx2gD0S1ykJ5UHGvE0/d+4QYOqjFPCEp7q
	DVJkLP1OAbYueRYXAX7aiuTSvsEjsuzvi679JSPNwaCh8ej37bxUUOip5OAO5Nms4S67
	+1GA==
X-Gm-Message-State: ABuFfoh2OwQdthRH91qX+XTK48rFuK58w1HY16FMhXvIHVyrTrbCr+2g
	97bVZQoAvmitX9kktwHn0nM8wYsbSlfcamfqIAI=
X-Google-Smtp-Source: ACcGV62cTMG2t+CZhawDbR801JecOcDiHhp7Vs9OnJAaGqgul7as0+coLXuYvrfh0N1Gr3UQ8V39CQB41vsap8BpRk4=
X-Received: by 2002:ad4:41cc:: with SMTP id a12mr38263372qvq.55.1540044500438; 
	Sat, 20 Oct 2018 07:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20181019153821.21177-1-stefan@agner.ch>
	<a1d9ca7b7bfa913983b356b854e0170967a55b57.camel@linuxfoundation.org>
In-Reply-To: <a1d9ca7b7bfa913983b356b854e0170967a55b57.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Oct 2018 15:07:53 +0100
Message-ID: <CAMKF1sp_KNg4yh6BqY4J5OmKbT5THy_vxExGvP2AE3NThQOmVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: opkg-devel@googlegroups.com, stefan.agner@toradex.com,
	Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, ricardo@foundries.io
Subject: Re: [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
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
X-List-Received-Date: Sat, 20 Oct 2018 14:08:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 20, 2018 at 10:16 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-10-19 at 17:38 +0200, Stefan Agner wrote:
> > From: Stefan Agner <stefan.agner@toradex.com>
> >
> > When using sstate, two parallel builds can produce two packages
> > with the same mtime but different checksums. When later one of
> > those two builds fetches the others ipk, the package index does
> > not get udpated properly (since mtime matches). This ends up with
> > messages such as:
> >   Downloading file:/../tmp/work/../image/...ipk.
> >   Removing corrupt package file
> > /../sysroot/../var/cache/opkg/volatile/...ipk
> >
> > However, in that case, ctime is different. Use ctime instead of
> > mtime to prevent failures like this.
> >
> > Suggested-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>
> Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Yep, thats for following up with implementing it.

Acked-by: Khem Raj <raj.khem@gmail.com>

> (I've been following this problem and this makes sense to me)
>
> > ---
> > This addresses the issue discussed here:
> >
> http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156348.html
> >
> >  opkg-make-index | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/opkg-make-index b/opkg-make-index
> > index 3227fc0..db7bf64 100755
> > --- a/opkg-make-index
> > +++ b/opkg-make-index
> > @@ -115,12 +115,12 @@ for abspath in files:
> >       pkg = None
> >       fnameStat = os.stat(abspath)
> >       if filename in old_pkg_hash:
> > -          if filename in pkgsStamps and int(fnameStat.st_mtime) ==
> > pkgsStamps[filename]:
> > +          if filename in pkgsStamps and int(fnameStat.st_ctime) ==
> > pkgsStamps[filename]:
> >              if (verbose):
> >                 sys.stderr.write("Found %s in Packages\n" %
> > (filename,))
> >              pkg = old_pkg_hash[filename]
> >            else:
> > -               sys.stderr.write("Found %s in Packages, but mtime
> > differs - re-reading\n" % (filename,))
> > +               sys.stderr.write("Found %s in Packages, but ctime
> > differs - re-reading\n" % (filename,))
> >
> >       if not pkg:
> >            if (verbose):
> > @@ -137,7 +137,7 @@ for abspath in files:
> >       else:
> >            old_filename = ""
> >       s = packages.add_package(pkg, opt_a)
> > -     pkgsStamps[filename] = fnameStat.st_mtime
> > +     pkgsStamps[filename] = fnameStat.st_ctime
> >       if s == 0:
> >            if old_filename:
> >                 # old package was displaced by newer
>

