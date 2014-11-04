Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D2FBD65D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4FsTcE027294; Tue, 4 Nov 2014 15:54:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ofAq87Ba4WKq; Tue,  4 Nov 2014 15:54:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4FsNpa027291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 4 Nov 2014 15:54:24 GMT
Message-ID: <1415116498.23396.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 04 Nov 2014 15:54:58 +0000
In-Reply-To: <CAGNsrLAPfA4=UH0GXkPeAmOx-GbJ7pnNF3gDaRixwNhNKw41og@mail.gmail.com>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
	<CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
	<CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
	<CAGNsrLAPfA4=UH0GXkPeAmOx-GbJ7pnNF3gDaRixwNhNKw41og@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Tue, 04 Nov 2014 15:55:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-11-04 at 17:10 +0200, Fathi Boudra wrote:
> after a lot of finger-pointing and implying we don't test our changes
> or do our homework or do clean builds:
> * I've built ltp for armv7a and armv8 on our builders and it works
> fine
> * I've built poky for x86 and it built fine
>
> here's my steps:
> $ git clone git://git.yoctoproject.org/poky
> $ cd poky
> $ source oe-init-build-env
> $ patch -p1 < 0001-ltp-update-to-20140828-release.patch
> $ bitbake ltp
>
> $ ls -l tmp/deploy/rpm/i586/ltp-*
> -rw-r--r-- 2 user user 55929600 Nov  4 16:28
> tmp/deploy/rpm/i586/ltp-20140828-r0.i586.rpm
> -rw-r--r-- 2 user user     3080 Nov  4 16:28
> tmp/deploy/rpm/i586/ltp-dbg-20140828-r0.i586.rpm
> -rw-r--r-- 2 user user     3264 Nov  4 16:28
> tmp/deploy/rpm/i586/ltp-dev-20140828-r0.i586.rpm
> -rw-r--r-- 2 user user    31884 Nov  4 16:28
> tmp/deploy/rpm/i586/ltp-doc-20140828-r0.i586.rpm
>
> afaict, the failure isn't related to the changes submitted. Could you
> be kind enough to try to reproduce the build failure outside of the
> yocto autobuilders? or give me the exact steps to reproduce the
> failure?

bitbake libtirpc; bitbake ltp

seems to reliably reproduce for me.

Cheers,

Richard



