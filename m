Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id E399B77E7A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 10:33:45 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id s15so274841uag.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MGr9U20a1ZW0/sh72KXdIBEGI/5KO8KRLX8HGisLvH0=;
	b=aiW9ezDNO4/cu0HHTOD0NQ26WOd058DsMETFRZNHnlalMSiSNtAZ0+wAgpfhLRQXL5
	m1tEsCYffRBmvL+7dB9svopiWWVuJnMoBo6vKyFT8/XihXJrdL7s5l9Qh2rdvJn9njOJ
	T1yXU795bGUJg5NIfvFWwlVJVjCIWZ6wJ39GH0X7pUhNWllxwW+Vw1rrjE1KusoTQzeD
	hNiSYPJtHLGvpep2745m7zFMi37ZDJj7qLrlUJ8NfRldckJOPCS9pgcSP8Hf3d03pakR
	DhirhRLLNnJyWSO3mV/In4WjhOh3SkEyF6ULWk5nskzkHHYzGdZ0f4J8qUrVvOvG0+u0
	y1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MGr9U20a1ZW0/sh72KXdIBEGI/5KO8KRLX8HGisLvH0=;
	b=bF2eIbHyv+VGYuGNhOSBBAUnVToggiP5T2OpM0AGcB7nHvdaS8RP8LbludcjJ4y5KW
	o5n0V51H850J/NrZkpZcl6MhDDEEs4pQK/oLrcYVDzihOIfKN/Ea0XxokIs5lK9+aqLw
	sGmYXzNxouf4Sx2x+pBN7++plsM/K2V8JRwxtbVTgSU+oZOAmpGc1/2R+hYDWHHUtUfL
	s2Kni8O2kjk68Og2oDyxGjmaFB4ek89opsPgLNv49vWieu1MuNwtQpXYS8m+vueuavfe
	DhiKEvBnRdvMK7Vy6ucrW1kBoBU/Ks3/Aua81D6iozYVPwyBrlPwCdChdZbKZlKCOCAb
	/0Eg==
X-Gm-Message-State: AHPjjUiDi4+eReMYw7H9lQ+FiGIcKxonvmuwbrYBi7vBJrMZE0SBOP16
	0C/dEsKhNTfq6XTwK8sBvxA/u3/qrQ==
X-Google-Smtp-Source: ADKCNb7KlcpvO6m3TydPTk1F58mfo2M+bm2OKMVHAeICRBlwW4Ns8mk5dlHuSXmlmphAvU1lOQvXmhQObRYtFNXMmFU=
X-Received: by 10.176.64.162 with SMTP id i31mr10829uad.60.1504521225371; Mon,
	04 Sep 2017 03:33:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.93.42 with HTTP; Mon, 4 Sep 2017 03:33:44 -0700 (PDT)
In-Reply-To: <CAHiDW_FXX2od__qC-mN=Z_yb2HGy_XCQrnBEqQv-pq7P-aHdwg@mail.gmail.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
	<38789a200c02167a293e7b7d51e0f2ac0ce0da21.1503923683.git.jussi.kukkonen@intel.com>
	<CAC+thW1+RRE8E6KguaGXhs=Hi+P6mp3X++nNYAs-U4S13TL7yQ@mail.gmail.com>
	<CAHiDW_FXX2od__qC-mN=Z_yb2HGy_XCQrnBEqQv-pq7P-aHdwg@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 4 Sep 2017 12:33:44 +0200
Message-ID: <CAC+thW3fUyuJZWaxjfsdPpwjKubO3MB5NfUWTpOz6XapwYWKfQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mesa: Support building without opengl
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
X-List-Received-Date: Mon, 04 Sep 2017 10:33:46 -0000
Content-Type: multipart/alternative; boundary="94eb2c122c5032068305585aa5fd"

--94eb2c122c5032068305585aa5fd
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 10:15 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 4 September 2017 at 10:49, Andrea Galbusera <gizero@gmail.com> wrote:
>
>> | configure: error: GLX cannot be built without OpenGL
>> | NOTE: The following config.log files may provide further information.
>> | NOTE: /home/gizero/work/smartliving/distro/repo-master/build-poky/
>> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_
>> 17.1.7-r0/build/config.log
>> | ERROR: configure failed
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_configure (log file is located at
>> /home/gizero/work/smartliving/distro/repo-master/build-poky/
>> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-gl/2_
>> 17.1.7-r0/temp/log.do_configu
>> re.1391)
>> ERROR: Task (/home/gizero/work/smartliving/distro/repo-master/build-
>> poky/conf/../../layers/poky/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb:
>> do_configure) failed with exit code '1'
>>
>> This doesn't seem to be related to the bbappend for mesa-gl that is
>> present in meta-raspberrypi, which merely appends "gbm" to PACKAGECONFIG
>> for rpi machines (bitbake still complains with this removed). Instead,
>> reverting this commit takes the build back to green light.
>>
>
> Sorry, I must have not tested mesa-gl with the version of the patch that I
> sent. Sending a fix after a quick test (mesa-gl seems to be missing
> "opengl" from PACKAGECONFIG).
>

Positively build tested the patch you just sent: it fixes it! Thanks!

--94eb2c122c5032068305585aa5fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Sep 4, 2017 at 10:15 AM, Jussi Kukkonen <span dir=
=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">=
jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><span class=3D""><div class=3D"gmail_extra"><div class=3D"gmail_quote">On=
 4 September 2017 at 10:49, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gizero@gmail.com" target=3D"_blank">gizero@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div cla=
ss=3D"gmail_extra">| configure: error: GLX cannot be built without OpenGL<b=
r>| NOTE: The following config.log files may provide further information.<b=
r>| NOTE: /home/gizero/work/smartliving/<wbr>distro/repo-master/build-poky/=
<wbr>tmp/work/cortexa7hf-neon-vfpv4<wbr>-poky-linux-gnueabi/mesa-gl/2_<wbr>=
17.1.7-r0/build/config.log<br>| ERROR: configure failed<br>| WARNING: exit =
code 1 from a shell command.<br>| ERROR: Function failed: do_configure (log=
 file is located at /home/gizero/work/smartliving/<wbr>distro/repo-master/b=
uild-poky/<wbr>tmp/work/cortexa7hf-neon-vfpv4<wbr>-poky-linux-gnueabi/mesa-=
gl/2_<wbr>17.1.7-r0/temp/log.do_configu<br>re.1391)<br>ERROR: Task (/home/g=
izero/work/smartliving<wbr>/distro/repo-master/build-<wbr>poky/conf/../../l=
ayers/poky/<wbr>meta/recipes-graphics/mesa/<wbr>mesa-gl_17.1.7.bb:do_<wbr>c=
onfigure) failed with exit code &#39;1&#39;<br></div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">This doesn&#39;t seem to be relat=
ed to the bbappend for mesa-gl that is present in meta-raspberrypi, which m=
erely appends &quot;gbm&quot; to PACKAGECONFIG for rpi machines (bitbake st=
ill complains with this removed). Instead, reverting this commit takes the =
build back to green light.</div></div></div></blockquote><div>=C2=A0</div><=
/div></div></span><div class=3D"gmail_extra">Sorry, I must have not tested =
mesa-gl with the version of the patch that I sent. Sending a fix after a qu=
ick test (mesa-gl seems to be missing &quot;opengl&quot; from PACKAGECONFIG=
).</div></div></blockquote><div><br></div><div>Positively build tested the =
patch you just sent: it fixes it! Thanks!<br></div></div><br></div></div>

--94eb2c122c5032068305585aa5fd--
