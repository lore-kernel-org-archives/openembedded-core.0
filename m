Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 718FF7E133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:27:39 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a64so10314777qkg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8bw7JKZE1Oh6v9cpVUKI6J8O2Zf8stiLCbXehxWBRxM=;
	b=k+6uoRaQ47s0G2RyPNqtmGxZX5lM/3hIUR0ijJdJYnkBr/06tTlU62ST5AE33F1u1Z
	9Dg5ikrkthF4xMNLY3mNJvnjwAscu0neSoY2l4B5f3VE+EB8F8YLfg35l43jlmRMuz/5
	EuuC+vvqAVqVPesJzZ0sHk01HGcgdUhn0SjfW3ilbMrqFhlCN5SdHLtQjloB9IzUlZ19
	eU0xJLoQ3kOxkKH9ytyRRdTaHedu1KJmb6jQ1zuCMpcutbPpsnMAQjG5B+g2eeIW9Zs0
	dNsXxi/zmHCflnks7T6tNMe6IWDWvOL8ow8HujUi2stJ6Wukb69wDJmiqLEC+jZaGKJW
	tSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8bw7JKZE1Oh6v9cpVUKI6J8O2Zf8stiLCbXehxWBRxM=;
	b=BzVwkdbnilCeMNs6kkDgBHi0At+Gu9EzDcjbEHsBIzYKxgw2Uz0Dr4NTbcd4WCDkY6
	TywSagye44OmHWQjU8fWTGiQhkFm5zjxqOXKcEPyWZZBRgoR93GJHmTva1a9ClZC5EJi
	+Frz/WJeLnEb7Sna+hpIBgvHCm5dr3NrwzHh1FGRPbub/9xOKjKhhTLJjvRK4DbIImCL
	ZPp/QsfGDFUy0MB1H60OmYjIAQ/rjxoAcDpfgHJGUy3Q7ViJpIYKJjRtMUlLW5FmHUSa
	xw7UP4n9SuVmCIuQXaeKHt6iIKMG/en33YTFuy49WmMlqM1GoEE0CpJcw4K2gdajMndc
	V2Bg==
X-Gm-Message-State: APjAAAXZUch14qUGkh0Iaipe6pHeVgA2yn9Yp1fi1A33NLXb34hq4SwS
	kUDieTRgJ9SXzHmD5CDdS6kuO1guN7qDFOWxUbpdoFqp
X-Google-Smtp-Source: APXvYqza5sC9lyfF1Q+IxcMJP0fepD/RYsi0T/M5/gvcv0PyhmK6KFDhhBeNxcxziaim5QxRcSm56WCqO0MwdxdquAg=
X-Received: by 2002:a37:78d:: with SMTP id 135mr61489984qkh.208.1558416460022; 
	Mon, 20 May 2019 22:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<975c9628-c743-3445-7bfa-d1ced1e9bae2@gmail.com>
	<a9d8f31c-f101-8f9f-e5a0-9015574218f1@windriver.com>
In-Reply-To: <a9d8f31c-f101-8f9f-e5a0-9015574218f1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 22:27:14 -0700
Message-ID: <CAMKF1soGiKT9YEZV9KNAoh+V777NkcGpse4gYQqDM7E3MJ6aVQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
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
X-List-Received-Date: Tue, 21 May 2019 05:27:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 7:55 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/5/21 =E4=B8=8A=E5=8D=882:05, Khem Raj wrote:
> >
> >
> > On 5/20/19 2:46 AM, kai.kang@windriver.com wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Add a configure file for systemd.networkd to configure wired network
> >> interfaces with dhcp. It works with common network interfaces such eth=
0
> >> and eno1.
> >>
> >> [YOCTO #13057]
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   meta/recipes-core/systemd/systemd-conf/dhcp.network | 5 +++++
> >>   meta/recipes-core/systemd/systemd-conf_242.bb       | 3 +++
> >>   2 files changed, 8 insertions(+)
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.netwo=
rk
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network
> >> b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> >> new file mode 100644
> >> index 0000000000..81f36ebaa5
> >> --- /dev/null
> >> +++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
> >> @@ -0,0 +1,5 @@
> >> +[Match]
> >> +Name=3Den* eth*
> >> +
> >> +[Network]
> >> +DHCP=3Dyes
> >> diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb
> >> b/meta/recipes-core/systemd/systemd-conf_242.bb
> >> index 96beea53a7..094f03e195 100644
> >> --- a/meta/recipes-core/systemd/systemd-conf_242.bb
> >> +++ b/meta/recipes-core/systemd/systemd-conf_242.bb
> >> @@ -10,12 +10,14 @@ SRC_URI =3D "\
> >>       file://logind.conf \
> >>       file://system.conf \
> >>       file://system.conf-qemuall \
> >> +    file://dhcp.network \
> >>   "
> >>     do_install() {
> >>       install -D -m0644 ${WORKDIR}/journald.conf
> >> ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
> >>       install -D -m0644 ${WORKDIR}/logind.conf
> >> ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
> >>       install -D -m0644 ${WORKDIR}/system.conf
> >> ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
> >> +    install -D -m0644 ${WORKDIR}/dhcp.network
> >> ${D}${systemd_unitdir}/network/80-dhcp.network
> >>   }
> >>     # Based on change from YP bug 8141, OE commit
> >> 5196d7bacaef1076c361adaa2867be31759c1b52
> >> @@ -29,4 +31,5 @@ FILES_${PN} =3D "\
> >>       ${systemd_unitdir}/journald.conf.d/ \
> >>       ${systemd_unitdir}/logind.conf.d/ \
> >>       ${systemd_unitdir}/system.conf.d/ \
> >> +    ${systemd_unitdir}/network/ \
> >>   "
> >>
> >
> > Please look into
> >
> > https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd
> >
> > this also means we need to enable networkd and resolved for this to wor=
k
> >
>
> I checked the repo you post,
>
> 1) package config 'networkd' and 'resolved' have been involved in
> default package config in systemd_242.bb
>
> 2) I suspect wireless.network is not necessary. Unlike wired network, we
> can't predict the ap name and connect it automatically.
>
> 3) the configure file doesn't work with qemu tap mode. I'll update with i=
t.
>

right your patch failed to set IP for qemux86 on my system.

> 4) Do the configure of section [DHCP] in wired.network necessary?
>
> [DHCP]
> RouteMetric=3D10
> ClientIdentifier=3Dmac
>

yes they work totally fine and also makes sure that IP is not changing
all the time
for phys which happens for so many boards where you get new IP every boot



>
> Thanks.
>
>
> --
> Kai Kang
>

