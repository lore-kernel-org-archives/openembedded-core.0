Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE9E46FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:19:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P7JvZ8009074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jul 2016 00:19:57 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:19:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<ac77505921ddfb1e69efd7e46dafca9707b112a4.1468935802.git.liezhi.yang@windriver.com>
	<CAJTo0LY9LrXHQDb4ORk+LTj7SZ_p7wG=7FFtJ98TgqjCUOLtVA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5795BD9B.4050802@windriver.com>
Date: Mon, 25 Jul 2016 15:19:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY9LrXHQDb4ORk+LTj7SZ_p7wG=7FFtJ98TgqjCUOLtVA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] slang: 2.2.4 -> 2.3.0
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
X-List-Received-Date: Mon, 25 Jul 2016 07:20:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 07/22/2016 04:54 PM, Burton, Ross wrote:
>
> On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * Removed:
>        change-char-type-to-signed-char-in-macros.patch
>        sprintf-bug-concerning-8-bit-characters.patch
>        They are already in the source.
>
>     * Updated:
>        fix-check-pcre.patch
>        fix-check-pcre.patch
>     slang-fix-the-iconv-existence-checking.patch
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> This fails in all the poky-lsb configurations (which generally implicates the
> security flags):

Hi Ross,

Use SECURITY_NO_PIE_CFLAGS for security flags will fix the problem, I will
send a V2 and drop e2fsprogs upgrade atm.

// Robert


>
> make[1]: Entering directory
> '/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/build/po'
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
> installing ../../git/po/ca.gmo as
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
> installing ../../git/po/cs.gmo as
> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo
> /bin/sh: 6: @mkdir_p@: not found
> /usr/bin/install: cannot create regular file
> ‘/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/da/LC_MESSAGES/e2fsprogs.mo’:
> No such file or directory
> ...
>
> (http://errors.yoctoproject.org/Errors/Details/72820/)
>
> as-needed dropping libraries that are needed later maybe?
>
> Ross

