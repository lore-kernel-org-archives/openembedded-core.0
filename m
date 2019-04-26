Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8447CF9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 15:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44rJRh6r1JzB7;
	Fri, 26 Apr 2019 17:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556293841;
	bh=elMz9TMjjlMpQlSMPPqfwkZQfjPh1nol+2bivlxuKuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DeL4Haxb1slxQ4h0cZKAWJ5/j1lalpOYOQG3httUwmeWC16iENMC0O/LspcnDntuN
	Zglqkgoh6a4Ky0LxWTh8LmgLboEsDYtPNnP070Jw3+zjciCFjRhGGya6C/ZhydDKXj
	CXhONMIAv68BD9tNMThfO0KgCRFnZNKxULbPj2/FltCnc754xSO0FVIPqeY/F5vxLx
	2kTeGXPCX8X0XodzAsuw2wIL+QlNKwr4LmotJOldbjRvO3JicFySwHwdReXl7ZhF8b
	M2MEMSWHEfw2k8F55XnFRlAqXPCgAeXLJmbkFTXXWtYwKruYg1N2MuhoYGzYKCMr/k
	0666JrC5ZPzkSesytP0ouyGGUA9JbyDuRUw2AkNGgzPef1lgcs79xsfwlzT7MfAZdD
	Dx1AJGBlGKAPW8ce8otCWDYTDdk7umafj/YZ1IQzz70A+/3W8Qd6aAzmC3SVzUXks+
	iTLcQ3ieMZMa05UyXkECQVIz/KjM24rt4UFxNCjMCsGepXa/5VH3q8oJHScj3v1sav
	jRx6G5PbopifoFhvT3Yne9v8q5q9JkXjwB+WuTf9e3kSQstuqxF1YB819290zdT69/
	G1G/UfpRNXcxTtCW79LUXYQ0YUqhLcGeyqcAerAOtS+EI3zcngS1tRuVB3nbh3EKHj
	s8aL20a7Kudgl0Zr9a8inhbM=
Date: Fri, 26 Apr 2019 18:50:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190426155038.GA17613@localhost>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
	<20190308203904.GA19247@localhost>
	<20190425192846.GA8813@localhost>
	<bf9d998e-487b-32a0-7879-9f0694a835ee@windriver.com>
	<20190426051215.GA26023@localhost>
	<c2b30caa-1e86-8363-57fb-d399484d9708@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c2b30caa-1e86-8363-57fb-d399484d9708@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Fri, 26 Apr 2019 15:50:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 26, 2019 at 10:31:03AM -0500, Mark Hatle wrote:
> On 4/26/19 12:12 AM, Adrian Bunk wrote:
> > On Thu, Apr 25, 2019 at 03:18:47PM -0500, Mark Hatle wrote:
> >> On 4/25/19 2:28 PM, Adrian Bunk wrote:
> >>> Would you consider this patch appropriate now that warrior has branched?
> >>
> >> The use of OpenSSL10 as a 'second library' is likely no longer needed.  But
> >> OpenSSL 1.0 (as an alternative version) to OpenSSL 1.1 is still needed in some
> >> cases.. (FIPS-140-2)
> > 
> > Is anyone actually security-maintaining OpenSSL in OE?
> 
> -In- OE?  I have no idea.
> 
> Outside of OE to meet the OpenSSL-FIPS 'you must not modify the sources and
> follow these exact steps', yes people are.
>...

Why does this need OpenSSL 1.0 in Yocto?
How does this look as OE recipe?

I would say that an OpenSSL-FIPS recipe might now perhaps need an 
openssl_1.1.1%.bbappend re-adding the three openssl-conf lines my
patch removes.

Do I miss anything more complicated here?

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


