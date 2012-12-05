Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TgBfi-0004vc-2f
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 10:53:42 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3094620pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 01:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=z6wvbFdWJpOxMFqM99P8LTu37lFIdCKw+vv6zcGGATc=;
	b=azPnI53VEm+P8ARHlXi1AgEHEcqsUHyH80EyNMkcdxqt/T/JP9NggbTcSqN176IYA2
	3uBnX7Ga3m9vRIzOXWAh5/d9+mPib7dOay0YoQ2MfWul7DDwyRZMsEeLi2OJUHlyfjl+
	32ChSwMQTLwolo1F/F0fAU3sYK+LIdWoYGzK9D1mESIBf2wgPIEQDK1OzQ7qLwlxXO7v
	6CwAK1xaS2kSajCRbV/k33LkQKYnZZxgOQx8M4v431lZcET0U9MDoHW3z4iZ3w1TLqO6
	H8r/vfGukvtBFI0m6dPeHyUPdneDXsGxn8FNzAFVzVOVCG3/fXw5TbTCbzBREERUBNdu
	uqxg==
Received: by 10.69.1.71 with SMTP id be7mr45792587pbd.45.1354700357516;
	Wed, 05 Dec 2012 01:39:17 -0800 (PST)
Received: from yiqingliang-pc.localnet ([121.237.170.22])
	by mx.google.com with ESMTPS id vx2sm2617607pbc.33.2012.12.05.01.39.13
	(version=SSLv3 cipher=OTHER); Wed, 05 Dec 2012 01:39:16 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 05 Dec 2012 17:37:58 +0000
Message-ID: <1824060.mVimSNr8td@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
In-Reply-To: <1354699758.25268.86.camel@ted>
References: <1370507.95j740KEpU@yiqingliang-pc> <1354699758.25268.86.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why recompile gcc-cross/eglibc when update linux package?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 09:53:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

that's it!!!

I think the version of linux-libc-headers should be same as kernel, in other 
words, use same source code, so I have updated both of them.

VERY THANKS!!!

On Wednesday, December 05, 2012 09:29:18 AM Richard Purdie wrote:
> On Wed, 2012-12-05 at 10:16 +0000, Yi Qingliang wrote:
> > I update the kernel from 3.6.6 to 3.6.9, and recompile it: bitbake linux
> > 
> > but it will recompile eglibc/gcc-cross first, so long time:( why?
> > the eglibc will use kernel header? if so, understand.
> > but what about gcc-cross?
> 
> Did you change linux-libc-headers or the kernel itself?
> 
> If you change the libc-headers, gcc-cross will rebuild since it depends
> on eglibc and as you mention, eglibc depends on the headers.
> 
> Changing the target kernel recipe shouldn't rebuild any of those.
> 
> Cheers,
> 
> Richard


