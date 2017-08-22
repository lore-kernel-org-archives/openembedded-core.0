Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7652E78232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:40:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MHej3k018743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 18:40:46 +0100
Message-ID: <1503423645.32591.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 18:40:45 +0100
In-Reply-To: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 18:40:46 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Tue, 22 Aug 2017 17:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 13:32 -0400, Trevor Woerner wrote:
> Is anyone else seeing insanely long (never ending?) do_install times
> for adwaita-icon-theme? The other day I manually killed a jenkins
> jobs
> still running after 3 days waiting for this recipe's do_install.
> 
> This morning I started a job manually and it's currently stuck in
> 
>     0: adwaita-icon-theme-3.24.0-r0 do_install - 9241s (pid 25320)
> 
> I'm pretty sure it's not going to end without manual intervention.
> 
> These aren't the first/only times I've seen this issue, they're just
> the most recent. It doesn't happen often, but enough to be
> noticeable.

I suspect it may be http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=231c9fe94d5b65bea345ffe9eb5e68b0db11cb07.

I've cc'd Alex, Ross and I have seen this very occasionally too.

Cheers,

Richard



