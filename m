Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web12.3445.1594072070193703013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 14:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.224.22])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 3E264A42FD;
	Tue,  7 Jul 2020 09:47:46 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 151.210.224.22) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: default to empty string, if LIC_FILES_CHKSUM is not available
Date: Tue, 07 Jul 2020 09:47:45 +1200
Message-ID: <5369173.DvuYhMxLoT@linc>
In-Reply-To: <0f90bcd9-199e-df33-00d2-11009898430a@gmail.com>
References: <20200706194226.4892-1-bjarne_michelsen@hotmail.com> <0f90bcd9-199e-df33-00d2-11009898430a@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Khem / Bjarne

On Tuesday, 7 July 2020 07:50:47 NZST Khem Raj wrote:
> On 7/6/20 12:42 PM, Bjarne Michelsen wrote:
> > [Bug 13971] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13971
> > 
> > A recipe using LICENSE=CLOSED would normally not have LIC_FILES_CHKSUM
> > set.
> > If LIC_FILES_CHKSUM was not set, it would cause `devtool upgrade` to fail.
> > 
> > This fixes the issue by defaulting to an empty string if
> > LIC_FILES_CHKSUM is not found.
> 
> would it do just for recipes which use CLOSED for license ?
> since we are synthesizing the checksum, It would be good to remain
> prudent and not empty it out in general when non existent, perhaps
> a warning for user to fix it in such cases would be appropriate

It would be nice to show an error if LIC_FILES_CHKSUM is empty and LICENSE != 
"CLOSED", although one would imagine this would be a fairly rare situation 
given that LIC_FILES_CHKSUM is mandated by the build system in that case and 
devtool upgrade requires a recipe to already exist (presumably one that has 
been built before). 

The fix itself is reasonable but the bug reference should be in the following 
form:

Fixes: [YOCTO #13971].

Thanks
Paul



