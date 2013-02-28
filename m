Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UB00H-0007b2-AX; Thu, 28 Feb 2013 10:42:20 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so776950dad.1
	for <multiple recipients>; Thu, 28 Feb 2013 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rZCW3Vot4xgzJoF8/N/SH2fYbdqnBTrdGrvltYQnaGI=;
	b=D0ByuRrbYanPfGvvLdubkX5ucmU+hjx46w2Aid/mFxIJ/iX0+/nrlgBF//KhKje9L/
	C3S0OJhwpihfjJjlqgiJJ7kBjY8+ghJ7HJLnp1x5A6R6CTyNHWdhJh3sG/gtyGQfAe/1
	0YRc1NEbRYzYw3PRyUavMQPvMIu6E15Q89oxXI83jFou3O9pS1a12fMG/f7BfFwjvrc4
	wAS62iz3gMQCcqqHnjIjXZLS3chTgyNu3fQLtz7M6EscIZanvlUApGPpaMoydyj1NSaw
	nm5WmiK3Fc1BgaMEyIjoVdbt7OJwnQwoionIRj1DJFs3qm3b9mJLcV6Mvd/1AKeN07AT
	ZKrw==
X-Received: by 10.68.10.227 with SMTP id l3mr8207607pbb.100.1362043553882;
	Thu, 28 Feb 2013 01:25:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu2sm7762806pbc.38.2013.02.28.01.25.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 01:25:52 -0800 (PST)
Date: Thu, 28 Feb 2013 10:25:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Message-ID: <20130228092539.GF8208@jama.dyndns-home.com>
References: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: tsc <tsc@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE TSC minutes 12 February 2013
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
X-List-Received-Date: Thu, 28 Feb 2013 09:42:20 -0000
X-Groupsio-MsgNum: 36008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline

--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 10:28:51PM -0800, Jeff Osier-Mixon wrote:
> b. meta-oe appends/overlayed recipes RFC
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043=
925.html
> =3D> Paul to talk to Chris about a release

