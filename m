Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.6299.1616057457224141453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 01:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DO+135DV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id 61so4589769wrm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=A/MpUHip7911U6HnPOhlRNrqnbxxMj5IZZ1y3/o4Jt8=;
        b=DO+135DV8Ik0QOoujAU3lLc2iBB8PR9dkCuqvUqCwSFXGfq4si2G4F9b/c/G3O8xZR
         pKSvUxQkEyqE1CK3/IqxlcXeZCYb5ElXpgpZaYsl+qv3sePpdx0ye4OsVRm/whH7kvyd
         hiG+mzuwGWIkYbVuiWUzcBp627DnloH2v65bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=A/MpUHip7911U6HnPOhlRNrqnbxxMj5IZZ1y3/o4Jt8=;
        b=nBaw+N4Qr75f9u9eKEF2bmaOsvulecyn2eL+a1rObcJV8pTp3gRM0AfvlbSUN7D7+8
         wbeqOK9CQfL4Jwqs782cQzKtvuuuT8nY+uj2B73t8dc4/HS3YK1HfuPvZEbSoQqwwjLE
         JVYk0unHjrZD5CIBfDDnM5OTUOsdk+i/+2+9hunk+lMdp3hc8NsrVe3zHdkxd8EgO4Nx
         c6sSdAHBSisN+f4atjd8m6Bx0ScNM1MKoUqYTJgInhH9eHz9XLgcFp7qFsThmHf7fd0c
         x4Xa7k+7VkiZWf4FwHDwFmg4DF449LVw2s0dE7o5QXUbVtOpu+SpgA877NuZAypMeGe4
         1gWw==
X-Gm-Message-State: AOAM530JPiZ9nLCpKtbyZ9KwMAfRPq18TExnov4wVo1KOeIJtAtgYM3P
	ktD8XIaP00F1WJZnyFEVGlQnog==
X-Google-Smtp-Source: ABdhPJx3MBLrN0NC2AqFRrdRjmmkBni3zAiK5Af3dh6mlKFKfEIQ8rziF23OvmV8HO8ndR2wKatlrQ==
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr8277919wrw.422.1616057455528;
        Thu, 18 Mar 2021 01:50:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:842d:8c78:da4:406b? ([2001:8b0:aba:5f3c:842d:8c78:da4:406b])
        by smtp.gmail.com with ESMTPSA id c2sm1485878wme.15.2021.03.18.01.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 01:50:55 -0700 (PDT)
Message-ID: <0dec7b1762a28052383ec39ff88122f6e49832f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Mar 2021 08:50:52 +0000
In-Reply-To: <CAMKF1srtexeyLKFLxqZXuqRg9UuaWEwLM2OCjT_bCHWz=nLReQ@mail.gmail.com>
References: <166D505781F5EE94.19946@lists.openembedded.org>
	 <166D50DC24E9BAF7.5206@lists.openembedded.org>
	 <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
	 <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com>
	 <4f991cf2-3e5a-212d-44f6-66c7e754eeb0@windriver.com>
	 <CAMKF1srtexeyLKFLxqZXuqRg9UuaWEwLM2OCjT_bCHWz=nLReQ@mail.gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-17 at 23:09 -0700, Khem Raj wrote:
> On Wed, Mar 17, 2021 at 11:04 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> > 
> > 
> > 
> > On 3/18/21 1:45 PM, Khem Raj wrote:
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > > 
> > > On Wed, Mar 17, 2021 at 10:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> > > > 
> > > > Hi Khem,
> > > > 
> > > > Understood your concern, but skip elfutils here is the least code change
> > > > and the gettext also use this means previously.
> > > 
> > > gettext perhaps can be pardoned since its the one providing these
> > > macros in first place.
> > > 
> > > > 
> > > > Meanwhile, there should as least as possible recipe need to skip wiping
> > > > macros. If no, we may need to reconsider the related implement in
> > > > autotools.bbclass. From this perspective, I think we should better
> > > > record the recipe in this general bbclass.
> > > 
> > > I agree, but so far it seems its only elfutils, if there are more then
> > > please mentioned then to the list
> > > and perhaps a different solution should be sought.
> > 
> > Currently only found elfutils has this problem in my env. I think
> > firstly if only one recipe, it's no big deal to record here as we wipe
> > the per recipe macros in this autotools.bbclass(I didn't find other
> > distribution wipe the macros). And secondly if there are other recipes
> > need to skip the wiping, then it's just right to record here to prove we
> > need to reconsider the related implements in autotools.bbclass.
> > 
> 
> this class is used everywhere, adding a check in this class would mean
> its executed in every recipe inehrititng it so no we are not doing it for
> one recipe.

I agree with Ross and Khem, this isn't a good fix. What issue are you seeing 
with elfutils? We're not seeing anything in our testing...

Cheers,

Richard

