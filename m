Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id B319471DE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:48:21 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w33so102519679qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QCh21PzqutFQBaZOCXeBi4E4CTEl+4bDgBdKjvlnB4w=;
	b=j1zZceTLfV+/VE30FuH/kDaQSU58NkKCZZ8xZbQhxeCbyra5l4dTBNHvf1cwCu/bgv
	YsJ290e+1j7AvkKcSWhjb/9UYcvfArjdde7uVA+jmnO4BpHGunbJP0hPKUVzxFJqy6KH
	VrHDJCwyoj8fWH9lsTAQvXSXRXROW16JorRkwW4UiHL1OFyIGIsrSMv4R3hlJOJzBkzE
	PG4ve5TuZ2mYz1AXanlzDfqkKkcKE9dcs9/JtZ+Q10L3+t02/JkusoNgnyiQQxiPJWej
	tQqOfK9KErXvJDTRC4g8/bLRezSMZ998sbTV5yf+rNYHuwIg1zwn4hD4UW0iqP1nFqca
	qvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QCh21PzqutFQBaZOCXeBi4E4CTEl+4bDgBdKjvlnB4w=;
	b=Sy4ME3whuFP733Z0TB/t96R7o3Tj4TrGH+Eah9o+WUC0S1huQEfUE8fgl002Ay7Sf5
	5cLkE415l6AjpIuPIEM68iX/Raq4H/ZYp0QtFFkNocbDSviPsjBkA6REfOg1+RPLtv1R
	3ItCEfWeJAQkxzsaVLoZiYcnwjZCIMUZIDBll/CXsWNCNNgZKAtpkWYefQ4GQwbgMFM7
	K00BTH6c+iY8nFYu3fWDlmX3Unly7QTYf5qfta4qB6sroOhCkpEpD6adLYRoCToUZQrM
	jKK6SqYEz4qOsRbGgxQ5yoFMDDqs6/xMpDC/G3iHo3yuTeOL0BPzMGhh4Fn/Ta+2jQ+c
	D4uQ==
X-Gm-Message-State: AKaTC01OxEjWnZ4qJDV5RjBD+okyUKgZisiN8FcCBHunhUBu4BoNH2KxzjGL73lfyPLwOKxz+HfTl3DbIuPOXA1C
X-Received: by 10.237.44.161 with SMTP id g30mr85275080qtd.144.1481626102425; 
	Tue, 13 Dec 2016 02:48:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 02:48:02 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612130530170.7395@localhost.localdomain>
References: <alpine.LFD.2.20.1612130530170.7395@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 10:48:02 +0000
Message-ID: <CAJTo0LYOvFxU2R5AkYvb9gf8O5=v56kTjKRFaJcrioLz1QzWeQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why does OE's systemd have a hard dependency on qemu-native?
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
X-List-Received-Date: Tue, 13 Dec 2016 10:48:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848869aff054387f5e9

--94eb2c125848869aff054387f5e9
Content-Type: text/plain; charset=UTF-8

On 13 December 2016 at 10:34, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> DEPENDS = "kmod intltool-native gperf-native acl readline libcap
>    libcgroup qemu-native util-linux"
>              ^^^^^^^^^^^ ?
>
> now, i *am* building for qemuppc for testing, but the above is an
> unconditional dependency on qemu-native. what does systemd need
> qemu-native for?
>
>   right below, we read:
>
>     inherit ... qemu ...
>
> so, again, qemu. yet a bit further down:
>

Using the qemu class means you generally need to depend on qemu-native.

SRC_URI_append_qemuall = "
>  file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
> so now SRC_URI is modified *conditionally* based on qemuall.
>

This is a MACHINE-specific tweak for qemu machines, and unrelated to the
qemu class.

Carry on searching for qemu:

pkg_postinst_udev-hwdb () {
        if test -n "$D"; then
                ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb
--update \
                        --root $D
                chown root:root $D${sysconfdir}/udev/hwdb.bin
        else
                udevadm hwdb --update
        fi
}

There is a rootfs-time postinst that uses qemu-user to run hwdb.

Ross

--94eb2c125848869aff054387f5e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 10:34, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1uj" class=3D"g=
mail-a3s gmail-aXjCH gmail-m158f7c20162da57e">DEPENDS =3D &quot;kmod intlto=
ol-native gperf-native acl readline libcap<br>
=C2=A0 =C2=A0libcgroup qemu-native util-linux&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^ ?<br>
<br>
now, i *am* building for qemuppc for testing, but the above is an<br>
unconditional dependency on qemu-native. what does systemd need<br>
qemu-native for?<br>
<br>
=C2=A0 right below, we read:<br>
<br>
=C2=A0 =C2=A0 inherit ... qemu ...<br>
<br>
so, again, qemu. yet a bit further down:<br></div></blockquote><div><br></d=
iv><div>Using the qemu class means you generally need to depend on qemu-nat=
ive.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1uj" class=3D"g=
mail-a3s gmail-aXjCH gmail-m158f7c20162da57e">
SRC_URI_append_qemuall =3D &quot;<br>
=C2=A0file://0001-core-device.c-<wbr>Change-the-default-device-<wbr>timeout=
-to-2.patch&quot;<br>
<br>
so now SRC_URI is modified *conditionally* based on qemuall.</div></blockqu=
ote></div><br>This is a MACHINE-specific tweak for qemu machines, and unrel=
ated to the qemu class.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Carry on searching for qemu:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">pkg_pos=
tinst_udev-hwdb () {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if test -n &quot;$D&quot;; then</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@qemu_run_binary(d, =
&#39;$D&#39;, &#39;${base_bindir}/udevadm&#39;)} hwdb --update \</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --root $D</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown root:root $D$=
{sysconfdir}/udev/hwdb.bin</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 else</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udevadm hwdb --update</div><div class=3D"gm=
ail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi</div><div class=3D"gmail_extra">}=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">There=
 is a rootfs-time postinst that uses qemu-user to run hwdb.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--94eb2c125848869aff054387f5e9--