tslib release (it's not clear without reading whole log

> (9:23:04 AM) bluelightning: for reference, the RFC:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043=
925.html
> (9:23:26 AM) RP: tslib is probably a case for putting pressure on
> Chris for a release
> (9:23:37 AM) bluelightning: RP: that's what I was thinking
> (9:23:55 AM) bluelightning: I can take the AR to do that
> (9:23:55 AM) RP: We could take the ffmpeg/libav stuff into the core
> subject to correct license tags
> (9:24:17 AM) RP: xserver-nodm-init I don't know the history of,
> probably needs someone to resolve the differences
> (9:24:20 AM) RP: It does need to be done
> (9:24:20 AM) koen-: bluelightning: feel free to drop the avr32 patch in l=
ibmad
> (9:24:34 AM) bluelightning: koen-: ok... is it no longer of value then?
> (9:25:28 AM) fray: so it sounds like me, we have a clear path for
> everything except xserver-nodm-init?
> (9:25:42 AM) koen-: bluelightning: no avr32 support in public layers
> (9:26:09 AM) bluelightning: koen-: well, there are a few references,
> but you're right, no machines that I'm aware of that use that
> TARGET_ARCH
> (9:26:55 AM) koen-: exactly
> (9:27:00 AM) bluelightning: I'd also note generally I'm still waiting
> to hear back from Martin Jansa since I figured he might have an
> opinion on the RFC
> (9:27:17 AM) RP: re: xserver-nodm-init, I probably know some of the
> history if there are specific questions
> (9:27:46 AM) bluelightning: well, the general question is how can we
> eliminate the duplication
> (9:27:51 AM) RP: I think its a case of nobody wants to touch it :/
> (9:28:00 AM) fray: :)
> (9:28:07 AM) bluelightning: so far that has been the pattern, it has
> been raised numerous times
> (9:28:18 AM) RP: I'd propose deleting the meta-oe version
> (9:28:22 AM) RP: see who complains :)
> (9:28:27 AM) fray: there ya go.. :)
> (9:28:42 AM) bluelightning: JaMa at least would probably have
> something to say about that :)
> (9:28:43 AM) koen-: RP: martin and I tried to get the meta-oe version
> into oe-core a year ago
> (9:29:16 AM) fray: I think the key thing, from the original goal of
> meta-oe (way back when we first met on oe-core/meta-oe) was to use it
> as a temporary space for appends (as necessary).. key being temporary,
> until it could be put into oe-core (or dropped)
> (9:29:16 AM) koen-: RP: but the oe-core maintainer couldn't grasp our
> usecase and it was before the big X.org cleanup
> (9:29:51 AM) fray: with the cleanup, does it make sense to try again?
> (9:29:52 AM) bluelightning: fray: I don't think that purpose ought to
> be supported anymore
> (9:30:12 AM) bluelightning: just causes too much mess
> (9:30:17 AM) fray: bluelightning I'm inclined to agree with you..
> (9:30:26 AM) koen-: systemd-user-sessions are a much better way to do it
> (9:30:34 AM) RP: koen-: So rather than explain it further you gave up?
> (9:30:36 AM) ***koen- has a ton of recipes to make that work
> (9:30:42 AM) fray: I was originally thinking experimental features,
> etc.. but always with an eye of getting things into oe-core
> (9:30:43 AM) koen-: RP: not really
> (9:30:54 AM) koen-: RP: after a while we hit the usual brick wall
> (9:31:02 AM) RP: koen-: "usual"?
> (9:31:07 AM) koen-: and then we focused on merging the meta-oe X.org stuff
> (9:31:26 AM) bluelightning: fray: if people want a shared layer to do
> that, I've no objection... as long as it's not the same layer that has
> useful stable additional recipes as meta-oe does
> (9:31:45 AM) fray: ya, and I think that's one of the things that has chan=
ged..
> (9:31:55 AM) fray: meta-oe is a lot more stable then it had originally
> been thought to be..
> (9:32:03 AM) fray: (not a complaint mind you!)
> (9:32:09 AM) khem: fray: meta-oe should be seen as extention of oe-core
> (9:32:42 AM) RP: My main concern with it has been the mix of distro
> policy and recipes
> (9:33:03 AM) RP: We're reaching a point where that is nearly resolved
> and I think we need to maintain that
> (9:33:19 AM) fray: RP, that is the place I'm seeing more focus on from
> you and others..  distro policy settings vs simply recipe
> integration..  it's a good thing and as you said, we need to maintain
> this work..
> (9:33:50 AM) fray: I think it speaks highly of the project and users
> that distro policy is an issue vs "I can't integrate recipes cause
> it's too hard"
> (9:34:52 AM) fray: ok then.. what are the next steps to this..
> (9:35:11 AM) RP: Its why the YP compatible status spells this out, its
> one of the hardest things to achieve yet it also helps the users the
> most
> (9:35:15 AM) fray: Finish up the work for the packages other then the
> xservers-nodm-init..
> (9:35:25 AM) fray: work on getting that integrated or dropped as a
> separate item?
> (9:35:33 AM) bluelightning: fray: well, we've resolved everything
> except the xserver-nodm-init, that needs further input from those that
> currently use the meta-oe version
> (9:35:45 AM) bluelightning: fray: I'm working on patchsets to tackle
> everything else
> (9:35:46 AM) RP: I don't know what the differences are so its hard to com=
mit
> (9:35:51 AM) RP: comment
> (9:36:00 AM) fray: and focus on only doing bbappends in oe-core when
> specifically necessary -- otherwise it should be in oe-core?
> (9:36:14 AM) RP: I would point out that a step by step series of
> logical changes does help me a lot with review
> (9:36:36 AM) RP: simply copying the meta-oe version over the oe-core
> one will not be helpful
> (9:37:06 AM) RP: meld is great for creating that kind of thing
> (9:37:39 AM) bluelightning: http://pastebin.com/e8DyTP1M
> (9:38:45 AM) RP: so rootless X support is one difference
> (9:38:45 AM) bluelightning: I can't get much from that diff I have to say
> (9:38:58 AM) bluelightning: but I'm not particularly familiar with the
> problem space
> (9:39:00 AM) RP: and one is machine specific, the other is allarch
> (9:39:11 AM) RP: It might be possible just to rename one of them
> (9:39:11 AM) khem: hmmm oe-core one is machine_arch specfic
> (9:39:21 AM) khem: but meta-oe is allarch
> (9:39:27 AM) RP: If angstrom and shr use it in their feeds, I'll take
> a rename to the core one
> (9:39:37 AM) RP: since there are less distro feed issues with core
> (9:40:01 AM) RP: khem: its due to the rootless X support which works
> on some machines, not others
> (9:40:30 AM) bluelightning: presumably machines with drivers that support=
 KMS ?
