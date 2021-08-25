Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.11780.1629876211371942288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 00:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kJ3zysXa;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id z128so45958020ybc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjX4FpaqupOSpuyEiii3Ie38gZoulpUf9a5HQ58skkM=;
        b=kJ3zysXa+V1+X1gLPkrn/wNwffIV9wcbzrH3cHxWZmvYUih3K0LjqQNFf/jYUGbrdT
         t4o4pkisskovN4yfGxLeRKC4rhh9W3fED0NTRBlB3S1vQwCq6bUIzNEG5bU9YcwU8BPe
         6R5WJb9AkfuzqpIggYMsSRCp09ZT88StUqwJwy+jU663ZVOO9+GwPmcfN0fM79SP7o4Z
         oxleyb27eF6AK4x7rsBO3jmqDuJggwlgGQtBnVKsiZeMwVwLV/2RHV1bUVCxDGbc/0+K
         2cbe7/lTdAInY1nSjoPOF6YhwsWU4IIWbzKyUo+cEoVxAKhCFBITZIznsUSwB1jMD2SK
         7hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjX4FpaqupOSpuyEiii3Ie38gZoulpUf9a5HQ58skkM=;
        b=g1UGPux/f4KBS+g8AE8l74bZrV6cPKbT81dQQwxcdUbtRk7wEjCF476qakkz3TS6sb
         9KkBTwO3s3TiqwqpToJ4qvE2Hh46cHQtEz8/S2Qi4UieVVxrNq79s2MBiVQR5rPtJwpa
         pTc5mg8kKphXBKM/gJ0nDcyDk4jLc26qh8AfdaOHj7tKfdeOggiUdDxkFeiivvVUafQq
         /3vWWuZAuZZWY8eGqY4k6TEB0jcRZICzb8ERV+35TJ0gb6ltPA63v46NjNv1Qv4Xfeu8
         suP02YUMLYE2qIGCCGr7/U80ItNGYmSNIW7WajanE1uaPPnAc5bOOBXuDBVPQYfl1UPh
         kjWg==
X-Gm-Message-State: AOAM532mDZOluim/2WoTKT7l2BEuEi7IGNV4/xetNPm7Aa9svZk7kOze
	kToPvRLErgT/WM61X5u6YUCOyGUV21pYmpUwcnc=
X-Google-Smtp-Source: ABdhPJzTQAbvtrDnpWvOdXTvCMrfqQmELybtKWKpDm1CYQn52+z5NaGeeDgPMaUAMdLTzSB4aJM3r8ph+k4DCgduZIo=
X-Received: by 2002:a25:cd45:: with SMTP id d66mr56276422ybf.74.1629876210574;
 Wed, 25 Aug 2021 00:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWQAWZyiSTQ3r8DiTK2DFuJZZ7hDasAuggfR9shqwz2ioQ@mail.gmail.com>
 <CAFiQ677d90DJCM6m+RgAJ-AieqpoBBY+soHXN-rH_bVP7Vgf6g@mail.gmail.com>
In-Reply-To: <CAFiQ677d90DJCM6m+RgAJ-AieqpoBBY+soHXN-rH_bVP7Vgf6g@mail.gmail.com>
From: "JH" <jupiter.hce@gmail.com>
Date: Wed, 25 Aug 2021 17:22:54 +1000
Message-ID: <CAA=hcWTXVcmu0YkOKeUf9Lo6puztqys=Z_+7i8=jstEdUQVyMQ@mail.gmail.com>
Subject: Re: oFono Version 1.31 ofonod crash
To: Sergei Golubtsov <s.e.golubtsov@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	yocto <yocto@lists.yoctoproject.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sergei,

Thanks for the advice, the latest ofono in oe-core master is 1.32, but
I am in branch Hardknott, so I copied ofono 1.32 from master to my
layer running Hardknott branch, but I could not build ofono 1.32 in
Hardknott:

ERROR: ParseError at
/build/oe-cor/../meta-solar/recipes-connectivity/ofono/ofono_1.32.bb:22:
unparsed line: 'SYSTEMD_SERVICE:${PN} = "ofono.service"'

I used ofono 1.30 and connman 1.37 in Zeus, both worked fine , but
both connman 1.39 and ofono 1.31 failed to work properly in oe-core
Hardknott branch, to narrow down if it is ofono issue or Yocto OE
build or other library issue, I was able to build ofono 1.30 for
Hardknott, I can confirm that ofono 1.30 failed just like the 1.31
stuck at the statement add_serial_device.

................
ofonod[2806]: ../ofono-1.30/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property
ofonod[2806]: ../ofono-1.30/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property
ofonod[2806]: ../ofono-1.30/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property

