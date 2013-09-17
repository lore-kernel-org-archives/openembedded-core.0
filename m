Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 949316BDAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:53:43 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so4005193vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 03:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+Z4Y6FCEGKNf9bLi+4MJk9sXbZgs4fa5NXnpEEIE72g=;
	b=P4UhSgU8wVGz5UXBcx7RcbHiJbnOtZ+QHkKASm3+ZbNBIKlOBtITnDTtXKOFVpOd29
	zt+tUPjm4N0AkRrlxkZkrtOWg5BFinIA3ve5mIQYajxbRNtv4BzvctFhVqUsjCvdcMCQ
	cFGDfn2x8Yik8jjHE/ngvqMsAgPQt2Xl7U3yHx1RsbgPw1zbLBaV0uwy3cfVZyB1B9LM
	qAePI03rJPVMX9ATZOle82+GAflj2SzueMc9lW4zuENbp6P46aW8UuF8Q9lzRX/qPvZF
	Tkx+ZIzeTABCEYA2nbWrUd34Whl2d2Y09gKvJixhL7cUq8dp3Sgsd/8U46a7AlOW+l0F
	I8Sw==
X-Gm-Message-State: ALoCoQnSoYXT33L1KAY7iSGrY0xagAGqvoyuwFLen6uI26eAUgk21z/O1fXv+NQ0zEx+L5Oeplma
X-Received: by 10.52.23.113 with SMTP id l17mr8984998vdf.23.1379415224828;
	Tue, 17 Sep 2013 03:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 17 Sep 2013 03:53:24 -0700 (PDT)
In-Reply-To: <20130917103029.GA7313@jama>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
	<20130917103029.GA7313@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 11:53:24 +0100
Message-ID: <CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Tue, 17 Sep 2013 10:53:43 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2013 11:30, Martin Jansa <martin.jansa@gmail.com> wrote:
> I think someone should measure it on machine with a lot of ram. If the
> test was executed on machine where it was linking mostly from swap,
> then it's not so surprising it was faster with the option enabled.

My very rough test says no significant difference between the option
being enabled or disabled (~23m +- 30s each way).  i7 with 16GB RAM.

Anyone else want to add a data point?

Ross

