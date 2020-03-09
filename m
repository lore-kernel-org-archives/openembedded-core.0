Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8380E60AF9;
	Mon,  9 Mar 2020 12:08:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48bcS95ZXfz3r;
	Mon,  9 Mar 2020 13:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583755690;
	bh=NOWL5tlLZOrgqlXVuLqqNVnbdLw5c9Ii0HDtd0P0o3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLu8qzi0N7gOqQ1qzbGj/Heslsr6YBkrb5ijBlkixNLCtHDdwpAP+epe6D6KSVkRh
	ob1GDHBc60JB2+DOd4204kJNjp1N73KJAjvL+NcQ7zDczNBuTNFuWu2OBIGkeVp5HT
	icvfZaMIPnm12M2QxTwsC40wL5F4RAlPGxqsXVwj+adpQo81k7xFLLwj8FZdLN83mL
	mMckTIAE+Yk+9WbHL3M8H1Ir7rbO4WMfnfs527MTc2bJtu9AefLro8VCxifOHnjFcn
	ZwY1tnhpNTBQmvSjhsUELv03e5s9GqMzvkJdGYmGgjkQmvoPB2hQoa+EySYZ+P94in
	XIKv4n6A5rYnGy73SgtQ1gkq+hU+z85jumfqBwQt7jNRwM0See48QJCL5JvMd6m3f9
	+O6oZhgK69fRdWVEQ2WYx5jsdiABiewe0TlTexvFneTevJh5ZEBN63OPfgyNPCNF/R
	VHIxFP7asRlOjl6QtVQRVITTo4qGAPIEsPAO8NDRWNov4npgCG3xleyZ/OKPtXwQ1X
	5tRlutdHCvGCHuD3QR0Wk+LGvnX0copAYmpg5lPixiohWV5T0mpLiLKKVB/AbRlLeB
	4ZksXbPO3Rf3z1+NBu7vzpBQP1UrPsFSlc1sKQWvSgqtWulJWJrqKvVYoQOZG8jcKx
	9F3sB6SdJIsA2SOAXqsyYmos=
Date: Mon, 9 Mar 2020 14:08:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200309120806.GB2477@localhost>
References: <f4e3d6a5a638b669dc742fddb14d652f06715d04.camel@linuxfoundation.org>
	<20200309105240.GA2477@localhost>
	<d6099f127ccb2211996119988c9da3f95c66becb.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d6099f127ccb2211996119988c9da3f95c66becb.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] buildtools-extended-tarball wrapping builds
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
X-List-Received-Date: Mon, 09 Mar 2020 12:08:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 09, 2020 at 11:41:13AM +0000, Richard Purdie wrote:
> On Mon, 2020-03-09 at 12:52 +0200, Adrian Bunk wrote:
> > On Sat, Mar 07, 2020 at 04:17:28PM +0000, Richard Purdie wrote:
> > > ...
> > > This does mean we could drop gcc 4.8/4.9 support if we wanted to
> > > and
> > > rely on the tarball support for centos7/debian8.
> > > ...
> > 
> > Debian 8
> > - will have LTS support ending at the end of June, and
> > - ships Python 3.4, which is no longer supported by bitbake.
> > 
> > 3 months ago Yocto master stopped working on Debian 8,
> > and as expected noone complained.
> 
> We still have one debian8 autobuilder worker:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/workers/9
> 
> and with buildtools tarball it works 'fine'.

Ah right, buildtools tarball ships python3.
So yes, this invalidates my second point.

> Cheers,
> 
> Richard

cu
Adrian