If I run ofono 1.30 built from Zeus build, the ofonod would pass
missing OFONO_DRIVER property and kept it work:

......
ofonod[3712]: ../ofono-1.30/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property
ofonod[3712]: ../ofono-1.30/plugins/udevng.c:create_modem()
/sys/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb1/1-1
ofonod[3712]: ../ofono-1.30/plugins/udevng.c:create_modem() driver=ubloxqmi
ofonod[3712]: ../ofono-1.30/src/modem.c:ofono_modem_create() name:
(null), type: ubloxqmi
ofonod[3712]: ../ofono-1.30/plugins/udevng.c:setup_ubloxqmi()
/sys/devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb1/1-1
.....

So I don't think it is an oFono issue, but rather an OE Yocto build or
library issue, can anyone run oFono in oe-core Hardknott branch?

Thank you.

Kind regards,

- jupiter



On 8/22/21, Sergei Golubtsov <s.e.golubtsov@gmail.com> wrote:
> Hi jupiter,
>
> Please try to update ofono to the latest release. Seems to be a library
> incompatibility issue or something like that.
>
> Yours sincerely,
> Sergei Golubtsov.
>
>
> On Sat, Aug 21, 2021 at 4:09 AM Jupiter <jupiter.hce@gmail.com> wrote:
>
>> Hi,
>>
>> I build ofono v1.31 from git://git.yoctoproject.org/poky branch
>> hardknott,
>>
>> $ cat meta/recipes-connectivity/ofono/ofono_1.31.bb
>>
>> SUMMARY = "open source telephony"
>> DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux.
>> oFono supports speaking to telephony devices through specific drivers,
>> or with generic AT commands."
>> HOMEPAGE = "http://www.ofono.org"
>> BUGTRACKER = "https://01.org/jira/browse/OF"
>> LICENSE = "GPLv2"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>>
>>
>> file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
>> DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
>>
>> SRC_URI = "\
>>     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>>     file://ofono \
>>     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
>> \
>> "
>> SRC_URI[md5sum] = "1c26340e3c6ed132cc812595081bb3dc"
>> SRC_URI[sha256sum] =
>> "a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"
>>
>> inherit autotools pkgconfig update-rc.d systemd
>> gobject-introspection-data
>>
>> INITSCRIPT_NAME = "ofono"
>> INITSCRIPT_PARAMS = "defaults 22"
>> SYSTEMD_SERVICE_${PN} = "ofono.service"
>>
>> PACKAGECONFIG ??= "\
>>     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}
>> \
>> "
>> PACKAGECONFIG[systemd] =
>> "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
>> PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
>>
>> EXTRA_OECONF += "--enable-test --enable-external-ell"
>>
>> do_install_append() {
>>   install -d ${D}${sysconfdir}/init.d/
>>   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>> }
>>
>> PACKAGES =+ "${PN}-tests"
>>
>> FILES_${PN} += "${systemd_unitdir}"
>> FILES_${PN}-tests = "${libdir}/${BPN}/test"
>>
>> RDEPENDS_${PN} += "dbus"
>> RDEPENDS_${PN}-tests = "\
>>     python3-core \
>>     python3-dbus \
>>     ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
>> 'python3-pygobject', '', d)} \
>> "
>>
>> RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
>>
>> The build was fine, but running the v1.31 ofono.service crashed at
>> udevng.c missing OFONO_DRIVER property, the ofono.service was repeated
>> to be restarted every 6 seconds:
>>
>> .....
>>
>> ofonod[9005]: ../ofono-1.31/plugins/udevng.c:add_serial_device()
>> Device is missing required OFONO_DRIVER property
>> ofonod[9005]: ../ofono-1.31/plugins/udevng.c:add_serial_device()
>> Device is missing required OFONO_DRIVER property
>> ......
>>
>> I am not quite sure if it is ofono 1.31 problem or oe-core
>> ofono_1.31.bb problem, could anyone have a look at and advise? Let me
>> know if you need more debug information.
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - jupiter
>>
>>
>> On 8/20/21, Jupiter <jupiter.hce@gmail.com> wrote:
>> > Hi,
>> >
>> > I upgraded from Zeus to Hardknotte, I was able to run dbus to get
>> > interface properties, but I failed on Hardknotte ofono 1.31. Has
>> > anyone got oFono 1.31 dbus work?
>> >
>> > Thank you.
>> >
>> > Kind regards,
>> >
>> > - jupiter
>> >
>> _______________________________________________
>> ofono mailing list -- ofono@ofono.org
>> To unsubscribe send an email to ofono-leave@ofono.org
>>
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
