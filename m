Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14883.1795095966231065966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 05:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xqXQrcSy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07D501A170A;
	Thu, 19 Nov 2026 13:46:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D076B60237;
	Thu, 19 Nov 2026 13:46:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B577D11BC0B0C;
	Thu, 19 Nov 2026 14:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795095959; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wEqDTClxb4aW6noikcBjFCWbdvHfdMU4D6GtSZs5PUg=;
	b=xqXQrcSyf5lZz07RJS7aS44eaxIVdD0EileQSPkn08hdfN/pWbo46KVOVtxtnYqsn4jS1/
	F2s80EY0ObToA0eqOniy1tiOCKGwSCSzv+ER4lp8l8QmU/NixZlfefEzlVW0MGLHbWsGJd
	6nWJ9YZ3qqCIE07MUFydrvzHbr48OEelp/VzLS/uWDTti0kHVDR0TOHvxpWpMQJY+G+U8J
	YZvffdPPVcFy4i1EFCaDA7iE3v1EVfwuq1Rxe3U8/U9kw5MoCmhI5AslDDJOTG83TbRmJ+
	bVNogSJ5D+069EKZn5j8F/lHHre6iP2/6vX2YC9poRA7SDTXQgjj9uS0pDlFEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 14:45:57 +0100
Message-Id: <DMZ8EQKIIH8N.3HVUP915JIV7T@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: drop S override
 and fix LIC_FILES_CHKSUM paths
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261118063416.18496-3-jaipaul.cheernam@est.tech>
 <20261118160802.24904-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261118160802.24904-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 13:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250669

On Wed Nov 18, 2026 at 5:08 PM CET, Jaipaul Cheernam wrote:
> S was set to ${UNPACKDIR}, but the sources are unpacked into
> ${UNPACKDIR}/${BP}. This was likely missed in previous cleanups.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the v2.

I believe we have another issue now:

ERROR: gstreamer1.0-plugins-rs-0.15.4-r0 do_compile: Execution of '/srv/pok=
ybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux=
/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_compile.3078309' failed with ex=
it code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemux86-wo=
rld/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.=
4/temp/log.do_compile.3078309
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: Using rust targets from /srv/pokybuild/yocto-worker/qemux86-world/b=
uild/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/rus=
t-targets/
| Error: CliError { error: Some(no matching package named `gstreamer` found
| location searched: directory source `/srv/pokybuild/yocto-worker/qemux86-=
world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.1=
5.4/sources/cargo_home/bitbake` (which is replacing registry `crates-io`)
| required by package `gst-plugin-tutorial v0.15.4 (/srv/pokybuild/yocto-wo=
rker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-p=
lugins-rs/0.15.4/sources/gstreamer1.0-plugins-rs-0.15.4/tutorial)`
| help: packages with similar names: bitreader
|
| note: offline mode (via `--offline`) can sometimes cause surprising resol=
ution failures
| help: if this error is too confusing you may wish to retry without `--off=
line`
|
| Stack backtrace:
|    0: <unknown>
|    1: <unknown>
|    2: <unknown>
|    3: <unknown>
|    4: <unknown>
|    5: <unknown>
|    6: <unknown>
|    7: <unknown>
|    8: <unknown>
|    9: <unknown>
|   10: <unknown>
|   11: <unknown>
|   12: <unknown>
|   13: <unknown>
|   14: __libc_start_call_main
|   15: __libc_start_main@GLIBC_2.2.5
|   16: <unknown>), exit_code: 101 }
| WARNING: /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_compile.3078=
309:159 exit 1 from 'cargo-cbuild cbuild -v --target x86_64-poky-linux-gnu =
--profile=3Drelease --manifest-path=3D/srv/pokybuild/yocto-worker/qemux86-w=
orld/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15=
.4/sources/gstreamer1.0-plugins-rs-0.15.4//Cargo.toml --offline -p gst-plug=
in-audiofx -p gst-plugin-closedcaption -p gst-plugin-fallbackswitch -p gst-=
plugin-file -p gst-plugin-hlssink3 -p gst-plugin-inter -p gst-plugin-isobmf=
f -p gst-plugin-mpegtslive -p gst-plugin-reqwest -p gst-plugin-rtp -p gst-p=
lugin-rtsp -p gst-plugin-threadshare -p gst-plugin-tracers -p gst-plugin-vi=
deofx -p gst-plugin-webp -p gst-plugin-webrtc -p gst-plugin-webrtc-signalli=
ng --destdir /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/image --prefix /usr --=
libdir /usr/lib64 --library-type cdylib'
| WARNING: Backtrace (BB generated script):
| 	#1: cargo_c_do_compile, /srv/pokybuild/yocto-worker/qemux86-world/build/=
build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run=
.do_compile.3078309, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/qemux86-world/build/build/tm=
p/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_comp=
ile.3078309, line 151
| 	#3: main, /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work=
/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_compile.30=
78309, line 218
NOTE: recipe gstreamer1.0-plugins-rs-0.15.4-r0: task do_compile: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openemb=
edded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.4=
.bb:do_compile) failed with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5073

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

