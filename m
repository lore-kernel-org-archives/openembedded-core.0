Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAA89606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:46:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6CBkLL0020231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Jul 2016 04:46:21 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jul 2016 04:46:19 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
	<102523f6b96c68522c940a9c004ce5fc3f977f7b.1467855356.git.liezhi.yang@windriver.com>
	<CAJ86T=USf+vf3xe-J6yNw97Ro9oKbMjjv9dOF5-5JpA_Vt7Lzw@mail.gmail.com>
	<CAJTo0LaRh6d67+eKrcGA2fQSxeR06-xQd7tB7xs_4_kx4FRakw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5784D88A.4080101@windriver.com>
Date: Tue, 12 Jul 2016 19:46:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaRh6d67+eKrcGA2fQSxeR06-xQd7tB7xs_4_kx4FRakw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Tue, 12 Jul 2016 11:46:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2016 05:53 PM, Burton, Ross wrote:
>
> On 7 July 2016 at 08:54, Andre McCurdy <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
>
>     Based on the e2fsprogs release notes, v1.43.1 adds a new configure
>     option, --enable-hardening
>
>     http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1
>
>     It might be nice to either enable that by default, or provide a
>     PACKAGECONFIG to control it (and in either case, verify that it
>     doesn't conflict with security_flags.inc).
>
>
> I'd lean toward enabling by default and then nullifying security_flags, assuming
> that the latter is effectively the same as the former, considering that the
> flags are supported upstream.

Hi Ross,

I updated it in the repo, enable it by default for target, it can't build
with native:

     | checking for uuid_generate in -luuid... no
     | configure: error: external uuid library not found


And "require conf/distro/include/security_flags.inc" doesn't affect the
build result.

   git://git.openembedded.org/openembedded-core-contrib rbt/pu
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (7):
   debianutils: 4.7 -> 4.8
   e2fsprogs: 1.43 -> 1.43.1
   git: 2.8.4 -> 2.9.0
   gmp: 6.1.0 -> 6.1.1
   libpcre: 8.38 -> 8.39
   wget: 1.17.1 -> 1.18
   file: 5.27 -> 5.28

// Robert


>
> Ross

