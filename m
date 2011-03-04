Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvaN1-0005Or-IO
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:08:59 +0100
Received: by fxm8 with SMTP id 8so2468253fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 11:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=lBGu6WEyLxw8jrVV7lU0MmoEH+drLe0kmDjWjEqpTnc=;
	b=JsWLkUUV7PydZEf7RDnAoxbJD+QdjtaKDJS5UTYn4U1b5q/+5SnQGgrEzQtmUCXe9F
	WtZLdr2TRax6d8Jrb6jG/SlGRjYcadXNsQ/iiy/Ts1mTNOcdWpru4NfEU7j1G/wOPMUQ
	UbAHgoHVJ9IehgDroGTb0J9ZXFwEHw3J9OCFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=WWPWPNQyMhLETGxyQyTAQfyEJyAPNZX9GY7s2lQNOMzunkcQTxkrqem6MDgW1zMFmD
	eE4Q8gktXiGgc2ftJXz3U5BZ9yClGpFSrcetcpLZVWKTO/IeWhvxv6/UNpH07BWeKiqo
	wVUuBESeP5nBnbcTcIKUoWsk9uQm12mRke/jE=
Received: by 10.223.6.73 with SMTP id 9mr1235202fay.131.1299265650075; Fri, 04
	Mar 2011 11:07:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 4 Mar 2011 11:07:00 -0800 (PST)
In-Reply-To: <4D713714.8030706@windriver.com>
References: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
	<4D71175D.4050307@gmail.com> <4D71192E.3050706@windriver.com>
	<B4A135D2-3DE3-4432-9C06-ADAE52BE1209@dominion.thruhere.net>
	<4D713485.90507@mentor.com> <4D713714.8030706@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2011 11:07:00 -0800
Message-ID: <AANLkTi=QjU7Ca-4v-29jgKaUco0GwMqg-S8_Q3_=_H_0@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Gst-plugin dependencies
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
X-List-Received-Date: Fri, 04 Mar 2011 19:08:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2011 at 11:01 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/4/11 12:50 PM, Tom Rini wrote:
>> On 03/04/2011 10:12 AM, Koen Kooi wrote:
>>>
>>> Op 4 mrt 2011, om 17:54 heeft Mark Hatle het volgende geschreven:
>>>
>>>> On 3/4/11 10:46 AM, Khem Raj wrote:
>>>>> On 3/4/2011 7:58 AM, Koen Kooi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> The current gst-plguin-<foo> =C2=A0 in oe-core is a bit anemic and t=
he ones in OE are really full featured. How do we want to handle this going=
 forward? I'm a big fan of shifting the pain to buildtime so people can ins=
tall any plugin they want at runtime instead of needing to rebuild it.
>>>>>> At TI we have cut-down versions of the recipes to save buildtime[1],=
 but it's a pain to maintain those and keep them up to date. It would be ni=
ce to come with a way to say you want full featured gstreamer or not. With =
my angstrom hat on, I would like the full feature set :)
>>>>>>
>>>>>
>>>>> May be controlling it with distro features
>>>>
>>>> Due to the licensing issues in the gst-plugins.. =C2=A0I'd be inclined=
 to say they're
>>>> out of the core myself. =C2=A0Move it to the distro specific layers.
>>>
>>> Even outside of licensing issues with things like MP3, I would like to =
have some kind of framework in OE (-core) for gst-plugins that layers can e=
xtend to their liking. Having dealt with the recipes over the years, too ma=
ny things change between versions. It takes someone familiar with gst to ma=
intain those recipes, and there aren't a lot of such people in OE :(
>>
>> I agree with Koen, gstreamer is pretty core to doing a lot of stuff in
>> real world applications. =C2=A0We just need a way to handle in a good wa=
y the
>> use flag type requirements this brings up.
>>
>> Is the TSC ready to talk about USE flags again yet? =C2=A0I think that c=
ould
>> help with the Angstrom hat vs TI hat problem Koen describes too, at
>> least in good part.
>>
>
> In some ways I think it's a bit more fundamental then that.
>
> I think we need to have a discussion on what's a "distribution" feature, =
what's
> a "FEATURE" and whats a "USE_FLAG" or other things.. and define some of t=
hese terms.
>
> I know I get confused as to the purpose of these various names and what t=
hey are
> used for already -- (I'm not even sure everyone is talking about the same=
 thing
> when they say these things)
>
> Let me suggest some:
>
> A "distribution" feature is one that affects an entire distribution and h=
ow it's
> assembled. =C2=A0Something like "LSB", "PAM", or "SeLinux" support is a d=
istribution
> feature to me.
>
> A "feature" is something specific to a package or subsystem within a
> distribution. =C2=A0It will enable or disable an optional component that =
is local to
> that area. =C2=A0(This allows most of the components, not affected by the=
 feature, to
> be reused.)
>

yes I think its right kind of definition to me.

> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


