Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THbfN-0000bD-T9
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 16:35:45 +0200
Received: by eeit10 with SMTP id t10so1294543eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=zy0fw3sw2Nta0Hvfy2iBmpQntj9EEJzzucpBCAWbXzM=;
	b=J7GV94EU8TtyJLb9/9/h7Gg6bJ1OSF4sCIfWI4/mgCNwBaW+U81xE4nKISNUCfVV5/
	J/cI0Fs+0RU2G0pPmu3MoSt4RNJUfSsT1boxTK5JVKWNG+13sCJavYZEixWPIzyyxdiR
	xt/GTT+/WLqcSDzFnX3hnvffgHyu0c/oqSx8/Y/egsZkmp54SmnUIEygSrc67DvqqbNo
	7ihkdZZgJ7Dj3jyFCSZLGonVDeQNI//65Z7Z4LqAR9/x8G63rzpWkxwvI5clskV82mrd
	QuSlURuIdPpzHxOipdSzbEfTgNPh0fTVK/oCDocynt4ZLPwkREbf/x34fzSWdjzjRItr
	OVtA==
Received: by 10.14.211.3 with SMTP id v3mr10087452eeo.43.1348842173016; Fri,
	28 Sep 2012 07:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Fri, 28 Sep 2012 07:22:21 -0700 (PDT)
In-Reply-To: <1348838527.15753.51.camel@ted>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
	<C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
	<C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B462F@039-SN1MPN1-001.039d.mgd.msft.net>
	<FBB69FDD-BE5F-4BAD-9FE3-59A5283722E6@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B48F3@039-SN1MPN1-001.039d.mgd.msft.net>
	<1348838527.15753.51.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Sep 2012 07:22:21 -0700
Message-ID: <CAMKF1sp40i-wmjcm--LNsbK9QULrNvhryn87Bs3-edjwKMrTjQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: perl install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 14:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 6:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-09-28 at 05:04 +0000, McClintock Matthew-B29882 wrote:
>> On Thu, Sep 27, 2012 at 11:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Sep 27, 2012, at 9:23 PM, McClintock Matthew-B29882 <B29882@freesca=
le.com> wrote:
>> >
>> >> On Thu, Sep 27, 2012 at 11:18 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
>> >>>
>> >>> On Sep 27, 2012, at 8:52 PM, McClintock Matthew-B29882 <B29882@frees=
cale.com> wrote:
>> >>>
>> >>>> On Thu, Sep 27, 2012 at 10:43 PM, Khem Raj <raj.khem@gmail.com> wro=
te:
>> >>>>>
>> >>>>> On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 <B29882@fre=
escale.com> wrote:
>> >>>>>
>> >>>>>> Khem,
>> >>>>>>
>> >>>>>> I'm just not looking at a similiar issue. Do this:
>> >>>>>>
>> >>>>>
>> >>>>>
>> >>>>> just 'not' or just 'now' ?
>> >>>>>
>> >>>>>> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
>> >>>>>>
>> >>>>>> And see which recipe is making this folder. It should be the perl
>> >>>>>> recipe, first not some other recipe=E2=80=A6
>> >>>>>
>> >>>>>
>> >>>>> cat sstate-control/manifest-* | grep usr/lib/perl5
>> >>>>>
>> >>>>> return nothing
>> >>>>
>> >>>> Maybe this is not the same root cause then.
>> >>>
>> >>> reverting that commit fixed it. before that I tried to cleans state =
clean all perl and perl-native
>> >>> to no avail.
>> >>
>> >> OK, well we got the same error and ours was from another sstate-cache
>> >> installing files in /usr/lib/perl5 before perl installed it's own
>> >> symlink. cleaning cache for perl did not help either.
>> >>
>> >> Reverting that patch could have causes rebuilds and change of orderin=
g
>> >> (possibly) that might mask the error a little longer. If ours are
>> >> related.
>> >
>> >
>> > Does it mean that if I invalidate whole state it will work ?
>> > thats kind of gross
>>
>> I think just making sure perl is deployed to sysroot first fixes this
>> issue. For us we were simply missing a 'DEPENDS =3D perl' for a recipe
>> which installed stuff in /usr/lib/perl5 - if perl is deployed to
>> sysroot first the symlink is always in place properly.
>
> Please try the latest perl patch I've posted which should hopefully
> address this problem once and for all. The sstate business is a red
> herring as far as I can tell.

Yes my problem seems to be gone with

>
> Cheers,
>
> Richard
>


