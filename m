Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.13293.1594394907950030358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iefxV/MM;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id b15so4961624edy.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwbfL/a3PGWSBE43YAEJE3Ss75kCzU/VHFiPiE0/FFM=;
        b=iefxV/MMj4FMi1VbsvsMkmbrUPXlJ2KravMe6FPqnAYCJvQU90+ANQgL9Ju1Kc3qOX
         4YY0wJ6B0sYQ99Br0ZDXyhZ59wuFfjj43HCIk1flBtAq3M6yaACBQH+F6MQgbnXQAU0w
         X7NgriblEbo+pxKTuGa9pDx2kDO8xrcQAbqaR1YTNXdGFL+Oq7JudEg5rikvoFs1KTfa
         kVO5Pu2bSQkvzKSEubupR3rSdzziSBC0nbysfUw9osbkRTHk+FTniqKA3DF7W8KizGQ9
         jn1IhNTquCH5F8pj3S0eMNL8DzCP7XZjbXj4DuYF6ejppAhFMhcQFeHd28ShRLr7qW/T
         Bdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwbfL/a3PGWSBE43YAEJE3Ss75kCzU/VHFiPiE0/FFM=;
        b=fcJmmDymhPL0g5SAlJ/m9f+mOIhRlyvsU8Q4GLJZg6N8d3EE082lbdBpuCRfN1MLeo
         ksBP618eWMay7vTu6JK1p5uMzFrAWMxUgvCchgEONrtMPmczhLXdtBraK4QTGTpbC2GG
         5jdvC3Qq8hFemDeeuWhTYlSyX6L5apsRofHYrbF7/ZFWYBq9WVlacTOMbUzA9ulMBMwa
         DztFcJICCExNDWtYr7BbrJTY2B2aYNYIlqTf/ISqrtlnTdwsVMiTsiWlnqp4jGM4zylv
         OSroZDr7q2HN4QawDbhv/tpcMhO+xRwhVmU5wYy6zaoWDyyTsIAmozq+MNbkn7R5aUXg
         DolQ==
X-Gm-Message-State: AOAM532vj9b/kCc7jOuWVEYZlJTgDifUUk4L01a0pPeENp+ENExssNmL
	dzOY2RQhroXB0gOXGkkpcSzDC5K+5TegPg8lz7s=
X-Google-Smtp-Source: ABdhPJyJainxt+B2RlkGIJ/FjDD3+5/SFCA+4y91rOYiSZuk+JEaY6UIbynKldDAVMihMsWzzZQdgNucRG5E8N9eM84=
X-Received: by 2002:a05:6402:1614:: with SMTP id f20mr75092034edv.129.1594394905946;
 Fri, 10 Jul 2020 08:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200710090514.440-1-max.krummenacher@toradex.com>
 <20200710090514.440-2-max.krummenacher@toradex.com> <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
 <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com> <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
In-Reply-To: <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 11:28:14 -0400
Message-ID: <CADkTA4P-y9n5LLFBmbwhVjV5eXqpM43oVL9KqJxzAUNS8VFZGQ@mail.gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
X-Groupsio-MsgNum: 140523
Content-Type: multipart/mixed; boundary="0000000000000048b905aa17fe42"

--0000000000000048b905aa17fe42
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 11:21 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Fri, Jul 10, 2020 at 11:12 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > Hi Bruce, Hi Andrey
> >
> > Am Freitag, den 10.07.2020, 15:21 +0200 schrieb Andrey Zhizhikin:
> > > On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > > In the case of no patches or no configure fragments, during
> > > > > do_kernel_metadata() scc is not called, and thus
> > > > > kernel-sources/${meta_dir}/config.queue is not created.
> > > > > Later do_kernel_configme fails because the file is missing.
> > > >
> > > > This is a really strange case, since in tree and defconfigs go through
> > > > the queue.
> > > > How are you ending up in this situation in the first place?
> >
> > I have a kernel recipe with SRC_URI = "git://kernel-git file://defconfig"
> > As far as I understand it no configure fragments kick in from anywhere.
> > Whith that the above case is what happens, i.e. none of the variables put together to
> > form 'elements' have any content.
> >
> > Notably, $sccs is empty. I.e. if I add some bbwarns after the sccs assignment
> >
> >         sccs="$sccs_from_src_uri"
> >         bbwarn "sccs " $sccs
> >         bbwarn "sccs_from_src_uri " $sccs_from_src_uri
> >         bbwarn "sccs_defconfig " $sccs_defconfig
> >
> > I get:
> >
> >    WARNING: sccs
> >    WARNING: sccs_from_src_uri
> >    WARNING: sccs_defconfig  .../recipes-kernel/linux/linux-toradex-4.14-2.3.x/mx8/defconfig
> >
> > sccs_defconfig has been removed from the variables which form elements in commit
> > 23dcff0d396c (oe: e6845327b693) (kernel/yocto: ensure that defconfigs are
> > processed first). Was that removal not intended?
> > In which of the variables would you expect an out of tree defconfig to end up?
>
> It goes into the config.queue just like the rest of .scc files.
>
> The changes I made recently were only to ensure that it was at the
> bottom of the queue, so fragments can logically follow and adjust
> settings. So no, the defconfig is not removed from the processing, it
> has just been order adjusted.
>
> >
> > I admit I lack the big picture of what kgit, scc and do_kernel_metadata and
> > friends really do, I wrote the patch under the impression that without
> > configuration fragments or patches one should not run scc here.
> >
> > >
> > > Can this be the same issue that was solved when defconfig is not in-tree?
> > >
> > > I guess this could happen only when the list of elements defined as:
> > > elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > > would contain nothing at all, which means that even a defconfig is not found...
> > >
> > > Max,
> > > Can you reproduce this issue from the latest master? Fix for searching
> > > for OOT defconfig is already merged there (see [1]).
> >
> > Yes, I can, actually without your patch the build errors out earlier.
> > You could reproduce it too if you removed
>
> I can build here with a defconfig only kernel, so something else is wrong.
>
> If you can send me (off list) the details of your build (your
> bblayers, local.conf settings), I can fire up a build and see what has
> gone wrong.

