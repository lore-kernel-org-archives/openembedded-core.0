Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6467E6BD85
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:00:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DDwgB032499; Wed, 4 Sep 2013 14:13:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I-eYvGikm6rD; Wed,  4 Sep 2013 14:13:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r84DDsca032491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 4 Sep 2013 14:13:55 +0100
Message-ID: <1378299645.1059.236.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francois Retief <fgretief@gmail.com>
Date: Wed, 04 Sep 2013 14:00:45 +0100
In-Reply-To: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
References: <CAFpw0gLn_s_SYaj9mMtYJvBfc1dqYEzYcXFn04J9+Xm1UroLeA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC search paths in MinGW SDK
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
X-List-Received-Date: Wed, 04 Sep 2013 13:00:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-03 at 23:13 +0200, Francois Retief wrote:
> Thanks to Richard's recent improvements in the oe-core tree, I finally
> got my first MinGW build to compile through and generate a SDK
> tarball.
>
> Next issue is that on windows GCC is unable to find the crt1.o, crti.o
> and crtbegin.o files. when compiling a small hello world app (see gist
> [1] for gcc verbose output). I verified that the files are indeed in
> the SDK folders and was correctly unpacked. 

Make sure you specify --sysroot=xxxx where xxxx is the location of
target sysroot you want to compile against.

> ps. I have noticed that there is a relocate_sdk.py file in the root of
> the SDK folder. What is it's purpose and can it have anything to do
> with the GCC search paths?

It is used on Linux to help with these kinds of issues, it will be
completely useless on windows and we shouldn't ship it there.

I've shared the result of my tweaks as
http://git.yoctoproject.org/cgit.cgi/meta-mingw/ btw. I flattened the
history as I had a ton of now meaningless commits and tests so it made
sense for a clean start IMO.

Cheers,

Richard



