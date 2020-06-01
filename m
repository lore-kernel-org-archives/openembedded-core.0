Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web11.50189.1591052198373729736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 15:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PjMaxz2a;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id n188so420809vkc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0NMnv/jptuFUGbWdbNOEj912xucXP22nS/fMnEQoSlU=;
        b=PjMaxz2aNK7v1uTRjAENY5Ts84vqXXgX31VaOscoWYKczEf8m6AIQ9aZPpFXTh55wR
         0SVHa4/xjyb+AjZXx+iFYDwavVu3ZEbgUck/Rxjxn+NEK57VvE2dPVOP4JNUhhrxTyjN
         V9QCkzEx+rw8pUZQje1o8J8myaw+g/v3PvMEJ2528ZvwbY4L+bnK1xlDahRnhC5VAWM1
         2Wrpn/8RuQ3Qemfh1fxvU6vV2BTtEx/1scoLyypOOU5dd9t6T8+vj7WP4WFJWfwV6fYa
         u/doaeBd5rRcXDeiQZzRca6y8n8buJlZs7mXQCVK3i40tegOIEbRFVvPpOEZFNjKew4b
         Oxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0NMnv/jptuFUGbWdbNOEj912xucXP22nS/fMnEQoSlU=;
        b=PXDoiIhcJKk7QL3WoJZDXTIRDprJmlWWkTqWi1arKEFdy33VXj3zEzqoa0jHdsRyE6
         BuQzuZwnXVvBJfRvsT1NeQXk0JfL4KxRpCTNrdPN+cuc1O3JJ56c9hWWZDzPdz+otW3Y
         ptxO/8rW8Fgi4r2fjQ/5cLlmdK9JCCcNEcjgGP/6w+OZX8wLZEk3gg0wo2Ck2/bhUfhz
         7FdxBlzVOpiS/ZXnc3yDI2UAXajODheNQdXde5SRqzlLu5+P20p523I0M+8UYZ1CskpU
         D4Z1FOyybDPvOiwC7u2cDc4OtJ3z7IzSDGWcB5PKLrSy9luLawAsKgnh87EtRv09X3AV
         241w==
X-Gm-Message-State: AOAM532OP6l4bwwYiidGtu7AwRY8F9sFAI91xTbg3FMeRnOBXXmB4uFM
	tma+BMxiX0s5/MA2up7LogzDin9Ai77C2YO7j9Y=
X-Google-Smtp-Source: ABdhPJwie0wmkSZdKNFKDhKz0fKiebiDTYENBKWqKHrpWlOxYnMSBAK9bxj4V2v+qs8R/wwBuDHGp6mE2SW8ftZjnuw=
X-Received: by 2002:ac5:cc44:: with SMTP id l4mr7755346vkm.43.1591052197363;
 Mon, 01 Jun 2020 15:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200514073936.40572-1-mingli.yu@windriver.com>
 <17e2ea0e-6588-355a-9f5a-b570a0e4cf87@gmail.com> <5EBCFA66.5010902@windriver.com>
 <BYAPR11MB2598FF5F9FC00BB12F54AF7EF1BD0@BYAPR11MB2598.namprd11.prod.outlook.com>
 <a0bd0c21-78b2-08ed-304c-3b5345d7e5da@gmail.com>
In-Reply-To: <a0bd0c21-78b2-08ed-304c-3b5345d7e5da@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 1 Jun 2020 15:56:28 -0700
Message-ID: <CAJ86T=W_ymSuW+D5mveh=+xo50gXq-3Chgu+shq4vWqY8_BNjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bison: fix the parallel build
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: "Yu, Mingli" <Mingli.Yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 10:53 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Hi Mingli,
> Thank you for fixing.
> /Jacob
>
> On 5/15/20 3:55 AM, Yu, Mingli wrote:
> > Hi Jacob,
> >
> > I can check the
> > https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00055.html
> > link now, so I resend the v2 to add the link for Upstream-Status part.

The previous workaround (ie EXTRA_OEMAKE_append = " -l") in the bison
recipe should be removed now.

Note also that there are questions on the bison mailing list related
to this change which don't seem to have any response yet:

  https://lists.gnu.org/archive/html/bison-patches/2020-05/msg00058.html

