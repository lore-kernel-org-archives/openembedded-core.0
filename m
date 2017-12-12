Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9242D7198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 14:00:31 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id f143so24496881itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LkO7sd5X4fafy6J494mZMtv5A+vCWAeqGNBAVwC8h6E=;
	b=vaYMggVuV1aR+quTGPCAH7fnWPcsmH8Kj+e3J1ozJ0phfXRaKBhweblW0nI8rlb2s1
	UW+WQJeB2rxhCg6RCdPDYnaIzT+LjroWZi6qh1bCilEJ6V77vHlXnfya8BvlyuVoOV89
	eMCExrTXm46xlo5HMjKwPXtwdtSnrxRgpApuQ5fUJ2LWhPALfE9WS/4mud4evClPts4Y
	kS8AIOuN5K18tv22rZZnsAFqjPGatkfBphPpICS+U+mJsaPFdytj3B6VXb3kZ7QQzfWm
	EFlu3SqHlV6/ZYX+X1dE0sh1DL1kvkK1lrh2V6Hpy01kyqhcVWye11o0RAjOJEoSYjtD
	5y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LkO7sd5X4fafy6J494mZMtv5A+vCWAeqGNBAVwC8h6E=;
	b=rp535LYZsPkezhEoMRG5Wq25wEVi9J/k+t7iOt74YffcMVCroHh0wddUxlqkaykqod
	kPrT2P55GFno9hb1ip2gHEThh3QKNwg1EaDfzJQMV0UHn9Jh0XyiFOVvHJOAVwjUCbbG
	n/blfwOXG/Wzi/UbecvdghWCg/2ZyVGawrH6GWKDatkd8xC75XGvGdw/A5dzctsw8d+O
	XFezT0LV6dAuoScsnevFsXFkpORk/LwRKa2zqpI0hYShL7v6CJ82eNPOjB5fD/ef9X9t
	jy/ijLCYXLBWrcLAP+n/ZGNXinuru3A1BORyrTlfI8BDBiBRRWhLmkbw5eHxxSunxT+E
	sZ2g==
X-Gm-Message-State: AKGB3mLUtEE4RezhJI4Vd6egVicMf/lRfnYKkV3B//cO/Qi5kg9Ibma4
	r1g7gEzCQoC+TU5qzgIqPtE7wQ9lvXEVJZAuNzZFKA==
X-Google-Smtp-Source: ACJfBouONxiRFhf3+Jk45DNXYAAaNOsMRPhjRnIp4ALXl2hfZfadJplGYowRVg8stO+VasGSEYK0ayygc3TCKt/CzXw=
X-Received: by 10.107.47.1 with SMTP id j1mr5198968ioo.217.1513087232504; Tue,
	12 Dec 2017 06:00:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 06:00:12 -0800 (PST)
In-Reply-To: <20171212132755.30556-1-stefan@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 14:00:12 +0000
Message-ID: <CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 14:00:31 -0000
Content-Type: multipart/alternative; boundary="001a11377fbc020947056025138c"

--001a11377fbc020947056025138c
Content-Type: text/plain; charset="UTF-8"

On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:

> On some build hosts distros (e.g. Fedora 26) waf tries to be
> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> This obviously is not what we want for 32-bit targets and usually
> fails in the do_package phase:
>   WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
> in any package:
>     /usr/lib64/libgstimxcommon.so.0
>
> Waf knows prefix, bindir and libdir as default options. Explicitly
> pass those three.
>

Obviously not.

ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configure
(log file is located at
/data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
Log data follows:
| DEBUG: Executing shell function do_configure
| waf [commands] [options]
|
| Main commands (example: ./waf build -j4)
|   build    : executes the build
|   clean    : cleans the project
|   configure: configures the project
|   dist     : makes a tarball for redistributing the sources
|   distcheck: checks if the project compiles (tarball from 'dist')
|   distclean: removes the build directory
|   install  : installs the targets on the system
|   list     : lists the targets to execute
|   step     : executes tasks in a step-by-step fashion, for debugging
|   uninstall: removes the targets installed
|   update   : updates the plugins from the *waflib/extras* directory
|
| waf: error: no such option: --bindir

Ross

--001a11377fbc020947056025138c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 December 2017 at 13:27, Stefan Agner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,2=
04);padding-left:1ex">On some build hosts distros (e.g. Fedora 26) waf trie=
s to be<br>
smart about libdir detection and defaults to [EXEC_PREFIX/lib64].<br>
This obviously is not what we want for 32-bit targets and usually<br>
fails in the do_package phase:<br>
=C2=A0 WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 do_package: QA Issu=
e: gstreamer1.0-plugins-imx: Files/directories were installed but not shipp=
ed in any package:<br>
=C2=A0 =C2=A0 /usr/lib64/libgstimxcommon.so.<wbr>0<br>
<br>
Waf knows prefix, bindir and libdir as default options. Explicitly<br>
pass those three.<br></blockquote><div><br></div><div>Obviously not.</div><=
div><br></div><div>ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function faile=
d: do_configure (log file is located at /data/poky-tmp/master/build/work/co=
rei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278)</div><=
div>ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/work/c=
orei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278</div><=
div>Log data follows:</div><div>| DEBUG: Executing shell function do_config=
ure</div><div>| waf [commands] [options]</div><div>|</div><div>| Main comma=
nds (example: ./waf build -j4)</div><div>| =C2=A0 build =C2=A0 =C2=A0: exec=
utes the build</div><div>| =C2=A0 clean =C2=A0 =C2=A0: cleans the project</=
div><div>| =C2=A0 configure: configures the project</div><div>| =C2=A0 dist=
 =C2=A0 =C2=A0 : makes a tarball for redistributing the sources</div><div>|=
 =C2=A0 distcheck: checks if the project compiles (tarball from &#39;dist&#=
39;)</div><div>| =C2=A0 distclean: removes the build directory</div><div>| =
=C2=A0 install =C2=A0: installs the targets on the system</div><div>| =C2=
=A0 list =C2=A0 =C2=A0 : lists the targets to execute</div><div>| =C2=A0 st=
ep =C2=A0 =C2=A0 : executes tasks in a step-by-step fashion, for debugging<=
/div><div>| =C2=A0 uninstall: removes the targets installed</div><div>| =C2=
=A0 update =C2=A0 : updates the plugins from the *waflib/extras* directory<=
/div><div>|</div><div>| waf: error: no such option: --bindir</div><div><br>=
</div><div>Ross=C2=A0</div></div></div></div>

--001a11377fbc020947056025138c--
