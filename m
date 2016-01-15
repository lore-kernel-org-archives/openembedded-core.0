Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4349B731F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 13:24:47 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so20175741wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 05:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HgHM90KtM+vy0xDSPmWSfMPS3CAK7H64/DflkdIWnbU=;
	b=gIABljZE5Ihsiz4K5JjPvimeYiG06JH2M4G94s33BItUC3WOo1zQfNg5oGUaeXOFQn
	uEJJ9T47UR3AURwYPhVFNyEPlVdAtkPBlQe7c5soyrJeySiqt1hcxv2D5CZZM5vQqMJj
	5b+NsFqApZVmUo/RdCG4fI1bvrakjuskfOiPphGj+EpVoCtBUdLR1q+e0EbtPHiAgvgg
	zpia4ssIyH5D4uOoeh4vHtt+C8nI+fCaVIgudJ42T0F5t/sWegeVleB244guoyS+eyoA
	F6XVY4+wjp/2wFGP0OmeaW12liyxy1wH4XS70PRH1gsqy8z0rqnr5FHF9nwRhaROYS/B
	aVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HgHM90KtM+vy0xDSPmWSfMPS3CAK7H64/DflkdIWnbU=;
	b=S7XmxIDOi9VqjkYadHwUrTdi9NIcKiasak+f+eDrwjBe9fJ1+wHRrv4rk/xQ/fDBDl
	WPvLsqg1uVZ8+BwwTxFBqoHNHLlSxQfttcbUfYijH4Bs2aCIqPX/bZW+KACUIAJDCsZC
	w37Reh7BKWPcL6lNa3wQ+ZCrXbj7IXw2W0CVxw65KyvYoX7Ulz6/DDfZBS5kNcResyAL
	gHLnCb3e+6jbAAyaCqg5Sr2dTZ1Ust40oRC7pzfb1yJGVI0/cqnGR79SD3fzy1CXX9vB
	ToMQkBoXryCo5GKHFz9/tssoAY1iwxiSNfVJpB3pvppqYcM6H0YT8lhAmcrzfMVyMR3H
	GBiw==
X-Gm-Message-State: ALoCoQnCr76OhuBq6qAloHatlpP2mrKUIUAQDSSvERcllIIiN28bo4Fbsnr9OZAmtHrshcCeUZiW1NSkGQDBZ+TiGkORaJDrww==
X-Received: by 10.194.175.104 with SMTP id bz8mr9425898wjc.8.1452864288127;
	Fri, 15 Jan 2016 05:24:48 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	s129sm2536247wmf.18.2016.01.15.05.24.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 05:24:47 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <5698F31E.1020905@dresearch-fe.de>
Date: Fri, 15 Jan 2016 14:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1452863169.28375.161.camel@linuxfoundation.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 13:24:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.01.2016 14:06, Richard Purdie wrote:
> On Fri, 2016-01-15 at 13:03 +0100, Steffen Sledz wrote:
>> Hi all,
>>
>> for our internal development we use the Angstrom distro with some
>> additional layers. Now we try to switch from fido to jethro branches
>> and hit a problem where we are overchallenged.
>>
>> Our local.conf contains
>>
>>   DISTRO_FEATURES_remove = "x11 wayland"
>>
>> what results in
> 
> The error you pasted means that your setup has some kind of circular
> override references in it.
> 
> Am I correct in understanding that you hit the same error regardless of
> the above line or not?

Some kind of.

If you look at my original post, with this line the exception is somewhat related to DISTRO_FEATURES. Without the line it is related to TUNE_FEATURES.

And I made another interesting discovery: The exception appears on certain machine types only, e.g with qemuarm it appears, with qemuarm64 or qemux86 not.

And last but not least with fido we did not had any problems.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

