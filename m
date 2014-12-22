Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8037872819
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 09:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBM98vHa029268; Mon, 22 Dec 2014 09:08:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MqyJObOzjd3W; Mon, 22 Dec 2014 09:08:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBM98fG2029263
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 09:08:53 GMT
Message-ID: <1419239358.13316.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Dec 2014 09:09:18 +0000
In-Reply-To: <CADkTA4OYpdJYGjb7DB6a7kEUiCP=zUjLahddNJjy5CjxM8VqFg@mail.gmail.com>
References: <1419164943.13316.51.camel@linuxfoundation.org>
	<CADkTA4OYpdJYGjb7DB6a7kEUiCP=zUjLahddNJjy5CjxM8VqFg@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Handle ppc crtsaves.o explictly for now
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
X-List-Received-Date: Mon, 22 Dec 2014 09:09:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-12-21 at 23:43 -0400, Bruce Ashfield wrote:
> On Sun, Dec 21, 2014 at 8:29 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Resolve kernel module build failures for qemuppc by including crtsaves.o.
> >
> > I'm not particularly happy to be doing this, it should perhaps be contained
> > in the kernel-dev package. Until the overlap between kernel-devsrc and
> > kernel-dev is resolved, this at least removed the regressions.
> 
> Interesting. I built qemuppc for core-image-kerneldev and core-image-sato and
> didn't see this.
> 
> Are the build steps that triggered this captured in the bug ? Or are they in the
> mailing list thread ? Either way, I'd like to run them here as part of
> any follow
> on cleanups.
> 
> But the patch makes sense, and looks fine to me for the current state.

Reproducer is/was in local.conf:

TEST_IMAGE = "1"
TEST_SUITES = "kernelmodule"

MACHINE=qemuppc bitbake core-image-sato-sdk

which will then build the image, boot it and then try and build a kernel
module. I did cheat and disable QT4 when I did it locally.

Cheers,

Richard



