Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web11.392.1630013586199085580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 14:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.225.0])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id B140FA2D68;
	Fri, 27 Aug 2021 09:32:26 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.225.0) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>,
	Andres Beltran <abeltran@linux.microsoft.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Add output file listing package information
Date: Fri, 27 Aug 2021 09:33:01 +1200
Message-ID: <12836793.uLZWGnKmhe@linc>
In-Reply-To: <20210812165856.6469-1-abeltran@linux.microsoft.com>
References: <20210812165856.6469-1-abeltran@linux.microsoft.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20210826213226.1066089.98781@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 13 August 2021 04:58:56 NZST Andres Beltran wrote:
> Currently, buildhistory does not produce a single file combining relevant
> information of installed packages. Produce an output file
> "installed-package-info.txt" listing a package's runtime name, buildtime
> name, its recipe, version, and size to avoid having to look up each package
> externally. Leave the existing package list files as-is for backwards
> compatibility.
> 
> In order to support this efficiently, extend oe-pkgdata-util to accept
> multiple keys for its read-value argument.

Acked-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>

(FWIW)

Cheers
Paul