> (9:40:33 AM) RP: bluelightning: are the scripts themselves different?
> (9:40:36 AM) khem: INITSCRIPT_PARAMS change is probablt disto specific
> (9:40:42 AM) khem: it should move to distro layers
> (9:41:00 AM) RP: bluelightning: Intel gen graphics supports it basically
> (9:41:08 AM) RP: khem: sane defaults are fine
> (9:41:16 AM) RP: khem: distros can then change if needed/wanted
> (9:41:50 AM) khem: yes
> (9:41:58 AM) khem: however we have
> (9:41:58 AM) khem: -INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
> (9:41:59 AM) khem: +INITSCRIPT_PARAMS =3D "start 01 5 2 . stop 01 0 1 6 ."
> (9:41:59 AM) khem: +INITSCRIPT_PARAMS_shr =3D "start 90 5 2 . stop 90 0 1=
 6 ."
> (9:42:09 AM) bluelightning: RP: yes
> (9:42:11 AM) bluelightning: RP: http://pastebin.com/MmPKzZ26
> (9:43:10 AM) fray: ok.. lets take this to the mailing list, and go on
> to the next topic(s)
> (9:43:23 AM) fray: 3a -- janitor/qa bugs.. I don't have anything here
> (9:43:26 AM) bluelightning: yep, I think that's probably best
> (9:43:29 AM) khem:        yes
> (9:43:59 AM) fray: 3b -- has anyone gotten to this yet?  if not we
> should keep it on and I'll try to get to it after ELC
> (9:44:17 AM) RP: Just to round off, I suspect we should try and make
> that recipe allarch for the machines that don't support rootless X
> (9:44:28 AM) RP: there don't appear to be many other significant differen=
ces
> (9:45:34 AM) RP: fray: no one has got to it that I know of

I can explain some bits on this one.

The main difference between xserver-nodm-init is not in this recipe
itself but in stuff it's using to get things done:
meta-oe version: xserver-common (includes settings for many MACHINEs),
integrates with xinput-calibrator

oe-core version: x11-common (uses formfactor to read MACHINE support,
xinput-calibrator not used and not available in oe-core

xinput-calibrator is now being reworked by Andreas so we should at least
wait for this rework to settle down, before it's imported to oe-core, some
people tried before, but not very well:

http://patches.openembedded.org/patch/13093/
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/006814.html

My patches in first version of BIG xorg cleanup also touched xserver-nodm-i=
nit,=20
but because I haven't reworked x11-common/xserver-common at that time it was
correctly refused:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/01042=
1.html

In next versions like
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010814.=
html
I was cleaning only xserver, libx11, mesa and keeping
xserver-nodm-init/x*common untouched.

I still belive that moving root-less support to
x11-common/xserver-common is right way (user should be able to start
root-less Xserver from command line without using init script) and
/etc/X11/Xsession or formfactor should decide if MACHINE supports that
use-case or not.

xserver-common has a lot of local patches in meta-oe, but all we're sent
to Florian to apply them upstream and hopefully with new xserver-common
release.=20

I still find xserver-common a bit more flexible (I can do whatever I
want in MACHINE specific section of xserver-common script), but someone
can check what those specific sections are doing and add more possible
options to formfactor + more IFs to x11-common.

Machines with touchscreen were usually adding -nocursor (x11-common
should probably do the same with HAVE_TOUCHSCREEN=3D1 in formfactor), some
MACHINES were even modprobing kernel module (not sure if we want to
support this use case by formfactor), selecting different xserver
implementation is probably not so useful now with almost everything
using Xorg.

I agree that formfactor is easier to maintain and MACHINE specific
declarations there can be used by other stuff besides x11, so it's good
thing to have.

I don't have time to work on this myself soon, but if someone moves
root-less support from oe-core's xserver-nodm-init to x11-common +
formfactor. Then as first step we should be able to drop
xserver-nodm-init from meta-oe and use
VIRTUAL-RUNTIME_xserver_common (already used in
packagegroup-core-x11.bb) to select between x11-common and
xserver-common.

And I think this first step should be done by someone with access to
device which is using root-less now =3D> not me and it's easier if that
person is not depending on meta-oe to get touchscreen calibration right
:).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEvIpMACgkQN1Ujt2V2gBxZlQCffX0ViipZVzFyZX6CtuDCRLkb
/sIAnij4KPbXuoN8YlkG7wqatDPh6AWQ
=TK7l
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
