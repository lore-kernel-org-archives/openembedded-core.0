Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEB27F303
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 03:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Mt6c0tqTz4t;
	Tue,  3 Sep 2019 05:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567482104;
	bh=8p7tm9TS/AfNPwr5h6+p48FSRaN5tSlFD/4HutU3wBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1qo39KeWuozM1lxKRLGNFQWaDaKU1csw8mi342WuMWe3pBV9aBIQu5dAv3HAkJBF
	qPyc0IStkXZSb4p4dnat7v8z5Icp9dnoB/28CoDNYww/msXS1OgDs6Yptk5sYDCbPI
	fnA6o74IITGzbI0DKIkuNrU5sGUImQW3x+XI6P5jKv3Xt7f2T4KmijAm5rlxBK/tSH
	XbI4EJQD3oCz4dCjIRb6RarwdThrmfFRXtenAY6IbxBx/wmtSuTrw3kvU6THBH3TkQ
	72XreLIUSX5uYkV0dVmhIhCt+8E28gUCao/uLn6GgDFEOqh9DkxutFHkRHBE2Q960D
	oolelUCOCYzwDQHqGuwOucIqq20mUNhXoyEVlBVOkJEdO+n/CiZVdX3o2ZsDZAlfV6
	57LzIctBmpZiKR70nt6Q89U0oHacxswquRPNHdm4isabZgPx0WZrpXe4XHw/JtLcMe
	5i/srQ1BIa+dVEPK5B0VKmAXZxD4eULDjZlRejnkDshbyziiu3Q28F5x29RU44qp04
	dsdMVK4PWSRnygQqSRbdPuWrbGovLTg8ti4NaZjdMs4Zp8IxCLrcsXj8HqMj4GUpzJ
	YZu4nIKROlO//vC70Y3KTI1aQItXzFC34kcBN6/0maMbsN3qkK+U1OLQgf4OV5TfrQ
	Ch83j4Oy+NH8HByBP9cy4F0w=
Date: Tue, 3 Sep 2019 06:41:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190903034141.GA6830@localhost>
References: <20190831211549.23729-1-akuster808@gmail.com>
	<20190901140542.GA11574@localhost>
	<9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
	<20190902124003.GA8291@localhost>
	<438c075e-9284-0eac-5aa0-9599d5c8dffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <438c075e-9284-0eac-5aa0-9599d5c8dffe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Tue, 03 Sep 2019 03:41:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Sep 02, 2019 at 02:33:02PM -0700, akuster808 wrote:
> 
> 
> On 9/2/19 5:40 AM, Adrian Bunk wrote:
> > On Sun, Sep 01, 2019 at 10:07:13AM -0700, akuster808 wrote:
> >>
> >> On 9/1/19 7:05 AM, Adrian Bunk wrote:
> >>> thud and zeus are providing 2 gcc versions each that need fixing.
> >> That is a true statement. What are you expecting?
> > The other versions also being fixed?
> >
> > gcc-8 being fixed in warrior before it gets fixed in master would be
> > the wrong order, and would introduce a security regression in master.
> sent a patch. hope it is what is meant by the above.

Thanks a lot!

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


