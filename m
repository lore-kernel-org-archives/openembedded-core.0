Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A3E93610E4;
	Mon,  9 Mar 2020 00:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48bJpk6Lggz4t;
	Mon,  9 Mar 2020 01:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583713391;
	bh=a8cmX3Wy0jaf49LCzdxkJEDK1D6acjMQ3F3WDVLq+NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iad/SfADRMsr8yqHMOqy1jpE+H+FDtzkg+aiykyeRozSljlU6h02LYR9VHb1imx/p
	BcUqFEGo5+lYvvLTDxfcSqHEa4oD34Ks2aenwGZIV5emoEAXBw5NQoFm24IRihqP3x
	ccYKNytFi0iCs4sP128HtZxEdye257hJEOs76sE/9EQpt54Un6+t+K+lCF+tobCGfZ
	ZKjaVAF2FTVWCGSVHIu2ce+5hRyKYNooEaWKO5pLIzQXtG2d74pZaZB63VyCy9p7Vz
	skTsBFx/H9j7C4WRzVPiv5TuVh6TTLWWEgfFV6bOAektXUJox3FtPjfgP3BMoIOa8g
	U4rfGC+CZeeHJ/JhbgzieCxUbwDrZsChkPduuGBpb2TKqt8RFtDmEUhRQXEPrVzmt0
	K4b7nHJ5kSSAWx96CNd33ZDq0vUNXuoDJOSqPFkoVs+shm1T0QLNaD/PDtbsfwCtjS
	7AUdb3ki/8LlQALr+4PuJ0Tji8mWdFh3O99qqxbgUx5KGgYdfpcTI7D4FaQTHh9/z0
	+Apuv5mOTCgbi4KPDTQzyz6kP1tnIhFt30GoCZBgbLMQjOG5eO0QeOuInM94YRdzor
	hvGtyIsHxY4aha55H3y5hlYeuutJRYOG9VV9rAQCZDgSkxMqvc0UUWAA4kKwbS31pj
	FQ6hK+Jt2gJRc/LrgSwNj5M4=
Date: Mon, 9 Mar 2020 02:23:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200309002308.GD1425@localhost>
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Mon, 09 Mar 2020 00:23:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 08, 2020 at 11:08:08PM +0100, Alexander Kanavin wrote:
> On Sun, 8 Mar 2020 at 22:46, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > It is on YP to make it clear to users whether or not Yocto comes with
> > the same set of security guarantees as distributions like Ubuntu or
> > Debian.
> > If it is the duty of every user of Yocto to track and fix CVEs,
> > then this has to be stated clearly instead of implying the opposite.
> > This gives users the opportunity to mitigate, instead of unknowingly
> > shipping insecure products.
> >
> 
> Do you have any actual evidence for actual users shipping insecure products
> because they mistakenly believe Yocto takes care of security for them?

Nothing to discuss in public.

> This
> has been the situation from the start of the project, certainly this was
> the case 5 years ago when I joined it, and the only person ever to make an
> issue out of it is you. Everyone else seems to understand the deal they're
> getting by using Yocto without a commercial support contract.
>...

You are saying that 'track and fix CVEs' is on users.
Let's check what YP is telling users.

Click on the "Is Yocto Project for you?" link on the YP frontpage:

https://www.yoctoproject.org/is-yocto-project-for-you/
13. Yocto Project follows a strict release schedule incorporating 
security patches in all supported releases. This predictability is 
crucial for projects that are based on Yocto Project and allows the 
development teams to plan their activities. Developers can choose which 
Yocto Project branch on which to base their activities as a function of 
their needs. The development branch will ensure access to the latest 
features while the stable branches will reduce the pace of changes. CVEs 
(common vulnerabilities and exposures) issues are supported for the 
latest 2 releases.


> Alex

cu
Adrian

