Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.907.1593209133067619759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 15:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hMBzf4KA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q15so10112648wmj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DMQWDGvYyeHZr2FAq/Gcqee1Ok24zDFGOlflsZ+L+so=;
        b=hMBzf4KADuwrR4WHAu55bvAhZwS33sha6u39n99I8BiQ+U0oTDBG3aobysnpz29rY6
         OySBRhPyohoaK9djufwSZKtQhodr95rGvfLYd/Zn6oXgH/Xih2Q2vdfkul1fvrNFb3TJ
         2JLWAWi3bJEL6t2+EXbLvzOtonpPJ1FhjbJbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DMQWDGvYyeHZr2FAq/Gcqee1Ok24zDFGOlflsZ+L+so=;
        b=A6Px4zWrnCUwkOpRx+N3u/AmSBzFZAK640TDgqIbkyt22wgo9nZB/GsdbTUpGCeLxN
         8aSJfP7W/6u02WWR5u2hWx5Ytods0KCqZtM82DQGcJ37KTp+38oGiPvkfd7h4fJJG7LR
         90d1Y1BOIyXmxF5OB8fzYxKU31RDs5nH/2kWh7YumORRMdRFLhjgLRHRj+DCs0SqN0gl
         l47lW7RyvYxRcz0MFAOp2LqlBunRmbgm8bCjeeaIIRgGajDzi6ADhW6/xVZi9FP5E7XI
         aPk84oUyUxdzshP5k43T+jIBPNVQ+a90yppiBbVAtapY4i7W/6kdguVnfVLnpCrx76z1
         AunQ==
X-Gm-Message-State: AOAM531k3qoTL+nycW+ALc/+9mEQyjTKw7jxnLDto1sz8nl3r6NDxpvo
	MtQ8EzP+0Uy6Y/12xVjxeg4R9w==
X-Google-Smtp-Source: ABdhPJw6lW0UAYjyi85VaSZJLRUkHLIQqL3x7b0ihy/6Tk9NKBDUosROigVP5lLLSuBr1FQVFUyglg==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr5537312wmk.16.1593209131379;
        Fri, 26 Jun 2020 15:05:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c6sm18191241wma.15.2020.06.26.15.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:05:30 -0700 (PDT)
Message-ID: <f7f696a4bc9a039bd24668162d4ffd641dd85289.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <sakoman@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj
 <raj.khem@gmail.com>
Date: Fri, 26 Jun 2020 23:05:29 +0100
In-Reply-To: <CAGDS+nmpht35NGDn3937ZrqQ4NsPfYnqo-eYiSba25yVd7HXiQ@mail.gmail.com>
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
	 <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
	 <CANNYZj_U=WVHNrZLZK8_pNdgHf9YyKvfpFdcSrCTrq+8X-njKA@mail.gmail.com>
	 <CAOSpxdbUVhvu_0sYvEWxiq=c8UAt1k-o4=9AXWJaMCPo5xQUsg@mail.gmail.com>
	 <CAOSpxdYOgf7Jj3O1ebFUOZo1ccZs0K=K1L6vd7rcO0d8s0vtjQ@mail.gmail.com>
	 <CAAnfSTtZOqXVz0==hgM0h3WP9igfuE1u2BU48iJWsh=rsFOwPQ@mail.gmail.com>
	 <CAOSpxdZP-aN-rWgNDpW+7nS4g-1_j5wQJ_dgxACgNo6EvonF=Q@mail.gmail.com>
	 <CANNYZj_ahPyrDVL0qoPakECCVQicdMNWm_Y3wi8oB4GJuSZwoA@mail.gmail.com>
	 <161C2CF3A1F68DB5.16301@lists.openembedded.org>
	 <CAOSpxdaNLcvvL=1g5n3Sod2HoD=Umg_sSHSiNizVL4ogyf1+ew@mail.gmail.com>
	 <CANNYZj927by5Pic50F-fe0nJk+XLwH=q65NisFObeXczSCg9rQ@mail.gmail.com>
	 <CAGDS+nmpht35NGDn3937ZrqQ4NsPfYnqo-eYiSba25yVd7HXiQ@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-26 at 11:46 -1000, Steve Sakoman wrote:
> On Fri, Jun 26, 2020 at 10:26 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > Technically, there are. I am not qualified to comment on how
> > destabilizing they could be:
> > http://site.icu-project.org/download/67
> > 
> > Perhaps it is possible to bisect the code to identify the fix that
> > can be cherry picked:
> > https://github.com/unicode-org/icu/releases/tag/release-67-1
> 
> Agreed, too many changes to take for LTS.
> 
> I think I'm just going to live with the occasional autobuilder
> failure.  This seems like way more work that it is worth :-)

I think its simpler. Look at the original implementation patch:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=72a56c2bd02d32382260d4f4fd14ab4c8d4cb8f4

specifically this bit:

            file://fix-install-manx.patch \
-           file://0001-Fix-big-endian-build.patch \
+           file://0001-Fix-big-endian-build.patch;apply=no \
            file://0001-icu-Added-armeb-support.patch \

I think the apply=no needs to be toggled depending on the PACKAGECONFIG?

Cheers,

Richard


