Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1DA60FD8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 18:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48fsFX3Cwjz3w;
	Sat, 14 Mar 2020 19:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584212113;
	bh=0PcErTIxbCS3JaHN6RA7p1pIL6DgnhTh+87hrNkO/ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rS1+2RFosG7t5LHDHCrXXCVVacphNKfcrDe7zQi3wTDlmEuTzRqleOxjJzK28nOmq
	fQ37JxZ5Rw9hZMe+puiC1BPmVAy9EPRIo3gJz1Q+Vjhd+c/tpNrsV2W5i5rYDOp0Ek
	EWoCPdw+K3zXgkFgTtgJ1WyESeOwmkWw+6qjtDGwr29lrj9QYPo1xJqt0E+iyLnhYs
	ILRnjTbbw8qoHBcOAh5vr96EMfnR8LtqbHFd/awKOqNEfwmZaABSJCOhZeBB0rWAx3
	ptYNE60SldGO2Nl5eG0fAuma7UuZSGtsEJjrTMklMUVYjwUyUMNntuy5TFIZoat9+y
	J9M27IZBvlrSyTKf4b734t26sX2cX7TpCaZWEwaN5ZK1WGMYE+4ootqVzO0oujmAZP
	pFRxnX+c8MDwEjlD33CvIQQnLpEgzifzK6qATKI7glJIVDIl27wZCPsxE01ELgSAT+
	KmT0oNH/8VRROH4R+Bqq4sTFwQ6nTKvI57QHAVeTrpsn/gLZ4cM3J00QA9U1n72hfo
	C6nK4q9mUinbI0IMY4I1/hHaIlqhbUBaEC6+/sjyRbPrINRMRHwCR7niiBBP8KGn7u
	udL52NTOX9zp5Nls1TYNnsncGSYHdIrG0Hj3eTYP2DtULh4oFxg2Q7c9noNIAykFSK
	CCEasfKBTUa0C+zOxGPcelCI=
Date: Sat, 14 Mar 2020 20:55:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200314185510.GA7258@localhost>
References: <20200314160706.2796013-1-raj.khem@gmail.com>
	<247f037c-10bd-0eac-68d9-09155b51c81f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <247f037c-10bd-0eac-68d9-09155b51c81f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Update to 3.5.3
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
X-List-Received-Date: Sat, 14 Mar 2020 18:55:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 14, 2020 at 11:27:00AM -0700, akuster808 wrote:
> On 3/14/20 9:07 AM, Khem Raj wrote:
>...
> >  "
> > +SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd982a7c4"
> no md5sum ?

https://git.openembedded.org/bitbake/commit/?id=47f0c849ed13ba554d9523b926d92405e8251702

> - armin

cu
Adrian

