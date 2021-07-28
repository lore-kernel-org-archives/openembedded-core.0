Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1029.1627507714574309909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 14:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RgiC0LLV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id b9so4162842wrx.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LQINTPByxx6xrW/+8oEF+1GMpSPLdrCJ6ZPTs7XghqE=;
        b=RgiC0LLVv5Gkobi0rpvm1vPE1Obe9V0qDj4pnWeIuDv+Jd1M+EriQvrYWTf3fCP+5u
         s9EQkuUI1K5sNobTPwWJN6iQttU37MHA1WkNSb4JZnp3YXr5DJp4P+MYgkozPKBs4tFP
         0YtwuuzLqjCJPMR09UFO/OvuRar4DcIFGC/Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LQINTPByxx6xrW/+8oEF+1GMpSPLdrCJ6ZPTs7XghqE=;
        b=JXVG/yX5isrvWeVgc63+jEmIVgusY9yUNHsEJo0pgr08K1Y1GUzGULjKVaNfLfBzMK
         eSsZltNfP50iwl2SU55ijXpVjfAMj/T6jotsht8oWRDLOOWCvhz6q+ZWv65JQxIccQj7
         IwFzvyH4gOl/zBMKsoDiCObfxptCMFtRi2PNHH1vEyK52B+TegcH1R4sSxGD8/YvOAHN
         Y3zXt5s/AQRgqVJG1Yie39MfZX9xW65AZ94aYkpVBx4BbOYMM8D+89Wj9thVZ6oYHYTH
         mjJ6EnkayuR3f9FlMyb92doBNgA5PMveDWP+QfeKaW42cYpSpRWlaeRs3YKCbGPgk1IW
         8yyg==
X-Gm-Message-State: AOAM532sww8GH7hgPtY209AGn6Dhm9NTn2L+/z8/dbp7s/G+UW+PKfpM
	NQ7N5wVPmU33OGDO061upTRY+Q==
X-Google-Smtp-Source: ABdhPJzQlqkrJHz8NCyH9q/K/ANVEMgnRYdApmVb6YNamnQ+upvRtnqd6RbyqU9OCaX0Du39eFDYkQ==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr1291153wru.45.1627507712802;
        Wed, 28 Jul 2021 14:28:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:824:a750:d1fb:a5cc? ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id e5sm1267480wrr.36.2021.07.28.14.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 14:28:32 -0700 (PDT)
Message-ID: <ade5b1fc3b4c5eba393ee15e0db44511c02bbfb5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jul 2021 22:28:29 +0100
In-Reply-To: <CAJ86T=WoknfuEhtgS3dOL=Xz1jsjPCViU5jXSTy703vK9cijCg@mail.gmail.com>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
	 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
	 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
	 <16960CD0F3F5D3AD.12099@lists.openembedded.org>
	 <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
	 <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com>
	 <51bf429c4259da7c57c70d28661c16d0ef68285d.camel@linuxfoundation.org>
	 <CAJ86T=WoknfuEhtgS3dOL=Xz1jsjPCViU5jXSTy703vK9cijCg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 14:21 -0700, Andre McCurdy wrote:
> On Wed, Jul 28, 2021 at 1:54 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-07-28 at 13:43 -0700, Andre McCurdy wrote:
> > 
> > > Since the script will be reused many times for many private layers I'd
> > > say making it as robust as possible is a worthy goal.
> > 
> > Well, sure. I have spent days on it and improved it several times over compared
> > to what it did do. I have it working for 10,000 cases in OE-Core with around 40
> > exceptions which I didn't think was too bad. I felt I'd reached the point of
> > diminishing returns with it. As with most things, we can improve it and patches
> > are welcome.
> 
> Unfortunately those most affected by shortcomings in the script are
> probably also those least likely to submit patches for it. Just as
> those most affected by the new recipe syntax were probably not reading
> oe-arch when you proposed the change and asked for feedback. They will
> instead find out about it months or years from now when they discover
> their meta layers don't work when they try using a new release of OE.
> At that point a lot of them will just shug and keep on using 3.1
> LTS...
> 
> > I'm more worried that the patterns of metadata in the wild may be quite different
> > to what we've trained the script with in OE-Core too, that may be a much more
> > important issue.
> 
> Yes, that's a concern too. Looking at the script now it seems to be
> mostly a long list of exceptions. The chances of it working well on
> layers you haven't considered don't look too good.

I'm not sure that is entirely true/fair. The bulk of the exceptions are for 
python function/variable names and OE-Core and bitbake itself have a much 
higher fraction of code like that than most layers do.

I am interested in real world feedback on layers people can test it against
though to see how much of an issue that really is.

The goal here isn't 100% perfect automated conversion (in which case bitbake 
could just markup things internally) but to help people convert layers with
minimal pain.

Cheers,

Richard


