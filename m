Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QtDZl-0006Mw-Ax
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 08:56:37 +0200
Received: by qyk9 with SMTP id 9so3973731qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QGbHdN+kMhjFhT9cnZ4u7jqZYxhNARL5Co3sUuftG34=;
	b=bkK+bO1gzyVDhcS2ahdJXWzEh47xJqjLBBzQVGsPMhd/2ebgP/Sl/OkTsZ4y/mFkbQ
	E+kxSfJ+ygObn6/7Ag3llTuCU+X1eEoTM5gLpg3PgZRZQdApEsP6iI/hdIRve8drlsQD
	dzuPSPaM2x+TX4gSkUcWEQ+e0PlGpohpm6FXY=
MIME-Version: 1.0
Received: by 10.229.192.148 with SMTP id dq20mr2898861qcb.97.1313477519657;
	Mon, 15 Aug 2011 23:51:59 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Mon, 15 Aug 2011 23:51:59 -0700 (PDT)
In-Reply-To: <201108151019.16878.paul.eggleton@linux.intel.com>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<9A00A881-7C5C-4053-BEDF-DE26572945C6@dominion.thruhere.net>
	<CAGiJk9dDp_CwiS2GL5+Cy6HNgjRZMmJqt+KGBWiwYTbYCSxY3w@mail.gmail.com>
	<201108151019.16878.paul.eggleton@linux.intel.com>
Date: Tue, 16 Aug 2011 08:51:59 +0200
Message-ID: <CAGiJk9dVtBmkLunL+tc-Kpimi=v90D5BMykV-4W_nrzSGjnYYw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Tue, 16 Aug 2011 06:56:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/15 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Monday 15 August 2011 10:06:33 Samuel Stirtzel wrote:
>> 2011/8/12 Koen Kooi <koen@dominion.thruhere.net>:
>> > There's also:
>> >
>> > https://github.com/ebutera/meta-igep
>> > http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
>> > http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix
>> > https://github.com/koenkooi/meta-ettus
>> >
>> > and likely much more
>>
>> I'd guess there is no list for third party components/repositories, or
>> am I wrong?
>
> I had intended the list to cover all available layers. However for layers that
> refer to other projects/manufacturers/products where the layer is not an
> official one, I think it's fine to list it there but important to mark it
> "unofficial".

It would be great to see at a glance what repositories exist out there.
Reinventing (or porting new software again) would become less
necessary if someone already did the things that you need.

>
> BTW I plan to add the above to the list some time today if I get time to do
> so.

That would be nice, I've got an idea for the unofficial list but it is
currently not sophisticated enough.

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



Regards
Samuel


