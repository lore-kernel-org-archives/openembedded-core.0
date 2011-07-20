Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjOcO-0003ae-MQ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 06:42:44 +0200
Received: by pvf24 with SMTP id 24so4400612pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=w8WBrXUKJV8nteDyM03lOP9UFIO/owScB6ArNRUjhVo=;
	b=Si5MgnMs/Z75cUOctHD3CgJGiWvldRZKScURHnD+HnqTvFj5p9F9jQksHn7P8s2yf7
	9Z64pz69oTugfADjo0F9m0iQAjgmpip5uk5yRuPhNumJXq99762DNzkAg/hXa32IcRET
	+rnKq0IE8mkZnA+WoYROMe+XbeayDAbojP47g=
Received: by 10.68.33.200 with SMTP id t8mr9737657pbi.144.1311136718065; Tue,
	19 Jul 2011 21:38:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 21:38:08 -0700 (PDT)
In-Reply-To: <1311118009.2344.33.camel@rex>
References: <1311100227-8624-1-git-send-email-raj.khem@gmail.com>
	<1311100227-8624-2-git-send-email-raj.khem@gmail.com>
	<1311118009.2344.33.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 21:38:08 -0700
Message-ID: <CAMKF1spaX+Ax0w0UJyQjqOd03vA2zexkpfN2kbDKfhvrfuhDyg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libiconv: Add recipes for 1.13.1
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
X-List-Received-Date: Wed, 20 Jul 2011 04:42:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 19, 2011 at 4:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-07-19 at 11:30 -0700, Khem Raj wrote:
>> Import 1.13.1 recipes from meta-oe
>> share common code through libiconv.inc
>
> The big question this triggers for me is "why"?

are there any downside of using .inc files ?
the code in the .inc file should hardly change and .bb files look simpler

>
> Deleting libtool.m4 certainly looks neater than this version of patching
> it out. Is that do_configure hack still needed with libtool 2.4?

May be not. I just imported what was in meta-oe.

>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


