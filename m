Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4EE60685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 21:54:41 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id s18so8864860qvr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8mmaBmowegRCpro9/YL83X9AqDRDIJZsFTp9NxC3ioI=;
	b=h9e0OdZRGlQua6twFugQxiDfVqipOLHX0vmmzMfczZZVFMkPxGn9IWUl38U/gzCkp2
	Q9u++67JRLS8lFBChihalXpz0Dpfbmn65hOxbK0bXze1xKkSFREk8GhPaOf6CkLZrqIK
	7Pxk6+XX4VtPFNj2uMNQ4sRz5fGd59hD/gJ3SKUULj95zbu7H6qtDfpwE0MUHiqn477v
	z2fo4IhJlNhHIo405Y2G6DoeWIAnADOiSWD+XFEI2IMVD4uA92G3Eo2bjOQbaZt4Wkg4
	VirKjfl79Bu4454+agrNgSfoCpJtPevran0K/g7vwOfmA18cBmomyOZtE/PTdbWLUGD6
	2bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8mmaBmowegRCpro9/YL83X9AqDRDIJZsFTp9NxC3ioI=;
	b=JkY8FtUgjVGwopbSzRDkiX4ROiofUzaZuBEH/Mm3ij0zccpfT6khUgQo8UkSWjebmd
	8JifDTQqFO3kH8h+Z7WtZvxWF+kHFUD93HIsvh2FMfdrq1En9bHfv1xUMBBSUxBJgnQi
	Q4I49SLSEYi/eeyEHhvb5We0J9A4MFiw7krIZFuuEkXUMqDsf6Y2mD/vLgrKtb0IDIQz
	CuZ8D15/qBMGvg7/U1xhdaLFboRN5Pyqqlq19FpYnGKxbelQH6R07SdNysUXp7sStZ7Z
	Gu9UQ7i16MTPBiNk9bpy5VAy/08VaY3/1Qjy8/688RmJEL/tgS3Js2a8saz/oCq82l1n
	yj1A==
X-Gm-Message-State: APjAAAXvDkFGdFdVEqHYaomS7E1+Hfzsq2haAeMOcy0d4OBvhbQCT51a
	q0zgve7b1aQrwkMuwk3CE69VK3ya9QDdCjnBf/c=
X-Google-Smtp-Source: APXvYqzqlOWMJMyoH7tmn7IlVzULcGgXz7rRO+0xDJG/yFYtCiRxoNg4+u3Svoi9/NKCPE2++VFRfKAWb4K7KbU7nGE=
X-Received: by 2002:a0c:fe69:: with SMTP id b9mr1738528qvv.206.1574200481881; 
	Tue, 19 Nov 2019 13:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
	<CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
	<CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
	<709581ab-081f-432d-8631-caac81d40a60@Spark>
	<CANNYZj-q73f8hbQbn1wxqjrNhJbvsoefqQyqJtGqLoxrA_2b9Q@mail.gmail.com>
	<CAMKF1spdQG3aXgy3yGUYA0u3adnkAv3BcrEe6PJhCfY-xr59fA@mail.gmail.com>
In-Reply-To: <CAMKF1spdQG3aXgy3yGUYA0u3adnkAv3BcrEe6PJhCfY-xr59fA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 13:54:15 -0800
Message-ID: <CAMKF1soG-p126RUfy1NJ5FvL-W7O8iAyjwJgtnEKYEOVKJDRVQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 21:54:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please update manpages to latest (5.04) that will justify moving to
new location for SRC_URI


On Tue, Nov 19, 2019 at 10:21 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 19, 2019 at 10:14 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I never said they are modifying files in place, I think you misundersto=
od me somehow. 'Archive' in this discussion is a folder on a server with ta=
rballs, not a tarball.
> >
> > Maybe it's easier if I provide clickable links:
> > https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/
> > https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/Archive/
> >
>
> I see that they are still carrying a release from 2013 in
> https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/, I am hoping
> that they do keep the tarballs in this location for long enough. So
> it might not be such a bad thing to move to using it, I was thinking
> the cycle is smaller
>
> > Alex
> >
> > On Tue, 19 Nov 2019 at 19:08, Christopher Larson <kergoth@gmail.com> wr=
ote:
> >>
> >> The whole point of having PV in the filename is ensuring it won=E2=80=
=99t change out from under us. If they=E2=80=99re modifying files in place =
that=E2=80=99s going to cause us headaches whether we pull from archive or =
not due to checksum changes.
> >> On Nov 19, 2019, 9:46 AM -0700, Alexander Kanavin <alex.kanavin@gmail.=
com>, wrote:
> >>
> >> On Tue, 19 Nov 2019 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>>
> >>> If I was asking you to store the tarball some place in arctic then I =
would understand your concern but in this case I am not able to. can you de=
scribe why using archive location is not suitable here perhaps that will he=
lp me
> >>
> >>
> >> The archive location is missing several latest releases of man-pages, =
which are only available from the main location. Which means that we always=
 ship an out of date version of manpages, and aren't aware (via version che=
ck tooling) that later versions exist.
> >>
> >> Alex