> > Thanks,
> > Mingli
> > ------------------------------------------------------------------------
> > *From:* Yu, Mingli <mingli.yu@windriver.com>
> > *Sent:* Thursday, May 14, 2020 15:59
> > *To:* Jacob Kroon <jacob.kroon@gmail.com>;
> > openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org>
> > *Subject:* Re: [OE-core] [PATCH] bison: fix the parallel build
> > Hi Jacob,
> >
> > On 05/14/20 15:55, Jacob Kroon wrote:
> >> Hi Mingli,
> >>
> >> On 5/14/20 9:39 AM, Yu, Mingli wrote:
> >>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>
> >>> Explicitly make the BUILT_SOURCES which
> >>> are the generated headers such as stdio.h,
> >>> fcntl.h and etc to be the dependencies of
> >>> the gl_LIBOBJS such as libbison_a-sprintf.o,
> >>> libbison_a-printf.o and etc to guarantee the
> >>> BUILT_SOURCES is generated before begin to
> >>> compile EXTRA_lib_libbison_a_SOURCES such as
> >>> fprintf.c in parallel builid, otherwise there
> >>> may come below error:
> >>>   | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
> >>>
> >>> It does the same for src_bison_OBJECTS and
> >>> lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
> >>> generated before begin to compile src_bison_SOURCES
> >>> which contains AnnotationList.c and etc.
> >>>
> >>> BTW, the MOSTLYCLEANFILES also contains the
> >>> generated header needs to be created early
> >>> in the build process, so add it also in to
> >>> avoid below error:
> >>>   | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
> >>> file or directory
> >>>
> >>> [YOCTO #13825]
> >>>
> >>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>> ---
> >>>   .../0001-bison-fix-the-parallel-build.patch   | 63 +++++++++++++++++++
> >>>   meta/recipes-devtools/bison/bison_3.5.4.bb    |  1 +
> >>>   2 files changed, 64 insertions(+)
> >>>   create mode 100644
> >>> meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> >>>
> >>> diff --git
> >>> a/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> >>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> >>>
> >>> new file mode 100644
> >>> index 0000000000..c3be91a109
> >>> --- /dev/null
> >>> +++
> >>> b/meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
> >>>
> >>> @@ -0,0 +1,63 @@
> >>> +From e0dbcee6e25b3c0cb11a627bbfe3af45ef67ec30 Mon Sep 17 00:00:00 2001
> >>> +From: Mingli Yu <mingli.yu@windriver.com>
> >>> +Date: Thu, 14 May 2020 15:23:16 +0800
> >>> +Subject: [PATCH] bison: fix the parallel build
> >>> +
> >>> +Explicitly make the BUILT_SOURCES which
> >>> +are the generated headers such as stdio.h,
> >>> +fcntl.h and etc to be the dependencies of
> >>> +the gl_LIBOBJS such as libbison_a-sprintf.o,
> >>> +libbison_a-printf.o and etc to guarantee the
> >>> +BUILT_SOURCES is generated before begin to
> >>> +compile EXTRA_lib_libbison_a_SOURCES such as
> >>> +fprintf.c in parallel builid, otherwise there
> >>> +may come below error:
> >>> + | muscle-tab.c:(.text+0x77a): undefined reference to `rpl_sprintf'
> >>> +
> >>> +It does the same for src_bison_OBJECTS and
> >>> +lib_libbison_a_OBJECTS to make sure BUILT_SOURCES
> >>> +generated before begin to compile src_bison_SOURCES
> >>> +which contains AnnotationList.c and etc.
> >>> +
> >>> +BTW, the MOSTLYCLEANFILES also contains the
> >>> +generated header needs to be created early
> >>> +in the build process, so add it also in to
> >>> +avoid below error:
> >>> + | ./lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such
> >>> file or directory
> >>> +
> >>> +Upstream-Status: Submitted [bison-patches@gnu.org maillist]
> >>> +
> >>
> >> I can't find the patch email in the bison-patches mailing list archive,
> >> do you have a link url ?
> >
> > Good catch, that's why I didn't paste the link in the Submitted part.
> >
> > BTW, I also cannot find at
> > https://lists.gnu.org/archive/html/bison-patches/2020-05/threads.html
> > though I indeed sent to bison-patches@gnu.org.
> >
> > Thanks,
> > Mingli
> >
> >>
> >> /Jacob
> >>
> 
