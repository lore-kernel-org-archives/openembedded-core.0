Return-Path: <msundius@sundius.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id BA24A74E41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 22:26:10 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id t1-v6so33826900ott.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 15:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sundius-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=xNYYMi7hV6JcvDEU/bnhqE8HHrpQyJNfqayvqLKILKI=;
	b=FR6XJAOWJzN7os1JW9UYBXedlztpRAJlLtvgK6P5QFt04L50My25+Wqi/wjV3kMjxb
	Vu+Yht4jSk7T8iiBLWCt1pVPxW0qMKZiaoxhML91L+wrSmubOgccUFyKYgMYpS1jaW+y
	X35OyW3waJPHa0l7H+lASU2DICPow7FjC+EJT8jAzgsfS7IUlznRjK6uhCorQmDgEUgJ
	49DH/GV6eG5BHl1fNHF/tBWWqSpIBQU7LefqJVxKeeYGYOlQPqQAWs7T+CF4T7izlcAD
	b6N4yUhQ12L7fgpXsxsB1Hu9mJXqtOGAgMrbS1m5ZTBcmHN+eeVvOb7Mh6xjb9dHrRFH
	6NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xNYYMi7hV6JcvDEU/bnhqE8HHrpQyJNfqayvqLKILKI=;
	b=BSdnimTn2N41S72fGI855wMTENJ6loMc2Wy05haUsxv6mPFCPtmrUBMs9ZJGCj/DNS
	2rzWeMLKWCNZXJkuw83Gd35BLCl/ysnhEuEi/tIlh0Ntvtrxea+YVp0PnK5oXyu7zXdf
	vIvsHts/wYqTEvvYzlGQ0OaSq1TNGSch8G2cMhXeo8dyfwuyp2nkVfRfUZhPGRaKOlqR
	ZRxsNDiCqZ01RtNRu4k6HVgJ8q2nFZl3F7lb2GmYLhdMG/wI+zSU4TfvLQddxrAnVN38
	Vy/LVK1AdzT94OYQ++vsJvfAbgVc2XWcKAHvJ9jSSbuiJgK7bw7o1jMQv/tSn5dOyBzj
	VFag==
X-Gm-Message-State: ALKqPwciHdqgFYR1Ip4Z2h88X9WR4HDscboobwmLkCy4SRrzjH5x4tKQ
	cT3I+UW1tPYXkOAHHP+8S17BN1/Dw3zikZpkI/tXqvTU
X-Google-Smtp-Source: AB8JxZrvH3D1R9wd10XspcXeWBEv8c2ASkmtfnIqpsxCRznOseYDOrveExzYX1AZ1ac8ZnS00MDXA9xfyY7SaLmftbQ=
X-Received: by 2002:a9d:1ec2:: with SMTP id
	n60-v6mr1229426otn.24.1525731971102; 
	Mon, 07 May 2018 15:26:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.47.72 with HTTP; Mon, 7 May 2018 15:26:10 -0700 (PDT)
From: C Michael Sundius <msundius@sundius.com>
Date: Mon, 7 May 2018 18:26:10 -0400
Message-ID: <CAGVhguEEi7uE2HZQoDj_4puDZ+44j5RhJSvsHFCc4cQcobMvxA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: sdk
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
X-List-Received-Date: Mon, 07 May 2018 22:26:10 -0000
Content-Type: multipart/alternative; boundary="00000000000029151c056ba528d4"

--00000000000029151c056ba528d4
Content-Type: text/plain; charset="UTF-8"

Hi All,

I've been scratching my head all day about why I can build my recipe under
bitbake, but whne I try to build w/ the SDK I create w/ bitbake -c
populate_sdk <my-image> it cant find the headers for the libraries that I
depend upon.

somehow when I create the sdk, it does not include the header files for the
dependent libs. I see the .so files in the sysroot, but I don't see any of
the header files.

I don't see any of the headers for libxml2,  or the other libs.. those are
simply standard recipes from yocto.

any thoughts what am i doing wrong?

-----------------------
inherit abc-cmake
inherit pkgconfig
inherit systemd

EXTRA_OECMAKE_append = "\
    -DENABLE_SYSTEMD=ON \
    -DENABLE_API=ON \
    -DENABLE_CONFIG=ON \
    -DENABLE_UNITTEST=ON \
    -DENABLE_TUNCTL=ON \
    -DENABLE_WATCHDOG=ON \
    -DENABLE_AESNI=ON \
    -DFORCE_ALIGNMENT=OFF \
    -DENABLE_TRACE=OFF \
    -DENABLE_TUNING=OFF \
"

EXTRA_OECMAKE_append_abc-dev = " -DENABLE_TRACE=ON"
EXTRA_OECMAKE_append_abc-dbg = " -DENABLE_TUNING=ON"

LIC_FILES_CHKSUM = "file://COPYING;md5=8b5f7a1e89273c8fd243ca57ad73e483"

SRC_URI += "file://myprog.service"
SRC_URI += "file://myprog.conf"

SYSTEMD_SERVICE_${PN} = "myprog.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install_append () {
        #install systemd service file
        install -d ${D}${systemd_system_unitdir}
        install -m 0644 ${WORKDIR}/udpf.service
