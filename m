Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TjISK-0000MA-NP
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 00:44:47 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1002575dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 15:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mU20bBs5rswLGd0gtilpGKZWolMB6nwswIzCF/uIaso=;
	b=TV8/q14HA59cMpwqu4Rfnmrtk+UCKpokKIDFnG8XlO4QQ/A2StItGTHvb1SgIuAsOJ
	IbyJ+/RbDgE9sSdhaG/vAU3fx6uD6TcuhYT6fWmYYxFfTCUXytHyYbGscpbYQHHtYf6F
	3KkFVRigDsElW7DcAQyyUiuoFqSgxwETiwjKUE2jUOFTfSbWslBhfEmTGJsABSw3ptNV
	1IAZRt5Z9iqI1DfFwq1p5WritmYY3CN/NQVdatb0qgrpj9I61ayR40Ax2oQ+doPaU66B
	4Cw2AzP6Atj4rHMrua97fCRHnMb0jUezgI9JeQVo6GNDpE2WPeqKooVuTz75JpEdcB3R
	SloA==
MIME-Version: 1.0
Received: by 10.66.72.198 with SMTP id f6mr10575673pav.42.1355441408626; Thu,
	13 Dec 2012 15:30:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Thu, 13 Dec 2012 15:30:08 -0800 (PST)
In-Reply-To: <1355428397.4799.7.camel@dromedary>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
	<CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
	<CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
	<1355428397.4799.7.camel@dromedary>
Date: Thu, 13 Dec 2012 21:30:08 -0200
X-Google-Sender-Auth: -I7iPGHo_iqaPi7nsT3ByyEiK8c
Message-ID: <CAP9ODKrEXv=h0f8vSqdb5H3T0c4N9UuhYu4GHJhi3Vufiz7rKg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 23:44:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 5:53 PM, Marko Kati=C4=87 <dromede@gmail.com> wrote=
:
> Oh dear, i completely forgot about this patch. It's been sitting in my
> local repo for weeks!
>
> So here's my (hopefully) final solution:

The patch seems broken for my e-mail reader (dunno if you pasted it here).

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


