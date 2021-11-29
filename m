Return-Path: <mohammedaqdam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871DAC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:26:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.63788.1638206759700567633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TaI4gdBF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: mohammedaqdam@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so12958940wmc.2;
        Mon, 29 Nov 2021 09:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dh/fdJtL/85XIGbhf9ADIFIMD82GiXWOlU6AiTcDmqU=;
        b=TaI4gdBFtip0VjPM+je5QL+nQXDBFuYFNpr4HP+r83Zhs/pNCFlS8CZY3gQk1Mta9w
         favA5jI7CmxeAl943lfuJceRj/auCeffatanbZcl8AztDorDTouYADwYc8pbNkBA+yl2
         sP2lhdyJZ4jzzVZFWI5+XEF0kVMDyFyeU0MFhrHmuQRWQa7N490d9fmw5i2iPyo3JPvv
         7J9Xw7fldA9WHEKYDLi+hCNG3nVxSA2TyNsq+I/wNRhgo+PeVGdGhIHmf18HWYWcgIod
         00zhcOrohgrRQSSZZW6fYL8ZvX1u7YZBU0pNLwYo9HOt01WmXLhpJ7KeTJz8C0skikt4
         5JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dh/fdJtL/85XIGbhf9ADIFIMD82GiXWOlU6AiTcDmqU=;
        b=3SS9xBUCeGUD9UKcAnV6JzwZp5C85uj5Z/A1iJYDZrNKUhrjK4q+M3MeQzTxEvEkWd
         XU0utNXnUmzOxlvdheNXR3y3FxWuhndETt7wHzJFQ0q1ntKDTEZQ52jWs9lgo8XO1BIs
         VXwNrt8pcrIHVBJaw/0p8POeTu0LTcGSfJ6sVzS+0mnQ2qn/VcPyzS7X5Nm6Nfh7oTt0
         6BjGDqGzOYBEGu/ynWL21mf9Jv2FKXpGSfLu04usLOD9cPSYmGJuRB+dtvbI9Fw9mMmP
         AXm0IqZYBLZhQfWYkhQ3cfFgup7/UMwJK1nT/SA7dUWIbAC/HMflhpHxdup7B9ZjXrwk
         AEnw==
X-Gm-Message-State: AOAM532KwkHSMmTfT1HXR22YNSF8/acunK8OrhAejJNTWvzbPj4jgIeF
	Cl+Nnkb9mzsa/LVt8VmJgf7ft4nS7T0EsHeYfVE=
X-Google-Smtp-Source: 
 ABdhPJywL/hAD7CYYcKJIKMzsP1ksnjGYA2kfJz0y5qa8UNJzH3Nj5h/awmlUgmaPJ+T3jAPtihdd6if2fhimfyIol0=
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr38798838wmn.153.1638206758147;
 Mon, 29 Nov 2021 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAGsrAHcMZv_H0wa8x9e47tWQOawFhe-s4zy2NN=Or7VteLS12A@mail.gmail.com>
 <a0a691a2-dba2-0a71-e0ef-ffc1a9083aa3@gmail.com>
In-Reply-To: <a0a691a2-dba2-0a71-e0ef-ffc1a9083aa3@gmail.com>
From: mohammed aqdam <mohammedaqdam@gmail.com>
Date: Mon, 29 Nov 2021 22:55:44 +0530
Message-ID: 
 <CAGsrAHft+zosZyQ2CbejwetYW4NVy3NFj4FZ6eRhKQHDo8Lt5g@mail.gmail.com>
Subject: Re: [OE-core] Not able to install chrony on zeus
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-core+help@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e35ae005d1f0bbe4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 17:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158957

--000000000000e35ae005d1f0bbe4
Content-Type: text/plain; charset="UTF-8"

Thanks Khem Raj,

Is it possible to install both?

On Mon, 29 Nov, 2021, 10:46 pm Khem Raj, <raj.khem@gmail.com> wrote:

