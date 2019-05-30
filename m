Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 90D307E4EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F8Ww1RDQz2M;
	Thu, 30 May 2019 16:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559225196;
	bh=82WpBxazqoYzVmy7zQNFIFrX0G+LhDxFE1xQza7Q0oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4350Knyhpo7vITC+c4UhQWItB2MQZU8an6l0xp0Vzn2JyKMqGvjzZ3N72kTR3+qA
	PELzaN2rWFLk/aJaiFb+aEfa0YvTFgmTgg0OPzjNW3ViHc7Z5TUvf1fSw1+pjfo33z
	bhuXGr6gXvSr75unwCOZlQcW6W4peiIkuH5ICiTA5oIOiuuDGX+v8i+rE+637kee5I
	UW7D70wUmVY+ZUThOue8m4v0ldPDtMqaoBSK3WspFRP9oOL9144PLG2PxVG0oGc8QR
	eaAdU8uhJcZhOKEwICCFfh2toATPP3E99lrYGpQSaf5fM+Rq2u0n1VBuBX1sWMhDLv
	ljpjr/7mFz1zzryWnFRdKA2Ptn3J1xnvL76voomk0xWmXKOYyKtoOgBQKf28NExA0D
	OcuyfERSRCT4aCaFCwJ3GPnSJvWYV4JBYSy5MrM314pIpWUJuw2p5EKONVGYxCz1uX
	i4G20/M6VNtXTVMZPt1dIdwOc72uJb1McZQ46uifk+FvdS11P7/vZHTdZ8ki0dRD6G
	Ddeu/kHxo02B9CJJRKF7MLVd1IPwdk2AMJMtOs+NVbsb6FOwNwvYqMUb9kneV/GkrZ
	EtFE3GkZqkak/DoIe6+cU2jW87yip/UZe1+Iny1JXZyTmrPZJXa+wpe4a24XEQ2Y5q
	MkerHGq01IgiNzVQwzswJ5es=
Date: Thu, 30 May 2019 17:06:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Philippe Normand <philn@igalia.com>
Message-ID: <20190530140633.GB318@localhost>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<20190530121718.GD20599@localhost>
	<4f49826346960c908c5d0dca1812bb9d9d860074.camel@igalia.com>
MIME-Version: 1.0
In-Reply-To: <4f49826346960c908c5d0dca1812bb9d9d860074.camel@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 14:06:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 02:30:14PM +0100, Philippe Normand wrote:
> Hi Adrian,

Hi Philippe,

> On Thu, 2019-05-30 at 15:17 +0300, Adrian Bunk wrote:
>...
> > 2. Wouldn't the more common case be to use the ca-certificates
> > package instead of PKCS #11?
> 
> I don't know why glib-networking needs to go through gnutls which then 
> needs to query p11-kit. I suppose p11-kit could directly be used, but 
> this is not my call to make.
>...

I think your "which then needs to query p11-kit" is not correct.

My reading of configure.ac is that ca-certificates could be used
instead, and this also makes a lot more sense in the default case.

> Philippe

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


