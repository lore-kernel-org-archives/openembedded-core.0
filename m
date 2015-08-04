Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4327475EEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 14:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t74ErDFO020515; Tue, 4 Aug 2015 15:53:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iuVbHDmSecx8; Tue,  4 Aug 2015 15:53:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t74Er079020414
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 4 Aug 2015 15:53:14 +0100
Message-ID: <1438699979.30526.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Tue, 04 Aug 2015 09:52:59 -0500
In-Reply-To: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
References: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-libc-headers: exclude drm headers from sysroot
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
X-List-Received-Date: Tue, 04 Aug 2015 14:53:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-04 at 09:58 -0400, Paul Gortmaker wrote:
> While diagnosing a problem with xf86-video-intel I noticed we had two
> copies of drm headers in the sysroot; one from here and one from
> the libdrm package.   The xf86-video-intel turned out to be another
> thing, but that doesn't mean we want two copies in the sysroot with
> different content and luck of include path indicating which one we
> get.
> 
> This one landed in usr/include/drm and the libdrm one put its files
> at usr/include/libdrm, so there was no obvious over-write conflict.
> 
> The obvious risk here would be unearthing implicit dependencies on
> the libdrm; things trying to build before it has populated the sysroot
> but two full highly parallel builds containing a full desktop graphics
> suite did not show any issues.
> 
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Is this something which should get addressed in the upstream kernel?

I agree we likely don't want two sets of those.

Cheers,

Richard



