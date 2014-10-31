Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01AFC71F05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9VAw13e023551; Fri, 31 Oct 2014 10:58:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L7gNw_zxoopl; Fri, 31 Oct 2014 10:58:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9VAvskE023548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 31 Oct 2014 10:57:57 GMT
Message-ID: <1414753109.7649.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Oct 2014 10:58:29 +0000
In-Reply-To: <CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Oct 2014 10:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-10-31 at 09:44 +0000, Burton, Ross wrote:
> On 29 October 2014 08:38, Fathi Boudra <fathi.boudra@linaro.org>
> wrote:
>         bump SRCREV to 20140828 tag
>         drop automake-foreign patch - fixed upstream (commit 18594de
>         and edbae29)
>         update realtime tests fixes upstream status from submitted to
>         backported - merged upstream
>
> This doesn't build on the autobuilders, see for
> example https://autobuilder.yoctoproject.org/main/builders/minnow/builds/84/steps/BuildImages/logs/stdio
>
> There are hundreds of compiler warnings, and a missing header.

Now, since I've heard complaints that we don't merge patches quickly, I
want to highlight what this means.

We tried this patch, we found it had issues, therefore whenever we see
similar patches from similar authors, we now have a nagging doubt about
how much testing they've had. This means we when we aggregate those
patches there is more risk to the build, we need a clean build before we
merge patches so it can delay other people's patches. This is a bit of a
vicious circle and its why you see some of the behaviour we get
complaints about.

So I'd remind people that if they send things which don't work, it does
have an impact. There is also something you can do to influence this.

Cheers,

Richard



