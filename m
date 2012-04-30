Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOrXX-0007Yt-Bc
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 16:25:23 +0200
Received: by lagw12 with SMTP id w12so1833544lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3UoMzvO0LCQDz2LuYwn59oIXwaBt6hDkU3sVxiqz0qs=;
	b=ecpEHy9WMMMIjUoQF8fCAzoyxsGZOxBKRvti2mYeKqyV9VeuHeEduj7zGGeax3VGDp
	qiVla1UaMNuw+OwWpbu9Pjb66fu4C0uJbdCfR3Hj7FLP4q40zDw7PFDrML+WnJfcQYQf
	zB5xqqfcqgf3lQjBudC5G9PPNlkY/ieB/ZGPvEq1pENFdBnpA85l3n06pRfPVfgw2BBI
	uHvUGsJzdsaM8San+uFop45bE+Sr1HK8yFiAnM73Ef1awbrSvqZ9E+2wXG0vlCqkQDri
	TtOkyllHL87kBOZbMRj/Jgx83nFEVZMVlNvxe2zfo3vZlxDsIja1ahOOV2/iM5RVxjuz
	lAZQ==
Received: by 10.112.86.101 with SMTP id o5mr10089012lbz.1.1335795341393; Mon,
	30 Apr 2012 07:15:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 07:15:11 -0700 (PDT)
In-Reply-To: <20120430104345.GC3664@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<20120429091230.GB350@jama.jama.net>
	<20120430104345.GC3664@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 07:15:11 -0700
Message-ID: <CAMKF1soz_mgP2bwDP_kqRVFcb5MrO3PTOTu7J+u+eWfR2W3jsQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 14:25:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 30, 2012 at 3:43 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I've found one more, which seems to happen only on x86(-64)
> /OE/shr-core/meta-openembedded/meta-oe/recipes-multimedia/libav/libav_0.7.4.bb
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
> /OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'

port the below commit from OE-Core/master

commit 1161c40a26146629613bd6a17b263175a492b751
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri Mar 30 12:07:39 2012 -0700

    gst-ffmpeg: Fix build with gcc 4.7

    A cmp instruction with two constants is invalid, therefore 'g' constraint
    is not correct but must be "rm" instead.

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


