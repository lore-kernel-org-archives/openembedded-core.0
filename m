Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SUHiY-0004lZ-DG
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 15:23:10 +0200
Received: by yhjj56 with SMTP id j56so5550670yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Bu54NL4PHeSX1umwxpoF+JpqYjzuOG21p2x63zI20hg=;
	b=Jwmm1sMU0wBmL8WhYiI2RSjjLGeuw/b22+M6Y4LlKSIlt28OKT6PxfEsS5QMcFQQ+0
	/6PkJLCxe931/0XAt+o9Uft0dlroNC/BwXoq5m1Fu4IbUBk/gDrD4/6TswWJ+vR3Fdqv
	z6ZexAn8yOpvS9e6LZdfjGS34snVXourl4CzrBqbFAWYNv3tGDGloJOSzuvTvSzfCrNb
	wd9vixZ3xNMYB6geO/dMch6Eo2EFCWHHeo6XYAy/fzVuvmU3CgDeHCOCBwN1YNZde7Nq
	t2oOxIDNtn5qY8HP9bGVakDjXiEkLRbzUyczPyaIQRuHh7S6dC5vvigkX0rlkR5i3kIk
	SxRA==
MIME-Version: 1.0
Received: by 10.50.100.226 with SMTP id fb2mr5456575igb.31.1337087589668; Tue,
	15 May 2012 06:13:09 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Tue, 15 May 2012 06:13:09 -0700 (PDT)
In-Reply-To: <20120515130625.GD3166@jama.jama.net>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<20120515130625.GD3166@jama.jama.net>
Date: Tue, 15 May 2012 16:13:09 +0300
Message-ID: <CAF6bG8fj59QFg7QqZjOoGBCPwg-D=Ba-wLsGU38X8+n83tZUZQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:23:10 -0000
Content-Type: text/plain; charset=UTF-8

On 15 May 2012 16:06, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, May 15, 2012 at 03:02:37PM +0200, Giuseppe Condorelli wrote:
>> Hi All,
>>
>> there are a number of packages having a broken SRC_URI, for example git.
>> Has someone met this issue?
>> For sure we can correct those links adding a dedicated .bbappend file for
>> each failing package but
>> I think we could also update the main package fixing the errors.
>
> This should go to oe-core ML:
> openembedded-core@lists.openembedded.org
>
> And yes it should be fixed in original recipe.

 Is there some way to disable automatic MIRROR usage that one could
use to find out all source fetching problems?


 - ML


