Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UP9su-0001HV-VT
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 13:05:13 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so1466678eek.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 03:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=woCACI7htjdJv9ksS0nJZllepBPwYCGJIpo7qDvL5J8=;
	b=Kh2ymqF2K95QkPB/IId3FbONAYCAgOw5YfivXFVeFoQf6G+GEk4CaudR0N0chKDy2b
	CTtSyybHfdSsxV5CJZ4ER7uCf6POXTpy40wjxeXFOCVZ6bQs4oSmSWyhcmDgJHXLey66
	DH5TVP9vlNnc3egvamIxBMwXOBef/1kM2G8cJInkO3THI9s+0qVPwh6c0A0Q5Xp0QVLt
	PwqTINtSu64L9sV4soSrVWV23l1AT4eSGWoUGGKOcue4q2LCIuaxGn/KZp7ixZCilcKy
	HIf4y76yfCQp+9sPNd0kLqohigRjAa7RaeKtGTH2ZXWgCQ0VAC4NkxhnY5gpemVh5gKO
	352w==
X-Received: by 10.15.43.73 with SMTP id w49mr47358507eev.12.1365418074559;
	Mon, 08 Apr 2013 03:47:54 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a1sm31303929eep.2.2013.04.08.03.47.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 03:47:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbOMz+MninSBv6d8UjeQ3cJMn-WXfq1v5Cqu4npDh+eng@mail.gmail.com>
Date: Mon, 8 Apr 2013 12:47:51 +0200
Message-Id: <2ED8DCD8-2873-4DE1-85C2-5CB254B8FD58@dominion.thruhere.net>
References: <5162038C.2020706@pseudoterminal.org>
	<9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
	<CAJTo0LbOMz+MninSBv6d8UjeQ3cJMn-WXfq1v5Cqu4npDh+eng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQneAGnLkGnQHZzK0RFtS8eI7NXZ/ZUNhNso1bx6BXz5hgmVKtT3oOd03NXZZUTAfkqViMGP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 11:05:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 apr. 2013, om 11:35 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Op 8 apr. 2013, om 01:38 heeft Carlos Rafael Giani
> <dv@pseudoterminal.org> het volgende geschreven:
>> to start working with GStreamer 1.0 on several embedded platforms, I =
decided to
>> adapt the existing GStreamer recipes from danny for 1.0. Out of this =
I created a layer,
>> which is hosted at https://github.com/dv1/meta-gstreamer1.0 .
>>=20
>> I write this RFC, because I figure that GStreamer 1.0 support is =
already on TODO lists
>> of several people, and will eventually end up in OE-Core, just like =
GStreamer 0.10 did.
>=20
> Excellent!  I'd love to see this merged into oe-core as soon as we've
> branched for 1.4.
>=20
>> I built the packages for several platforms (cubox, beagleboard, =
imx6), and they worked
>> well. Since 1.0 has been designed to be able to coexist with 0.10 in =
the same rootfs, I
>> changed the naming convention for the packages: they all start with =
"gstreamer1.0-" .
>=20
> Perfect.
>=20
>>> * gstreamer: check_fix.patch (I could not reproduce the documented =
problem), and gstregistrybin.c/.h (why are these present?)
>=20
> The binary registry stuff is upstream now I think.
>=20
>>> * gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure =
what this is trying to fix, and this line does not exist in 1.0), and =
gst-plugins-base-tremor.patch (again, works well without it)
>=20
> Fine, is there are problems we'll soon find them again. :)
>=20
>>> I am also considering some kind of autodetection for when yasm and =
liborc are available (for example, because meta-oe was added to =
bblayers.conf), and then switches on Orc and enables yasm in gst-libav. =
Or better yet, if libav is available as a recipe, it lets gst-libav use =
it instead of its internal copy. These autodetections would improve =
performance significantly.
>=20
> Build-time autodetection has to also be deterministic, i.e. it
> examines the MACHINE and layers instead of poking at the sysroot.
>=20
> So...
>=20
> On 8 April 2013 08:57, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> I've been meaning to ask the same questions, since I need both orc =
and external libav to make gstreamer  (0.10, but still) useable on my =
platforms. I came up with the following ideas:
>>=20
>> 1) Make every external dep a PACKAGECONFIG option in OE-core =
gstreamer
>> 2) Add bbappends with extra PACKAGECONFIG options for gstreamer in =
the layer that has the external dep
>> 3) add bbappens in the DISTRO layer that enables extra external =
dependencies.
>>=20
>> Angstrom is currently using 3) and I absolutely hate it. 2) is scales =
a lot better, but apparently is verboten judging from the patches sent =
that remove the qt bbappends that do the same.
>> Which leaves 1), which will cause problems for most users, since they =
will spot the PACKAGECONFIG options but not bother to read the comments =
saying they need to enable extra layers.
>>=20
>> I favour 1) since that has all the knowledge in a single place, =
looked after by the OE gst maintainer (which we don't have yet, but =
still).
>=20
> (1) definitely needs to happen in my opinion  I'm not a massive fan of
> (2) in general as it leads to stuff changing simply by adding a layer
> - you may pull in meta-oe for some other packages but suddenly the
> GStreamer package is pulling in more dependencies.  I guess for things
> like GStreamer where the dependencies are generally isolated into
> separate packages this is less of an issue though.

Same thing is true to Qt, the *sql plugins are all subpackages. I =
realize 2) is unclear on wether the extra PACKAGECONFIG default to on or =
off.=20

Both Qt and gstreamer have nice automated packaging of their plugins, so =
bbappends are generally safe to use, but both of them also have =
configure options that enable/disable complete libraries (e.g. QtOpenGL) =
that might trigger missing symbols in other libraries in Qt/gstreamer =
(again, QtOpenGL).

So were do we as OE(-core) community draw the line for bbappends in =
layers? For Qt it seems to be at "No bbappends allowed", but should we =
consider drawing it at "safe plugins only"? For generic layers like the =
ones in meta-oe I sure as hell don't want the "unsafe libraries" =
bbappends.

And for the sake of the argument, pretend that 'opengl' is not a =
DISTRO_FEATURE yet, we can fix the specific openGL case with a =
DISTRO_FEATURE PACKAGECONFIG.

regards,

Koen




