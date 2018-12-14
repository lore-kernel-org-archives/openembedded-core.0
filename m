Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 184CC60745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 22:54:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 96so6907770wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 14:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xwR7bYymst8D1yNHIXEpGp1cGtt4Nt29gFrlr5JN6Jk=;
	b=axiighLCS8XJaQiLweNo9P5GMrN5Ka0H1wtcfwmfiCnWOmualvx+gIRbhOn+ZSBJmL
	r4LBqXOO2SbB1HSTVLcZ4MrpDl4viYsmKqy9YpyQlCGCNSjPD0XwGSSz/NyunaRnpCK/
	4uMwRoEfTmucO/XliHe/SDZAH+x9ul3i8mlo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xwR7bYymst8D1yNHIXEpGp1cGtt4Nt29gFrlr5JN6Jk=;
	b=AW1g629GlPsxUjCXdhX+6Ykpv/GQ9vNWAHr7daZ9mmox44ZZVYlY1bSjxTSitN7/9K
	pTUbfyTXqRez8GwKAFzuya6dMeCS71XEl5x9baaOzCD5thMvzuBHOIcxtr1AappcdBTi
	w1K5izHfdqPZQca+r2YmFQNEKUXGT1bvAKRyaG0l8mzk6ubZrZxN8Z7peZvkGM+LgSw/
	pUdBnYy6t0tVWhxsEQJmk7oTPX0b68Kl6MM7ZOIP7v6l1adaQNlnVGMzpwT2hm5bgtbk
	oZ1H8WDoUf7iyJpA9zmAntGWY2B5EgjUiSiY+HPStVap9XrHZwg59IO2v3LixfZoyaSh
	PSLg==
X-Gm-Message-State: AA+aEWaQyyXBzaWrRlTdV/pA6CnhPoCv2Mz1KXA1Ds3amQnh9ZtyArsI
	YPYbcJt0KB/bM4Bu/cYASPi/OA==
X-Google-Smtp-Source: AFSGD/X/qWRMA/rmQA2eGIhdU3LCwQSUHIThMC7xF6FY4lt0fRPqVn0cmQFa32dSfucQelGHOqQKhw==
X-Received: by 2002:adf:df01:: with SMTP id y1mr4108453wrl.127.1544828095739; 
	Fri, 14 Dec 2018 14:54:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q12sm4517151wmf.2.2018.12.14.14.54.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Dec 2018 14:54:54 -0800 (PST)
Message-ID: <818babcd1dfc54b1233a5ccdaeea9a94e8d2ab87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Dec 2018 22:54:53 +0000
In-Reply-To: <CANNYZj8aDC6L66bSkAgMCT5dxmWMsMAEKMsixGWCvcaoUd8fbg@mail.gmail.com>
References: <20181214181535.9186-1-richard.purdie@linuxfoundation.org>
	<20181214181535.9186-2-richard.purdie@linuxfoundation.org>
	<CANNYZj8aDC6L66bSkAgMCT5dxmWMsMAEKMsixGWCvcaoUd8fbg@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/selftest/distrodata: Port to use the new recipeutils.get_recipe_upgrade_status() function
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
X-List-Received-Date: Fri, 14 Dec 2018 22:54:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 19:28 +0100, Alexander Kanavin wrote:
> On Fri, 14 Dec 2018 at 19:16, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > @@ -17,11 +19,11 @@ class Distrodata(OESelftestTestCase):
> >          feature = 'INHERIT += "distrodata"\n'
> >          feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
> 
> ^^^^ These are no longer needed? Otherwise, looks fantastic!

The license flags may not be, the distrodata is still needed right now
to inherit the maintainers include file.

I will add a patch to do that by default, then we can drop the class
and the inherit. The license flags variable needs investigation so can
also be a followup...

Cheers,

Richard


