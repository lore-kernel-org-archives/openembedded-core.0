Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhS45-0004Fm-J7
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 21:59:17 +0200
Received: by pvf24 with SMTP id 24so538932pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kOJB+mR+ODgQqU5t89mbkZPNnRv6dFysIc3YvijL06c=;
	b=dFWx7HQst34k8N4F+KjJ0jSPM3WYKcMkzKV/ncS1y4BEONmoM9RMLkeDDfML0j9B4S
	YQFA4eJczaIsI000avT3UjhLl5yQVAM+2skMJlPRShGYGVa1LB8X08NbtsJ0omSH+4W5
	8S0d8c/IJdUGauLKSwAz2p0ubIQ3C28g0mJfY=
Received: by 10.68.10.103 with SMTP id h7mr3145331pbb.211.1310672882062; Thu,
	14 Jul 2011 12:48:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 14 Jul 2011 12:47:32 -0700 (PDT)
In-Reply-To: <1310653552.2378.64.camel@phil-desktop>
References: <1310547824.6337.212.camel@phil-desktop>
	<1310555312.20015.1096.camel@rex>
	<6FD8E09E-1FDA-4CB6-84B0-085F878F0214@dominion.thruhere.net>
	<1310556386.2378.6.camel@phil-desktop>
	<DA356529-F7C2-4402-B058-6537D1272BCD@dominion.thruhere.net>
	<1310653014.20015.1162.camel@rex>
	<1310653552.2378.64.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jul 2011 12:47:32 -0700
Message-ID: <CAMKF1sp3UPLr_OP9x7WcwkHD00pRzozOKXn38Lxc4_tcfgHQMQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: ensure that NSS libs go into the right package when ${base_libdir} and ${libdir} are the same
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
X-List-Received-Date: Thu, 14 Jul 2011 19:59:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2011 at 7:25 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-07-14 at 15:16 +0100, Richard Purdie wrote:
>> On Wed, 2011-07-13 at 15:14 +0200, Koen Kooi wrote:
>> > Op 13 jul 2011, om 13:26 heeft Phil Blundell het volgende geschreven:
>> >
>> > > On Wed, 2011-07-13 at 13:13 +0200, Koen Kooi wrote:
>> > >> Op 13 jul 2011, om 13:08 heeft Richard Purdie het volgende geschrev=
en:
>> > >>
>> > >>> On Wed, 2011-07-13 at 10:03 +0100, Phil Blundell wrote:
>> > >>>> Previously, libnss_hesiod et al. could get swallowed by the wildc=
arded glob in ${PN}-dev.
>> > >>>> Fix it by moving eglibc-extra-nss earlier in the PACKAGES and adj=
usting its FILES to ensure
>> > >>>> that the devel symlinks don't get caught.
>> > >>>>
>> > >>>> Signed-off-by: Phil Blundell <philb@gnu.org>
>> > >>>> ---
>> > >>>> meta/recipes-core/eglibc/eglibc-package.inc | =C2=A0 =C2=A04 ++--
>> > >>>> meta/recipes-core/eglibc/eglibc_2.13.bb =C2=A0 =C2=A0 | =C2=A0 =
=C2=A02 +-
>> > >>>> 2 files changed, 3 insertions(+), 3 deletions(-)
>> > >>>
>> > >>> Merged to master, thanks.
>> > >>
>> > >> That is missing a PR bump for eglibc 2.12
>> > >
>> > > Oh yeah. =C2=A0Do we really need to keep 2.12 around still?
>> >
>> > It's the default for angstrom, dunno if that's a good enough reason :)
>>
>> Does Angstrom have any plans to switch to 2.13?
>>
>> Certainly we're not aware of issues with 2.13 and as such we should
>> really consider phasing out 2.12 from OE-Core at least...
>
> How about glibc 2.10; is anybody still using that at all?

I think all glibc recipes should go away.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


