Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.1941.1620936542160200925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BdNPNQoZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so419389wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hqb7aI5ivV7u7JJptXMZzL8ilOeGHZdS0fEIb1x/8xI=;
        b=BdNPNQoZdQuthcSmqNofMMYEBvoJHoLgqOAjw8oOmpLTgoEooBtwm74ZhQJMabIH35
         jdjgy72hvSgJb7UHxRRB4YTjPLr/q5cxsCkZSSqLN3MboxfEYhTSKFWk6VT4RJpYS3GF
         s4ej24qDWWDm88AoTxBGxS9e6VyBJjyTg7hmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hqb7aI5ivV7u7JJptXMZzL8ilOeGHZdS0fEIb1x/8xI=;
        b=sa2uAkk07S3v9jd4B7SE1M0qa72fiidHTzaJb04MTq4UPh8ghhHv88zb5nGiPDOTdO
         4zD8N968HnCBtDFJJobkvEfh3CVrkjPbnf/omrvnqOAsaYrjvurK5K5WYSJkZueaGZ+h
         R4j/pZQ5Thy8CsiH5H4mjAloiZ9ApbUEchptZrYi1xESIbcRgJ2ObgfucgdO9Rc7nvjY
         AViviIKew2Yr8PN0aryfkQwdnMe8GsxK/6OfHtZpsw1d5AdudBot1q6PUH7hTsCjktnC
         O6Oe5jEdcBe/LZ3Sj80h4gtSiqOgLBrNaPhWAJmpA6cvTG4nilBDWfQcU8adkpYy6bEl
         I+gA==
X-Gm-Message-State: AOAM5323wxngNaCnYztWIKFMTFNCaatmxOuq1bcbtTc3k9IwlOYU9i9g
	AGllRWw/iVe1kv8RSZDldvIK4iTOey9oyQ==
X-Google-Smtp-Source: ABdhPJwb6VG9qQ++4I7eCNlDvsR8w/5tglZfGmZldaohTZZqMYyKju2YGLgkAclCQwGmLd5JzVHINg==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr45345148wmc.126.1620936540671;
        Thu, 13 May 2021 13:09:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f649:3481:d239:bb03? ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id r18sm3168651wmp.0.2021.05.13.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:09:00 -0700 (PDT)
Message-ID: <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
Subject: Re: [OE-core] master/main branch renaming and bitbake
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: colin walters <walters@verbum.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 May 2021 21:08:57 +0100
In-Reply-To: <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
	 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
	 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
	 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
	 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
	 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
	 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
	 <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-13 at 09:27 -0400, colin walters wrote:
> 
> On Thu, May 13, 2021, at 3:08 AM, Richard Purdie wrote:
> > 
> > I had a look at the code to try and remind myself why it is doing this. 
> 
> Thanks!
> 
> > The best answer I found is that it does support filtered fetching of 
> > remotes, i.e. it can and will only pull the branch it wants/needs rather
> > than a full repo clone. In the case of a small repo, it doesn't matter
> > much. For a large repo it can make a significant difference to the speed.
> 
> This is with `git clone --single-branch`?  Makes sense.
> 
> > We also don't run "test" commands against the remote repo, we figure out
> > what we want and then get it with small numbers of commands.
> 
> I think what I'd argue is that in the case where the remote branch is deleted,
> the tooling should fall back to listing remote branches, sort by
> most recently updated, and try finding the commit on that.
> And in practice, explicitly using `main` first in that list would make sense.
> 
> > Is explicitly specifying the branch along with the repo url such a big 
> > problem? We already have to provide the url, it isn't like we guess that
> > too.
> 
> The problem is that your build system is penalizing upstream projects that 
> are trying to migrate to using `main`.

Some of our users have complained, yes. That isn't a conscious decision on 
"our" part, just a rather unfortunate and unplanned consequence of the fact
we're pretty strict about declaring where we get our sources.

The advice to anyone hitting this issue is to add in the correct branch
to the SRC_URI. It is simple and easy to do, can be in bbappends 
or even changed via anonymous python and similar if necessary. We've already
found the issue with several core recipes, we simply updated them and most 
users didn't notice. I would even likely take that kind of change into older
otherwise unmaintained branches and I think I did so in at least one case in
the past.

There is no intent to peanlize or complain, my intent is just to deal with
it like any other upstream source change, these things happen all the time. 
I am stating that here for any other maintainers to read and suggest they 
follow oe-core's lead.

I appreciate the tooling could do all kinds of magic things. I have a strong
preference for not adding magic into it, or over complicating it, it is already
horrendously complicated and a nightmare to test. I appreciate nobody believes
me, I only do my best to maintain it. The code is here for anyone interested:

http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/fetch2/git.py

I'd also note you can add ;nobranch=1 to the urls or ;usehead=1. Those do
have side effects, I will not recommend them, or accept them for general use
in layers I maintain, they're considered developer options. I was reminded
recently that we have seen bugs the branch parameter has caught where a 
revision was not where we thought it was so these do catch real world issues.

Cheers,

Richard


