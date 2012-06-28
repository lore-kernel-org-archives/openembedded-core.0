Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkKjI-0003Mq-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 21:50:16 +0200
Received: by eaal1 with SMTP id l1so973631eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QiexsdsK8RN0IiN0dM6neKap3N9EzFLIWIiqwhXnhnw=;
	b=0FVOhYAK7iHq9Gh8RKHiHjo33VFmuJaTfOHUW9Lir1m90lmKVE0WW+u5MijMia3S02
	EeNJyGfH2aYZAiyO1EQEQZw+FcJ6jadCxGEOeRIA/+XyvP7V34ACuBoQ0EYYnUQ4xHZN
	eVFu6OaBCjDBj0mNmfRpG24HGLOc9j0LYu+HeT4YOPoi/hfrEMRQyN1iiqbue5JZOuY+
	I929Y3/lUyVIBze/bMcjzOX87JB9y8Wma78UM+h0jFqpvpwEyRl4bp5pRYL8a7sTfcPj
	3OONGzMzHYuhz/UGkip1s3+xhcK7pOAp33nYpQl68vOpJYmWvwqGUGOWOTyEtSvzyCC0
	PJeA==
Received: by 10.14.37.132 with SMTP id y4mr746888eea.142.1340912361780; Thu,
	28 Jun 2012 12:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 12:38:51 -0700 (PDT)
In-Reply-To: <4FEC2F34.2090908@linaro.org>
References: <cover.1340377031.git.raj.khem@gmail.com>
	<7e632ad285b74dd043764b0830bdc63e2ad4d709.1340377031.git.raj.khem@gmail.com>
	<4FEC2F34.2090908@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 12:38:51 -0700
Message-ID: <CAMKF1sp3v6BQYVuy-5ERn_gSsr9ON3EeSbPXceR978a_At_K+Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gcc-4.6: Retire into toochain-layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 19:50:17 -0000
Content-Type: text/plain; charset=UTF-8

I have something here that should be pulled. I removed the linaro
patches from there banking on meta-linaro to provide a 4.6 version.

http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/move-gcc-4.6

On Thu, Jun 28, 2012 at 3:17 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 22.06.2012 16:59, Khem Raj pisze:
>> If anyone wants it add toolchain-layer from meta-openembedded
>> repo to your setup
>
> hrw@puchatek:~/oe/meta-openembedded/toolchain-layer/recipes-devtools/gcc$ ls
> -1
> files
> gcc-4.6
> gcc-4_6-branch-linaro-backports.inc
> gcc-common-4.6.inc
> gcc-cross-canadian_4.6.bbappend
> gcc-cross-initial_4.6.bbappend
> gcc-cross-intermediate_4.6.bbappend
> gcc-cross_4.6.bbappend
> gcc-crosssdk-initial_4.6.bbappend
> gcc-crosssdk-intermediate_4.6.bbappend
> gcc-crosssdk_4.6.bbappend
> gcc-runtime_4.6.bbappend
> gcc_4.6.bbappend
> libgcc_4.6.bbappend
>
> I would love to build gcc-(linaro-)4.6 but even toolchain-layer wants
> recipes...
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


