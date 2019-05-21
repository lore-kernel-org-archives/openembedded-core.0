Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9362A7E172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:41:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p2so13420526iol.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pXoDfiNcuFIBlGuW+iyD3B0fcpC07ibe3CaAAprkEoo=;
	b=LQBR5UTDzng2ANnzCzt96BOJThwpZYeQfht+4e/EP7c+2cnCzQrc/58GWMyv/ECHvT
	qBejtPpwAsgA3UguM3UKxuW/Mb5XInTirVBJi2rIKseYKKdWFfaUp/4IwWSocVO3smQo
	x6U38hNT69+m4zL3Ts1Pj8/QSZHqmZgSt/2UAX+yWE9U+0KDbRrfKPx/XFNoPeTTPBs1
	QHBNkhXhVlaTDLpOMVxrxFvKBXLeWS2EP82gmaGd2Gnf2Qbl8ylWF7sMzfmYkR2Xul+N
	nyUUqylIH6TsyWObM3emIZ5pncE6H64GTATDSfj2Y7DgDqQiYojBL1IjP/x1vt11eb0R
	U7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pXoDfiNcuFIBlGuW+iyD3B0fcpC07ibe3CaAAprkEoo=;
	b=gWOLXbmg7x+K8Lublf6G6aSLjmN+YpgmVsNlqg7gGzk/g7lWF1LTNarvdyoX0YJzP2
	8zocth4+URsocGPlxvgUVOWs30KM8le/XTQXWSsMJVX3xSeQQkDdCWOhu6og6o1PfGxm
	BY7TOr7Pq+Ovxor3/oZoxm2qujZ1s8gnavg/qT18Wygt+W1bwQo0G6/BIZ8cMmABFw4M
	wZPfaNYQW/EDHma0KSe9RF+P85X9LbPdYIXydc+uym3mD8kMuT6t9k/ijEaXupTKLBdY
	ddBEdgN3yB0e1t+kI6rpFdFo+qMEA9+wQ0NiHOO1jwFYM5TGBpKf9mBhK135vEuJn3Le
	rFUw==
X-Gm-Message-State: APjAAAWooo37ihmk1+lGoOX/i/OKdS9UaLVESL7OewWTGXBZdhUZ4/VJ
	T0/60yA9k73YFB8ZNeX94mZugNGsBH573++zRe4=
X-Google-Smtp-Source: APXvYqxaqPxN72zxgqyoBMMp03eaeWEeIqnqZt29GSJ8XbXriz0noJphuOT2RItGaK5xG3JTi7oetvFUnG/lEaK+FeQ=
X-Received: by 2002:a05:6602:214f:: with SMTP id
	y15mr8742942ioy.102.1558431699696; 
	Tue, 21 May 2019 02:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
	<135a9bc7-29ac-7b7c-c005-8b679f724414@windriver.com>
	<CAO5Uq5QjL0sy4SeMc1AemLmLGVuQ4OC+gSM_0cWQXeStEvkjkQ@mail.gmail.com>
	<22a8d6a6-1644-0d69-72d8-f4c09224160f@windriver.com>
In-Reply-To: <22a8d6a6-1644-0d69-72d8-f4c09224160f@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 21 May 2019 10:41:25 +0100
Message-ID: <CAO5Uq5Q43E3Bi25pOw_PSmftaNUXEKWeQRdEvOA2z6QbnQ+C5A@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: paul.eggleton@linux.intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 09:41:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 6:04 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/5/21 =E4=B8=8B=E5=8D=8812:49, Alex Kiernan wrote:
> > On Tue, May 21, 2019 at 2:34 AM Kang Kai <Kai.Kang@windriver.com> wrote=
:
> >> On 2019/5/21 =E4=B8=8A=E5=8D=881:45, Alex Kiernan wrote:
> >>> On Mon, May 20, 2019 at 10:47 AM <kai.kang@windriver.com> wrote:
> >>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>
> >>>> Add a configure file for systemd.networkd to configure wired network
> >>>> interfaces with dhcp. It works with common network interfaces such e=
th0
> >>>> and eno1.
> >>>>
> >>>> [YOCTO #13057]
> >>>>
> >>> I'm really not convinced about this - yes it's initially surprising,
> >>> but should base packages have this kind of assumptions/policy baked
> >>> into them?
> >> I have considered whether systemd or systemd-conf should contain such
> >> configure file. Compare to Fedora and Debian,
> >> no such kind of pre-configured network setting provided by systemd, so=
 I
> >> added the configure file to systemd-config.
> >>
> >> If systemd should be preferred, I'll update in v2.
> >>
> > No, systemd-conf is the right place for it, since this is machine
> > specific configuration. My question is really if this piece of
> > configuration should exist at all in OE-Core; but I'm not totally
> > opposed to it.
> >
> > I could live with the kind of construction in meta-yoe (but with the
> > files added to systemd-conf as you already have)
>
>
> The original requirement is from [Bug 13057 - No default network
> configuration for systemd-networkd ] which blocks to make systemd as
> default init manager. If add this to meta-yoe, it still no working
> network if no connman/networkmanager installed(but this is same as
> Fedora 29 and Debian 9).
>

I guess it's the requirement I'm questioning, equally you've got it
systemd-conf, which is explicitly machine specific and so I'd struggle
to say it shouldn't go in.


--
Alex Kiernan

