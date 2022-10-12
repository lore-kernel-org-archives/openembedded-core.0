Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145C0C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 10:03:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.18388.1665569033216454595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 03:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b0pERSqS;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id j4so25132299lfk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lg2wQZVbRE//PoViG3lETTYNrYyLR3ySlM2Ns1KtjM8=;
        b=b0pERSqS33LitgrLbrV8XpTT/wZRKWV8x5Y90dOKw7xGNkIKuHdBanZHI2RYlpnEQG
         HhD7dGWZzdkoP/D+Tj8gIEgIVEddnfRJN/4k1KbwHv/wkYmxd9SnReSaOJj5y4QoPsl0
         MZElG+wZnBCMcoPAKH73aB12cmLk85ljahNMLKjFyfnTMWjwMIvY0QkcN7kjwybxnhTK
         rIuKzltqzDb3RhI5Pbnbodge8o/aiiXNEPmNuYLnF9vb01Fk5uzn1JaYxXpgoPyeP+k4
         yFI2AwM/I+9X+Kqm2SHLmcD6PHQUkjiZPKMWrbvPs6nDkpNu2JJsZVCfO7m+JL79eSAU
         bDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg2wQZVbRE//PoViG3lETTYNrYyLR3ySlM2Ns1KtjM8=;
        b=R76vWtXOQBTv1ji4MyhTuVyxdsxIkYR1GhiZoh6BuFN6krXOitG91XnywNSJlp1uk6
         t+1E4S9QwYfqJlKJHTuc5b69sPus0E2E3nN6csn7wOArbp0JArusyLTtk0rlZA/ln9Hq
         z0j8DXyI7kG3K36qhUyxzxrwnnOXValsj1PyVsDV2Ys2wPwE4iLwqUEx/E6z4rhOehKt
         UMyA5qKuUP00O9A9p7f66xg/ymKNCVTmuG0KL6f8154E8OSHqpRzA97Cs/8Qldl1064s
         YaLon/c938JQxc3Ps/2x/67gdXQaxMrLoIObQKihgRIxtEGqKoGEoCmbQI3aFCZIwvrl
         5sSQ==
X-Gm-Message-State: ACrzQf25jdgUFTUBy2e0OAWy9OjQa7XVcojNY0kfdnT13v0Q5eu1rzwC
	uQBh3c4w+FrzDwZ03GyyPQip2g==
X-Google-Smtp-Source: AMsMyM4cdyB/oOIlOtnBO4FEzuZAmtOh+n4FOwKRQt8G28AFPmLGCEtIvMwJJ2akInkckCO978sMFQ==
X-Received: by 2002:a05:6512:241:b0:4a2:33e9:4829 with SMTP id b1-20020a056512024100b004a233e94829mr9834809lfo.494.1665569031000;
        Wed, 12 Oct 2022 03:03:51 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004a03e7e8019sm2237573lfk.289.2022.10.12.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:03:50 -0700 (PDT)
Date: Wed, 12 Oct 2022 13:03:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Carlo Piana <k@piana.eu>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alberto Pianon <alberto@pianon.eu>,
	OE-core <openembedded-core@lists.openembedded.org>,
	marta rybczynska <marta.rybczynska@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] severe issue in CVE checker
Message-ID: <Y0aRBGVaqoPZHXdG@nuoska>
References: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 10:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171662

Hi,

I did not mean that yocto CVE checker is useless, or that bugs like
this should not be fixed. Using it is part of the best practice
processes for making secure products with yocto (even if it's currently
not documented as such).

But we should also document that the CVE checker makes a LOT of
assumptions which are frequently broken in real life. poky tries to work well
with CVE checker but many other layers and recipes may not work at all.

Few reasons are:

 * recipe name may not match to a CPE product name in the NVD database,
   and CVE_PRODUCT may not be set

 * recipe versions PV may not be compatible with upstream version
   numbers and hance the version range checks may fail

 * data in NVD is frequently wrong about the version ranges of CVEs

And there are more corner cases. All these fail silently.

Now you found a problem with the NVD download scripting which I think
needs to be fixed. But even if it works, developers who need to run
security checks on real products need to do more than just rely on
CVE check output.

Cheers,

-Mikko

On Wed, Oct 12, 2022 at 11:51:28AM +0200, Carlo Piana wrote:
> [sent from the wrong account, resent, sorry for the noise] 
> 
> ----- Messaggio originale ----- 
> > Da: "Mikko Rapeli" <mikko.rapeli@linaro.org> 
> > A: "Marta Rybczynska" <rybczynska@gmail.com> 
> > Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Alberto Pianon" <alberto@pianon.eu>, "OE-core" 
> > <openembedded-core@lists.openembedded.org>, "marta rybczynska" <marta.rybczynska@linaro.org>, "Richard Purdie" 
> > <richard.purdie@linuxfoundation.org>, "Carlo Piana" <carlo@piana.eu> 
> > Inviato: Mercoled�, 12 ottobre 2022 10:04:07 
> > Oggetto: Re: [OE-core] severe issue in CVE checker 
> 
> > Hi, 
> > 
> > Can the downloads be turned into normal do_fetch() SRC_URI downloads including 
> > caches in yocto infrastructure? 
> > 
> > There are many issues around CVE checking that it's really 
> > a process where a lot of details and uncertainties just need to be 
> > accepted. It's far from a perfect and users just need to accept this. 
> > 
> > 
> 
> [...] 
> 
> I beg to (strongly, if I may) differ. 
> 
> CVE is broken? This is no excuse of course to ignore a known insecurity. 
> 
> Is it better to include a process that, when fails, the fail goes unnoticed, than nothing? No, "nothing" is better than flawed here, speaking of security, since a false sense of security is worse than insecurity itself. 
> 
> If we put a CVE checker that just throws in a contradictory message (a warning and eventually a "success" one) and then silently moves on without any fuss, we leave users in a state of false belief that they have completed at least the CVE checks -- however insufficient this may be -- but in reality it's a test that never fails because the database is empty or outdated. I agree that for developers CVE checking, compliance, software component inventory are a PITA, but it's way more a PITA when an attacker exploits an unpatched known insecurity kept out in the wild, or when a copyright troll comes after you demanding (many!) millions in damages (I can't disclose who has received it, but I have seen it in real life), because you failed to notice that a GPL component went into a mass-distribution device. 
> 
> Once the function is advertised, the expected behaviour for a thing of that importance must be to visibly flag the issue and **stand in the way** until you acknowledge it, so that the warning cannot be missed. It is up to the duly informed user to say "Ok, it's nothing, I know it" and shrug the problem off. Not a decision taken for the user by others and hidden under the carpet. We have several clients relying on that CVE checking and just by coincidence we noticed that something did not add up. God only knows how many times did this happen before. 
> 
> One can think it's not their problem, this is open source after all. But being open source is not total relief from liability. If you create a hole in the road and cover it with foliage, the fact that you are not paid to pave the road and you are doing it as a service for the community does not shield you if a car takes a nose-dive into it. 
> 
> I am sorry to intrude in the discussion so bluntly, but I prefer that the legal implications are correctly perceived before making a decision. 
> 
> All the best, 
> 
> Carlo 
> 

