Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAD86E2E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 09:11:40 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id ep20so87275lab.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=U5Sf0QgXN0nXI/M2GBKIzWp6B+/9JAXfmInsJ6lvmc8=;
	b=Z4hJWxbCI2GD81ZF857E4+xKoIzduO6+ZSgPNz1vYTWbgeDr7GLoI8buqnsHESvrou
	oOblb/0i3UWQgC3oHJdcpSt81fcqbLL9JzO3SIWWeH3y2IHfwHqG0mARSmCJyL78idDz
	dE9YEvcPiEZbpIr0QL2duUmwg/pLAmeRpBNr6X6BDRl9xWdOPcZTHu+nEASMJy/xsMZt
	JqgCx7+bNfuiJHSzzAFzj1/mVcbNumsT5RpCyDsB9Lo5fxXZ6WmXsphJNDcyf/gvI4Ub
	X9O5TKBItvbexSwFult2Cb0LCNVI1ybcaBtfzQfJUT/kPupdE+k25ohLX1Gp1ZPUaEOu
	84DQ==
X-Received: by 10.152.120.7 with SMTP id ky7mr744853lab.83.1386839499466;
	Thu, 12 Dec 2013 01:11:39 -0800 (PST)
Received: from [172.16.141.147] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id a8sm33501923lae.5.2013.12.12.01.11.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Dec 2013 01:11:38 -0800 (PST)
Message-ID: <52A97DC1.8020402@gmail.com>
Date: Thu, 12 Dec 2013 10:11:29 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1386773181-24944-1-git-send-email-david.nystrom@enea.com>
	<1386775110.4332.90.camel@ted>
In-Reply-To: <1386775110.4332.90.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Allow creation of meta-packages for images
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
X-List-Received-Date: Thu, 12 Dec 2013 09:11:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 11 dec 2013 16:18:30, Richard Purdie wrote:
> On Wed, 2013-12-11 at 15:46 +0100, David Nyström wrote:
>> No packages were created for core-image-minimal et.c. which
>> is a known top level interface for Yocto/OE users.
>>
>> When installing from a repo, it would be good if these interfaces
>> were common. If not, users are left with
>> packagegroup-core-*, which names are not always easy to parse.
>>
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>> ---
>>   meta/classes/image.bbclass | 12 ++++--------
>>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> I'm not sure we can do this since there isn't one magic package group
> which represents a given image. The problem is it needs to account for
> IMAGE_FEATURES as well and I think this could end up confusing users
> more than helping them.
>
> Cheers,
>
> Richard

Hi Richard,

Yes, the package contents may vary, but should this not be up to the 
distro to be able
to configure meta-packages with a common top-level api ?

I suppose we can create our own ALLOW_EMPTY meta-package recipes, where 
items are RDEPEND:ed,
which in turn mirrors the contents of selected IMAGEs.

DISTRO_FEATURES and in some degree PACKAGE_CONFIG also alters package 
dependencies,
and contents. I can't really see how this is different.

Br,
David

