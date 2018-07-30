Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCBF71B2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 22:23:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6UMNTxR013501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 30 Jul 2018 23:23:30 +0100
Message-ID: <44b28ecdf9da3f1edab59861a7b32c4e11d0eead.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 23:23:29 +0100
In-Reply-To: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
References: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: Is a dependency on hostperl-runtime-native actually useful?
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
X-List-Received-Date: Mon, 30 Jul 2018 22:23:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-30 at 14:44 -0700, Andre McCurdy wrote:
> Currently the openssl 1.0 recipe defines a dependency on
> hostperl-runtime-native and the openssl 1.1 recipe does not. Both run
> "perl ./Configure ..." as part of do_configure().
> 
> Since hostperl-runtime-native is included in ASSUME_PROVIDED, is it
> really useful for the openssl 1.0 recipe to list it in DEPENDS?
>
> ie is the openssl 1.0 recipe being unnecessarily complex or is the
> openssl 1.1 recipe being too simplistic?

It is useful for things to list their dependencies and we did have an
effort to actually list things out so we know ASSUME_PROVIDED is
correct. This means we can spot areas we might be able to trim back
dependencies (amongst other reasons).

With the introduction of HOSTTOOLS, its perhaps less needed than it was
but in principle it is still useful to know which things need a given
item, particularly where its more unusual. I'd still be interested in
trying to cut back HOSTTOOLS a bit more.

The 1.1 recipe was pretty heavily cut back, probably too much so based
on some of the patches we've been getting...

Cheers,

Richard

