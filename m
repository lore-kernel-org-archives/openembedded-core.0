Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C34FC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 19:03:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.65594.1638212581573939901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 11:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OmsXVzC4;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id l8so17670655qtk.6;
        Mon, 29 Nov 2021 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynxyuHZmf2qyR0rZ1EDVIHiTmgba6F92/FsxfKnCgNY=;
        b=OmsXVzC4pYMZBWFy4S8YWKX49nsf4fT/QSDXCRBU+wplMHcy+My+hTa/Eb2te0Yw5R
         c6xRXk94nXdzhGqf3Ssa8JeNQd8VEvofrIrRo+TzPe09KSLACEYyoesQ9xldpKasq6bw
         zlzZoJBgRbsEGDjEM9y5k0Uw2SwEBi6cDBPALruppWgVnLiTaBtlynwhtcYi2BSV/bRy
         CvSc84Cy8TeUC6wriDuHTH84Q4ayH026+7NShBvMRWYyrrdRwsBe0yQPQqc0dHvAPjmf
         R3ZZqhnTX2cAEc0Dd2fQxzSfnFGUsFJUNWBcUH5YFujLlLbAhXzlvFZ44TJPqqSR9od5
         latQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynxyuHZmf2qyR0rZ1EDVIHiTmgba6F92/FsxfKnCgNY=;
        b=D+c4U93XOnxGtorCMVxqtypZ/NsJpVtvRFZvrMjqGhnTZvpc6I804vzqFmV8PjOrLJ
         DMQMTMUh4fKPf8CzdOJHKCjJe7fBEM8kYqx0Pfp7v14hnWi4txEdd854bVY4dcXtUaQR
         Zb52V41Ci+rEnpAraegzkIt62ALVUfSNyVxleUMb+bRZmb2+HysHsbeETC0+jpNJFka9
         1NgXXQSwAe4LtVUVbNNlKwZmJFroT86c6rP4nz5NFUq9xIKGaGETV1TyHsol1sG5RctR
         KN76pngDve5Liu/WK70hfQu8L9LeHj7LiTDoj88NpXAEhT8AAws4ujfjNPZWzQh5ryxl
         1zfw==
X-Gm-Message-State: AOAM530dTu5tZMtwpQ+uCYIhXST6vD/qn5Iqx1v7sQC3PkYT/P/7zHIZ
	tYAJQbx/XS1hoHbbMzs03Ijpi3bF5lOnnQQtmF4=
X-Google-Smtp-Source: 
 ABdhPJymVyCA42dwsf7izA1zuN4D7vFv/Uf/mnpP5gP1MSqhiw3Pyyim0lpdWuWcdmIlgD77tVqDMrnmD2GIBC8+KO4=
X-Received: by 2002:ac8:518e:: with SMTP id
 c14mr36931887qtn.665.1638212580604;
 Mon, 29 Nov 2021 11:03:00 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAGsrAHcMZv_H0wa8x9e47tWQOawFhe-s4zy2NN=Or7VteLS12A@mail.gmail.com>
 <a0a691a2-dba2-0a71-e0ef-ffc1a9083aa3@gmail.com>
 <CAGsrAHft+zosZyQ2CbejwetYW4NVy3NFj4FZ6eRhKQHDo8Lt5g@mail.gmail.com>
In-Reply-To: 
 <CAGsrAHft+zosZyQ2CbejwetYW4NVy3NFj4FZ6eRhKQHDo8Lt5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2021 11:02:34 -0800
Message-ID: 
 <CAMKF1so3tisSD4DK7L5WuyC0FJQZ_+VzY3xf+jknJnbEyrnoRQ@mail.gmail.com>
Subject: Re: [OE-core] Not able to install chrony on zeus
To: mohammed aqdam <mohammedaqdam@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-core+help@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 19:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158958

On Mon, Nov 29, 2021 at 9:25 AM mohammed aqdam <mohammedaqdam@gmail.com> wrote:
>
> Thanks Khem Raj,
>
> Is it possible to install both?
>

maybe if they can be make to coexist perhaps by using update-alternatives etc.

