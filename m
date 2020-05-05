Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.4740.1588673369651998143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 03:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZpjE49Eh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id e16so2016788wra.7
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zfikT2UwbbguNO1ljXjpad5z9yNAAgoWvq2iDCPFBXk=;
        b=ZpjE49Ehs+SJQYjpxemQpAEvCuAwk9dIXmL63/E0E/nG8hSQ3CStX/eC3a8d9zd2ad
         5x4wlpMfCiB11foO+9VOhsLbpkJXWShKN9wGn7GlzEpenrU9ZY6crsXUlYfwBZsJ0LLC
         JN0N2FTrIiaVSHKdy8w75kliD480PYE54seyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zfikT2UwbbguNO1ljXjpad5z9yNAAgoWvq2iDCPFBXk=;
        b=BX1SH5PSJMQO7EV5/FjM99b1sNFW29RxRuCjmLxS6/J15uuR45n47ghA7GYDeWQAy4
         xgoSWQYmrPCTYKqoUhOZtqAKpfW6iVGV4uzOfCdTdPfI57ibMxzafAZj+UZEYHX48z6Q
         rdBOFigeDKBrtdFXiNNAMwUeqLP+ym4mqpIxMt9uiPzM7snyIfHLQGxBvjZGxGPyDqn+
         3O0fGWLu+Wt4Vuv86WgsUxGMJxqNQ8FErZ0o7RdQuqr8KTU7E+3hGhcH4PqDMaiG/IYx
         2UzvVlKKcDEPMQvaamkgf4n6WFy57UiK29cAmLxay+CpHyyRGo7s7fEY9Xy0+kOBQLXT
         6PmA==
X-Gm-Message-State: AGi0Puakcag6dZ3WxIVmjTyDjvwDrZdNjo8m3wbLhYtP3lKUYcqArwBi
	+OWu4/3RtuzaNjl50uKGj4S5HA==
X-Google-Smtp-Source: APiQypKcFacCIVoV5zGBOrhs/FXgXDxAdPlDeV5TkVpDzi0wT5dxMLNr5iMYSyRyAroRjTuCEXFVAA==
X-Received: by 2002:adf:e941:: with SMTP id m1mr2688526wrn.385.1588673368034;
        Tue, 05 May 2020 03:09:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n2sm2324019wrt.33.2020.05.05.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:09:27 -0700 (PDT)
Message-ID: <5dca9bf84a4bd0265beead352beac6af9c0d4919.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 05 May 2020 11:09:26 +0100
In-Reply-To: <AM6PR10MB3000B53772612F2BF2E835DB92A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
References: <20200501082616.11296-1-andrej.valek@siemens.com>
	 <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj-0k=gL0K6b5r5U4SJpRo-cnUNO7zymt4J43uzapH6JKA@mail.gmail.com>
	 <AM6PR10MB3000922C3F644E6916BDE3C092AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <CANNYZj8OcGr5911zfRXpKaEYY-3o_WJCoLZoybE+=863==L2tw@mail.gmail.com>
	 <AM6PR10MB3000E49EE4C38CFA9947DDA492A80@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <AM6PR10MB30002791F30A5942D6CB496592A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
	 <abf15032d9b14a18031f0c017ab422365d386930.camel@linuxfoundation.org>
	 <AM6PR10MB3000B53772612F2BF2E835DB92A70@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-05 at 08:13 +0000, Valek, Andrej wrote:
> I know, why the patch is failing, because of mixed line endings.
> 
> I have already created a PR, where all patches fit as well. So you
> can take the patches from there instead of mailing list.

To be clear, I mean that I have a lot of requests from other people
about failing patches. There is a kernel reproducible builds issue, a
glib in meta-gplv2 issue, libinput, libacl-native and so on.

With yours I understand it needs to come from a git repo. You're using
github rather than poky-contrib so its not part of my normal workflow
and I personally hate the github UI to review a patch.

My point being I'll get to it but I'm struggling to keep up with the
problems with the patches already in master-next and that having
something outside "normal" just makes things harder and much as I wish
otherwise, lower down the queue.

Anyhow, I've added it locally so it will make the next round of testing
as its easier to "sort this" than discuss it.

Cheers,

Richard


