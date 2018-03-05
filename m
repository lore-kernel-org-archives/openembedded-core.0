Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 66DDD78A83
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 16:34:32 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id k79so10840598ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5FIWtWpbd2DCQj6oHruneKuj+ywusQC7UUdjeFBBFmA=;
	b=KoDE2ZPyW0mw1yLBrHg2K5iQRtu38b+1q7cQF8BD+9QBD9nGn2WS7cACG/pZNQZJQK
	LP5devhcYEgA7GEJr3lCch417bGytJACJrzWk5+hbf+gUIWoiQ0UKIoNhgVvsA5GtyF9
	B9kvYxzMv2o8xBxw8KqpwtVE+uhIEcGbrz3WD6i5YkOG/EKqub/0Uq6qaQa/eUKV9T5L
	MNvO1lzZibgZ9UUAz911kj9l8YYKUCHdLBZFntKQEV/ChBoXHeNetI9bvxq42HlZmFMp
	sPi6aZTbgdYaOpfnBpehVD1BL2BeZJ2RcjTfQ8FS542W1eBZGR5U0HuPT3uvIT1ox8mh
	juzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5FIWtWpbd2DCQj6oHruneKuj+ywusQC7UUdjeFBBFmA=;
	b=lD39w5lyMVuseseM+hYpobKJgJOhr4COFZBPYTDVe1PurQmpzdeJ8WzG1P0w/UFxmp
	p1bOFxcOIufylrJQPSBATev+Pgu3IVD+ZsjNG4Ofnxpb59t3UYXoTdieLkiZE2zZ6/85
	b5AODDTDLZgGNVTBli0y7q3xRSuZIPBc2SRla7r3Nj/s6ijzVnm980YvJ4ZAfhNEQIcm
	cmwsYDjcjURn3Rku/oSTh6wCw+xv+CNm3l5ID21p3T8Lkp7SPRVbbjN2Oi1MVCfg6bMY
	u4PTpAiAfW4xwrEL7FVMb19odKwRN8o72n4zny18EZ7EoMHJx8g/gPI3xlwSsxzrh2ow
	Dkow==
X-Gm-Message-State: AElRT7FZS1ITZ/cRngdG5hJDCIgAg1AP8KsOpjF8B6qlj9Uvj/qQ2iTv
	fWRgSM/1tgB0nwq8rM6mpxlyeGuLpfyh07+EpSAroQ==
X-Google-Smtp-Source: AG47ELu2Gfsqw+RvSZLoD8W2gxqQq5lZ6D88Pk9DJyW9J8AYGI18jjT8txGsfPB1wmFni5RNtbxBl2RLunlcfmT66Oo=
X-Received: by 10.36.66.195 with SMTP id i186mr15223745itb.45.1520267674477;
	Mon, 05 Mar 2018 08:34:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 5 Mar 2018 08:34:13 -0800 (PST)
In-Reply-To: <8dcbb503-f0d0-c616-e794-80742dccd78a@gmail.com>
References: <CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com>
	<8dcbb503-f0d0-c616-e794-80742dccd78a@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 16:34:13 +0000
Message-ID: <CAJTo0LYA6HPE4TUEXCWCFwbbM-dUXiYjkwQ22fkvnWvuPkyqCg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gU3ViamVjdDogWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMOKAmTE4?=
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
X-List-Received-Date: Mon, 05 Mar 2018 16:34:33 -0000
Content-Type: multipart/alternative; boundary="001a113b8804b393110566ace64d"

--001a113b8804b393110566ace64d
Content-Type: text/plain; charset="UTF-8"

On 5 March 2018 at 16:30, akuster808 <akuster808@gmail.com> wrote:

>
>    - Performance metrics indicate that a recent merge has caused a
>    slowdown in build times.
>
> Is this data publicly available?
>

https://lists.yoctoproject.org/pipermail/yocto-perf/2018-March/thread.html

The HTML mails are much more readable...

The raw data is in the wiki somewhere but I can't recall where right now.


>
>    - Flood of last-minute upgrades continuing to be reviewed and merged
>    if low-impact.
>
>
> Is there a cut off on package upgrades?
>

Strictly speaking,  weeks ago.  If an upgrade appears safe it might well
sneak in now.

Ross

--001a113b8804b393110566ace64d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 March 2018 at 16:30, akuster808 <span dir=3D"ltr">&lt=
;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <blockquote type=3D"cite"><div class=3D"gmail-m_-1299853748163035768Wor=
dSection1"><ul style=3D"margin-top:0in" type=3D"disc"><li class=3D"MsoNorma=
l" style=3D"color:black;vertical-align:baseline"><span style=3D"font-family=
:Arial,sans-serif">Performance
              metrics indicate that a recent merge has caused a slowdown
              in build times. </span></li>
        </ul>
      </div>
    </blockquote></span>
    Is this data publicly available?</div></blockquote><div><br></div><div>=
<a href=3D"https://lists.yoctoproject.org/pipermail/yocto-perf/2018-March/t=
hread.html">https://lists.yoctoproject.org/pipermail/yocto-perf/2018-March/=
thread.html</a></div><div><br></div><div>The HTML mails are much more reada=
ble...</div><div><br></div><div>The raw data is in the wiki somewhere but I=
 can&#39;t recall where right now.</div><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x"><div bgcolor=3D"#FFFFFF"><span class=3D"gmail-"><blockquote type=3D"cite=
"><div class=3D"gmail-m_-1299853748163035768WordSection1"><ul style=3D"marg=
in-top:0in" type=3D"disc"><li class=3D"MsoNormal" style=3D"color:black;vert=
ical-align:baseline"><span style=3D"font-family:Arial,sans-serif">Flood
              of last-minute upgrades continuing to be reviewed and
              merged if low-impact.</span><br></li>
        </ul>
      </div>
    </blockquote>
    <br></span>
    Is there a cut off on package upgrades?</div></blockquote><div><br></di=
v><div>Strictly speaking, =C2=A0weeks ago.=C2=A0 If an upgrade appears safe=
 it might well sneak in now.</div><div><br></div><div>Ross</div></div></div=
></div>

--001a113b8804b393110566ace64d--
