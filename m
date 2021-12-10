Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B8FC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:01:44 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.7364.1639144903043787631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JtupeXxE;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y13so29875250edd.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uoHkyOHKeAi1pi+ZX1EhyMnMkola+TGAKm+5FfQrbYE=;
        b=JtupeXxEGe48hZvR//k1ybqvkO36/PSRdZHcRHso2opl4RL0h9SLddmYq/X1Ly5y62
         r87bje24iqdZ5YYH/yDUdpqQsivdM8MS6Rn7+P7e8AgBKsB5EjkxR3/eDyIjFO0ihOTz
         NYVDrwHgfEwsgFbV0i1vIa1dsWs2dtX7YT615wM5VsGJF3F+2Ke5zJExdHUPVmO0GmY8
         GgqXEaammwq48PM5nACIp4zxr6dliaCzaC6/8GzqRlhHOD36Rwk8YXY3UH4wY56FLjAw
         ZBorXtQqWDC+mf6VTPirN+oVgxU8j5VhTzJ1kHeAlULrI54/1Mt5xoRX+90DsH2U+yOj
         J6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uoHkyOHKeAi1pi+ZX1EhyMnMkola+TGAKm+5FfQrbYE=;
        b=OwXXsef4IyBc5POLlkwzmWHxzj74YMKcYxn5CY5BAcxwhzs85KUrlNp7+N0+GDgtSL
         a7xdngnv2BsSDRpUnpUXE1tWsDTQmbjSXBWbd9qsRrap1lHLfqk0mwCTbMIQ/ugekzEc
         TeUhXb8JtGUAge4v7yLf6h1bbBf5BjlePIEMBhssJroEYB5KAjf8BeSJMvzhKmw6nEmh
         QDtsAmAQhL73NDB8O0M1mrjEOkiyqzTo/O4RVOHXV8q/DKgNbkn8k7lMy2wl58g5cea6
         pc6PQjwaxkL5SrTAwgMeDyDmFU3BmHxFf5E/f+Zj76wjds4gg7UGjxDm47XyfO/Fm67W
         QRuw==
X-Gm-Message-State: AOAM530jMzxnu3wd+jokieCcOGCl1oOz7Ie3IVx0mQAeG8qcVp7ENS/l
	7/Gyh3KloSSH2RJxMLdbtLCdHKzlB+PftmA3ldc=
X-Google-Smtp-Source: 
 ABdhPJzK+2dyh78XP/R22f0/ZGili8QN0iiFS5E99LrciA3xy5b01q74aGMiOz2IuFw2TIdIAM8wu3jgKH4J3n7GMsQ=
X-Received: by 2002:a17:907:d19:: with SMTP id
 gn25mr23769254ejc.165.1639144889858;
 Fri, 10 Dec 2021 06:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <20211210130458.39716-2-max.krummenacher@toradex.com>
 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Dec 2021 09:01:18 -0500
Message-ID: 
 <CADkTA4NKr0WjukbqH4FQoze8-L5Jn3F9QekfV-hOcL1wU-VZOg@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159522

On Fri, Dec 10, 2021 at 8:29 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 10.12.21 14:04, Max Krummenacher wrote:
> > The current developer manual specifies that patches that are
> > part of a directory which is given in SRC_URI are applied by
> > the do_patch task. However that is not implemented in the
> > current code.
> >
> > Implement part of it with two differences:
> > - The implementation requires the parameter "apply=yes" and
> >    adds all files as patches, not only files ending in .patch
> >    and .diff.
> >    This keeps recipes which depend on the current implementation
> >    working.
> > - The possibility to exclude a file in that directory from being
> >    applied by a follow up entry with "apply=no" is dropped.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >   meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
> >   1 file changed, 59 insertions(+), 39 deletions(-)
> >
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index 950fe723dc..0d2afab2f9 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -794,68 +794,88 @@ class UserResolver(Resolver):
> >               raise
> >           os.chdir(olddir)
> >
> > -
> > -def patch_path(url, fetch, workdir, expand=True):
> > -    """Return the local path of a patch, or return nothing if this isn't a patch"""
> > -
> > -    local = fetch.localpath(url)
> > -    if os.path.isdir(local):
> > -        return
> > +def is_patch(local, workdir, apply_all, expand):
> >       base, ext = os.path.splitext(os.path.basename(local))
> >       if ext in ('.gz', '.bz2', '.xz', '.Z'):
> >           if expand:
> >               local = os.path.join(workdir, base)
> >           ext = os.path.splitext(base)[1]
> >
> > -    urldata = fetch.ud[url]
> > +    if ext in (".diff", ".patch") or apply_all:
> > +        return True
> > +    return False
> > +
> > +def patch_path(local, urldata, fetch, workdir, expand=True):
> > +    """Return a list of local paths of patches or return an empty list if there are no patches"""
> > +    patches = []
> > +
> > +    apply_all = False
> >       if "apply" in urldata.parm:
> >           apply = oe.types.boolean(urldata.parm["apply"])
> >           if not apply:
> > -            return
> > -    elif ext not in (".diff", ".patch"):
> > -        return
> > +            return patches
> > +        else:
> > +            apply_all = True
> > +
> > +    if os.path.isdir(local) and apply_all:
> > +        for f in sorted(os.listdir(local)):
>
> This assumes that patches can be ordered (in here alphabetically) -
> which isn't the case for most of the projects I worked with - I think it
> was also a reason why one has to specify the order and inclusion in SRC_URI.

