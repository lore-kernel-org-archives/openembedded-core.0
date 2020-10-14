Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.484.1602684325581225213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 07:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ITWWsIsS;
 spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id i12so3522149ota.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YEHcSIeBPOWrYtoHTtXpZmeFRdD2cJY+7dQfxf2BgoY=;
        b=ITWWsIsS25QXdEHbnh95qBbOp0+Hhu4DNw454SFQXfu6XSw3LwRKS/SOuE4tTBKJ4f
         YD/ExUlNR3wjFndyF5kE1a4XPjNGl2kgyR3+ohJPAXfaSZfrSQeBaP5oMXKoxC2tCpz2
         rIdQOYa8Fm55WRXtEf60/TWNY5SzBZjOesTB+oS5GXAqtAdFxrU87JhnAVZYQ9FTAYKY
         edE44DEsXMW2d5RKVfleH77qOoai3F9Nom0265xtveOt/soiuWcv+qU93g3vZo9ZAOV2
         sYBrrL7YB9x2NclZEtSwUlqVvpy2T0Ecdi2QB0PRFQ1JMLVmmcqUGQhG7vh9/rCxaklI
         O8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=YEHcSIeBPOWrYtoHTtXpZmeFRdD2cJY+7dQfxf2BgoY=;
        b=MEFIQ1L3SZVlOZZwMqxha3yuZouAmTptE31ylQoxgT6uP9ymDnzaOneeYEEEKQGAbg
         W4dy2DkRFNISWd/1Ip2AffiubuSGTHe/Dr8nWmwAQUpHKxCgyzqt5MUK96dSAGdMr4Fn
         ZiA1j+uAT1A20Q75KWoftPDPGzCBhadNSb5ZSYfYD384/tXRDkuv/OSt+8cvfb/8TTfA
         HGeah+iQszZt9/cD0vtctQQgPsPfiqW+YQ3e0Eh87oRMB33XQB8cKIWSyHIU5a3NCOn/
         0RSUfOCGyfW5k+xgTpA7fr1CwXo5bM2qVmaVf8DKZiFYgX0sOcdGyEqZu9ywQaijkzvb
         VLlQ==
X-Gm-Message-State: AOAM532k9CEpdh2tSyLDSQUM/9tFJ8RErL8XGmED9W5dChUxPdYauQIs
	UWh1NZ5eruAw04uZuoYfypE=
X-Google-Smtp-Source: ABdhPJxjP+HPYLwj5Wjz4mhMYnE2piSfv1vIoVzRtqeIKH6tecjmAmyVw2NVgDbRXJC8byRTnXrXrA==
X-Received: by 2002:a05:6830:13c5:: with SMTP id e5mr3462913otq.319.1602684323842;
        Wed, 14 Oct 2020 07:05:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:283a:e7e0:f7dd:41c0? ([2601:202:4180:a5c0:283a:e7e0:f7dd:41c0])
        by smtp.gmail.com with ESMTPSA id y23sm1516121ooj.34.2020.10.14.07.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 07:05:22 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] kea: add init scripts
To: Diego Sueiro <Diego.Sueiro@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: nd <nd@arm.com>, Ross Burton <Ross.Burton@arm.com>,
 =?UTF-8?Q?Kamil_Dzie=c5=bcyk?= <Kamil.Dziezyk@arm.com>
References: <20201014050821.25233-1-akuster808@gmail.com>
 <AM6PR08MB34615B96808A64EF05A1024B92050@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <7e320cf5-695e-a575-fd33-d4ee51875295@gmail.com>
