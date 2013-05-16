Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ucs0d-0002Zn-VY
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 08:49:52 +0200
Received: by mail-ea0-f182.google.com with SMTP id r16so1552098ead.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 23:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=4AcZNuNqksZA3RwO0VyeYcKZLqXTlZSGSgW5oesJRRg=;
	b=Ef5/Dk4teUkgQssiBx2zqviQiJjRD1JhlLKQOyQFV2xGTURguyOICp7fWKi8xWePxO
	zBmdoF2uDYqlTOga6kAIaOUTQZ6+KN42u+Uq1Z0f/Iy85UbAC2TWJqUqB33ZXzYClY/y
	OUfYo8NwIgmi5NXYeE1rIp0yB0B1S/MituYQvCxC0bfWMGAtq62FFhum+sLW27QWaoFt
	VfdDfFmKfPA7vduiPi99lS7gKIB4/l+qZ1mb0TUK+gCeFd8dVmRT8yNVtqV8aUbJm+dZ
	Ep5bmzrVJnIa43Twdx5KTw5pI1tZFsmfbNhJh3K61+2hdpS9/xkECXUyhj98uUQRpWJw
	rBHw==
X-Received: by 10.15.73.197 with SMTP id h45mr71746964eey.46.1368685898361;
	Wed, 15 May 2013 23:31:38 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id g7sm8406211eew.15.2013.05.15.23.31.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 23:31:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1499979.6pTC18VfFV@helios>
Date: Thu, 16 May 2013 08:31:33 +0200
Message-Id: <879938A8-B7BD-4FA6-A38B-F2DDF9D5A48B@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1499979.6pTC18VfFV@helios>
To: openembedded-core layer <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnrVxkTjwNjQRVEGIz8n9v2xr+bGQI4LCS3PvNnkpob5PkmBzxtdzMNEsDTWbFsh6tvsvcF
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 06:50:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 mei 2013, om 16:44 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> Hi Koen,
>=20
> On Tuesday 14 May 2013 09:36:02 Koen Kooi wrote:
>> What triggered PR going backwards this time was a BSP removing its =
netbase
>> bbappend because it wasn't needed anymore. That's great, I hate =
netbase
>> bbappends since they tend to be ifupdown specific and don't work as
>> intended with connman/NM/netctl/etc. Long story short:
>>=20
>> 	ERROR: Package version for package netbase-dbg went backwards =
which would
>> break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package =
version
>> for package netbase-staticdev went backwards which would break =
package
>> feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package version for =
package
>> netbase-dev went backwards which would break package feeds from =
(0:5.0-r3.1
>> to 0:5.0-r1.2) ERROR: Package version for package netbase-doc went
>> backwards which would break package feeds from (0:5.0-r3.1 to =
0:5.0-r1.2)
>> ERROR: Package version for package netbase-locale went backwards =
which
>> would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: =
Package
>> version for package netbase went backwards which would break package =
feeds
>> from (0:5.0-r3.1 to 0:5.0-r1.2)
>>=20
>> To avoid things like that in the future I have a few recommendations =
I'd
>> like to get feedback on:
>>=20
>> 1) For a given BSP split it in multiple layers:
>> 	a) One 'core' BSP layer with only:
>> 		o Bootloader
>> 		o Kernel
>> 		o Tooling to build bootloader/kernel/image
>> 	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
>> 	c) One or more layers with bbappends for libav/clutter/etc[2]
>=20
> I don't like this. This will mean effectively 3x the number of BSP =
layers, with=20
> independent testing effectively expected for the different =
combinations; I don't=20
> think this will be practical. It's fine for distros with pre-supplied =
lists of=20
> layers but lots of users are assembling their own layer stacks and =
this is=20
> just going to add pain for them.

The flip side is that adding BSP layers becomes a lot safer. I don't =
mind adding layers. Adding layers is easy. Removing layers is pretty =
much impossible, though.

> It's probably time we looked seriously at more effective analysis =
tools for=20
> examining what a layer is actually doing. We now have the variable =
history in=20
> bitbake which means that pinpointing a change to a variable down to =
the=20
> specific line in the file that made the change is now possible; we =
should be=20
> able to build upon this to provide tools that determine when e.g. BSP =
layers=20
> are doing things that affect builds for other machines.
>=20
> Of course, getting maintainers to deal with these issues is another =
problem,=20
> but identifying them in the first place would help a lot.

Yes, layer maintainers are proving to be the weak link is the layer =
system.

>> 2) *Never* use PRINC in type b) bbappends
>>=20
>> 3) Avoid PRINC in general
>=20
> Do we even need PRINC at all any more? I realise we have PRINC values =
around=20
> in bbappends that we can't easily drop without causing the problem you=20=

> mentioned.

If PRSERV would work reliably we wouldn't need it. But even with the =
current flaky PRSERV PRINC is causing more problems than it's supposed =
to solve.

>> 4) make buildhistory.bbclass mandatory in OE-core
>=20
> Buildhistory does have some overhead as you know, which is why it's =
not on by=20
> default. I wonder if we could move the version going backwards check =
to=20
> package.bbclass or package QA, instead making it read the previous =
values from=20
> pkgdata. I'm not sure if sstate would get in the way in that the =
previous set=20
> of files might already be removed by the time it got to do_package; =
this would=20
> need to be investigated. Even if that is the case it might be that we =
can work=20
> around it.

I personally think the overhead is worth it, but as you say, moving bits =
to package.bbclass (and maybe using a sqlite db) would be very good as =
well.

>> During the last TSC meeting we discussed that there is currently no =
way to
>> force maintainers to behave. I think the most we can do is have clear
>> guidelines on the OE side and enforce those during the "Yocto Project
>> Compatible" process.=20
>=20
> Being more specific in the Yocto Project Compatible process =
requirements might=20
> help; I wasn't involved in developing that process so I can't really =
comment=20
> more than that. That wouldn't help with other layers in the OE =
community that=20
> aren't put through that process however.
>=20
> I think we need to improve the documentation we have about what is and =
what is=20
> not appropriate in a BSP layer. Most of the time it's not that =
maintainers are=20
> too lazy or deliberately setting out to force values, it's that they =
don't=20
> know they're doing anything wrong because we haven't documented all of =
the=20
> best practices anywhere. There was recently a question on this very =
mailing=20
> list about what constitute distro policy settings in the context of =
what=20
> shouldn't go into a BSP layer; the response has been a resounding "".
>=20
>> And have the layer index orange/red flag layers that
>> do stupid things. Come to think of it, that would actually be the =
most
>> visible way to go, having wikipedia style warning banners on the =
offending
>> layers.
>=20
> I think that's reasonable as long as maintainers can understand the =
problem.=20
> We'd need to be notifying maintainers directly about specifically what =
they are=20
> doing wrong and how to fix it; just putting a warning in the index =
isn't enough=20
> IMO. The layer index does record maintainer information and regularly =
reads=20
> layer metadata, so we have the infrastructure to do this now, just not =
the=20
> specific tools.

My thinking was that adding such a banner would email the maintainers of =
that layer. That still assumes that the layer maintainer actually reads =
email, which I don't think is true for a lot of layers :/

regards,

Koen=


