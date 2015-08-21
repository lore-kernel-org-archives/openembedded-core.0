Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id E2DE173E20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:26:47 +0000 (UTC)
Received: by qkch123 with SMTP id h123so25680892qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/K+IlJrAC7v38Oyx1gcE6RgQSfGiE7GSH9rhTosQraM=;
	b=H+mzbeMt6w6wqLzPsEG66GWrTBgigEpaPji9eeSf2cf9DRRPdSzy46vZcCjwxFkznW
	r2aSDdLgp5Gtibaid1zuuxsbdMfJ/zBQwT40Pi/cy4cdeIG+QOj12ZhPl7JrOTDAXR+t
	7IQ3I+3v6LlbFfhuqwA1IFDY9DQ1+Tqu1lX/cf1G8t95VIs2In8IoELurE8aAfhqjbsy
	mg4uFFiNlKpNBCBjF0pkgBriDWySDmhti5r7alN8/5KuywUiJ/l4+CTJa2I/VC+vZO8E
	bYqYF904ZzqFeOj7crimhWa0qK5N9gtAkJCe3zFUcJ4lo7B/DyJ2ebbENbgmam7xOo7P
	iobQ==
X-Gm-Message-State: ALoCoQlBlgSl8j4SVpa0UnoQ+qrJ6cZGFqfzx+E99B5t08YFFjrDEtYKCCdER8ojUNsIO4IEbGdj
X-Received: by 10.55.221.25 with SMTP id n25mr17275870qki.67.1440163607465;
	Fri, 21 Aug 2015 06:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 06:26:27 -0700 (PDT)
In-Reply-To: <1440144361-16138-1-git-send-email-rongqing.li@windriver.com>
References: <1440144361-16138-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 14:26:27 +0100
Message-ID: <CAJTo0LYOCmMy_5L8qWxSfTveeevZkPZrYAjHMj4r_DViX1H+SQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: fix the check
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
X-List-Received-Date: Fri, 21 Aug 2015 13:26:51 -0000
Content-Type: multipart/alternative; boundary=001a1149b5c43dec64051dd2389f

--001a1149b5c43dec64051dd2389f
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 09:06, <rongqing.li@windriver.com> wrote:

> +       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1"
> ] && grep -q install-python_ext ${S}/tools/perf/Makefile; then
>

So now of course Python gets installed, but not packaged:

ERROR: QA Issue: perf: Files/directories were installed but not shipped in
any package:
  /home
  /home/pokybuild
  /home/pokybuild/yocto-autobuilder
  /home/pokybuild/yocto-autobuilder/yocto-worker
  /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
  /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
[installed-vs-shipped]

Ross

--001a1149b5c43dec64051dd2389f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 August 2015 at 09:06,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7wd" class=3D"a3s=
" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${@perf_=
feature_enabled(&#39;<span class=3D"il">perf</span>-scripting&#39;, 1, 0, d=
)}&quot; =3D &quot;1&quot; ] &amp;&amp; grep -q install-python_ext ${S}/too=
ls/<span class=3D"il">perf</span>/Makefile; then<br></div></blockquote></di=
v><br>So now of course Python gets installed, but not packaged:</div><br>ER=
ROR: QA Issue: perf: Files/directories were installed but not shipped in an=
y package:<br>=C2=A0 /home<br>=C2=A0 /home/pokybuild<br>=C2=A0 /home/pokybu=
ild/yocto-autobuilder<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-wor=
ker<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-pp=
c-lsb<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-=
ppc-lsb/build<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-fsl-ppc-lsb/build/build<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-fsl-ppc-lsb/build/build/tmp<br>=C2=A0 /home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots<br=
>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/=
build/build/tmp/sysroots/x86_64-linux<br>=C2=A0 /home/pokybuild/yocto-autob=
uilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-lin=
ux/usr<br>=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl=
-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib<br>=C2=A0 /home/poky=
build/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sy=
sroots/x86_64-linux/usr/lib/python2.7<br>=C2=A0 /home/pokybuild/yocto-autob=
uilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-lin=
ux/usr/lib/python2.7/site-packages<br>=C2=A0 /home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/=
usr/lib/python2.7/site-packages/perf.so<br>=C2=A0 /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-l=
inux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info<br>Please set =
FILES such that these items are packaged. Alternatively if they are unneede=
d, avoid installing them or delete them within do_install. [installed-vs-sh=
ipped]<div><br></div><div>Ross</div></div>

--001a1149b5c43dec64051dd2389f--
