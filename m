Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.36951.1605543729045661940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 08:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DFFVKxw7;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id s8so16124776yba.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 08:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8inQK6oG2cpNmeHyn1U5u6ccKY2rido/xzzxPl0EnI=;
        b=DFFVKxw7jsgdWw9z6WTZBacK6zqGLpjyIvkAgcl+Oy99L2dKQ+TrHetDkmtzZAio96
         qUmXH3WU2wNLZqkJ/PzQCQmJzJGAX4k4KTTLDm30U+Y3oBTF01IlsXg+CJfMWUXOhuyu
         pL9uozPeXx5Csn8bRb7kCiLIxIoLYMDgYMqhDDFqOCQoZv9J4p9afWkFdCJ194iEUP/B
         jYjWi8EiOqt8Coz+8ahyBtZc9kgVPrf+VX7+2a1d05DOzO7x2yOX8dqvdAeeBBs0YyOz
         JBkCx5emJXsJBl8qQSUgEcv5jktY+nEAmnVJKC656FkndiU8ZnvEqI2ciHD484wlkW9E
         M9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8inQK6oG2cpNmeHyn1U5u6ccKY2rido/xzzxPl0EnI=;
        b=Oq05/LQHP/T7tfiWQN4EKtWwXb5aa4DfpT8JH81/SqMpwB2URrmsGTWfOSguvIU5lp
         7/2riDnLharjapwteCLy8wQsG/AqU2z0eKToVgIFXA0wlv29bnKM3CM3NucjrzKLGlB2
         epxjAeD9THqs+r5N1nxdZAcJa+jZFaOQgXBPUykcq98dxJqgsYEMXdXYnhnWazlRc+Q7
         mArKASh+RDvsMNv4y9WfG444jKINMwJ8afdwPQXWDPBPWe52FY6Hs164TN1KuivYMVAJ
         0LpyLCRwwclBexDAJrZS5s4FtBwK3Saa+sDFRrT8V2kpBh7JFyaJInIRoW4CfS4/jvoh
         Cw5A==
X-Gm-Message-State: AOAM533tqMqL1dTzu4yCZhHUW+UjUYbKJqxk2Gr7s/wZEtOy/l0JjjCK
	O7HJvBR3TnJeLXwnh4Fn+k+xAG3d2wtbaDQhMVo=
X-Google-Smtp-Source: ABdhPJx82s2n1oXC0KAVOXDFKSOlQN9xKURM5D9eUC/fw3k+Tums0a1qH2tNpwnmL3jxTjzUMCfJQAhQNIDGPqJm1hM=
X-Received: by 2002:a25:9705:: with SMTP id d5mr19287792ybo.290.1605543728266;
 Mon, 16 Nov 2020 08:22:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605278902.git.steve@sakoman.com> <c0d1eb1efad160b7832abd87a168ca547c296d94.1605278902.git.steve@sakoman.com>
 <63ffafbe277b2b6708b3eba02ad03e18aed4c5dc.camel@gmail.com>
In-Reply-To: <63ffafbe277b2b6708b3eba02ad03e18aed4c5dc.camel@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 16 Nov 2020 06:21:57 -1000
Message-ID: <CAGDS+nkZS2eMfYyMdRWqgYToKO7e0oEDVe=erZh1rAVc1ye8qg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/18] ptest-runner: Fix license as it contains 'or later' clause
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2020 at 4:53 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Steve
>
> There is a nasty problem with ptest-runner 2.3.2: It prints an internal
> warning for each test case, which got fixed by
> commit: d3e9e5ebf36d1d1d7ee4bc38a64f6ec9e8fc819b
> "Backport patch to fix inappropriate ioctl error"
>
> You might want to consider updating ptest-runner to the latest version
> by picking 4 commits instead of just one.
>
> - ptest-runner: Bump to 2.4.0
>   792d1ebba98b097d4d68c7261bf6af0c9d186eab
> - ptest-runner: fix upstream version check
>   5df6dc44370c446c699007659782323814a4d9ce
> - ptest-runner: Backport patch to fix inappropriate ioctl error
>   d3e9e5ebf36d1d1d7ee4bc38a64f6ec9e8fc819b
> - ptest-runner: Fix license as it contains 'or later' clause
>   744a463831016abdac3433db8ca9d1b656881915
>
> We did this a few weeks ago on our local dunfell branch. So far it
> seems to be the right approach for us.

This looks reasonable to me.  I'll add these to my next autobuilder
test run and if all goes well will submit to the list for
review/comments.

Steve


> Thank you and regards,
> Adrian
>
>
> On Fri, 2020-11-13 at 04:52 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > The license headers are clear that the code is "or later", fix LICENSE
> > to match.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 5f0b5cdfcb104ac50222a47652e090ad8770e49f)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> > index 187f22df04..3a0dbf84fd 100644
> > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> > @@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
> >  runs them in sequence."
> >  HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
> >
> > -LICENSE = "GPLv2"
> > +LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> >
> >  SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
> >
> >
> We have been doing this without any problems for a few weeks now.
>
>
> 
>
