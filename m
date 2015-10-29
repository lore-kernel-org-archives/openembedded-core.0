Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBEA75A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9TMKEpd022493; Thu, 29 Oct 2015 22:20:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N0ytgsuIAVvr; Thu, 29 Oct 2015 22:20:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9TMK0Ul022470
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Oct 2015 22:20:12 GMT
Message-ID: <1446157200.4521.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>
Date: Thu, 29 Oct 2015 22:20:00 +0000
In-Reply-To: <1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
References: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
	<1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glibc: Allow 64 bit atomics for x86
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
X-List-Received-Date: Thu, 29 Oct 2015 22:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-29 at 13:43 -0700, Juro Bystricky wrote:
> This patch fixes [YOCTO#8140].
> 
> The fix consist of allowing 64bit atomic ops for x86.
> This should be safe for i586 and newer CPUs.
> It also makes the synchronization more efficient.
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../glibc/glibc/use_64bit_atomics.patch            | 24 ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch

Since the patch is only changing nativesdk 32 bit x86 and we know that
the 32 bit SDK is pretty broken at the moment I've merged this on the
basis that it can't really make it any worse. There is pressure to move
to the next rc candidate for 2.0.

I would like to get to the bottom of the real issue here and I still
suspect 32 bit x86 images are likely broken too :/.

Cheers,

Richard