Actually, I think I see the hole that this managed to sail through.
Can you try the attached patch ?

It isn't the final one, since I'm also going to add a message and
error if no configuration elements are found, but I wanted to see if
this addresses the immediate issue.

I'm actually in the midst of re-working quite a bit of this flow for
the fall release, so I'm trying to keep changes to a minimum at the
moment, since they could end up being tossed in the bin shortly.

Bruce

>
> Bruce
>
> >     SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch"
> > from meta-freescale/recipes-kernel/linux/linux-imx_5.4.3.bb and rebuild that kernel e.g.
> >     MACHINE=imx8qmmek bitbake virtual/kernel -fc kernel_configme
> >
> > >
> > > > I'd rather not force create this, but detect the misconfiguration and
> > > > output a useful error message.
> > > >
> > > > Bruce
> >
> > Max
> >
> > > [1]:
> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe
> > >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000048b905aa17fe42
Content-Type: application/octet-stream; 
	name="0001-kernel-yocto-account-for-extracted-defconfig-in-elem.patch"
Content-Disposition: attachment; 
	filename="0001-kernel-yocto-account-for-extracted-defconfig-in-elem.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kcgdjvws0>
X-Attachment-Id: f_kcgdjvws0

RnJvbSBhZDRmNjBiYzExOWFlOTc0ODcwZDdkNmEyYTUxMDA2MzBkMWYyYWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBGcmksIDEwIEp1bCAyMDIwIDExOjI0OjA2IC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0ga2VybmVsLXlvY3RvOiBhY2NvdW50IGZvciBleHRyYWN0ZWQgZGVmY29uZmlnIGluIGVsZW1l
bnRzCiBjaGVjawoKVGhlIHRlc3QgZm9yIHdoZXRoZXIgb3Igbm90IHNjYyBzaG91bGQgdG8gaW52
b2tlZCB0byBnZW5lcmF0ZSBhCmNvbmZpZy5xdWV1ZSB3YXMgbWlzc2luZyB0aGUgbmV3bHkgY3Jl
YXRlZCBzY2NzX2RlZmNvbmZpZyB2YXJpYWJsZS4KV2UgbmVlZCB0byB0ZXN0IGZvciB0aGF0IHZh
cmlhYmxlIGFzIHdlbGwsIG9yIHdlIG1heSBtaXNzIGdlbmVyYXRpbmcKdGhlIGNvbmZpZy5xdWV1
ZSBpbiBzb21lIGNhc2VzLgoKU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFz
aGZpZWxkQGdtYWlsLmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3Mg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MgYi9tZXRhL2NsYXNz
ZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKaW5kZXggMzMwOTMzYTM5Ny4uM2JjZDc0YTI5NSAxMDA2
NDQKLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzCisrKyBiL21ldGEvY2xh
c3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcwpAQCAtMjUxLDcgKzI1MSw3IEBAIGRvX2tlcm5lbF9t
ZXRhZGF0YSgpIHsKIAltZXRhX2Rpcj0kKGtnaXQgLS1tZXRhKQogCiAJIyBydW4xOiBwdWxsIGFs
bCB0aGUgY29uZmlndXJhdGlvbiBmcmFnbWVudHMsIG5vIG1hdHRlciB3aGVyZSB0aGV5IGNvbWUg
ZnJvbQotCWVsZW1lbnRzPSJgZWNobyAtbiAke2JzcF9kZWZpbml0aW9ufSAke3NjY3N9ICR7cGF0
Y2hlc30gJHtLRVJORUxfRkVBVFVSRVN9YCIKKwllbGVtZW50cz0iYGVjaG8gLW4gJHtic3BfZGVm
aW5pdGlvbn0gJHNjY3NfZGVmY29uZmlnICR7c2Njc30gJHtwYXRjaGVzfSAke0tFUk5FTF9GRUFU
VVJFU31gIgogCWlmIFsgLW4gIiR7ZWxlbWVudHN9IiBdOyB0aGVuCiAJCWVjaG8gIiR7YnNwX2Rl
ZmluaXRpb259IiA+ICR7U30vJHttZXRhX2Rpcn0vYnNwX2RlZmluaXRpb24KIAkJc2NjIC0tZm9y
Y2UgLW8gJHtTfS8ke21ldGFfZGlyfTpjZmcsbWVyZ2UsbWV0YSAke2luY2x1ZGVzfSAkc2Njc19k
ZWZjb25maWcgJGJzcF9kZWZpbml0aW9uICRzY2NzICRwYXRjaGVzICR7S0VSTkVMX0ZFQVRVUkVT
fQotLSAKMi4xOS4xCgo=

--0000000000000048b905aa17fe42--
