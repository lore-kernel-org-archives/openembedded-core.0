Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.702.1627938529033181778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 14:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nmTnhurL;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id a19so12641870qtx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TPjhNnu6FLuosmsU5LsxxSCjOBEcO8C8KvlKG2iPpcg=;
        b=nmTnhurLLy5AVUAfJPskHApgekXoESoFY2GQiicJxW37cYFQm8d6gn2bzEEdEqH3Jl
         q3rGEAkmxAsfdbPqjNupClPwx/AUjB6hfk+mPB3spINykPGF/XMw2HF3bGL3dWwDvYMA
         rLow8s1WBiz+lKHrnyAu51wEMLExmjyeH4AWBTryOs7RZWcgW2AZrrXp7W1/nYOzGtjS
         JAksWkCfbCs5S5Za0LkkDSKd+J4tRyq+/BonpHhJftWc86+aR0IvYJXHtXRGMdogdn1n
         JwB8TImu04gUQBFocyW61aD+bkb8/t4Jpe7RlFk0UXboivHXhwyRop5HmG66xC/tvhgi
         1qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TPjhNnu6FLuosmsU5LsxxSCjOBEcO8C8KvlKG2iPpcg=;
        b=Rx1ptSqCxkqDtbmdd+aH1L1+Xs5Nn7E5bnRfwZOE2RlLUIBr0UXi88kuPetyz7ql2H
         o3RUSWTtyhhvkZu9CyaCTWHPCFAZ/qdyFgR3vfuDgH3O1negn56bjO88Lr2i3ioz9J2J
         t06ODumfmoLNchCy7UF2MLFRhB/VRJf5+2leaH2AQYwqrglk/mFD41z7Sov8JAntIE+d
         gfKITefI6tE69ZobGwuw1iEtF9dGTnkHyeOixVw5cDkX2X3I9a8MmTK9yzA89vPrchT1
         AN2Oa/4YgSCtRMEO4hcyFwLoCLUG/X9oUGffa39Pz5KEBCekM7TEXJI6q6Wc1XuDPQQc
         nJNg==
X-Gm-Message-State: AOAM530WrM4I3OBUflLtEThPWjKzVnGdH1ZrnhSMkSuV2wYmrUkvAhk0
	EpWzpG5JghxjJmk1bG0sRrvZ62sGs6M391s0Zxg=
X-Google-Smtp-Source: ABdhPJw85sSzLiCvwiYbiVWXUFNRn+BzrcpNw+1xFyXFhkrNhCO+oMCNwmEZbD8/Es2lN/xQmVkHTaathVpUiI5CVVw=
X-Received: by 2002:ac8:41cd:: with SMTP id o13mr15710935qtm.289.1627938528133;
 Mon, 02 Aug 2021 14:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210802154639.4181923-1-raj.khem@gmail.com> <CAMKF1soO6HGJ_8gJsgtrmz_iSp1JsD1kgk0P2TAt0qxp6ahefQ@mail.gmail.com>
 <1ff300b8d5d7447325576536760bbed872b65f13.camel@linuxfoundation.org>
In-Reply-To: <1ff300b8d5d7447325576536760bbed872b65f13.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Aug 2021 14:08:22 -0700
Message-ID: <CAMKF1sqCBeq8JuSRSaneL+jjjTJ47y6EZYBv1rarnsjbbD_p2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] glibc: Upgrade to 2.34 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 1:31 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Khem,
>
> On Mon, 2021-08-02 at 13:17 -0700, Khem Raj wrote:
> > please note that v3 is rebased on top of master-next, if you are using
> > master then v2 is good.
>
> I'm afraid I can't get any version of these to apply. Is there a branch I
> could pull from?

https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.34

this is on top of master-next btw.

>
> Cheers,
>
> Richard
>
>
