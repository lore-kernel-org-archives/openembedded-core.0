Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.5433.1616047777098353147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P7qo3YRG;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id x10so954947qkm.8
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cyDfb2rjcEW19r42W2yuWl1Qj/T0h/dGA6RptCsWXws=;
        b=P7qo3YRGl1z/mSlCN4RwTFXf7qM5cWjCDhJKM/nBpb/CQxeCQkh51CV4sNkWmKgNav
         XwsZAsY6ltdEHjonh9f8nLnM0tOK/x+m7/9ZElyqToO/hqJT9ZJNmSJunDt1gj4tozSI
         MLB7yECQcdi1nCxotvCXgDWhErayuxO0e/jjTbzaqZZiCEzI1nCoSrT8H6u2ZO4tQXmS
         lVdYQvGVHmUe3d/5IbMobJ8aJwuWq2UDvD4I/Lqe4McIx6wJU0ODasjZyY8McRbscvi4
         TnaPWx7Tixx0xqHZeryi5hazPkxtaOS2BHhxBBbepKhtJOLRc1A7gQ0wQNFwWkfxYLAA
         IwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cyDfb2rjcEW19r42W2yuWl1Qj/T0h/dGA6RptCsWXws=;
        b=l0qEuZJCSp5wuXD7nzChrVaIqm3kuRuI/t76AxVbb4IVgbAKhjWnq0WN9X7e9jib0H
         6XvTSZhrkohDT/B3AjDRyDHUsQLJfCwuwo1PeHfZLG7YAeOZwLli1GnCqUHdtwPd7UQz
         e/QpRUzs982sRlK+7qxMVwcz38NxBxwt4ONUlsdEHInjaVxQmr9fs6KbJzGOX3ZJRtct
         4QqZH40qvGtTqP2v2XALsQMo4aAE4verilFe8grXKsuFqwGnyDVlPY5K3Q4wANA0tc3J
         3dpycXsNfkQ2aOaMz4d87n1nIPoo9Lxc1fUBCEK75a5mbeG8SS6E1Siv+uZcq0vNqAXX
         RtwQ==
X-Gm-Message-State: AOAM532Vw7GCBfauuX4dQ1dvSi9DAeHzEhhR95e7TTbJgO1G4Y3IuTuf
	eZRfaClHiq8WAqWfrSPanmL8Po1vJReX2c+dLEw=
X-Google-Smtp-Source: ABdhPJzfe7yweI6/Fr7Y3OQpZS3SYRT1JnP1lQn6Nhw2FYPj8BZzLa6ZQI2BJUjrU75ZX18nPz4QIALJizJ09JkiSTI=
X-Received: by 2002:a37:a350:: with SMTP id m77mr2842833qke.146.1616047776024;
 Wed, 17 Mar 2021 23:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <166D505781F5EE94.19946@lists.openembedded.org>
 <166D50DC24E9BAF7.5206@lists.openembedded.org> <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
 <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com> <4f991cf2-3e5a-212d-44f6-66c7e754eeb0@windriver.com>
In-Reply-To: <4f991cf2-3e5a-212d-44f6-66c7e754eeb0@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 23:09:10 -0700
Message-ID: <CAMKF1srtexeyLKFLxqZXuqRg9UuaWEwLM2OCjT_bCHWz=nLReQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 11:04 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 3/18/21 1:45 PM, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Wed, Mar 17, 2021 at 10:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >> Hi Khem,
> >>
> >> Understood your concern, but skip elfutils here is the least code change
> >> and the gettext also use this means previously.
> >
> > gettext perhaps can be pardoned since its the one providing these
> > macros in first place.
> >
> >>
> >> Meanwhile, there should as least as possible recipe need to skip wiping
> >> macros. If no, we may need to reconsider the related implement in
> >> autotools.bbclass. From this perspective, I think we should better
> >> record the recipe in this general bbclass.
> >
> > I agree, but so far it seems its only elfutils, if there are more then
> > please mentioned then to the list
> > and perhaps a different solution should be sought.
>
> Currently only found elfutils has this problem in my env. I think
> firstly if only one recipe, it's no big deal to record here as we wipe
> the per recipe macros in this autotools.bbclass(I didn't find other
> distribution wipe the macros). And secondly if there are other recipes
> need to skip the wiping, then it's just right to record here to prove we
> need to reconsider the related implements in autotools.bbclass.
>

this class is used everywhere, adding a check in this class would mean
its executed in every recipe inehrititng it so no we are not doing it for
one recipe.

> Thanks,
>
> >
> >>
> >> Thanks,
> >>
> >> On 3/18/21 11:05 AM, Yu, Mingli wrote:
> >>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>
> >>> The below m4 macros files shipped with recipe will be removed if the
> >>> recipe use AM_GNU_GETTEXT.
> >>> gettext.m4
> >>> iconv.m4
> >>> lib-ld.m4
> >>> lib-link.m4
> >>> lib-prefix.m4
> >>> nls.m4 po.m4
> >>> progtest.m4
> >>>
> >>> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> >>> commit (dd52d2ab Modernize gettext infrastructure) included, so the above
> >>> m4 macros files such as iconv.m4 is removed and it's bad as we need to
> >>> patch against iconv.m4 shippped with elfutils.
> >>>
> >>> So we skip elfutils to not let the elfutils m4 macros removed and also
> >>> fix below issue:
> >>>    $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch -f
> >>>
> >>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>> ---
> >>>    meta/classes/autotools.bbclass | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> >>> index 9dc8ebdaa7..4b462c5aba 100644
> >>> --- a/meta/classes/autotools.bbclass
> >>> +++ b/meta/classes/autotools.bbclass
> >>> @@ -203,7 +203,7 @@ autotools_do_configure() {
> >>>                                bbnote Executing glib-gettextize --force --copy
> >>>                                echo "no" | glib-gettextize --force --copy
> >>>                        fi
> >>> -             elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> >>> +             elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> >>>                        # We'd call gettextize here if it wasn't so broken...
> >>>                        cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> >>>                        if [ -d ${S}/po/ ]; then
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> 
> >>>
