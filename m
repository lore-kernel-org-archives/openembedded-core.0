Return-Path: <Le.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 920756057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:51:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8R8owFW011578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Sep 2016 01:50:58 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 27 Sep 2016 01:50:57 -0700
From: "Liu, Le (Charles)" <Le.Liu@windriver.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Re:[OE-core] [PATCH] ltp: 20160126 -> 20160920
Thread-Index: AdIYlJqXxz2viqx4QiGHBKxTCr0MWQ==
Date: Tue, 27 Sep 2016 08:50:56 +0000
Message-ID: <B2115E68FB13924CB56D34112C696DFA010C9EEE49@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.144]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: 20160126 -> 20160920
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
X-List-Received-Date: Tue, 27 Sep 2016 08:51:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Xin,

I just tried your patch on qemux86-64 BSP. It looks working well, except fo=
r the following two minor issues on patching.  =20

1.  I have to remove some "/dev/null" from the patch manually, before it wa=
s applied successfully.=20

 $ diff ~/\[OE-core\]\ \[PATCH\]\ ltp\:\ 20160126\ -\>\ 20160920.eml /origi=
nal_oe-core/\[OE-core\]\ \[PATCH\]\ ltp\:\ 20160126\ -\>\ 20160920.eml=20
200a201
> --- /dev/null
238a240
> +++ /dev/null
272a275
> --- /dev/null
508a512
> --- /dev/null
680a685
> --- /dev/null
734a740
> +++ /dev/null
770a777
> +++ /dev/null
1169a1177
> +++ /dev/null
1585a1594
> +++ /dev/null
1941a1951
> +++ /dev/null
2013a2024
> +++ /dev/null
2074a2086
> +++ /dev/null
2143a2156
> +++ /dev/null
2193a2207
> +++ /dev/null
2286a2301
> +++ /dev/null
2323a2339
> +++ /dev/null
2357a2374
> +++ /dev/null
2391a2409
> +++ /dev/null
2428a2447
> +++ /dev/null
2466a2486
> +++ /dev/null
2504a2525
> +++ /dev/null


2. There are Hunk issues during patching "0011-Rename-sigset-variable-to-si=
gset1.patch".

...
Applying patch 0011-Rename-sigset-variable-to-sigset1.patch
patching file testcases/kernel/mem/shmt/shmt04.c
Hunk #1 FAILED at 56.
Hunk #2 FAILED at 71.
Hunk #3 FAILED at 148.
3 out of 3 hunks FAILED -- saving rejects to file testcases/kernel/mem/shmt=
/shmt04.c.rej
patching file testcases/kernel/mem/shmt/shmt06.c
Hunk #1 FAILED at 57.
Hunk #2 FAILED at 70.
Hunk #3 FAILED at 147.
3 out of 3 hunks FAILED -- saving rejects to file testcases/kernel/mem/shmt=
/shmt06.c.rej
patching file testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
Hunk #1 FAILED at 91.
Hunk #2 FAILED at 112.
Hunk #3 FAILED at 165.
Hunk #4 FAILED at 212.
Hunk #5 FAILED at 235.
5 out of 5 hunks FAILED -- saving rejects to file testcases/kernel/syscalls=
/sigprocmask/sigprocmask01.c.rej
Applied patch 0011-Rename-sigset-variable-to-sigset1.patch (forced; needs r=
efresh)




These might be related with the patching method I used (git am --keep-cr ~/=
\[OE-core\]\ \[PATCH\]\ ltp\:\ 20160126\ -\>\ 20160920.eml). Could you help=
 to confirm?


Thanks,
Charles

