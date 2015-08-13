Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8018C76618
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:22:18 +0000 (UTC)
Received: by iodt126 with SMTP id t126so62979664iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dr1fu5DqwLtB4Ira8govlWbZCpMeUweDB/mTOvujR9s=;
	b=DWAGnYgT7ZR9Fb9SCFofGgggLuWLctXHoWYW7CktCkUJtAwGwoBmNukGoW1RCZxfTw
	tk7sJi6oOqzH2TQNjbWMqTwWLZXtOdIQIY5KNl2h6Pf4cr51vaQ2yMdQUZ5UhONm1u2S
	UH++M3ckjSadFDJTwGwR00/7RoWJDNVMjBZ7wiDTwbMOUtW0Mt34lbk8u28uy9JRbWdz
	8CQFDknRKSHV7bB0xQ1Lx7dsdK2Q7j/tjfbvJ7h+Pe64YOwKH+8ealjPs6CJKJvOTCh5
	14NFqOC8H8fXv4gKS+hgKB2+BXkukSlV9RTRT9FyhnzYnwN0wx4jZNBYk8bQzAU4yFJC
	IyLQ==
X-Received: by 10.107.14.203 with SMTP id 194mr45260349ioo.195.1439493738439; 
	Thu, 13 Aug 2015 12:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 13 Aug 2015 12:21:48 -0700 (PDT)
In-Reply-To: <CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2015 12:21:48 -0700
Message-ID: <CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 19:22:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 13, 2015 at 12:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Debian control files are defined to be UTF-8, so the use of an ASCII
> encoding method is wrong
> (https://www.debian.org/doc/debian-policy/ch-controlfields.html).
>
> (RPM appears to assume UTF-8 too)

but check it still fine isnt it.

