Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RE2Sb-00073z-13; Wed, 12 Oct 2011 19:19:17 +0200
Received: by qyk10 with SMTP id 10so5272969qyk.6
	for <multiple recipients>; Wed, 12 Oct 2011 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=mTPIQe4S+nKVfJNwuCqeD5ioiC7dvqng9hOam90EVD0=;
	b=FTV+OM9vb6vTcPUEB/mLhKpWQrwTpuguWH5xId+TgCNksLI3JMGbN2XlfD6aCvvwMN
	GZcfThlp/zqwupxlAiVFCUPjsUsAeDpHum7xQyirwbFN30NECcUo4FG/Yhd+gcvTbazy
	HvYKBaCirSXoH/suKIlD7FvzjsYPiYYo7TKDk=
Received: by 10.68.208.229 with SMTP id mh5mr2314622pbc.124.1318439610062;
	Wed, 12 Oct 2011 10:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.58.168 with HTTP; Wed, 12 Oct 2011 10:13:00 -0700 (PDT)
In-Reply-To: <201110121648.29478.paul.eggleton@linux.intel.com>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
	<201110121648.29478.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2011 10:13:00 -0700
Message-ID: <CAMKF1sohuOYX=bRf-t7mCOCjOL6xmiw3z=MtzJ7Rahiga3VWww@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 17:19:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 8:48 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 12 October 2011 16:18:37 Koen Kooi wrote:
>> Op 12 okt. 2011, om 17:16 heeft Khem Raj het volgende geschreven:
>> > On Wed, Oct 12, 2011 at 1:17 AM, Koen Kooi <koen@dominion.thruhere.net=
>
> wrote:
>> >> -----BEGIN PGP SIGNED MESSAGE-----
>> >> Hash: SHA1
>> >>
>> >> Op 11-10-11 21:11, Cliff Brake schreef:
>> >>> Hi, we are moving git.openembedded.org to a new server.
>> >>>
>> >>> SSH access on the old server has been disabled. =C2=A0git:// still w=
orks
>> >>> there.
>> >>>
>> >>> As soon as DNS propagates, SSH access will work with the new server.
>> >>>
>> >>> Let me know if you see any problems.
>> >>
>> >> When will cgit be back up?
>> >
>> > It should be up already. Do Ctrl+f5 in your browser on
>> > git.openembedded.org
>>
>> Let me rephrase: when will it be working again? I still get "No
>> repositories found" when clicking on a repo.
>
> I think you may find it's the "/cgit.cgi" part of the URL that's causing
> problems. It used to work, now it doesn't - if you remove it then you get=
 a
> working interface.
>
> FWIW I'd be in favour of fixing it however; all of the links to cgit on m=
y
> layer index page are now broken for example.

Yes, however the new webserver is running on nginx so coming up with
correct set of
rules to reproduce old urls is a bit of challange. Right now the mails
to openembedded-commit
ml are probably not going and the url mentioned in those emails dont
resolve as well
but eventually they will

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
>


