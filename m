Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web08.5010.1618961898990000528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 16:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4] (unknown [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPSA id 4373D1007A7;
	Wed, 21 Apr 2021 08:38:13 +0900 (JST)
Subject: Re: [PATCH v2] seatd: add seatd recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, kl@kl.wtf,
 Simon Ser <contact@emersion.fr>
References: <20210420162259.179433-1-ayaka@soulik.info>
 <CANNYZj9dcq0fsz+zStCiGnMFr_FmcGA-+frMVhwnjzW6ZnH31Q@mail.gmail.com>
 <8cd8leGg45Gxy5RpPo8Qahajr-bTPFM6MlcVSzeWsz-UFPUYn3bdumIRKyM7hjr0rkeQm-CB1qmIqAHShlon7ZbCedWzvBoS6_okd0GqHhY=@emersion.fr>
 <CANNYZj-URUhy_osEObxEHMcLaU-uM0O0Q+ONkD4OUTCPMs4SYw@mail.gmail.com>
From: "Randy Li" <ayaka@soulik.info>
Message-ID: <c11ee73b-1671-e031-e048-40e724ff3b0d@soulik.info>
Date: Wed, 21 Apr 2021 07:38:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj-URUhy_osEObxEHMcLaU-uM0O0Q+ONkD4OUTCPMs4SYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/21/21 3:16 AM, Alexander Kanavin wrote:
> That's fine then but please resend the patch without the erroneous 
> nativesdk-packagegroup tweak.
Oops, my fault, that is a X related issue, I would send a patch later
>
> Alex
>
> On Tue, 20 Apr 2021 at 19:43, Simon Ser <contact@emersion.fr 
> <mailto:contact@emersion.fr>> wrote:
>
>     Additional note: libseat is already mandatory for wlroots.
>
> +}
> +
> +INITSCRIPT_NAME = "seatd"
> +INITSCRIPT_PARAMS = "start 8 5 2 . stop 21 0 1 6 ."

We are all fine with the priority I set here ? Because we need to start 
before weston and should end after weston quit, I choose 8 and 21 here.

Besides, when build for the systemd version, seatd would be an empty 
package.

> +
> +USERADD_PACKAGES = "seatd"
> +
> +GROUPADD_PARAM_seatd = "-r seatd"
