Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SuUII-0003EY-VG
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:04:23 +0200
Received: by yhjj56 with SMTP id j56so2231359yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2Abl5bZ4LoXc/34oiDoohl39sv1UTEUV8/pPTo1A1tg=;
	b=AZHZKn4TZ7j/bwkeQLrNG5XdG+sZCuGR9q412w40qdONcLfi13ioYcqWNgN/pRjp9M
	+hzJZeUlVAEKA5e/HmKy0Iaaifv59IPC3EV5t1vTDJa6Zmr6XBASkHIKsMJZhcZpaEoW
	stE7EpwIRhk+gmPiFkM+spqg6eazpYInyQt6q0NjS7fX2bkPmx2iOLYucHfrvD69ixj1
	BCQmwbPNmjaKsodJXQ+Go2Ip3oJ6yp9jq0rfrQKplgp8D7IXRSsKcQCFNokqZRf35RCm
	TFw5PweFgvKuJY9SzImeug3ratO6zyV59RafKhMDrx7vJtmBCbxFOhi2nGqz2GmtKWf1
	WsnQ==
MIME-Version: 1.0
Received: by 10.50.209.73 with SMTP id mk9mr2648360igc.66.1343332371296; Thu,
	26 Jul 2012 12:52:51 -0700 (PDT)
Received: by 10.231.239.131 with HTTP; Thu, 26 Jul 2012 12:52:51 -0700 (PDT)
In-Reply-To: <17225760.ocbdZxpBHY@helios>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
	<17225760.ocbdZxpBHY@helios>
Date: Thu, 26 Jul 2012 15:52:51 -0400
Message-ID: <CADkTA4PRY7TqEcMpTNHF2tf40x_30CC2aHvxi0WtnHoqRhQk9Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Thu, 26 Jul 2012 20:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 25, 2012 at 6:09 AM, Paul Eggleton
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

And an example would be the three linux-yocto kernel versions. We'd have
to break them out into separate layers if the version wasn't in the filename.

That being said, the linux-yocto-dev recipe doesn't have a version in it's name
for the same reason, it's simpler to keep it moving forward constantly without
the version in the name.

.. just chiming in from the kernel point of view :)

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


