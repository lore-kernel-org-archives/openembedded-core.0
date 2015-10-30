Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CC17B75894
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 22:00:11 +0000 (UTC)
Received: by igvi2 with SMTP id i2so18916257igv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ffuGLMtcDtiA6lNJt4VaiKHNnebnUGcgc50gIKf3vEk=;
	b=mVcWki9BeKmNNu75MjePocC/WTp/Kyxg5WfqEMUaeYHwtuurayqHGtJYUVOnh9HMJ9
	uhuRh76JcJ3r35DtLKpOUCg944vTtIbbbjIBMqN/+emcPVcEDl53gnb7GJGwwkoMb/m+
	qYHRbWxKxCkgcM3zaKLKXASVaxOMb3PJ9xy5RKK/ZdBR7PIH1LQAe0yMAGbwDiKBx9Df
	Us9oRwDRRjT52eWpaEUjQpZsO5RomxBXcMqsB8fUaom/yQgI+CQn5vEo2I8Cg2iUUAPV
	hBf/1ExnqqHbjO0EXeOodZuMrmHiz/XhxHAse6ZYDzvkVHQwEODYYKBZLIY/tWHJ8E6R
	rvaA==
X-Received: by 10.50.55.42 with SMTP id o10mr603300igp.11.1446242411328; Fri,
	30 Oct 2015 15:00:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 14:59:41 -0700 (PDT)
In-Reply-To: <5633E452.9040500@windriver.com>
References: <5633E452.9040500@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 14:59:41 -0700
Message-ID: <CAMKF1sp4Jd5765g2mvDAir6MgO_4pNRvByNV9_MPjrQX-NviEw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: PowerPC / gcc / prelink
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
X-List-Received-Date: Fri, 30 Oct 2015 22:00:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 30, 2015 at 2:42 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I finally chased down the PowerPC prelink problem.  It appears to be within GCC.
>
> On most systems GCC (for PPC) is configured with --enable-secureplt.  However,
> the OE-Core version is not.  The prelinker assumes that for certain types of
> relocations that the PPC_GOT table will exist, otherwise it gives up.  (It
> doesn't know how to do the relocations in the old style .bss-got table.)
>
> I'm wondering if there is a reason that PPC is defaulting to the old style
> .bss-got (other then the secureplt was not enabled by default).
>
> Is this something we should do in all cases, or should this become a
> DISTRO_FEATURE like the mips 'mplt' setting?
>
>
> I'm still building systems and running tests, but adding --enable-secureplt to
> both the gcc-cross-initial, and gcc-cross appear to have resolved the prelinking
> issues.

enabling secureplt is ok, ensure that binutils is configured correctly as well.


>
> --Mark

