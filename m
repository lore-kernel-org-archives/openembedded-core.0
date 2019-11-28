Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 535F17F9F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 12:19:12 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f8so7331827edv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CkPUG4tlTFcnCG6cJHp17krgrmJRK0iK04YObBH/nQo=;
	b=CQaB5N3vGPGu56si+xD12+p6poj1p+Bg0G/+c30ORBqHh16e0s/tOoRtleqI5EMigk
	B4D92dIvo36cmTiq1v+/My8oZt5Udto3KHSTwwNBw0+oCxKdQBzYtA/aweJOZCxMeh31
	QyYySq8jZYs34ms+gVCoRbdHGubaj8jelNEpEwgBR+jASziDFYSPseaqJrfx6F8QFtnm
	gUHpbTlUbO2LHQenzB77dsIRhJkaKeOYo9w+9Y3HyrtHAI218VBgw6ygGJ8NyBJaKMoi
	unuy6cw03JNNJriGtN227hdWfYJBvqHzlDisfDVquOxOxDdx4dyc5ztm5hLTAmwQ70LN
	K99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CkPUG4tlTFcnCG6cJHp17krgrmJRK0iK04YObBH/nQo=;
	b=CxCEhO8TafvcmCDwXEvVRiRXqpcu8nKQOAb5QMBMnbsDwDPgZlT2weZpjKZVLcvTG4
	TrZUay+WpSupCKO8HdKBeHEsUl0/fT+ldDntaN6DL7cIGrNhG/f5gl/o+UYc8tv35uHa
	fGZ1TK+CLaFgf0KTYC2xoM91Lnr8kmkttAo2TLheOwWpoPEoVkMc2YeYjizJ3G3WuQvF
	9TyQFPMC3pSwWg2VN/U1xvnLx1nszrT6bSm69LesH4F3vxu8muTet7gqzrocd+E+/ZYR
	yHNcFlNRcKUM3AWXaJfU9wGkutg/SO3qhO1xRXcCDcNvCs7FTUX81PYLj2XWCxv3GSxk
	YZhA==
X-Gm-Message-State: APjAAAVzOUzBM0tBHFj1SrauxV5ajmROOl5L4GpDtlfU0oliz/i21Pei
	qXUURkI7n5ENInqYlV2si95SOILRfV8hFyHVJJJNFw==
X-Google-Smtp-Source: APXvYqzAE4DmYgKoplVY4upuvmbOK7FbAiGIl3cM0oq+2duDHQr8vPRy5hiQ/TdyzpRh1KCQtE1UETgmI1BUyhDYd+Q=
X-Received: by 2002:a17:906:6403:: with SMTP id
	d3mr55548462ejm.258.1574943552421; 
	Thu, 28 Nov 2019 04:19:12 -0800 (PST)
MIME-Version: 1.0
References: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
In-Reply-To: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 28 Nov 2019 13:19:01 +0100
Message-ID: <CAAfyv36tfnBaF=tG=KaoBx=Yx+xj2FApS7WvwXpyDuq_SAeXSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Jake Withecombe <jake@ruggednetworks.co.uk>
Subject: Re: [meta-oe][PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Thu, 28 Nov 2019 12:19:12 -0000
Content-Type: text/plain; charset="UTF-8"

Ping.

On Thu, Nov 21, 2019 at 4:29 PM Marek Belisko
<marek.belisko@open-nandra.com> wrote:
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
> ---
>  .../janus-gateway/files/janus-gateway.service      | 14 +++++++
>  .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
>  create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
> new file mode 100644
> index 0000000..5b4d4f2
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Janus WebRTC Server
> +After=network.target network-online.target
> +Wants=network-online.target
> +
> +[Service]
> +Type=simple
> +ExecStart=/usr/bin/janus -o
> +Restart=always
> +RestartSec=60
> +LimitNOFILE=65536
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> new file mode 100644
> index 0000000..bca716f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Janus is an open source, general purpose, WebRTC server designed and developed by Meetecho"
> +HOMEPAGE = "https://janus.conf.meetecho.com/"
> +SECTION = "libs/multimedia"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c9e0a79f2244c2f79cda22ea5fed9135"
> +
> +SRC_URI = "https://github.com/meetecho/janus-gateway/archive/v${PV}.tar.gz \
> +          file://janus-gateway.service \
> +"
> +
> +SRC_URI[md5sum] = "b068ac2b40ae800d83f471b8189bc87c"
> +SRC_URI[sha256sum] = "01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +DEPENDS = "libsrtp jansson libconfig libnice openssl glib-2.0 gengetopt-native"
> +
> +PACKAGECONFIG ?= "rest_api rest"
> +#PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
> +#PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
> +#PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
> +PACKAGECONFIG[rest_api] = "--enable-turn-rest-api,--disable-turn-rest-api,curl"
> +PACKAGECONFIG[rest] = "--enable-rest,--disable-rest,libmicrohttpd"
> +PACKAGECONFIG[unix_sockets] = "--enable-unix-sockets,--disable-unix-sockets,"
> +PACKAGECONFIG[post_processing] = "--enable-post-processing,--disable-post-processing,"
> +PACKAGECONFIG[plugin_echo] = "--enable-plugin-echotest,--disable-plugin-echotest,"
> +PACKAGECONFIG[plugin_videocall] = "--enable-plugin-videocall,--disable-plugin-videocall,"
> +PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
> +PACKAGECONFIG[plugin_videoroom] = "--enable-plugin-videoroom,--disable-plugin-videoroom,"
> +PACKAGECONFIG[plugin_voicemail] = "--enable-plugin-voicemail,--disable-plugin-voicemail,"
> +PACKAGECONFIG[plugin_recordplay] = "--enable-plugin-recordplay,--disable-plugin-recordplay,"
> +PACKAGECONFIG[plugin_textroom] = "--enable-plugin-textroom,--disable-plugin-textroom,"
> +
> +FILES_${PN}_append = " ${libdir}/janus/plugins/* ${libdir}/janus/transports/* ${libdir}/janus/events"
> +FILES_${PN}-demo = "${datadir}/janus/*"
> +
> +PACKAGES_append = " ${PN}-demo"
> +
> +INSANE_SKIP_${PN} = "dev-so"
> +
> +SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
> +
> +do_install_append() {
> +       # Install the systemd service so we can kick start on boot
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 644 ${WORKDIR}/janus-gateway.service ${D}${systemd_unitdir}/system/
> +}
> --
> 2.7.4
>

