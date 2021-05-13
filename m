Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web10.469.1620922328402226593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 09:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=E+o1I8yI;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hDwLl0wxW1iLShDwMleS8v; Thu, 13 May 2021 17:12:06 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=IYUcpVia c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=5FLXtPjwQuUA:10 a=Q4-j1AaZAAAA:8 a=-C6SC4ZDGvx2BCIhgcEA:9
 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:CC:
	Content-ID:Content-Description;
	bh=1P0Ep9wQjsWwsm7dKHe0QhyhTv9o3GiXEv+l31utYxQ=; b=E+o1I8yIGiFYEXtYuw/b0L1hgg
	PFTwZYcn275uKcl20akpB0eD+3Xi/5LVOhD3Oc/bnUlG4etUEEiRVbkkTYXanxqotWvzdje4vri2V
	rQNEFiBefJea48+FxMUzT+3uT6jt5Sb65eAOlMdZUES/StHxJzekBoSIcDONfgTZGBSlR5YgCPBgA
	DyYCHZHV4n2l4b40QMfeKqe2lGz6RGqwzsb9yYGDWOPZFBeE1uPBndQlfhvFyMbACf+2uCaRkL6KX
	70JCg9mUR3Duf12oMToRskZux4EZffNof70uGH4664765RczoldzEknD4wfx8GCiZTyInpXi4y+6B
	IBVfXqjg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhDwL-0004V4-IS; Thu, 13 May 2021 17:11:57 +0100
Date: Thu, 13 May 2021 17:11:57 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libnotify: Make gtk+3 dependency optional
Message-ID: <20210513161157.GA16929@mcrowe.com>
References: <20210513143632.1211604-1-mac@mcrowe.com>
 <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
 <ac5c9794b628c2699810343783eaff3747c2166c.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ac5c9794b628c2699810343783eaff3747c2166c.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfGolOvp7eChSTdaWLLFf090UBvWRbNEPWu9AnSjHsVn8mIG3xNh7EEqXLwap1qKkEB+o7s72Pys3xTT7I6WEENhYZ/EtnKTQbT74ZXUec7qP+337weJC
 GKd1hslR48mQ/eyg9hpU7xIJ0cUAABStgbkKtsP3x7sOVAIqVvHKe0VIdVJnTNuuemkLoyK86e6C7A==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thursday 13 May 2021 at 17:06:23 +0100, Richard Purdie wrote:
> On Thu, 2021-05-13 at 16:43 +0200, Alexander Kanavin wrote:
> > On Thu, 13 May 2021 at 16:36, Mike Crowe via lists.openembedded.org <
> > yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> > > +PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
> > > 
> > 
> > 
> > Was the --enable-tests scenario tested? Specifying gtk+3 after two ,,s seems weird.
> 
> It means to add a runtime (RDEPENDS) rather than DEPENDS. There are 
> options for positions 5 and 6 too if I remember rightly.

Yes, but it should have been a build dependency. :( Alexander was correct
to draw attention to it. It turns out that the whole line is wrong because
I failed to spot that master is now using Meson too. :(

A better patch will be arriving shortly.

Thanks.

Mike.