Date: Wed, 14 Oct 2020 07:05:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB34615B96808A64EF05A1024B92050@AM6PR08MB3461.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/14/20 12:43 AM, Diego Sueiro wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of akuster via
>> lists.openembedded.org
>> Sent: 14 October 2020 06:08
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] kea: add init scripts
>>
>> [ Yocto # 14074 ]
>>
>> Add init scripts for dhcp4,6 and ddns
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> The keactrl is not working as expected in a core-image-minimal. I'm getting the following
> output for `keactrl status`:
> ```
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCPv4 server: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCPv6 server: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCP DDNS: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> Control Agent: inactive
> Kea DHCPv4 configuration file: /etc/kea/kea-dhcp4.conf
> Kea DHCPv6 configuration file: /etc/kea/kea-dhcp6.conf
> Kea DHCP DDNS configuration file: /etc/kea/kea-dhcp-ddns.conf
> Kea Control Agent configuration file: /etc/kea/kea-ctrl-agent.conf
> keactrl configuration file: /etc/kea/keactrl.conf
> ```
>
> And the dhcp4 server is running ` ps | grep kea-dhcp4`:
> ```
> 773 root     51000 S    /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d
> ```
>
> The problem is that the oe-core busybox does not include the `rev` applet and
> it  doesn't support `ps -p`:
> https://github.com/isc-projects/kea/blob/master/src/bin/keactrl/keactrl.in#L141
>
> We need to build the busybox `rev` and `pgreg` applets and have something like:
> ```
> --- kea-1.7.10.original/src/bin/keactrl/keactrl.in
> +++ kea-1.7.10/src/bin/keactrl/keactrl.in
> @@ -137,8 +137,8 @@
>      # Get the PID from the PID file (if it exists)
>      get_pid_from_file "${proc_name}"
>      if [ ${_pid} -gt 0 ]; then
> -        # Use ps to check if PID is alive
> -        ps -p ${_pid} 1>/dev/null
> +        # Use pgrep and grep to check if PID is alive
> +        pgrep -v 1 | grep ${_pid} 1>/dev/null
>          retcode=$?
>          if [ $retcode -eq 0 ]; then
>              # No error, so PID IS ALIVE

thanks for the feedback. I did not notice those messages.

I got some things to think about.

-armin

> ```
>
> Cheers,
>
> Diego Sueiro
>
>> ---
>> .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
>> .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
>> .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
>> meta/recipes-connectivity/kea/kea_1.7.10.bb   | 13 ++++-
>> 4 files changed, 151 insertions(+), 1 deletion(-)  create mode 100644
>> meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>> create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
>> create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server
>>
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>> b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>> new file mode 100644
>> index 00000000000..fe19179f290
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>> @@ -0,0 +1,46 @@
>> +#!/bin/sh
>> +### BEGIN INIT INFO
>> +# Provides:          kea-dhcp-ddns-server
>> +# Required-Start:    $local_fs $network $remote_fs $syslog
>> +# Required-Stop:     $local_fs $network $remote_fs $syslog
>> +# Default-Start:     2 3 4 5
>> +# Default-Stop:      0 1 6
>> +# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>> +
>> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
>> +DESC="kea-dhcp-ddns-server"
>> +NAME=kea-dhcp-ddns
>> +DAEMON=/usr/sbin/keactrl
>> +DAEMON_ARGS=" -s dhcp_ddns"
>> +
>> +set -e
>> +
>> +# Exit if the package is not installed
>> +[ -x "$DAEMON" ] || exit 0
>> +
>> +# Source function library.
>> +. /etc/init.d/functions
>> +
>> +case "$1" in
>> +  start)
>> +        echo -n "Starting $DESC: "
>> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>> +        echo "done."
>> +        ;;
>> +  stop)
>> +        echo -n "Stopping $DESC: "
>> +        kpid=`pidof $NAME`
>> +        kill $kpid
>> +        echo "done."
>> +        ;;
>> +  restart|force-reload)
>> +        #
>> +        $0 stop
>> +        $0 start
>> +        ;;
>> +  *)
>> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> status is not implemented. The same applies to the other init scripts.
>
>> +        exit 1
>> +        ;;
>> +esac
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>> b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>> new file mode 100644
>> index 00000000000..59128e530d6
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>> @@ -0,0 +1,46 @@
>> +#!/bin/sh
>> +### BEGIN INIT INFO
>> +# Provides:          kea-dhcp4-server
>> +# Required-Start:    $local_fs $network $remote_fs $syslog
>> +# Required-Stop:     $local_fs $network $remote_fs $syslog
>> +# Default-Start:     2 3 4 5
>> +# Default-Stop:      0 1 6
>> +# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>> +
>> +PATH=/sbin:/usr/sbin:/bin:/usr/bin
>> +DESC="kea-dhcp4-server"
>> +NAME=kea-dhcp4
>> +DAEMON=/usr/sbin/keactrl
>> +DAEMON_ARGS=" -s dhcp4"
>> +
>> +set -e
>> +
>> +# Exit if the package is not installed
>> +[ -x "$DAEMON" ] || exit 0
>> +
>> +# Source function library.
>> +. /etc/init.d/functions
>> +
>> +case "$1" in
>> +  start)
>> +        echo -n "Starting $DESC: "
>> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>> +        echo "done."
>> +        ;;
>> +  stop)
>> +        echo -n "Stopping $DESC: "
>> +        kpid=`pidof $NAME`
>> +        kill $kpid
>> +        echo "done."
>> +        ;;
>> +  restart|force-reload)
>> +        #
>> +        $0 stop
>> +        $0 start
>> +        ;;
>> +  *)
>> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
>> +        exit 1
>> +        ;;
>> +esac
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>> b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>> new file mode 100644
>> index 00000000000..e0119d6eb2e
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>> @@ -0,0 +1,47 @@
>> +#!/bin/sh
>> +### BEGIN INIT INFO
>> +# Provides:          kea-dhcp6-server
>> +# Required-Start:    $local_fs $network $remote_fs $syslog
>> +# Required-Stop:     $local_fs $network $remote_fs $syslog
>> +# Default-Start:     2 3 4 5
>> +# Default-Stop:      0 1 6
>> +# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>> +
>> +# PATH should only include /usr/* if it runs after the mountnfs.sh
>> +script PATH=/sbin:/usr/sbin:/bin:/usr/bin
>> +DESC="kea-dhcp6-server"
>> +NAME=kea-dhcp6
>> +DAEMON=/usr/sbin/keactrl
>> +DAEMON_ARGS=" -s dhcp6"
>> +
>> +set -e
>> +
>> +# Exit if the package is not installed
>> +[ -x "$DAEMON" ] || exit 0
>> +
>> +# Source function library.
>> +. /etc/init.d/functions
>> +
>> +case "$1" in
>> +  start)
>> +        echo -n "Starting $DESC: "
>> +        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>> +        echo "done."
>> +        ;;
>> +  stop)
>> +        echo -n "Stopping $DESC: "
>> +        kpid=`pidof $NAME`
>> +        kill $kpid
>> +        echo "done."
>> +        ;;
>> +  restart|force-reload)
>> +        #
>> +        $0 stop
>> +        $0 start
>> +        ;;
>> +  *)
>> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
>> +        exit 1
>> +        ;;
>> +esac
>> diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-
>> connectivity/kea/kea_1.7.10.bb
>> index 2ea4b12758e..15193aeda38 100644
>> --- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
>> +++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
>> @@ -13,11 +13,17 @@ SRC_URI = "\
>>     file://kea-dhcp4.service \
>>     file://kea-dhcp6.service \
>>     file://kea-dhcp-ddns.service \
>> +    file://kea-dhcp4-server \
>> +    file://kea-dhcp6-server \
>> +    file://kea-dhcp-ddns-server \
>>     file://fix-multilib-conflict.patch \  "
>> SRC_URI[sha256sum] =
>> "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
>>
>> -inherit autotools systemd
>> +inherit autotools systemd update-rc.d
>> +
>> +INITSCRIPT_NAME = "kea-dhcp4-server"
>> +INITSCRIPT_PARAMS = "defaults 30"
>>
>> SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-
>> ddns.service"
>> SYSTEMD_AUTO_ENABLE = "disable"
>> @@ -44,8 +50,11 @@ do_configure_prepend() {  }
>>
>> do_install_append() {
>> +    install -d ${D}${sysconfdir}/init.d
>>     install -d ${D}${systemd_system_unitdir}
>> +
>>     install -m 0644 ${WORKDIR}/kea-dhcp*service
>> ${D}${systemd_system_unitdir}
>> +    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
>>     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
>>            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e
>> 's,@SYSCONFDIR@,${sysconfdir},g' \
>>            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
>> @@ -55,6 +64,8 @@ do_install_append() {
>>     rm -rf "${D}${localstatedir}"
>> }
>>
>> +CONFFILES_${PN} = "${sysconfdir}/kea/keactrl.conf"
>> +
>> FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
>> FILES_${PN} += "${libdir}/hooks/*.so"
>>
>> --
>> 2.17.1

