Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.56583.1584979532706892054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 09:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y9Mg/W9U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id w10so17807426wrm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TGo8nDi+73DIeNJnVSHRRrXejPjrqKEW4HYdTeg7agk=;
        b=Y9Mg/W9Uocco2EEwfoaeRhHgeuB8wZ7O7C2eco3nHOTZwtRmbyTL36P/hDaYYB7ih4
         RUdBzzWl3a29Qgxik/5g3N8sVaM74hp639dnNwUySEEj1u8HGebRgQKXd7U7/fjsFly6
         3oJXEyxNg7W3Pr8eH80Dl8T8pwfasF/YQ85QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TGo8nDi+73DIeNJnVSHRRrXejPjrqKEW4HYdTeg7agk=;
        b=I0/gMNwBxiF5o89SVbbtgpABUyBhB4V6qVuvKq1Mpziv+ALkfydttnd8wutH0yLKAC
         LbsjVrV2IqlPPu72s8A4y6WnlXreYBfvth5u1vQMjpTQ3STkoZSfiP+8wy7jthaQKKt+
         UqljXEe7k834CDWjF4E7t7BuN0tPQcdg1NxkI8FWKEqFLiPTOpAussMQ9Q/pJpGit6Yr
         yfehxeGomp27XQKpzVuvsqEFFKFsvh7U7xpPlk/0U12c4rLD0vcswW6N/OE9P4xPEg3a
         iPMXLI83cAq2yyrlUOOz1au2XdQxNaWV/n8gERgjeucq0l8F7xvuHI8WJwaufxN7tjga
         vJeQ==
X-Gm-Message-State: ANhLgQ0BR1gqvaWjTin/8HCgXsj+bmxvdNdmTz7prn2netAU5n+MAkK4
	3LoRpHz0+GRADD8vbXztBT+WJQ==
X-Google-Smtp-Source: ADFU+vuHn3/Y4FThwGL9o2CIlQZ6BRDFZf8ExYK2MpjodKKAB8YrKoKM7TzcWh2j+8CiwUP0414njQ==
X-Received: by 2002:adf:9b9d:: with SMTP id d29mr30697027wrc.294.1584979531189;
        Mon, 23 Mar 2020 09:05:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o9sm8542073wrx.48.2020.03.23.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 09:05:30 -0700 (PDT)
Message-ID: <89ed530a5dc904f8ea677e2633f3732b59b3bbc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] what is the current purpose of PRIORITY variable?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Mar 2020 16:05:29 +0000
In-Reply-To: <alpine.LFD.2.21.2003230924440.14394@localhost.localdomain>
References: <alpine.LFD.2.21.2003230924440.14394@localhost.localdomain>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 09:28 -0400, rpjday@crashcourse.ca wrote:
>   continuing my travels, ran across "PRIORITY" variable that i was
> not
> aware of, was introduced in bitbake.conf way back in 2005 in
> oelint.bbclass, but there are only a few lonely references to it
> these days:
> 
> meta/conf/documentation.conf:PRIORITY[doc] = "Indicates the
> importance
> of a package.  The default value is 'optional'.  Other standard
> values
> are 'required', 'standard' and 'extra'."
> 
> meta/conf/bitbake.conf:PRIORITY = "optional"
> 
> meta/classes/package_ipk.bbclass:        fields.append(["Priority:
> %s\n", ['PRIORITY']])
> 
> meta/classes/package_ipk.bbclass:IPKEXTRAVARS = "PRIORITY MAINTAINER
> PACKAGE_ARCH HOMEPAGE"
> 
> meta/classes/package_deb.bbclass:        fields.append(["Priority:
> %s\n", ['PRIORITY']])
> 
> meta/classes/package_deb.bbclass:do_package_write_deb[vardeps] +=
> "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN
> HOMEPAGE"
> 
>   is this doing anything useful these days?

Not really, no.

Cheers,

Richard

