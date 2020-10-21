Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web10.5205.1603244094802801195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 18:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.228.105])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id B864FA42C7;
	Wed, 21 Oct 2020 14:34:50 +1300 (NZDT)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 151.210.228.105) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: akuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 6/8] dhcp: remove from core
Date: Wed, 21 Oct 2020 14:34:50 +1300
Message-ID: <2502938.BddDVKsqQX@linc>
In-Reply-To: <20200901152236.9377-6-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com> <20200901152236.9377-6-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 2 September 2020 03:22:34 NZDT akuster wrote:
> update maintainers.inc too
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Thanks for doing this work. One request for the future though, if you could 
include in the commit message a brief explanation for changes like this (as 
simple as "Functionally replaced by kea (server-side) and dhcpcd (client 
side)" that would be much appreciated by folks looking back through the 
history :)

Cheers
Paul



