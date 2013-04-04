Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNf0X-0001YN-Hc
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 09:54:54 +0200
Received: by mail-bk0-f51.google.com with SMTP id y8so1313980bkt.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 00:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ut1WuJPXiUXigJPnFehYBuX+Tcvy7TeWJTCyVNTvUsM=;
	b=SXjHRN0tVi05zfMVYviQENvz7UPduexbAw4f0LDbaO7ZLEUzAtyVITt7SmgxoKbdSx
	HO9+FbdrXBFp3IRhqfsTiY3SEZJrblxmAo6KpUKwbKBsedsE82gg/fITyiOX2egnwU1T
	382y+lEGWOp8TJWRwYUxtzaCTf/jL+cd6BR1ulh4iY+YbPQDKCN3VWKs3sYwPKD9ED5k
	4FlRfFpfhGayvWwEl/Zbffmwib/GGS3bKWLteULjRI7xh1jsX3jekc0/FdAIcIPIj3fa
	agqn+G9WPnW0QvpR0yfaGie3WG0L3oDCt4l6ARjrl5EQK7cMTXntS4jW2t0d2JDgzTrA
	YSng==
X-Received: by 10.205.37.198 with SMTP id tf6mr3412042bkb.29.1365061060952;
	Thu, 04 Apr 2013 00:37:40 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id x10sm5066496bkv.13.2013.04.04.00.37.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 00:37:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
Date: Thu, 4 Apr 2013 09:37:38 +0200
Message-Id: <AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnPCj1vxA+PyiWyUc8/cylT1tCLlKv8jprQAqewlNjqzE+j5uxkQVXGVWZik4ynuurqpMkN
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 04 Apr 2013 07:54:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 apr. 2013, om 17:27 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 3 April 2013 15:51, Samuel Stirtzel <s.stirtzel@googlemail.com> =
wrote:
>> When we decide that we handle standard behavior different than the
>> rest of the world, then this patch is basically a fork of systemd.
>> Also we tell every affected software developer:
>> "No your software won't work with OE-core / Yocto Project without
>> adaption, we are incompatible with the systemd standard to make life
>> more comfortable for (some of) us"
>=20
> Changing the default target depending on the use of the image isn't
> really the same as forking systemd, and we're not making anything
> incompatible.

I think the point that Samual is trying to make is that when using =
systemd you implicitly agree to a kind of "social contract" to not be =
different for the sake of being different. Samuel, please correct me if =
I misinterpreted what you're saying.

Let's look at an example, 2 years ago this was the accepted by upstream:

	=
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D1bd8b8184ee3bc7fc=
023d6d6dfb2ca99fb6612f3

But nowadays that is a big no-no:

	=
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3Dbc2708414babc5c99=
bb8000e63c84e87606cc15d

Any time you want to make a change it you should ask the systemd folks =
on #systemd or their mailinglist if that's the right way to do that. The =
systemd recipe is already a deviant by using prefix=3D/, but we know why =
that is and accept the consequences.

=46rom what I can tell changing the default runlevel based on the image =
content should be OK and not make the OE systemd implementation =
different from all the others. But I have lost track what is being =
discussed here, see below.

>>> How would you implement this?  Register the alternative in =
systemd.bb
>>> defaulting to graphical, and then switch it in every image recipe in
>>> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
>>> shortly) session?
>>=20
>> If this works why not?
>> It sounds like a good idea, because this way would not break =
anything,
>> and we would be compatible with the standard systemd.
>=20
> Obviously the nuances of my sentiment were lost as it was transcribed =
to ASCII.
>=20
> I'm advocating changing the default target to multi-user and then
> patching the two recipes where X session scripts are packaged to also
> set the target to graphical.  People switching to systemd who don't
> use the standard X sessions (they roll their own, or don't use X, or
> whatever) will notice quickly that the default target needs to be
> changed, and can do it in their graphical startup recipes.
>=20
> You're suggesting leaving the default target as graphical and changing
> uncountable numbers of *image recipes* to override the default target,
> the alternative being errors in the log.
>=20
> So far "the community" disagrees on the approach here - we've had
> vocal objections to errors in the log for any image, changing the
> default target, and the other proposals.

I'm getting a bit lost on what the actual problem is and what kind of =
fixes are needed besides this patch. So can the people involved tell me =
what will change when I have the following:

1) console-image already using systemd, used as-is
2) gdm-image already using systemd, used as-is
3) console-image already using systemd, gdm will be opkg-installed at =
some point.

What will be different between 2 clean builds before and after these =
changes and what will happen when I 'opkg update ; opkg upgrade' those =
image built before the change with ipks built after the change?

> We *do* need a way of changing the default target.  Do we at least all
> agree that update-alternatives is a logical way of changing it on a
> per-image basis?

Looking at =
http://www.freedesktop.org/wiki/Software/systemd/FrequentlyAskedQuestions =
it suggest using symlinks, which is what u-a does under the hood, so it =
looks like a decent solution to me.

regards,

Koen=


