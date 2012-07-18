Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SrUSi-0004L2-G4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:38:44 +0200
Received: by qaat11 with SMTP id t11so1034539qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RI9xzPDNW91+6fVX/3+yv4tkd/aWWhmZN+lzHsDwxeg=;
	b=uhvl6uhiqnxkcCrao6d9I82zzm8gNjmfgHM24SOme90mCLVYKWDVm/JJogUxy225OU
	iTejuxuNsOUJ6AfWvsP5+vi9YMHm9Iy/lBGHdP17t+r0YUh5APJFKwwxKfAOJC4E4ysP
	QIct0gswBLGP+O5oeu0IJGBCs2chRK9w1fxYCUWuFCnvFMIeXn2uAExW0AAlCaw/eaQP
	vhZZ/dotMxtXfxEBb/7rG5qDQ5Tfai/FEPBCyuh9DMCmqtuhA+ICUxd0spRPPYJj1+0f
	8Fk7ZjUOIyt0QVKbrn5kEQaoFI0oSohsELgclfk90k5xhaLNDvcZSNff7gEE3IWTG2lh
	ymnw==
MIME-Version: 1.0
Received: by 10.224.203.8 with SMTP id fg8mr5957991qab.38.1342618043570; Wed,
	18 Jul 2012 06:27:23 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Wed, 18 Jul 2012 06:27:23 -0700 (PDT)
In-Reply-To: <1342617829.513.3.camel@ted>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
	<CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
	<1342617829.513.3.camel@ted>
Date: Wed, 18 Jul 2012 09:27:23 -0400
Message-ID: <CADkTA4MUWNXk3QDg5iAibaqkHV+b7ErFhUA=2VqrRBomyvjrNQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 18 Jul 2012 13:38:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 9:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-07-18 at 09:03 -0400, Bruce Ashfield wrote:
>> On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
>> <bogdan.a.marinescu@intel.com> wrote:
>> > On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> Why is recipe renamed
>> >
>> > Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?
>>
>> No one replied to my other question (or at least no one replied that I
>> noticed), about
>> why we even bothered to bump it to 3.4.3 ...
>>
>> I have the same elements in that question .. but from a different angle.
>
> I think Khem's question is a little vague and I'm not sure how I'd
> answer that.
>
> As for policy of updating the kernel headers against stable releases, it
> can't hurt and we needed to bump PV or PR anyway as Martin mentioned so
> that was the main reason I took the patch.
>
> I think there could be a perception issue if we don't update, on the
> other hand it could be considered unnecessary churn. So I think in
> future this will be on a case by case basis. If there was a header fix
> in the stable series (which is conceivable), we would want to take that
> for example.

This works for me, and was my main point. Updating it is one thing, but
we should consider before updating, since the "normal" rules don't always
apply to this particular package.

Thanks for the clarification,

Bruce

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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


