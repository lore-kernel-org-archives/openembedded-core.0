Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B50C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:53:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.25337.1646654009704462421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DMr6KH+Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id x15so22800263wru.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V4EGc6qUMGr0lpJ/ZxJYDKag5rBys3kKctAWHnCq/Ro=;
        b=DMr6KH+YPcW+s7/uTQVkqVPwocPVPW5vThW7r7igBhwSiZ/agqtj3pUF6Bi3KHT3s7
         EtkqUyGa8Oo492AcRIY4EhqUsW2dJ2f4gdmYZyiOArmP4bfXGgzNorlR6TMZN3Qo7JqY
         FG3Ekz3H/krnnhQ1X6m27qX1/syJ+Li2Rame4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V4EGc6qUMGr0lpJ/ZxJYDKag5rBys3kKctAWHnCq/Ro=;
        b=XNAtimv1bC1Y0M1GL2m6B7zKsKdwA2CE6EKCK6pY9gAQNZPfJxzscJWtycfkvUGVtm
         hs2eyMH5Bb0qqfXWzvRDSN7KbC6DL7rqc3ua0r3Mb9v+NoBa8OECMpHjSOVTZYdIkTYt
         Rmz7aY19ymgAzF8AQxoAWLMCgtMLCyxATyBm3UVrAToA58n7CrXS9l+dQBceuHJGFRfp
         cRL95wChWvjs41Q16NYeQS5f3Cj/wsHWe4Yud9qnuA58h6o8LNl8FLwtfDxVlEP55Sh0
         hKIkLg4rggsXZSSc9aGltkRqI+3RhLWwlQgM5p58fSjm02/bn2qeXOm1kLWgui00zwVY
         pVWA==
X-Gm-Message-State: AOAM5323HFpULOogfz+cPRWAj2fFmk1uCyHQIpqmkNXai0kU7kZpvDuO
	cHis32w6OjJc/GBoD6lPNHi/Vw==
X-Google-Smtp-Source: 
 ABdhPJwoqwUkZjVsfV9Vxc263cSpUEH2qWk4AP2KEnlihRU5Rt3gZV0o4vGoc30keeTB8ZeZXvTUPw==
X-Received: by 2002:adf:dfc2:0:b0:1f0:262a:d831 with SMTP id
 q2-20020adfdfc2000000b001f0262ad831mr7539497wrn.589.1646654007974;
        Mon, 07 Mar 2022 03:53:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb31:2700:8490:fdf8?
 ([2001:8b0:aba:5f3c:bb31:2700:8490:fdf8])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm11113161wrq.33.2022.03.07.03.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 03:53:27 -0800 (PST)
Message-ID: 
 <c4d688f9281b0dcfcde893f5d86c3c0d8e9020a7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [honister][PATCH 2/2] util-linux: upgrade 2.37.3 ->
 2.37.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
	Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 07 Mar 2022 11:53:25 +0000
In-Reply-To: <8e250ef4-2cbc-a004-903f-57309b7ebacd@theobroma-systems.com>
References: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
	 <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
	 <62fd97c4-b5e5-42d5-cc13-ae0883184210@theobroma-systems.com>
	 <cdbe8623d35c2ebf943806de4fd4400a8636f4f0.camel@linuxfoundation.org>
	 <8e250ef4-2cbc-a004-903f-57309b7ebacd@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:53:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162813

On Mon, 2022-03-07 at 12:51 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On 3/7/22 12:44, Richard Purdie wrote:
> > On Mon, 2022-03-07 at 12:26 +0100, Quentin Schulz wrote:
> > > Hi all,
> > > 
> > > On 3/7/22 12:21, Quentin Schulz wrote:
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > 
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > (cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > > ---
> > > 
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_util-2Dlinux-2Dng_msg17037.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U4eCQXCHnTmgAB4bLm1IJBHGUvY0OlzZwRhwZUecFxMBJMnqgAgrTpTz0IrWUJTR&s=Z_Fk9dO_TkdYJYl46pu81nr28SBx_F4uwjA-u2QRndg&e=  2.37.3 fixes
> > > two CVEs (not listed on nvdist database for some reason).
> > > 
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_util-2Dlinux-2Dng_msg17087.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U4eCQXCHnTmgAB4bLm1IJBHGUvY0OlzZwRhwZUecFxMBJMnqgAgrTpTz0IrWUJTR&s=FoMkkE5_1EdZcBKwKLGT1JehXLRN8KwCdyEAunBBJIw&e=  2.37.4 fixes
> > > one CVE (not listed on bvdist for some reason).
> > > 
> > > I think it might be useful for release maintainer(s) if we mention in
> > > the commit log or commit title if it's a security bump or not when
> > > sending patches for version bumps to master? What do you think? (FYI,
> > > Buildroot seems to do it regularly and it helps me with keeping my
> > > vendor tree somewhat up-to-date security wise).
> > 
> > I'm happy if people do mention it (I did for expat recently) but I'm not going
> > to block upgrades on the information being missing (how would I tell?).
> > 
> > We're struggling to get people to submit upgrades so I'm reluctant to make it
> > harder for them.
> > 
> 
> Impossible to enforce anyway, as you just mentioned. But making people 
> aware that it's a nice thing to do should be doable, e.g. adding a few 
> words in 
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#submitting-a-change-to-the-yocto-project 
> and 
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded ?
> 
> It was not my intention to suggest add additional rules, sorry if it 
> came across this way.

Highlighting in the docs sounds like a great idea :)

Cheers,

Richard