This was immediately my concern as well when I read the 0/N for the series.

I'd be more inclined to remove the documentation, rather than trying
to deal with sorting and sequencing issues. Since it hasn't been
working until now, there wouldn't be any users to annoy with dropped
functionality.

(That being said, we could make the argument that anyone attempting to
just point at a directory full of patches knows enough that they need
to have them named in a way to keep them sorted and applied in order).

Cheers,

Bruce


>
> > +            sublocal = local + '/' + f
>
> Wouldn't be a sorted glob be more suitable here?
>
> > +            # Also search in subdirs
> > +            if os.path.isdir(sublocal):
> > +                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
> > +            else:
> > +                if is_patch(sublocal, workdir, apply_all, expand):
> > +                    patches.append(sublocal)
> > +    else:
> > +        if is_patch(local, workdir, apply_all, expand):
> > +            patches.append(local)
> >
> > -    return local
> > +    return patches
> >
> >   def src_patches(d, all=False, expand=True):
> > +    """Return a list of local paths from SRC_URI. With all=False all patches targeting do_patch, with all=True all other local paths"""
> >       workdir = d.getVar('WORKDIR')
> >       fetch = bb.fetch2.Fetch([], d)
> >       patches = []
> >       sources = []
> > -    for url in fetch.urls:
> > -        local = patch_path(url, fetch, workdir, expand)
> > -        if not local:
> > -            if all:
> > -                local = fetch.localpath(url)
> > -                sources.append(local)
> > -            continue
> >
> > +    for url in fetch.urls:
> > +        local = fetch.localpath(url)
> >           urldata = fetch.ud[url]
> > -        parm = urldata.parm
> > -        patchname = parm.get('pname') or os.path.basename(local)
> > +        locals = []
> > +        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
> >
> > -        apply, reason = should_apply(parm, d)
> > -        if not apply:
> > -            if reason:
> > -                bb.note("Patch %s %s" % (patchname, reason))
> > +        if not locals:
> > +            if all:
> > +                sources.append(local)
> >               continue
> > -
> > -        patchparm = {'patchname': patchname}
> > -        if "striplevel" in parm:
> > -            striplevel = parm["striplevel"]
> > -        elif "pnum" in parm:
> > -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> > -            striplevel = parm["pnum"]
> >           else:
> > -            striplevel = '1'
> > -        patchparm['striplevel'] = striplevel
> > +            for patch in locals:
> > +                parm = urldata.parm
> > +                patchname = parm.get('pname') or os.path.basename(patch)
> > +
> > +                apply, reason = should_apply(parm, d)
> > +                if not apply:
> > +                    if reason:
> > +                        bb.note("Patch %s %s" % (patchname, reason))
> > +                    continue
> > +
> > +                patchparm = {'patchname': patchname}
> > +                if "striplevel" in parm:
> > +                    striplevel = parm["striplevel"]
> > +                elif "pnum" in parm:
> > +                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> > +                    striplevel = parm["pnum"]
> > +                else:
> > +                    striplevel = '1'
> > +                patchparm['striplevel'] = striplevel
> >
> > -        patchdir = parm.get('patchdir')
> > -        if patchdir:
> > -            patchparm['patchdir'] = patchdir
> > +                patchdir = parm.get('patchdir')
> > +                if patchdir:
> > +                    patchparm['patchdir'] = patchdir
> >
> > -        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
> > -        patches.append(localurl)
> > +                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
> > +                patches.append(localurl)
> >
> >       if all:
> >           return sources
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159521): https://lists.openembedded.org/g/openembedded-core/message/159521
> Mute This Topic: https://lists.openembedded.org/mt/87635233/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

