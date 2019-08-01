Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E87A47DD6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 05:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zfFB5qbLz3P;
	Thu,  1 Aug 2019 07:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564637839;
	bh=TPBXXldze0tMBXiNoQYQmHnw2yxSLjkcj5nJWIaN/DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YR5Q0TGTHOeudtyWGplZ+M7DC2isjrMWWYYfTgD+MIZoeTylAMihE/QisFznHy04y
	x/mN2qbL6nenZf1xqZLy4kD8v9V7YMA4XUbF+nYyW6JkYcAz3+cw9fj9NNGc1b0qeC
	1v4LWX3MSm1vqOAgi15DAfQ7shS3VH+Ye3UsQZw5CMWhGk4Zq7naMn3xm5CWsrS/mK
	ZsEftboCqxI9S1DbNX7WfWVjetMa3NY+jVjyFNkK2Mof9sw+c7wyq28Wz5pjlBd/Mu
	cAh/HyEzg/RER9nW2PMC0TFFWA0LWlGBEqgzFrvg3SyDJfgYRWnJil5Yk0YzDvv/aK
	DrHWeOH1VPW8V3mpLPDF5igvLqsFMhmf8+Cfg7+bLy/mGMcxezLXvy22ge4ogsK90l
	jaahoisMS1hECaYmmZLzKrNqg8iZmG7D+xTRL55PY1EFaFGVMgga59W1xrEWUUyLGm
	AKUddB/rUy1ilU114tmODhMGduj67RQDHdrHKUSLvLHrup4Np9LzDXlL/bcjbDc96u
	L55pYQ3lHg1nylIcsQkCg9gilhii0jSucCayIAa2yN3smKUVRoKxOfp7OvPNF+tyuK
	Pd1Td7HW4HqKI0BeVEyQRqYVZVFYaGERv1oDMjzEryY9n1e+haM1cMu03rClvM1SZL
	E5tW2F20l7tOHvUs4GWHHl00=
Date: Thu, 1 Aug 2019 08:37:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190801053715.GA12769@localhost>
References: <20190801045001.19548-1-bunk@stusta.de>
	<CAMKF1so74xJArBvgMKUi34Lh65C5+BHV5xznsG=HUfXa18tQZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so74xJArBvgMKUi34Lh65C5+BHV5xznsG=HUfXa18tQZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: Stop disabling gold on aarch64 and mips
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
X-List-Received-Date: Thu, 01 Aug 2019 05:37:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 31, 2019 at 10:19:24PM -0700, Khem Raj wrote:
> I don’t remember if mips disable reason was same as aarch64 I hope it was
> not a runtime failure can you dig a bit

Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Aug 8 15:51:00 2016 -0700

    webkitgtk: Disable gold for mips/mips64
    
    with binutils 2.27, mips has got the gold support
    but it doesnt work for webkitgtk _yet_ therefore
    disable it for now.

To me this looked like a buildtime failure, but it's hard to be sure 
when the problem is not described.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


