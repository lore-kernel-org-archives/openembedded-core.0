Return-Path: <mohammedaqdam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E205EC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:09:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.60162.1638187749557146392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 04:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dyuKQ0/8;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: mohammedaqdam@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id s13so36346015wrb.3;
        Mon, 29 Nov 2021 04:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ogG/stlVB9FS1HVOLWP1UrIZYLyaRwd6Jjbaua49DBQ=;
        b=dyuKQ0/8GmEQnbbzBlf5XsLLf0ZmjcyPNzW2PKmZAhSsc1yPiCwmCtMLPuax3LMYaG
         kcacA0f/YdinefGtRD0fV/7lcrw6RzQ9GPekc6dieyRoANGuJR5yBmD0iQ/4kVMFFdXi
         rRlwm19aiqgodcPWFdCruxwqT2YGNKwzd2h18TEeQ398znKsCyiRvHXcqHnBLxUNi+Th
         BJrgnUrWJLjvkiEXgOFRcYUl+pTIXgX1FBBKwZBLYFMchDsElYmGy0T3wLPPfOwzU9mA
         yhFaau98qKOqt/URwy1xwgMEEsWZrMlpv5AhiqDb3TJROMoO357pVhOeqFP5kCH3s9Hw
         a3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ogG/stlVB9FS1HVOLWP1UrIZYLyaRwd6Jjbaua49DBQ=;
        b=hAWlSNYRXX6kThjcA8MVIxZsWiez33V3VhmLKCy27yiV2F1JCUO7BvJ40XyrauS62p
         m7Mr5oV/LQE4YAd9PxicernvTizAPvWF1JejkZgBe4hjOB38JmYOS/saHwCm4Xgb4IwL
         x3AEf+XFPjm5DTNFbIPozuL69zFulTVeqCy6k99L0u7oKuczHeA8UuyomjkSPz2AvUAt
         h4nkkB0DBMu5UiFUIsOxOlS672uKZ2zHs0HzRyABxQG1H+kD3cy5l5eeuVdcwOSuPf/w
         eQXeaBBCtOHXDiI8bKR13T0tPy8yjyBnSIvrko+LjZGshUCNbxrqRtUFmt/eJ4P2d74w
         AgFQ==
X-Gm-Message-State: AOAM532RWinpX8JBvOYg2XULcSWAUjonC8JMxskC+T9HqKAxNO1rp0kT
	5bRrmtkyZT9ZIv+p6p8iMtVAAEcsfUjxuUb7rreu6nVB/2k=
X-Google-Smtp-Source: 
 ABdhPJykWsaziksKsLknjZNP95HGYJenI08DAxV7TfRQAmJh+syqcOUA3e0cD3C3CgCfAcRoTyXlFtzXsqTAvaAAMeU=
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr33307725wrt.31.1638187747541;
 Mon, 29 Nov 2021 04:09:07 -0800 (PST)
MIME-Version: 1.0
From: mohammed aqdam <mohammedaqdam@gmail.com>
Date: Mon, 29 Nov 2021 17:38:56 +0530
Message-ID: 
 <CAGsrAHcMZv_H0wa8x9e47tWQOawFhe-s4zy2NN=Or7VteLS12A@mail.gmail.com>
Subject: Not able to install chrony on zeus
To: openembedded-core@lists.openembedded.org,
	openembedded-core+help@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c4852005d1ec4e95"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 12:09:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158938

--000000000000c4852005d1ec4e95
Content-Type: text/plain; charset="UTF-8"

Hi There,

I am trying to add chrony/chronyd to my final image
using IMAGE_INSTALL_append += " chrony ntp pps-tools "

When I run bitbake(bitbake -k imx-image-full), Seeing "packages have unmet
dependencies" errors, please check the logs for more information.

Initialising tasks: 100%
> |###########################################################################################################################|
> Time: 0:00:05
> Sstate summary: Wanted 9 Found 7 Missed 2 Current 3666 (77% match, 99%
> complete)
> NOTE: Executing Tasks
> NOTE: Setscene tasks completed
> ERROR: imx-image-full-1.0-r0 do_rootfs: Unable to install packages.
> Command
> '/data/home/maqdam/imx-yocto-bsp_latest/build/tmp/work/imx8mpevk-poky-linux/imx-image-full/1.0-r0/recipe-sysroot-native/usr/bin/apt-get
>  install --force-yes --allow-unauthenticated --no-remove android-tools apt
> autotalks chrony libddsc0 devmem2 dfu-util dhcp-client dhcp-server dpkg
> gpsd imx-test ink-app-nets-files-obu ink-service iperf3 jailhouse
> libwebsockets15 luxservice net-snmp net-snmp-client net-snmp-dev
> net-snmp-libs net-snmp-server net-snmp-server-snmpd
> net-snmp-server-snmptrapd net-tools ntp opencv-apps opencv-samples openvpn
> packagegroup-base-extended packagegroup-core-boot
> packagegroup-core-full-cmdline packagegroup-core-nfs-server
> packagegroup-core-ssh-dropbear packagegroup-core-tools-debug
> packagegroup-core-tools-profile packagegroup-core-tools-testapps
> packagegroup-fsl-gstreamer1.0 packagegroup-fsl-gstreamer1.0-full
> packagegroup-fsl-optee-imx packagegroup-fsl-tools-audio
> packagegroup-fsl-tools-benchmark packagegroup-fsl-tools-gpu
> packagegroup-fsl-tools-gpu-external packagegroup-fsl-tools-testapps
> packagegroup-imx-isp packagegroup-imx-ml packagegroup-qt5-imx
> packagegroup-tools-bluetooth paho-mqtt paho-mqtt-sn perl
> perl-module-data-dumper perl-module-file-copy perl-module-file-spec
> perl-module-getopt-std perl-module-io-file perl-module-term-readline
> pps-tools psplash python3-opencv rapidjson rtklib run-postinsts strongswan
> tcpdump tinydtls usbutils versions weston-init weston-xwayland xterm'
> returned 100:
> Reading package lists...
> Building dependency tree...
> Reading state information...
> Some packages could not be installed. This may mean that you have
> requested an impossible situation or if you are using the unstable
> distribution that some required packages have not yet been created
> or been moved out of Incoming.
> The following information may help to resolve the situation:


