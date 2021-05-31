Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.39277.1622428085335178389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 19:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gG+nYiHw;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ss26so14315483ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFffWK4jnG9o7SKe0WkIviImfOvOQfZeOzj9/tlbXFA=;
        b=gG+nYiHwwaXXmvTZu/4RBNbcrpTJH30lS9t9H5h1Je6PkMcZ6S3AgVOThDyu6U26WE
         9MNdkr9Q6gwqzDYstpc7LFEqcfpl+TrAhFWYHdQF6Y+9muxghVc844ay2VVWEDemmtnR
         dx3prDZwYB9gm1I1xX0kNlSHQOwN23tqxH9di4ga+iqSZ9O3zQAaNXkHdxN0oazENuDU
         R9ll1wdi5ti2gRqdm2zB5LUkYLx6Div9qaT+FKHzjBo8NKIEVfz4eocHTQK2QZu55q5u
         +r/ZIPtIe/TxhhmJw3M9DOkZnJKSxVfpX9F4btGSI7tHjY+FajXmDTpAPYpXiOKFQ0xn
         o+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFffWK4jnG9o7SKe0WkIviImfOvOQfZeOzj9/tlbXFA=;
        b=PM0h9kcD5lzIQlT6AZC72TQ/VGRdobW+DIZ9uKrj49pFbgNVnPkx711E5j+XkjcRIE
         9TBjLUqB7/kJYxKUHwCHlZLwa2JcYri2flQga/mDcqFZshBJXqRduBjqig+/lYHZ8O6s
         +ZW+uPP3Ulf+AknsY/TJRyBAuWmORlwWYEOm/KywZGQl0oxdjH3Ivhm/fVGpXhpjJIIF
         eCGdHRUhBeZHtW9deDtPld1rUJGQ0xx40QRat/SF5AVI57MOlUjF36U9bcGFGfDLWvh6
         peZfwLHr0IwWksLky7ppyaW8agcMhnRiDqNKrc99ca7qpjrjiFSt4WfdhMuNd4/mCbif
         1n/Q==
X-Gm-Message-State: AOAM531wWU9AjXbow6oOtV5O/JD39lQGKhqcQRXdqXvToa2C7XJzpPE7
	GnWAEfJZBthKBrPmu0Mpx6hhBq6bpNU71CK6X8M=
X-Google-Smtp-Source: ABdhPJwAoJqxX7b6EHYj4W7Kjn5HBrRfbuZGrMQuixp3SE+p9vsnpbGr2DHk1YTstaOXqB9hJiWdLQBWf3c2C9R0rWE=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr20721775ejz.247.1622428083684;
 Sun, 30 May 2021 19:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210530180552.580308-1-akuster808@gmail.com> <CADkTA4ORQc2j9W9QgRJUhDY=q1ZLUdKxctJj=HLdkPPm9iGoTA@mail.gmail.com>
 <9bc2b2eb-7691-82a2-e68f-8b9d6c7459ce@gmail.com>
In-Reply-To: <9bc2b2eb-7691-82a2-e68f-8b9d6c7459ce@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 30 May 2021 22:27:52 -0400
Message-ID: <CADkTA4OWSw6DL5bJzoH3XVJfSpO+3=jZkTuCHnggND4RT-=PbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] kernel-kfrag: add new class
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 4:54 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/30/21 1:47 PM, Bruce Ashfield wrote:
> > On Sun, May 30, 2021 at 2:06 PM Armin Kuster <akuster808@gmail.com> wrote:
> >> This provides a common place to define kernel fragments
> >> that may be usefull to the larger community.
> > Not a bad idea at all, but what about calling the class
> > "kernel-features", versus kfrag ? That describes the purpose, versus
> > what the mechanism does.
> works for me.
> >
> > A 2nd suggestion would be to bbwarn if this is inherited, but
> > kernel-yocto is not.
> seems reasonable.  I did wonder the best place to place for thie. The
> kernel cache can be used w/o linux-yocto.

True that it can be, but we don't have a universal way to detect
fragment merging ... and as we all know, the implementations are all
over the place.

I'd suggest that as a starting point, check for kernel-yocto, and we
could enhance the check in the future if there are other kernel
recipes that are doing merging, that also want to use this.

There's lots of other checks that we could do about
kernel/machine/version combinations, etc (and in fact, i have an old
bugzilla for them somewhere), but I'd stick with simple first .. and
then we can see what makes sense to incrementally add.

> >
> > Note: as mentioned during the yocto summit, I do have patches that
> > make fragments more universally available, when I get them ready, we
> > could remove the bbwarn.
> Would those patches eliminate the need for a class like this?
>

Nope. They just drive the fragment operations into kernel.bbclass and
only enable it when a .cfg/.scc are detected in the SRC_URI (so as to
not impact class/standard kernel recipes). This is just delivering a
fragment to that operation, so the class would still do the same job.

Bruce

> -armin
> >
> > Bruce
> >
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta/classes/kernel-kfrag.bbclass | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>  create mode 100644 meta/classes/kernel-kfrag.bbclass
> >>
> >> diff --git a/meta/classes/kernel-kfrag.bbclass b/meta/classes/kernel-kfrag.bbclass
> >> new file mode 100644
> >> index 00000000000..c0c5667b519
> >> --- /dev/null
> >> +++ b/meta/classes/kernel-kfrag.bbclass
> >> @@ -0,0 +1,8 @@
> >> +#
> >> +# Class to place yocto-kernel-cache fragments
> >> +# selections usfull to anyone
> >> +#
> >> +
> >> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
> >> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
> >> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
> >> --
> >> 2.24.3
> >>
> >>
> >> 
> >>
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