${D}${systemd_system_unitdir}

        #install tmpfiles.d configuration file
        install -d ${D}${sysconfdir}/tmpfiles.d
        install -m 0644 ${WORKDIR}/udpf.conf ${D}${sysconfdir}/tmpfiles.d/
}


PACKAGES =+ "${PN}-utilities ${PN}-samples ${PN}-conf"

FILES_${PN} += "${sbindir}/dpfd"
FILES_${PN}-dev += "\
    ${sbindir}/segtest \
    ${sbindir}/ttest \
    ${sbindir}/workq \
"
FILES_${PN}-utilities += "${sbindir}/tunctl ${sbindir}/tapctl"
FILES_${PN}-samples += "${datadir}/*"
FILES_${PN}-conf += "${sysconfdir}/dpf/*"

RDEPENDS_${PN}-samples += "python"
DEPENDS = "libxml2 libevent nss systemd concurrencykit netmap"
RDEPENDS_${PN} = "libxml2 libevent nss systemd python-core
kernel-module-tun netmap"
RDEPENDS_${PN} += "libxml2 libevent nss-dev systemd python-core
kernel-module-tun netmap"

--00000000000029151c056ba528d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All, <br><br></div><div>I&#39;ve been scratching m=
y head all day about why I can build my recipe under bitbake, but whne I tr=
y to build w/ the SDK I create w/ bitbake -c populate_sdk &lt;my-image&gt; =
it cant find the headers for the libraries that I depend upon. <br><br></di=
v><div>somehow when I create the sdk, it does not include the header files =
for the dependent libs. I see the .so files in the sysroot, but I don&#39;t=
 see any of the header files. <br><br></div><div>I don&#39;t see any of the=
 headers for libxml2,=C2=A0 or the other libs.. those are simply standard r=
ecipes from yocto.<br></div><div><br></div><div>any thoughts what am i doin=
g wrong?<br><br>-----------------------<br>inherit abc-cmake<br>inherit pkg=
config<br>inherit systemd<br><br>EXTRA_OECMAKE_append =3D &quot;\<br>=C2=A0=
=C2=A0=C2=A0 -DENABLE_SYSTEMD=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_API=3DO=
N \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_CONFIG=3DON \<br>=C2=A0=C2=A0=C2=A0 -DEN=
ABLE_UNITTEST=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_TUNCTL=3DON \<br>=C2=A0=
=C2=A0=C2=A0 -DENABLE_WATCHDOG=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_AESNI=
=3DON \<br>=C2=A0=C2=A0=C2=A0 -DFORCE_ALIGNMENT=3DOFF \<br>=C2=A0=C2=A0=C2=
=A0 -DENABLE_TRACE=3DOFF \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_TUNING=3DOFF \<br=
>&quot;<br><br>EXTRA_OECMAKE_append_abc-dev =3D &quot; -DENABLE_TRACE=3DON&=
quot;<br>EXTRA_OECMAKE_append_abc-dbg =3D &quot; -DENABLE_TUNING=3DON&quot;=
<br><br>LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D8b5f7a1e89273c8fd24=
3ca57ad73e483&quot;<br><br>SRC_URI +=3D &quot;file://myprog.service&quot;<b=
r>SRC_URI +=3D &quot;file://myprog.conf&quot;<br><br>SYSTEMD_SERVICE_${PN} =
=3D &quot;myprog.service&quot;<br>SYSTEMD_AUTO_ENABLE_${PN} =3D &quot;enabl=
e&quot;<br><br>do_install_append () {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 #install systemd service file<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 install -d ${D}${systemd_system_unitdir}<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/udpf.service ${D}${syst=
emd_system_unitdir}<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #inst=
all tmpfiles.d configuration file<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 install -d ${D}${sysconfdir}/tmpfiles.d<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/udpf.conf ${D}${sysconfdir}/t=
mpfiles.d/<br>}<br><br><br>PACKAGES =3D+ &quot;${PN}-utilities ${PN}-sample=
s ${PN}-conf&quot;<br><br>FILES_${PN} +=3D &quot;${sbindir}/dpfd&quot;<br>F=
ILES_${PN}-dev +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/segtest \<br>=
=C2=A0=C2=A0=C2=A0 ${sbindir}/ttest \<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/work=
q \<br>&quot;<br>FILES_${PN}-utilities +=3D &quot;${sbindir}/tunctl ${sbind=
ir}/tapctl&quot;<br>FILES_${PN}-samples +=3D &quot;${datadir}/*&quot;<br>FI=
LES_${PN}-conf +=3D &quot;${sysconfdir}/dpf/*&quot;<br><br>RDEPENDS_${PN}-s=
amples +=3D &quot;python&quot;<br>DEPENDS =3D &quot;libxml2 libevent nss sy=
stemd concurrencykit netmap&quot;<br>RDEPENDS_${PN} =3D &quot;libxml2 libev=
ent nss systemd python-core kernel-module-tun netmap&quot;<br>RDEPENDS_${PN=
} +=3D &quot;libxml2 libevent nss-dev systemd python-core kernel-module-tun=
 netmap&quot;<br><br></div></div>

--00000000000029151c056ba528d4--