>
>
> *The following packages have unmet dependencies: chrony : Conflicts: ntp
> but 4.2.8p15-r0 is to be installedE: Unable to correct problems, you have
> held broken packages*.
>

I see *ntp_4.2.8p15, *in my source code not *4.2.8p15-r0, *so I tried to
rename the bb file to ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb>.*
Got errors while accessing the Index of /~ntp/ntp_spool/ntp4/ntp-4.2
(udel.edu) <https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/> due to
missing  ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb> * in list.

Kindly let me know if i am missing anything for adding chrony.

Thanks,
Aqdam

--000000000000c4852005d1ec4e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0There,<br><div><br></div><div>I am trying to add c=
hrony/chronyd to my final image using=C2=A0IMAGE_INSTALL_append=C2=A0+=3D &=
quot; chrony ntp pps-tools &quot;</div><div><br></div><div>When I run bitba=
ke(bitbake -k imx-image-full), Seeing &quot;packages have unmet dependencie=
s&quot; errors, please check the logs for more information.</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Initialising tasks: =
100% |#####################################################################=
######################################################| Time: 0:00:05<br>Ss=
tate summary: Wanted 9 Found 7 Missed 2 Current 3666 (77% match, 99% comple=
te)<br>NOTE: Executing Tasks<br>NOTE: Setscene tasks completed<br>ERROR: im=
x-image-full-1.0-r0 do_rootfs: Unable to install packages. Command &#39;/da=
ta/home/maqdam/imx-yocto-bsp_latest/build/tmp/work/imx8mpevk-poky-linux/imx=
-image-full/1.0-r0/recipe-sysroot-native/usr/bin/apt-get =C2=A0install --fo=
rce-yes --allow-unauthenticated --no-remove android-tools apt autotalks chr=
ony libddsc0 devmem2 dfu-util dhcp-client dhcp-server dpkg gpsd imx-test in=
k-app-nets-files-obu ink-service iperf3 jailhouse libwebsockets15 luxservic=
e net-snmp net-snmp-client net-snmp-dev net-snmp-libs net-snmp-server net-s=
nmp-server-snmpd net-snmp-server-snmptrapd net-tools ntp opencv-apps opencv=
-samples openvpn packagegroup-base-extended packagegroup-core-boot packageg=
roup-core-full-cmdline packagegroup-core-nfs-server packagegroup-core-ssh-d=
ropbear packagegroup-core-tools-debug packagegroup-core-tools-profile packa=
gegroup-core-tools-testapps packagegroup-fsl-gstreamer1.0 packagegroup-fsl-=
gstreamer1.0-full packagegroup-fsl-optee-imx packagegroup-fsl-tools-audio p=
ackagegroup-fsl-tools-benchmark packagegroup-fsl-tools-gpu packagegroup-fsl=
-tools-gpu-external packagegroup-fsl-tools-testapps packagegroup-imx-isp pa=
ckagegroup-imx-ml packagegroup-qt5-imx packagegroup-tools-bluetooth paho-mq=
tt paho-mqtt-sn perl perl-module-data-dumper perl-module-file-copy perl-mod=
ule-file-spec perl-module-getopt-std perl-module-io-file perl-module-term-r=
eadline pps-tools psplash python3-opencv rapidjson rtklib run-postinsts str=
ongswan tcpdump tinydtls usbutils versions weston-init weston-xwayland xter=
m&#39; returned 100:<br>Reading package lists...<br>Building dependency tre=
e...<br>Reading state information...<br>Some packages could not be installe=
d. This may mean that you have<br>requested an impossible situation or if y=
ou are using the unstable<br>distribution that some required packages have =
not yet been created<br>or been moved out of Incoming.<br>The following inf=
ormation may help to resolve the situation:</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0<br><b>The following packages have u=
nmet dependencies:<br>=C2=A0chrony : Conflicts: ntp but 4.2.8p15-r0 is to b=
e installed<br>E: Unable to correct problems, you have held broken packages=
</b>.<br></blockquote><div><br></div><div>I see <b>ntp_4.2.8p15, </b>in my =
source code not=C2=A0<b>4.2.8p15-r0, </b>so I tried to rename the bb file t=
o ntp_<b><a href=3D"http://4.2.8p15-r0.bb">4.2.8p15-r0.bb</a>.</b></div><di=
v>Got errors while accessing the=C2=A0<a href=3D"https://www.eecis.udel.edu=
/~ntp/ntp_spool/ntp4/ntp-4.2/">Index of /~ntp/ntp_spool/ntp4/ntp-4.2 (udel.=
edu)</a>=C2=A0due to missing=C2=A0 ntp_<b><a href=3D"http://4.2.8p15-r0.bb"=
>4.2.8p15-r0.bb</a>=C2=A0</b>=C2=A0in list.</div><div><br></div><div>Kindly=
 let me know if i am missing anything for adding chrony.</div><div><br></di=
v><div>Thanks,</div><div>Aqdam</div><div><br></div></div>

--000000000000c4852005d1ec4e95--

