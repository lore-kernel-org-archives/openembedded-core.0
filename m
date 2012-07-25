Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Su27y-0008Lx-SC
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 15:59:50 +0200
Received: by lbol5 with SMTP id l5so578773lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=HjQ6Jq8cEXMuniRQaIiske4NgDriNCPSgxRZdLZAcyQ=;
	b=oJoX8jNEYbnHeCImGeV++Wq1cVhcRes1zkxNbqZlxzL3HzD0xqIN80BQxY+JJUTQhH
	0tEPhfVigcwcr0K+lavEAu8boCzZibIc3dd0wSM8iqiScnqh21iHnMEJ1URwh6g3kPKp
	/VVL6Y0q6j10aeyjxKGN5h0NJfGCPfYJBdyoM2dyvR9Cdw/zoP8mhWtP/DkvO54HrWJ0
	WteRi8QG+mpniWrCZZffHszPGSgBS5XKIYrrxUJz68yKvKZkQzNIw4BHlknrfFVpKvVH
	fkW/4XBkjXH3FXPSJzZcmbSVWjR83OJuHFDFNXijb1uYRjIjFlvYewix9HqYTEM3M8xE
	efXw==
Received: by 10.152.148.1 with SMTP id to1mr25836974lab.34.1343224101148; Wed,
	25 Jul 2012 06:48:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Wed, 25 Jul 2012 06:48:00 -0700 (PDT)
In-Reply-To: <17225760.ocbdZxpBHY@helios>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
	<17225760.ocbdZxpBHY@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 25 Jul 2012 06:48:00 -0700
X-Google-Sender-Auth: pKwmJMtIrF8PSpY5U7mCQkKug7Y
Message-ID: <CABcZANkFVqWFAD9YWMcR+QWC3ap85Ua8Bi7_bk_tYAub535dtA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Package recipes change proposal (system-wide) - name wise
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
X-List-Received-Date: Wed, 25 Jul 2012 13:59:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 25, 2012 at 3:09 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 25 July 2012 07:23:31 Iorga, Cristian wrote:
>> For me, having the version number contained in the name of package recipe is
>> a little bit puzzling. For example: libpcre/libpcre_8.31.bb
>>
>> Is there a solid technical reason to not have it like this?
>>
>> libpcre/libpcre.bb
>> and inside the recipe to have a PV variable defined:
>> PV="8.31"
>
> The benefit of having PV in the recipe file name is that you can then easily
> have different recipes for different versions of the same piece of software,
> which is particularly useful when those different versions may need to be built
> slightly differently.

It's worth noting that that can still be done by leveraging
BBVERSIONS. Not that I'm advocating that approach necessarily, but
noting that it can still be done without using multiple recipes with
version in the filename.
-- 
Christopher Larson


