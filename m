Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7BA6B067
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 11:38:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m188so5063032ioa.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fzeqVtZLEqiOQOA0nkelGosqqs8snczJbfUQLBmvskU=;
	b=S2sgg3RCHhnuAKCriW4w9dNDQNaVWMl+7jllp3p0jn0qjsqYZ6PUEo5/ky0yYqEUsl
	QzgBLkY8JTFHLidBYYr36P8H8GaLzJsVnjdGaPtaD69aPinrgHwOLmcUijuBuxfbId17
	VdYaMgNdWX/AvgUjGZni8GDH34oh38wgD+IVNx83ZI4aW2ujhbpBZ9ejltgCXiYFn3dP
	Xd88oZ4r654Ikit/n26Hj4V/5uh5j8gPRZz0YAteWJ+JwMLYHA6SvpJ+Pt+TL9TxotiY
	ArLjK9eWZViJqL1WcNbIocOkipGEGcsSiE4RZvcbREgGhsOTtozkwsKId8b2EIByitMz
	JkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fzeqVtZLEqiOQOA0nkelGosqqs8snczJbfUQLBmvskU=;
	b=IhPRk/dyEFFPyQSENEmjnep2wMhvMKX3UhMnWNj9H0xdWwHPoS1q3197KETfPR1yWZ
	SGZmOdJi1d/qUd+TCJJYUsJ0Y8PEQCsYlVZICoMloXDjtW9wYppvtaL7xdAT1ktOlNPX
	NvYCrFeE0qIkNTFqa1wBvOGshDybAVYunk7AC4sBqLAJewoVp2W3RXuAZUjLqGcQqfhc
	22pI+YVkbe/jqUQV7AV/tzN6/BUOb4oMuo2OCirTgyJv/ksK+BJCvYu5xRX1O7FfWBAM
	xDh8/AlcoeStM2Crox92exedpxyRj+23M5AnzFCwABXoABcFzYZ+GgyvVsyPyEIvL0W8
	0fTA==
X-Gm-Message-State: APjAAAVZaaQt6Fwq2WMzaRuYVZBxOO8SoFe/MXS+EDIQ6G37DXngftqZ
	owN/7DFjxp9SSW5L8Vi/lQcgDCc6cd0D/oC8YYA=
X-Google-Smtp-Source: APXvYqynpBpyVragry7non8CpnrwMYkNGhGcaJffeEb3Q4ugjoqgas3qSzIZnIiNk4KRManCXJF/eSTWEIRwDHEvblk=
X-Received: by 2002:a5e:d505:: with SMTP id e5mr8017683iom.99.1556365126091;
	Sat, 27 Apr 2019 04:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
	<CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
	<CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
	<BC6A3A88-2393-4AD1-8153-1301759A9646@gmail.com>
	<CALbNGRQUmLRMzXmMeLx21x5ZCuj+00EOL5Oo8S2JoVeeYqGfiA@mail.gmail.com>
	<4C482E9C-6F89-40FD-A1AF-3F090BB73C25@gmail.com>
In-Reply-To: <4C482E9C-6F89-40FD-A1AF-3F090BB73C25@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 27 Apr 2019 13:38:34 +0200
Message-ID: <CALbNGRR=3QG4pm2Ak_Kc77=6fR2pT74ZBvZ9S+=W7uWC_xUh1A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Sat, 27 Apr 2019 11:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2019 at 12:51 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Look at the step2d section, the actual error is there. Errors section inc=
ludes only the high level errors.

Thanks - lesson learned :)

Andreas
>
> Alex
>
> > On 27 Apr 2019, at 12.44, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> >
> > On Sat, Apr 27, 2019 at 12:02 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> The build log makes it rather clear?
> >>
> >> configure: error: *** A compiler with support for C++17 language featu=
res is required.
> >>
> >>
> > It is not that I cannot read how about a link?
> >
> > Followed Richard's link
> >
> > and find nothing which helps:
> > ERROR: vte-native-0.56.1-r0 do_configure: configure failed
> > ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
> > do_configure (log file is located at
> > /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/=
x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
> > ERROR: Logfile of failure stored in:
> > /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/=
x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
> > ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/bu=
ild/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
> > failed with exit code '1'
> > ERROR: vte-native-0.56.1-r0 do_configure: configure failed
> > ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
> > do_configure (log file is located at
> > /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/=
x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
> > ERROR: Logfile of failure stored in:
> > /home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/=
x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
> > ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/bu=
ild/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
> > failed with exit code '1'
> > ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
> > DISPLAY=3D:1 oe-selftest --skip-tests
> > distrodata.Distrodata.test_checkpkg
> > buildoptions.SourceMirroring.test_yocto_source_mirror -j 15 failed
> > with exit code 1, see errors above. (1556308938.9: 9403.3)
> >
> > Andreas

