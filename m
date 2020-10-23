Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web08.7099.1603451364634026467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 04:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 0873FA2B79;
	Sat, 24 Oct 2020 00:09:21 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>, Paul Eggleton <paul.eggleton@microsoft.com>, Ross Burton <ross@burtonini.com>
Subject: Re: [OE-core] [PATCH] Revert "classes/buildhistory: also save recipe info for native recipes"
Date: Sat, 24 Oct 2020 00:09:20 +1300
Message-ID: <35634030.XM6RcZxFsP@linc>
In-Reply-To: <CAAnfSTvDNN3wLpovsuJa8iDDJk_A6jsE2Ff3Zc3W8KaGKWNHBQ@mail.gmail.com>
References: <20201023104615.19187-1-richard.purdie@linuxfoundation.org> <CAAnfSTvDNN3wLpovsuJa8iDDJk_A6jsE2Ff3Zc3W8KaGKWNHBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 23 October 2020 23:47:38 NZDT Ross Burton wrote:
> Verified this fixes my build failures.
> 
> Ross

My apologies, this was not properly thought out nor sufficiently tested.

Paul




