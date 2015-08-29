Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 74F07759D5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 12:59:02 +0000 (UTC)
Received: by qgeh99 with SMTP id h99so45424606qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 05:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jvq3E5y06P/Mz7/qoBXJEEMhycmbAGW1mW2aO2ivq2s=;
	b=dqRAeQYW2xEJWKvxv22OoD8h7+3p62PvsHvdKXpX/qN7Sx5lAVop026ldd5MNliUGd
	oX/OTHZPr/c8IHGpDx70XGF6qmC9FWrNbF+T7beKNf1K16SQ3FaLZ4mpy6Ey7Mz0GlE4
	C4mRGi8Ys7VV9LfdTXcW1sruWfxYDRxsfkizt7hvCcjeBzjbmyCa6c5IFbYkccxwcUVB
	jlwsyOMtP/dg/8M10yzlpD/quTeugVTGrsV7ur9wVyWLuoukJCF4bPNBuTeMpRhqkxfa
	7TcjM4KvDBOogEcj0ItMg1iALULsQ07APOIRgypbjxvMf/H/0gN/8p2wmSJpPHr0W/U9
	N7fA==
X-Gm-Message-State: ALoCoQnMGaPbhq9HylkG7I3uleDgFCWpx3bRC8w9ShOizI69Gb5monzGDrYmWEW2geLKojbYhc/i
X-Received: by 10.141.28.2 with SMTP id f2mr25174255qhe.17.1440853142854; Sat,
	29 Aug 2015 05:59:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Sat, 29 Aug 2015 05:58:43 -0700 (PDT)
In-Reply-To: <2282129.zWgJW2nO2n@peggleto-mobl.ger.corp.intel.com>
References: <1440805397-3775-1-git-send-email-ross.burton@intel.com>
	<1440805397-3775-2-git-send-email-ross.burton@intel.com>
	<CAJTo0Lajxi8GD6DP_s4n4i4BBnQ3Sxsy0eOoYnxtEWL56u8izQ@mail.gmail.com>
	<2282129.zWgJW2nO2n@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Aug 2015 13:58:43 +0100
Message-ID: <CAJTo0LZOGj+3PFTezX8L70KYjF76YYEbKXP3W_ip-ypvZ_GFtQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/runtime/multilib: change test case to use glib-2.0-utils
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
X-List-Received-Date: Sat, 29 Aug 2015 12:59:05 -0000
Content-Type: multipart/alternative; boundary=001a11423974c0f397051e72c363

--001a11423974c0f397051e72c363
Content-Type: text/plain; charset=UTF-8

On 29 August 2015 at 12:35, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Why is that? Really the autobuilder should just be running all valid tests
> for
> the image and not have any knowledge of what tests are being run.
>

Because the autobuilder needs to build specific images: the multilib runs
build a core-image-sato but add IMAGE_INSTALL_append = "
lib32-connman-gnome" to the auto.conf to get the right bits in.

Merging this would mean a version bump and the AB respecting the version as
to what libraries it installs.

Ross

--001a11423974c0f397051e72c363
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 August 2015 at 12:35, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux=
.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":3n9" class=3D"a3s" style=3D"overflow:hidden">Why is that? Really the a=
utobuilder should just be running all valid tests for<br>
the image and not have any knowledge of what tests are being run.<br></div>=
</blockquote></div><br>Because the autobuilder needs to build specific imag=
es: the multilib runs build a core-image-sato but add IMAGE_INSTALL_append =
=3D &quot; lib32-connman-gnome&quot; to the auto.conf to get the right bits=
 in.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">M=
erging this would mean a version bump and the AB respecting the version as =
to what libraries it installs.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11423974c0f397051e72c363--
