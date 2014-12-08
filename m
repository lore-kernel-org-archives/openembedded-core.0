Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7289C7249B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 13:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6DD8F1806E;
	Mon,  8 Dec 2014 14:37:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sn5DgwUL1sqv; Mon,  8 Dec 2014 14:37:46 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 95A3218084;
	Mon,  8 Dec 2014 14:37:46 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 781C6AC5;
	Mon,  8 Dec 2014 14:37:46 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 6CBFCA0D;
	Mon,  8 Dec 2014 14:37:46 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 6A5FE343CE;
	Mon,  8 Dec 2014 14:37:46 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Mon, 8 Dec 2014 14:37:46 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 14:37:44 +0100
Thread-Topic: [OE-core] Why is systemd installed to / (was: [yocto] Export
	bitbake variables between recipes)
Thread-Index: AdAQN8APnkfbJR1rTKmVoNmmr5QO0wCtD04Q
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7AD123BB5CA@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7ACF18D3E7B@xmail3.se.axis.com>
	<547E08A9.2090500@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7ACF18D42B6@xmail3.se.axis.com>
	<547F305A.5060305@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7ACF18D45D8@xmail3.se.axis.com>
	<54811FDE.7050605@windriver.com>
In-Reply-To: <54811FDE.7050605@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: Why is systemd installed to / (was: [yocto] Export bitbake variables between recipes)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Dec 2014 13:37:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> ChenQi
> Sent: den 5 december 2014 04:01
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
> Export bitbake variables between recipes)
>=20
> On 12/04/2014 09:34 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Mark Hatle
> >> Sent: den 3 december 2014 16:47
> >> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] Why is systemd installed to / (was: [yocto]
> >> Export bitbake variables between recipes)
> >>
> >> On 12/3/14, 9:36 AM, Peter Kjellerstedt wrote:
> >>>>> Can anyone please explain why OE-core installs systemd to /
> >>>>> rather than /usr? Because I have traced the recipe all the
> >>>>> way back to its introduction in OE classic, and I cannot
> >>>>> find any rationale for this odd decision. And it is extra
> >>>>> weird given the systemd authors' agenda that everything
> >>>>> should be in /usr (and /etc)...
> >>>> It's only strange compared to Fedora.  We're not Fedora.. and
> >>>> I've got systems that need to boot from a small '/' before
> >>>> mounting '/usr'.
> >>> Speaking of Fedora, would an official image feature, e.g.,
> >>> "unified-fs", be acceptable for OE-Core that sets up the file
> >>> system with /bin, /sbin and /lib* as links to their /usr
> >>> counterparts? That would alleviate our problems with the
> >>> differences in how systemd is installed.
> >> The system permits developers to set the paths for the various
> pieces.
> >> To get a Fedora like unified filesystem, you could do something like:
> >>
> >> * provide your own fs-perms.txt:
> > I had not noticed fs-perms.txt before. And it seems easy enough
> > to extend via the FILESYSTEMS_PERMS_TABLES variable. :)
> >
> >> /usr/bin	link	${base_bindir}
> >> /usr/sbin	link	${base_sbindir}
> >> /usr/lib	link	${base_libdir}
> >>
> >> Then in your local.conf:
> >>
> >> bindir =3D "${base_bindir}"
> >> sbindir =3D "${base_sbindir}"
> >> libdir =3D "${base_libdir}"
> > I think you mean the opposite, i.e., that /bin should be a
> > link to ${bindir} and ${base_bindir} should be set to ${bindir},
> > but I get your point.
> >
> >> This will result in /usr/bin, sbin and lib being linked to /bin,
> >> /sbin, /lib -- and all of the package produced for your
> >> configuration will only reference '/'.
> >>
> >> This isn't that unusual of a configuration from what I've been told.
> > Which is why I think it warrants an official distro feature (an
> > image feature, as I originally suggested, will of course not do
> > if it is done the way you suggest since the packages' contents
> > are modified). That way people would not have to invent the wheel
> > over and over again (and somehow find out that there is such a
> > thing as fs-perms.txt which up until now had eluded me).
> >
> >> --Mark
> > //Peter
> >
>=20
> Hi Peter,
>=20
> It's easy to link /usr/bin to /bin, /usr/sbin to /sbin and make things
> work in OE.
> But if we want the opposite to work, we might need several additional
> patches to OE.
>=20
> Several days ago, I tried to do /usr merge in OE (like what Fedora and
> Arch does). It turned out that we need to patch several packages to
> make things work.
>=20
> (I haven't sent out the patches because it's just some initial
> investigation and I'm not sure if people want this feature or not.)
>=20
> If you want this feature in OE, please open a bug/enhancement in
> bugzilla https://bugzilla.yoctoproject.org/ to see if the community
> wants it or not.
>=20
> Regards,
> Chen Qi

I have created a ticket for this now:=20
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7040

//Peter


