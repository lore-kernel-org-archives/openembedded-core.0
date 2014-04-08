Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id AC16A65D77
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 09:29:33 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jx11so524130veb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=DZMQdS1WKK7axm61NReR6gVNa2dLgf7/XAPSbrNDjZM=;
	b=r0yLWZNPtih7D/6W6JUAWknOc/8i7pRDY34MW4uj6TmJ0RW4l3dJF2mK6nTNaGmu7u
	7aMskndkpkJ4A7so87PV1Zs919qaPUbxvSRMeZwHtKbOpgVsPIJRCjt1cOs/sXy1+B1v
	odXmwQX4WVtC9HYPbk3sglw8yPJ4VyIMcIun1uH3g+M9bSoTVcNc4qx3VY6qibjT1Ch7
	aQXpOX75B0FI5vFe/IWl91hnGyrF9DMkPxE5g4/edgK6W8VXgSr6dMHeMMQ+fJ3/pH7S
	GBdNbOCE6vSzvskPmMwMhhPR+ZdDlvuRdVQwbGcspsXWZNIPKsarwYl3QyQpG6jKNXKP
	Q1fQ==
MIME-Version: 1.0
X-Received: by 10.59.9.38 with SMTP id dp6mr727521ved.24.1396949374026; Tue,
	08 Apr 2014 02:29:34 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 8 Apr 2014 02:29:33 -0700 (PDT)
In-Reply-To: <2245979.Tj1EYu6Ry0@peggleto-mobl5.ger.corp.intel.com>
References: <1396362098-14134-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRRm0JJ2Eq43V5kS2uHehoMWTFiSSbeBGxWav1XyLhmj_g@mail.gmail.com>
	<2245979.Tj1EYu6Ry0@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 8 Apr 2014 11:29:33 +0200
Message-ID: <CALbNGRR0px+BSjjiKhDiQJPF9=zhNazRaC+xzHu+nc68BfGFQA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: make x11-base a valid image feature
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
X-List-Received-Date: Tue, 08 Apr 2014 09:29:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2014 at 10:51 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 08 April 2014 09:47:23 Andreas M=C3=BCller wrote:
>> On Tue, Apr 1, 2014 at 4:21 PM, Andreas M=C3=BCller
>>
>> <schnitzeltony@googlemail.com> wrote:
>> > make
>> >
>> > commit 049f89155b1e80875aad6e53b21808b827c06915
>> > Author: Chen Qi <Qi.Chen@windriver.com>
>> > Date:   Fri Dec 20 10:45:52 2013 +0800
>> >
>> >     image.bbclass: add ability to set systemd default target
>> >
>> >     Add ability to set the default target for systemd images.
>> >
>> >     The default target for system is controlled by SYSTEMD_DEFAULT_TAR=
GET.
>> >     The default value for this variable is derived from checking wheth=
er
>> >     IMAGE_FEATURES contains 'x11-base' or not. Each image could overri=
de
>> >     this value in its own recipe. For now, we don't need to do any cha=
nge,
>> >     because all images that support graphical environment has 'x11-bas=
e'
>> >     in its IMAGE_FEATURES.
>> >
>> >     [YOCTO #3816]
>> >
>> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> >     Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> >
>> > work for users wanting graphical target. Fixes
>> >
>> > ERROR: 'x11-base' in IMAGE_FEATURES is not a valid image feature. Vali=
d
>> > features: dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs package-manageme=
nt
>> > ptest-pkgs qtcreator-debug read-only-rootfs splash staticdev-pkgs
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > ---
>> >
>> >  meta/classes/image.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> > index 29309f5..35e8d3b 100644
>> > --- a/meta/classes/image.bbclass
>> > +++ b/meta/classes/image.bbclass
>> > @@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
>> >
>> >  # IMAGE_FEATURES may contain any available package group
>> >  IMAGE_FEATURES ?=3D ""
>> >  IMAGE_FEATURES[type] =3D "list"
>> >
>> > -IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs"
>> > +IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs x11-ba=
se"
>> >
>> >  # rootfs bootstrap install
>> >  ROOTFS_BOOTSTRAP_INSTALL =3D "${@base_contains("IMAGE_FEATURES",
>> >  "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}">
>
> This is not the right fix. At this time, "x11-base" is not a valid featur=
e
> unless you're inheriting the core-image rather than image class. The orig=
inal
> change is therefore incorrect, unfortunately.
>
I can't follow: The patch breaking graphical target introduced the new
image feature x11-base. This cannot be used without the patch I sent.

Andreas

