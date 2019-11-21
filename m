Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1173E7F7D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:50:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JkXw6rvkz4c;
	Thu, 21 Nov 2019 16:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574351425;
	bh=OccsGRuX6oxn8Bkk8i/+02H56HZxEg5h5asZVJ+vJ+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n81OcmJBcp1vznqBvt523Zv8TYj+gt5pHDfY43AWgoX++G+7/vUPRd5UP/g8tlRn2
	AWun0I9v5D5x1gQzYqas2cAAltrL64LO2QFDKeLEyKLuCwE9BAdyk+cSjHbfbfNdnh
	FLOBiZgrMIMhNhUcaFhldD+y/G2WToIv4rOEk+Vuy/4mKDU2oCuKnkqwIGDRbg5ZVY
	aZ/h6r0ugDIuXBifN/0inWqMLfXKNp5hiMn5Q9ToKHgQTGd5x2yAY/gMHYEs6F+b5A
	ngJK8yMBxo6LowVpM+kzkq1M7L0mOHG688x29yl57tRDT4GDA/Fksub/AesS/RCaZr
	zkyk5CBautQflPTK1d88c4ZSeIkFvJp1Pl6Kuaw4i4Za8LKYtps0qDXNQZdrOB3fN8
	QD/gjMotGHNexLmAH9n2rnsPo3YZX3NQyK0Sh0JkKlaM1uTZk8LpbRai2/tvbjtNgT
	0E+hYmKL+90i8rroOxB0jnoSSZo7MVgTJpkY0vH9lEFYDOssz39v+U8xJ/m7wg7Ar9
	0JwmjFGsaIX++fnOrOVh/HiiN51Qsko8X9gl7MtFt5MOrYFlL6dKgGxnbpuSZ02ceE
	RHKQQu7PEPdL/BeUGJThDZaWFRNfU73VQ1d764C/hlMmHAkw3kEv8CInSDpyoHMT+o
	CezmNG9Ri62Fkl7ydg+SzcpQ=
Date: Thu, 21 Nov 2019 17:50:18 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191121155018.GB28013@localhost>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20191121150207.3657-3-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 15:50:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 21, 2019 at 03:02:07PM +0000, Richard Purdie wrote:
> Older versions break opkg-build when reproducible builds are enabled.
> Rather than trying to be selective based on which features are enabled,
> lets just make this a minimum version.
>...
> +    if LooseVersion(version) < LooseVersion("1.28"):
> +        return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar.\n"
>...

How does "Please install a newer version of tar" work in practice
on a supported host distribution like CentOS 7 ?

As user I would expect such things to just work when using
a distribution that is documented as supported.

cu
Adrian