> On Mon, 29 Nov, 2021, 10:46 pm Khem Raj, <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 11/29/21 4:08 AM, mohammed aqdam wrote:
>> > Hi There,
>> >
>> > I am trying to add chrony/chronyd to my final image
>> > using IMAGE_INSTALL_append += " chrony ntp pps-tools "
>> >
>> > When I run bitbake(bitbake -k imx-image-full), Seeing "packages have
>> > unmet dependencies" errors, please check the logs for more information.
>> >
>> >     Initialising tasks: 100%
>> >     |###########################################################################################################################|
>> >     Time: 0:00:05
>> >     Sstate summary: Wanted 9 Found 7 Missed 2 Current 3666 (77% match,
>> >     99% complete)
>> >     NOTE: Executing Tasks
>> >     NOTE: Setscene tasks completed
>> >     ERROR: imx-image-full-1.0-r0 do_rootfs: Unable to install packages.
>> >     Command
>> >     '/data/home/maqdam/imx-yocto-bsp_latest/build/tmp/work/imx8mpevk-poky-linux/imx-image-full/1.0-r0/recipe-sysroot-native/usr/bin/apt-get
>> >       install --force-yes --allow-unauthenticated --no-remove
>> >     android-tools apt autotalks chrony libddsc0 devmem2 dfu-util
>> >     dhcp-client dhcp-server dpkg gpsd imx-test ink-app-nets-files-obu
>> >     ink-service iperf3 jailhouse libwebsockets15 luxservice net-snmp
>> >     net-snmp-client net-snmp-dev net-snmp-libs net-snmp-server
>> >     net-snmp-server-snmpd net-snmp-server-snmptrapd net-tools ntp
>> >     opencv-apps opencv-samples openvpn packagegroup-base-extended
>> >     packagegroup-core-boot packagegroup-core-full-cmdline
>> >     packagegroup-core-nfs-server packagegroup-core-ssh-dropbear
>> >     packagegroup-core-tools-debug packagegroup-core-tools-profile
>> >     packagegroup-core-tools-testapps packagegroup-fsl-gstreamer1.0
>> >     packagegroup-fsl-gstreamer1.0-full packagegroup-fsl-optee-imx
>> >     packagegroup-fsl-tools-audio packagegroup-fsl-tools-benchmark
>> >     packagegroup-fsl-tools-gpu packagegroup-fsl-tools-gpu-external
>> >     packagegroup-fsl-tools-testapps packagegroup-imx-isp
>> >     packagegroup-imx-ml packagegroup-qt5-imx
>> >     packagegroup-tools-bluetooth paho-mqtt paho-mqtt-sn perl
>> >     perl-module-data-dumper perl-module-file-copy perl-module-file-spec
>> >     perl-module-getopt-std perl-module-io-file perl-module-term-readline
>> >     pps-tools psplash python3-opencv rapidjson rtklib run-postinsts
>> >     strongswan tcpdump tinydtls usbutils versions weston-init
>> >     weston-xwayland xterm' returned 100:
>> >     Reading package lists...
>> >     Building dependency tree...
>> >     Reading state information...
>> >     Some packages could not be installed. This may mean that you have
>> >     requested an impossible situation or if you are using the unstable
>> >     distribution that some required packages have not yet been created
>> >     or been moved out of Incoming.
>> >     The following information may help to resolve the situation:
>> >
>> >
>> >     *The following packages have unmet dependencies:
>> >       chrony : Conflicts: ntp but 4.2.8p15-r0 is to be installed
>> >     E: Unable to correct problems, you have held broken packages*.
>> >
>>
>> chrony and ntp packages are in conflict, which means both of them are
>> trying to install something that other also installs. So you have to
>> decide which one of these two you need.
>>
>> >
>> > I see *ntp_4.2.8p15, *in my source code not *4.2.8p15-r0, *so I tried to
>> > rename the bb file to ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb>.*
>> > Got errors while accessing the Index of /~ntp/ntp_spool/ntp4/ntp-4.2
>> > (udel.edu) <https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/> due
>> > to missing  ntp_*4.2.8p15-r0.bb <http://4.2.8p15-r0.bb> * in list.
>> >
>> > Kindly let me know if i am missing anything for adding chrony.
>> >
>> > Thanks,
>> > Aqdam
>> >
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#158938): https://lists.openembedded.org/g/openembedded-core/message/158938
>> > Mute This Topic: https://lists.openembedded.org/mt/87375915/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