>
>
> On 11/29/21 4:08 AM, mohammed aqdam wrote:
> > Hi There,
> >
> > I am trying to add chrony/chronyd to my final image
> > using IMAGE_INSTALL_append += " chrony ntp pps-tools "
> >
> > When I run bitbake(bitbake -k imx-image-full), Seeing "packages have
> > unmet dependencies" errors, please check the logs for more information.
> >
> >     Initialising tasks: 100%
> >
>  |###########################################################################################################################|
> >     Time: 0:00:05
> >     Sstate summary: Wanted 9 Found 7 Missed 2 Current 3666 (77% match,
> >     99% complete)
> >     NOTE: Executing Tasks
> >     NOTE: Setscene tasks completed
> >     ERROR: imx-image-full-1.0-r0 do_rootfs: Unable to install packages.
> >     Command
> >
>  '/data/home/maqdam/imx-yocto-bsp_latest/build/tmp/work/imx8mpevk-poky-linux/imx-image-full/1.0-r0/recipe-sysroot-native/usr/bin/apt-get
> >       install --force-yes --allow-unauthenticated --no-remove
> >     android-tools apt autotalks chrony libddsc0 devmem2 dfu-util
> >     dhcp-client dhcp-server dpkg gpsd imx-test ink-app-nets-files-obu
> >     ink-service iperf3 jailhouse libwebsockets15 luxservice net-snmp
> >     net-snmp-client net-snmp-dev net-snmp-libs net-snmp-server
> >     net-snmp-server-snmpd net-snmp-server-snmptrapd net-tools ntp
> >     opencv-apps opencv-samples openvpn packagegroup-base-extended
> >     packagegroup-core-boot packagegroup-core-full-cmdline
> >     packagegroup-core-nfs-server packagegroup-core-ssh-dropbear
> >     packagegroup-core-tools-debug packagegroup-core-tools-profile
> >     packagegroup-core-tools-testapps packagegroup-fsl-gstreamer1.0
> >     packagegroup-fsl-gstreamer1.0-full packagegroup-fsl-optee-imx
> >     packagegroup-fsl-tools-audio packagegroup-fsl-tools-benchmark
> >     packagegroup-fsl-tools-gpu packagegroup-fsl-tools-gpu-external
> >     packagegroup-fsl-tools-testapps packagegroup-imx-isp
> >     packagegroup-imx-ml packagegroup-qt5-imx
> >     packagegroup-tools-bluetooth paho-mqtt paho-mqtt-sn perl
> >     perl-module-data-dumper perl-module-file-copy perl-module-file-spec
> >     perl-module-getopt-std perl-module-io-file perl-module-term-readline
> >     pps-tools psplash python3-opencv rapidjson rtklib run-postinsts
> >     strongswan tcpdump tinydtls usbutils versions weston-init
> >     weston-xwayland xterm' returned 100:
> >     Reading package lists...
> >     Building dependency tree...
> >     Reading state information...
> >     Some packages could not be installed. This may mean that you have
> >     requested an impossible situation or if you are using the unstable
> >     distribution that some required packages have not yet been created
> >     or been moved out of Incoming.
> >     The following information may help to resolve the situation:
> >
> >
> >     *The following packages have unmet dependencies:
> >       chrony : Conflicts: ntp but 4.2.8p15-r0 is to be installed
> >     E: Unable to correct problems, you have held broken packages*.
> >
>
> chrony and ntp packages are in conflict, which means both of them are
> trying to install something that other also installs. So you have to
> decide which one of these two you need.
>
> >
> > I see *ntp_4.2.8p15, *in my source code not *4.2.8p15-r0, *so I tried to
> > rename the bb file to ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb>.*
> > Got errors while accessing the Index of /~ntp/ntp_spool/ntp4/ntp-4.2
> > (udel.edu) <https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/> due
>
> > to missing  ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb> * in list.
> >
> > Kindly let me know if i am missing anything for adding chrony.
> >
> > Thanks,
> > Aqdam
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158938):
> https://lists.openembedded.org/g/openembedded-core/message/158938
> > Mute This Topic: https://lists.openembedded.org/mt/87375915/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000e35ae005d1f0bbe4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks=C2=A0Khem Raj,=C2=A0<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Is it possible to install both?=C2=A0</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 29 Nov, =
2021, 10:46 pm Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 11/29/21 4:08 AM, mohammed aqdam wrote:<br>
&gt; Hi=C2=A0There,<br>
&gt; <br>
&gt; I am trying to add chrony/chronyd to my final image <br>
&gt; using=C2=A0IMAGE_INSTALL_append=C2=A0+=3D &quot; chrony ntp pps-tools =
&quot;<br>
&gt; <br>
&gt; When I run bitbake(bitbake -k imx-image-full), Seeing &quot;packages h=
ave <br>
&gt; unmet dependencies&quot; errors, please check the logs for more inform=
ation.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Initialising tasks: 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0|##################################################=
#########################################################################|<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Time: 0:00:05<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sstate summary: Wanted 9 Found 7 Missed 2 Current 3=
666 (77% match,<br>
&gt;=C2=A0 =C2=A0 =C2=A099% complete)<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Executing Tasks<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOTE: Setscene tasks completed<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: imx-image-full-1.0-r0 do_rootfs: Unable to i=
nstall packages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Command<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/data/home/maqdam/imx-yocto-bsp_latest/build/t=
mp/work/imx8mpevk-poky-linux/imx-image-full/1.0-r0/recipe-sysroot-native/us=
r/bin/apt-get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install --force-yes --allow-unauthenticated =
--no-remove<br>
&gt;=C2=A0 =C2=A0 =C2=A0android-tools apt autotalks chrony libddsc0 devmem2=
 dfu-util<br>
