Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id B76827F0BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:52:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w17so8747546qto.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/68N/qG/rhIQciIsogJwo8ut2oqq/t4VPz72qnYavQ8=;
	b=lpaMi/1LxYpXK/D7qJqhZyuCrjBciobi1ojj5SUoxF7vtfER2Yr8I6TaP5aN5QBIPE
	Pe14e0xOl5vQ5WLnPTmmjG1FixxHcwE+RG2NJFO3bwh506xed7qH7QZvYYSxW0pPSBGb
	YD3xEcG10U0M5xqAz6eJ+fMH70RPPncEcsHhj0QkO7cS9uV/lCYlIopgt9OMMMMxwWe8
	DyHTiBef8oXnGclcB7yr3UUXiVpwi/hGN2HE4VJvVQ/XnzaaRs5c7uyixLxbaR5FL59v
	fnO7PHsgIZYB4HmQlfCqJCu0CJ8y/+1jWUIFN4oKZQ3wcXWBDfIvEFJ3HEHm0yXqKg1x
	K90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/68N/qG/rhIQciIsogJwo8ut2oqq/t4VPz72qnYavQ8=;
	b=cUuHwi+5Ydjhn+LASUktpN34ui3AKRuuXrSlnwcX3FysN6hdM0aj57oPuzeWBCxABo
	UdZbWi6NiWWiZ2CGIYyNq8Ls/VY6U+Ka7n8YZGL3H9H8YZpZrc7qGNjGl8NBjK6tHgay
	0BBa3GJ8ZQNcnCSRn/2FVFJQSf/HZIDc79E4USyEk7C3Jy0gDYInY2BO/HOjEm+pZ+S+
	IaunnSMefPxeZoyKXjLhqeDuc3pcyXrAiIUx6go1tQqXQ7O99bsKwxR04kCf78RKShi3
	mwVubj63YYZN+tMbSgrKIFNMTeIblnHAzt09mUSDsMhHMjCi6nYc+ScPa+ZNKDvVbVAx
	b4DQ==
X-Gm-Message-State: APjAAAUHlliiYI7wyZizGzsPZeFT++OLpR/ZGmIHQKHSbX1uy8PXras7
	3SJ64V8i/vqH4+ovH4ebnPRvFD6PunSujpaaa1c=
X-Google-Smtp-Source: APXvYqwUuUh1IyvW19pfjj0WnWyTq95OjS4Ay8QBezgUPQjWRW/NL7NYnOdnKCnHvzhc0GT3mNSZYTAz7gPAPen05Lo=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr6753238qtj.53.1562950345407;
	Fri, 12 Jul 2019 09:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
	<1554165783-46226-1-git-send-email-changqing.li@windriver.com>
	<b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
In-Reply-To: <b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 09:51:59 -0700
Message-ID: <CAMKF1srhMCmdQxdGYUKWXcL0SLPfqg7-DPWGwFbznhm6MMh-bA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] llvm: fix link error for powerpc
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
X-List-Received-Date: Fri, 12 Jul 2019 16:52:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 12:59 AM ChenQi <Qi.Chen@windriver.com> wrote:
>
> I'm recently getting llvm build failure on qemuppc. After reverting this
> patch, the build succeeds.
> My host is ubuntu16.04.
>

so what has changed ? I guess default gcc is now 9.x instead of 8.x. I
wonder if thats contributing to it
if so, I am fine with reverting the change, just mention that if using
8.x we need to add -mlongcall to cxxflags on ppc

> I'm also wondering why autobuilder does not detect the build failure. No
> world build for qemuppc?
>
> Best Regards,
> Chen Qi
>
> On 04/02/2019 08:43 AM, changqing.li@windriver.com wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > fix below link error for powerpc
> >
> > lib/libLLVMSupport.a(CommandLine.cpp.o): in function `llvm::cl::opt_storage<(anonymous namespace):
> > :HelpPrinterWrapper, true, true>::setLocation(llvm::cl::Option&, (anonymous namespace)::HelpPrinterWrapper&) [clone .isra.189]':
> > /usr/src/debug/llvm/8.0-r0/git/llvm/include/llvm/Support/CommandLine.h:1218:(.text.startup+0x5c):
> > relocation truncated to fit: R_PPC_PLTREL24 against symbol `llvm::errs()' defined in .text section in lib/libLLVMSupport.a(raw_ostream.cpp.o)+8000
> > lib/libLLVMSupport.a(CommandLine.cpp.o): in function `setLocation':
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   meta/recipes-devtools/llvm/llvm_git.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> > index d2ea927..a35ea4a 100644
> > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > @@ -88,6 +88,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
> >                     -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> >                    "
> >
> > +CXXFLAGS_append_class-target_powerpc = " -mlongcall"
> > +
> >   do_configure_prepend() {
> >   # Fix paths in llvm-config
> >       sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
>
>

