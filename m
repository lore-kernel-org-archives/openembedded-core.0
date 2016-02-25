Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00F70772D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:40:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1PMeGSM023631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 25 Feb 2016 14:40:16 -0800
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 14:40:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456423924.git.mark.hatle@windriver.com>
	<CAJTo0LZX67n-DicK5gWBA39sh5eyr52VvhehQNZRDd5=F=N4Ww@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56CF82CF.2020504@windriver.com>
Date: Thu, 25 Feb 2016 16:40:15 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZX67n-DicK5gWBA39sh5eyr52VvhehQNZRDd5=F=N4Ww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Thu, 25 Feb 2016 22:40:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/25/16 4:34 PM, Burton, Ross wrote:
> 
> On 25 February 2016 at 18:18, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     There is not yet an official RPM 5.4.16 release, however one will be coming
>     soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
>     5.4.16.  These patches are part of the commit (compressed w/ .xz).  However
>     I am not sending them as part of the email as it's not very interesting
>     to review base64.  :P
> 
> 
> Sorry Mark...

working on it.  There was a problem with the keccak module also enabling SSE
support.  (Same problem on any non-IA32 64-bit target such as MIPS64 and aarch64
BTW)

Which BSP is this, so I can verify I've got it resolved?

--Mark

> | In file included from ../../rpm-5.4.15/rpmio/keccak.c:71:0:
> |
> /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/5.3.0/include/emmintrin.h:753:1:
> error: inlining failed in call to always_inline '_mm_setzero_si128': target
> specific option mismatch
> |  _mm_setzero_si128 (void)
> |  ^
> | ../../rpm-5.4.15/rpmio/keccak.c:656:10: error: called from here
> |      Zero = ZERO128(); \
> |           ^
> | ../../rpm-5.4.15/rpmio/keccak.c:666:36: note: in expansion of macro
> 'thetaRhoPiChiIotaPrepareTheta'
> |  #define thetaRhoPiChiIota(i, A, E) thetaRhoPiChiIotaPrepareTheta(i, A, E)
> |                                     ^
> | ../../rpm-5.4.15/rpmio/keccak.c:1957:2: note: in expansion of macro
> 'thetaRhoPiChiIota'
> |   thetaRhoPiChiIota(17, E, A) \
> |   ^
> | ../../rpm-5.4.15/rpmio/keccak.c:2026:5: note: in expansion of macro 'rounds'
> |      rounds
> 
> (qemx86)
> 
> Ross