&gt;=C2=A0 =C2=A0 =C2=A0dhcp-client dhcp-server dpkg gpsd imx-test ink-app-=
nets-files-obu<br>
&gt;=C2=A0 =C2=A0 =C2=A0ink-service iperf3 jailhouse libwebsockets15 luxser=
vice net-snmp<br>
&gt;=C2=A0 =C2=A0 =C2=A0net-snmp-client net-snmp-dev net-snmp-libs net-snmp=
-server<br>
&gt;=C2=A0 =C2=A0 =C2=A0net-snmp-server-snmpd net-snmp-server-snmptrapd net=
-tools ntp<br>
&gt;=C2=A0 =C2=A0 =C2=A0opencv-apps opencv-samples openvpn packagegroup-bas=
e-extended<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-core-boot packagegroup-core-full-cmdli=
ne<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-core-nfs-server packagegroup-core-ssh-=
dropbear<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-core-tools-debug packagegroup-core-too=
ls-profile<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-core-tools-testapps packagegroup-fsl-g=
streamer1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-fsl-gstreamer1.0-full packagegroup-fsl=
-optee-imx<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-fsl-tools-audio packagegroup-fsl-tools=
-benchmark<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-fsl-tools-gpu packagegroup-fsl-tools-g=
pu-external<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-fsl-tools-testapps packagegroup-imx-is=
p<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-imx-ml packagegroup-qt5-imx<br>
&gt;=C2=A0 =C2=A0 =C2=A0packagegroup-tools-bluetooth paho-mqtt paho-mqtt-sn=
 perl<br>
&gt;=C2=A0 =C2=A0 =C2=A0perl-module-data-dumper perl-module-file-copy perl-=
module-file-spec<br>
&gt;=C2=A0 =C2=A0 =C2=A0perl-module-getopt-std perl-module-io-file perl-mod=
ule-term-readline<br>
&gt;=C2=A0 =C2=A0 =C2=A0pps-tools psplash python3-opencv rapidjson rtklib r=
un-postinsts<br>
&gt;=C2=A0 =C2=A0 =C2=A0strongswan tcpdump tinydtls usbutils versions westo=
n-init<br>
&gt;=C2=A0 =C2=A0 =C2=A0weston-xwayland xterm&#39; returned 100:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reading package lists...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Building dependency tree...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reading state information...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Some packages could not be installed. This may mean=
 that you have<br>
&gt;=C2=A0 =C2=A0 =C2=A0requested an impossible situation or if you are usi=
ng the unstable<br>
&gt;=C2=A0 =C2=A0 =C2=A0distribution that some required packages have not y=
et been created<br>
&gt;=C2=A0 =C2=A0 =C2=A0or been moved out of Incoming.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The following information may help to resolve the s=
ituation:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*The following packages have unmet dependencies:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chrony : Conflicts: ntp but 4.2.8p15-r0 is t=
o be installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0E: Unable to correct problems, you have held broken=
 packages*.<br>
&gt; <br>
<br>
chrony and ntp packages are in conflict, which means both of them are <br>
trying to install something that other also installs. So you have to <br>
decide which one of these two you need.<br>
<br>
&gt; <br>
&gt; I see *ntp_4.2.8p15, *in my source code not *4.2.8p15-r0, *so I tried =
to <br>
&gt; rename the bb file to ntp_*<a href=3D"http://4.2.8p15-r0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">4.2.8p15-r0.bb</a> &lt;<a href=3D"ht=
tp://4.2.8p15-r0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http:/=
/4.2.8p15-r0.bb</a>&gt;.*<br>
&gt; Got errors while accessing the Index of /~ntp/ntp_spool/ntp4/ntp-4.2 <=
br>
&gt; (<a href=3D"http://udel.edu" rel=3D"noreferrer noreferrer" target=3D"_=
blank">udel.edu</a>) &lt;<a href=3D"https://www.eecis.udel.edu/~ntp/ntp_spo=
ol/ntp4/ntp-4.2/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://w=
ww.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/</a>&gt;=C2=A0due <br>
&gt; to missing=C2=A0 ntp_*<a href=3D"http://4.2.8p15-r0.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">4.2.8p15-r0.bb</a> &lt;<a href=3D"http://=
4.2.8p15-r0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://4.2.=
8p15-r0.bb</a>&gt; *=C2=A0in list.<br>
&gt; <br>
&gt; Kindly let me know if i am missing anything for adding chrony.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Aqdam<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#158938): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/158938" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1589=
38</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87375915=
/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/87375915/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--000000000000e35ae005d1f0bbe4--

