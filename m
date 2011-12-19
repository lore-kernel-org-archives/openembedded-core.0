Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RcVHG-0006Pp-SK
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 05:56:42 +0100
Received: by lami14 with SMTP id i14so2016720lam.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 20:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=9XP5+F5wE7VfXjv/7iW7aMIhhZqQWokNyXtEVfJ+07c=;
	b=BvKOEaYbdCyhih5W4VZd1t0eqYIqkx+ld9ojTnFqt4Qqm4a9jkaTfHjr5DXrJ9CgAw
	pj9GxZdS7S1CRWeWjCeVvwRIy4l+hGEuOInoasaiTX0wpkrMhjSGiKZ3TfCUv2WElIzC
	6uLfJfJ8/3lTmR+c48TQ5AdX+WQU6NzKAZaYQ=
Received: by 10.152.104.206 with SMTP id gg14mr15014425lab.41.1324270180357;
	Sun, 18 Dec 2011 20:49:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.36.198 with HTTP; Sun, 18 Dec 2011 20:49:09 -0800 (PST)
In-Reply-To: <1324252928.4568.161.camel@ted>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<1324237652-15618-2-git-send-email-dbaryshkov@gmail.com>
	<CAMKF1sofqczGSZg47zkRdFU+f-FntO4-Tms_pi9kTs=3cs_kVw@mail.gmail.com>
	<1324252928.4568.161.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Dec 2011 20:49:09 -0800
Message-ID: <CAMKF1spKGrk=9o7hxjrji4sCu0SRuhY1SbnrH-=r8GtsMe3hbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] Move check that all installed files are shipped into insane.bbclass
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
X-List-Received-Date: Mon, 19 Dec 2011 04:56:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 18, 2011 at 4:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2011-12-18 at 15:29 -0800, Khem Raj wrote:
>> On Sunday, December 18, 2011, Dmitry Eremin-Solenikov
>> <dbaryshkov@gmail.com> wrote:
>> > Checking that all installed files are shipped is in reality a QA
>> check.
>> > It would benefit from mechanisms like ERROR_QA/WARNING_QA. So move
>> it
>> > into insane.bbclass. If some of the files are installed but should
>> not
>> > be shipped for some reasons, one can add them to the variable
>> > IGNORE_UNSHIPPED_FILES.
>> >
>> This needs to be documented somewhere too and may be added to
>> sample.conf.extended
>
> This doesn't make sense for sample.conf.extended. We're talking about a
> recipe specific configuration variable, not distro/machine/conf config
> which is more appropriate there.

yes forgot that

>
> I'd suggest adding to documentation.conf and/or the various manuals.
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


