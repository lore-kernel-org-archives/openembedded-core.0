Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCD57D573
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 22:17:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DlSm5XYCz6Y;
	Thu, 30 May 2019 00:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559168249;
	bh=WWgzpa2IIqeQk9nhwllVWgErC/glQFtAqlJjwHPfbk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjBeI2zt20BX/wxRQu0PTFkKWVp/qpgFn9EzHkVHwSmnn/3G/jIEXJ8DFTkLAWnjU
	lhbgjQZqk+plqtDN//rI8/hS5ygZxJdwfQe/0DA2NGhKor9vGsGv2klXUzDUPVfooq
	lTzw0nBOFVUf0SYDrh9qRmY89t+dosRrrHX65S7calTb0DvNOmjarE4ZaeyhRB+UNC
	/3ivisR54NYRdA2QaOu7YLZpKJBm2M/eNoLz77M78CWUoKGU7PTfGeLZ2faNbyngXX
	bt0ZcPLFCQbarmuWD4uBlHUWMJLaEzUASO6YD9mklDy3Ln6YmXTChcFoItPL2Z7iI+
	7uWR5MAvsluHMZrUmlwhOFRLxzxauZ3iYSNH1TSadvjUPCBsBrqMQqC7aH/EJNxNKO
	ANnu7g8oi7OhVV7n0tfTBnweGVolDFJH4EyJUReJMq1No2IzosaigIRMki5Mn9wZ/E
	2XSdcv5B6Hqxt0VE9piqNorWzztm3zEMcyXm33J1crPasRlXNMXPRXriZ3dUOtPeWQ
	2DOlcPfzuk/MxZjyqlkXE9J7mLhv8WSisnrj+5IjgHLiCZerCxbPB+mPqjkmwz8Uf4
	mut1dt4yyqC8mFyv0rZskIz7VqdhfZGhssLkrFY9eihz/pJHj0R/iacoC1XWXhJX6R
	oo5Emoahy8DbxzqtNbMcibuU=
Date: Thu, 30 May 2019 01:17:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190529221726.GA16075@localhost>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 22:17:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 10:29:31PM +0100, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > On Wed, May 29, 2019 at 09:50:22PM +0100, 
> > richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org wrote:
> > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > (From OE-Core rev:
> > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > 
> > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > With back port to warrior and Thud too?
> > > > > Yes, we'll need to do that if we bring fedora 30 workers online
> > > > > on
> > > > > the
> > > > > autobuilder.
> > > > I know the uninative update is required for FC30 but changing the
> > > > compression does not.
> > > > 
> > > > This question is about the compression extension question.
> > > > 
> > > > Does this mean YP will no longer be providing bz2 uninatives?
> > > 
> > > Correct, the patch should be straight forward to include with the
> > > upgrade.
> > 
> > Does that in turn mean we must have host xz-utils?
> 
> It will mean you need a tar which supports the -J option. The tests
> I've see so far suggest all our oldest supported distros do...

For thud tar >= 1.27 is required, -J was added in 1.22.

But Tom is asking about something different:
tar calls "xz -d" for decompression, which needs xz-utils installed.

https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host 
documents that xz has to be installed, but looking at 
meta/conf/bitbake.conf it might be missing in HOSTTOOLS.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


