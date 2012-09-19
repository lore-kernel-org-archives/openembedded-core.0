Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEOUC-0003Nr-JI
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:54:56 +0200
Received: by weyr6 with SMTP id r6so722010wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GXZFy2WH1PN1R5npPJ7vXgRuEYBftXSlt4yejAi1nDg=;
	b=JWBtfy1najFunlfEHwozMop2IyhpU4RDHaimmExJrMzEx1S6c2jFgVkGeUxS0z1Nm1
	mjiGiYKhZWlIqDckdk8WC/6vnNT1aNy3cVUXAwNyzwL/5Kr/ID/5FqqGTeMztjgtpY4U
	nz6cjrmTlObeVvM/4yYUD/nnz7yLQrDb5a7RV6MO/6AwaXGzu1f95SBxjEYhPRKahHze
	HwFbuxsz7Y1tu0/ITfVBtsaI0nkqR1GWk6k+koi4Tdyc49rQVwMLE3FjtJ9yREkocgha
	nEtAYjQAht35quDEmnm+AOALMO+bMfT1ROacZY+uwD+B5b0MGkKoUA2N7w6XcL6R50kK
	NPLw==
Received: by 10.180.91.1 with SMTP id ca1mr154348wib.8.1348076535277; Wed, 19
	Sep 2012 10:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.42.197 with HTTP; Wed, 19 Sep 2012 10:41:45 -0700 (PDT)
In-Reply-To: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
References: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 10:41:45 -0700
Message-ID: <CAMKF1sr8_PN8p0H+35JqUAyKyDLFTij4etP47VEb613pOi11Tw@mail.gmail.com>
To: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SVN checkout ERROR: Function failed: Fetcher failure for URL:
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
X-List-Received-Date: Wed, 19 Sep 2012 17:54:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 9:48 AM, Tarek El-Sherbiny
<tarek.elsherbiny@gmail.com> wrote:
>
> I would like to check out from our local SVN repository. This is the URI
> line I'm using in the recipe:
>
>  SRC_URI =
> "svn://svn.local.repo/svn/dev_repos/Generation3_app;module=trunk;proto=http"

use protocol=http above and make sure that your server exports over
http otherwise drop the argument

>
> When I try the same command bitbake is using on the command line it works
> fine. But bitbake is not fetching the package.
>
> Is there a special parameter that I need to modify for SVN to work?


