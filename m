Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web09.572.1630014325738505320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 14:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.225.0])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 6B4F6A2D68;
	Fri, 27 Aug 2021 09:44:47 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.225.0) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Label packages providing per-file dependencies in depends.dot
Date: Fri, 27 Aug 2021 09:45:22 +1200
Message-ID: <11959132.O9o76ZdvQC@linc>
In-Reply-To: <20210818171726.11101-1-abeltran@linux.microsoft.com>
References: <20210818171726.11101-1-abeltran@linux.microsoft.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20210826214447.1079031.58338@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 19 August 2021 05:17:26 NZST Andres Beltran wrote:
> Currently, depends.dot includes per-file dependencies but not the packages
> providing those files. This makes it hard to obtain all package
> dependencies by just looking at depends.dot.
> 
> Parse the RPROVIDES and FILERPROVIDES fields from pkgdata to map each of
> their values to the package providing the component. Include runtime
> packages as dependencies in depends.dot, together with the component
> provided by the package as a label.
> 
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>

Acked-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>

(FWIW)

Cheers
Paul




