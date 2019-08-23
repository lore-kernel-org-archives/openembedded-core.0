Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74FCB7DDAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 18:11:32 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id m18so4248775vsr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zRBkno0FfWWceCv/hupGDIT3SPXy7lQW6tS9HN0oZlg=;
	b=hFwGayJ6YRqZprAsxBe3Q1hXStZDwqrTLmsdPwa3YRSYw3ehR1zBZY8RYIcIMeBz5b
	lhwlx1FPMdZ1Vmd//kJsiuUB4J3el5DRQB9DbSRKmnzG7nN34ciBNIzy3Dcv/AEs/+8X
	BNpZqEuMbl7r/EhfpD95Lwboh9e8uxVNCpCyM/kEl0eZkapPkCcvgtzEYZ2hAcxyEZrY
	yYTFFjbJSvHE+vCSGV8OzPnsLccvzu426AqEfsT9OBV7oCPdauDo4iyCkYC3megtpPEk
	uBb2MIlBVC6RODMh9cr+yNsY1weljltTkAha2LY2TmwySedXMPz1fyZlQqwZtBzF6EU+
	0aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zRBkno0FfWWceCv/hupGDIT3SPXy7lQW6tS9HN0oZlg=;
	b=Hd73f97THB+z38DR82hIoPQMdJSjl2PyFR6VrZkuBbU5swz8/sKreLy6ckoUmD6jJk
	s2gNBc/q6AbmG/MtbyvAfotsrn7csyGp1BygDgMbI4zlCDg0SHYLkJ6m+TgYgDr4zjB+
	Qjd96ny1XRsuLPt3RR2SQ2ewR43Qw7l/egcuaHcNVe2F3WdCwdQva6topyjru8dV6PsX
	8pzSLgAM4nzUsAtHX+AQNM6KTIkuOtDd6co7fWQF8GxLow8/7EVRf6dAuJHXCUs20q9S
	uqKGKEs6cZBGAKl0Fq3/3iSdqAuABw6anE22mC96mWXyijSDODigQMWqlUpriYp6TtWg
	LV/A==
X-Gm-Message-State: APjAAAWKNn3OopaQ/dRgoeMEZSSJGO/ehj81pArVxv1ySYsEfmNjRia9
	FDUVrjPXT1yB5jHgT51cY6Kdf1TnSqwXpbxCB98=
X-Google-Smtp-Source: APXvYqzkSaKWysCWPZfQ6X+d9RfVAQ87dZIpbRcsuya5kqp4OujStpdcVm3X3rXv24Bbctl/7F9uKMHIuzu+XaIlDuk=
X-Received: by 2002:a67:ec50:: with SMTP id z16mr3429040vso.137.1566583893249; 
	Fri, 23 Aug 2019 11:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
In-Reply-To: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 23 Aug 2019 11:11:22 -0700
Message-ID: <CAJ86T=XwwjSZR6oNdXCr=bvbOKw5trKWJ=na4=_+83vXXJo6Bw@mail.gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatic prebuilt management
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
X-List-Received-Date: Fri, 23 Aug 2019 18:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2019 at 9:06 AM Loic Poulain <loic.poulain@linaro.org> wrote=
:
> Say a company works with an OE internal tree, with open-source and closed=
-source packages. The company wants to release the tree so that its custome=
rs can fully customize the images/distro. The closed sources being only ava=
ilable internally, the company has to generate and handle prebuilt binaries=
 for proprietary packages. Ideally, with a unified public/internal OE tree =
(same recipes for internal/public build).
>
> This question is actually similar to an older thread:
> https://marc.info/?l=3Dopenembedded-core&m=3D146779329804683

That very old thread was also referenced recently in a follow up where
I shared a later solution, see:

  http://lists.openembedded.org/pipermail/openembedded-core/2019-July/28489=
6.html

> I started to work on this and added a 'generate-prebuilt' class which gen=
erates a tarball of ${D} in deploy/prebuilts after do_install task. Symmetr=
ically, It's also possible to create an 'install-prebuilt' class which bypa=
sses do_fetch, do_unpack, ..., do_install with noexec flag and instead unco=
mpresses a previously generated prebuilt tarball into ${D} and continue nor=
mally. But I would like something smarter, e.g. first trying to check if th=
e SRC_URI is available, if not switching on using the prebuilt package if a=
vailable (e.g. in a DIR_PREBUILT)...
>
> Before going further is there already an existing solution for that? do y=
ou have any recommendation on the easier/best way to achieve this?

I did initially try the approach of having a single recipe which can
automatically support both building from source and extracting a
prebuilts tar file, but that (for me anyway) turned out to be a dead
end. Building from source requires build dependencies and config
options but extracting a prebuilt tar file does not, so the two end up
sharing very little... so 90% of the recipe ends up being conditional
on which mode it's running in. The solution I ended up with (see link
above) was for the class which creates the prebuilt tar file to also
create a dedicated mini recipe to extract it.

From my experience however an equally hard part of the problem is the
distribution of prebuilts. It starts off easy (you share a tar file
via email or an ftp site and the receiver manually copies to their
downloads directory...) but that doesn't scale if you need to make
regular updates. My solution is discussed a little more in the thread
linked to above.

