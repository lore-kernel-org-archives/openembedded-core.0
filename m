Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.6083.1601034223198035905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ORzN3BO3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x14so3210748wrl.12
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=a26LRfbN77ghNMipPxzG36cdqS/7Ec8YEKuEM1NwP20=;
        b=ORzN3BO3buj2UqDkb6NQFX3481HIF0O0XY5EUb0KRVtJprdJAw6vAf/Z3LalEBQ/m3
         O5j32NOtnY8hrECioQgsZHshEpeIN9I5L3x3UyySWT0p6WDieY7VmEX02mqclO9nc42+
         KVI2BeJVQH1U5V5WDi1OvjnJngn7O26uFWmlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a26LRfbN77ghNMipPxzG36cdqS/7Ec8YEKuEM1NwP20=;
        b=pLXqX78uki41ES8bCuOkvKZs/7Ru527ytBfq8k3RXN4Yt0OVVd5W+Eu/69Q5rNMt6i
         cf/eEVNxy6G25HeA9wT/5EIPN3YlV6qPm40zdCwuiyZ4lw7NiEPyxDgQWKp909Gcc4aj
         jGcs3J2vTSpImsso2dZD+hJ1Rk9RHlr2kbdYiLDWmCnfk4PyJLMPz1TSZdGKQ1Tgo7E6
         M/OOt9C8NChwP3aq+UeaTedP1ACIqk8DjKA1D0s2FKELjb7LRS3vzLdYZjYqDuuOYQIk
         kCU676wcCD1iYRCUozDcCj9EI1MfDyiELShVV4q1szn/r2fGz+vklnDggVymKT6w+zG/
         O7jg==
X-Gm-Message-State: AOAM530jRRShCqev/zhP8QY5JcB0nSRyiCSz40ZUmkyarlFoNiY/gGkb
	gSLZab+2rl8qmAHinKoV5UzCCw==
X-Google-Smtp-Source: ABdhPJw+IhPzmiHPpvWVFcXy8AKu3u7HtfjPiYNoFyOBqPJ0ItYDsjR7gosTq8DXlQ2WbGrx3Z94KA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr3833935wrn.333.1601034221476;
        Fri, 25 Sep 2020 04:43:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id u2sm2925819wre.7.2020.09.25.04.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 04:43:40 -0700 (PDT)
Message-ID: <3bcf67c6bbef25101b2f8b6bef4948b222a0fb64.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Sep 2020 12:43:37 +0100
In-Reply-To: <e923307a-eb4d-d716-82b9-ca420a317eee@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
	 <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
	 <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
	 <e923307a-eb4d-d716-82b9-ca420a317eee@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 12:31 +0200, Rasmus Villemoes wrote:
> Well, perhaps listtasks could be taught to say "[noexec flag set]" in
> the description - currently it seems to be somewhat random whether a
> class uses noexec or deltask.

No. That would just confuse things even more. That would hide do_build
for example so the default target would be missing?

> Oh, and for debugging task ordering issues, it would also be nice if
> listtasks showed tasks in topological rather than alphabetical order -
> that won't necessarily always show an implicit dependency that went
> missing due to a deltask, but it would at least reveal some of them.

I think showing half of some information would be much more confusing
that clearly not showing it. We'd just get bug reports that the order
was "wrong" and it can't be fixed in all cases.

> > I think there were technical issues as well, such as recipes which
> > inject other tasks between unpack and patch. We needed to stop those
> > other tasks running too which deltasks does effectively, noexec would
> > not.
> 
> Eh, but the other side of that coin is that there are obviously tasks
> injected between unpack and patch, or some other combination, which must
> _not_ be prevented from running

Some need to be prevented, for example where they do extra unpacking
type operations on files. Those would actively break externalsrc.

>  - cf. at least the two or three workarounds that seem to become unnecessary.

Some would be unnecessary, it would break other use cases.

> So can you give examples of
> such tasks that _should_ implicitly not run when externalsrc disables
> (one way or another) the SRCTREECOVEREDTASKS tasks? That's actually the
> RFC part of this, I hope somebody with far more knowledge of various
> corner cases and odd recipes can demonstrate why deltask is more
> appropriate - and then, as I said, some comments to that effect in
> externalsrc.bbclass would be much appreciated.

I will try my best to find them. I don't have a list of these things I
can just recite from memory. One that did come up in a quick search is:

classes/dos2unix.bbclass:addtask convert_crlf_to_lf after do_unpack before do_patch

I would note that the class doesn't appear used in OE-Core any longer.

I know there were other recipes that did inject processing between
unpack and patch but over time, for example to deal with mistakes when
projects have made releases. We have cleaned up OE-Core a lot and I
couldn't find any left at a quick search. I suspect other layers will
have them though.

Proving OE-Core is "safe" for such a change is only part of the
challenge too, there is the wider ecosystem to consider.

> I think it would be weird for a recipe to inherit externalsrc and at the
> same time define a task ordered before do_patch, then not expect that
> task to run at all. So I'm genuinely curious how such examples would look.

devtool takes recipes and adds externalsrc behind the scenes to them to
enable it to do things. Its expected these scenarios work, its used for
example by the automated upgrade helper. We're not risking breaking all
these tools just because you think the code might be cleaner.

I do agree it would be nice if we had some better way of encapsulating
the "source availability" tasks for these purposes and it would make
the work of things like externalsrc and devtool easier. Swapping
deltask and noexec around isn't going to do that though.

Your approach also concerns me as you are basically asking me to
"prove" your code has issues and it seems aren't interested in testing
even the patch you did send. If we did take the change and things
broke, who would fix that?

I'm struggling to try and keep things building as it is, without
changes like this which introduce a lot of risk :(.

Cheers,

Richard





