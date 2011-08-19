Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuS7Y-00013Z-AP
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:40:36 +0200
Received: by pzk2 with SMTP id 2so7056117pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5jXOqogI5k5IO95Kbn/WLsOAEOEs8TXSLVxN2YRIphc=;
	b=CCHFfj3FbXluakjp9b3Z6rdQBOWZZX7suPiqCmgg/ZvAM7vLqQ+pwtdiSP5vCmfsog
	MnShjcG+y5vthZRRB7O0N53p/f8YojruzxvKeit28WL8ATl6aunrjY40lJth4eeWU441
	qRz3/9cC1eZq+e0Ujt/1c5PvESO/FfDt0o61I=
Received: by 10.142.127.1 with SMTP id z1mr399199wfc.62.1313771753209; Fri, 19
	Aug 2011 09:35:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 09:35:23 -0700 (PDT)
In-Reply-To: <1313770386.13995.112.camel@rex>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
	<1313745878.6733.259.camel@phil-desktop>
	<1313763965.13995.100.camel@rex>
	<4E4E80C9.7010507@gmail.com> <1313770386.13995.112.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 09:35:23 -0700
Message-ID: <CAMKF1soEegXwf0AxMHeg96+omLHJUDwzAMnPq2gJY9rb+wF5Cg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 15/32] conf, recipes: Redefine LINKER_HASH_STYLE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 16:40:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 19, 2011 at 9:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-08-19 at 08:27 -0700, Khem Raj wrote:
>> > Also, if mips doesn't support this, how is anything at all working at
>> > the moment?
>>
>> see last line in distro/include/tcmode-default.inc
>>
>> TARGET_LINK_HASH_STYLE ?=
>> "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True)
>> in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
>
> So given that, why can't we just add TARGET_LINK_HASH_STYLE to gcc's
> EXTRA_OECONF?

if you mean the configure option --with-linker-hash-style then
yes we can and certainly we can get rid of TARGET_LINK_HASH_STYLE
altogether then however
the patch I backported only for gcc 4.6 certainly can be done for 4.5
and I left it in there mainly for
prebuilt external toolchains. since we don't control how those
prebuilt toolchains are configured

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


