Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF97E753B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 14:11:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36EBnF6021910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 15:11:50 +0100
Message-ID: <1523023909.2942.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 06 Apr 2018 15:11:49 +0100
In-Reply-To: <CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
References: <cover.1522936224.git.akuster808@gmail.com>
	<CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
	<CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Fri, 06 Apr 2018 14:11:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-04-06 at 16:07 +0200, Martin Jansa wrote:
> > Is it safe to backport to morty, which doesn't have RSS?
> 
> It doesn't work well for me, all the builds are now failing with:
> 
> ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is
> trying to install files into a shared area when those files already
> exist. Those files and their manifest location are:
>    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/SUPPORTED
>  Matched in b''
>    TMPDIR/sysroots-components/aarch64/glibc-stash-
> locale/lib/libnss_nisplus.so.2
>  Matched in b''
>    TMPDIR/sysroots-components/aarch64/glibc-stash-locale/lib/ld-
> 2.24.so
>  Matched in b''
> ...

I suspect using its own sstate task is ok in morty even if it didn't
have RSS. What may have broken is the existing TMPDIR upgrade path
though :(

If the files are removed, I suspect things will then work out ok. There
were manifest handling changes in later versions which dealt with this
kind of issue better (removals before installations).

Cheers,

Richard

