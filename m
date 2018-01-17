Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0D5478766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 21:43:54 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 196so11044137iti.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Ls8P1DAYLtILfOl5JvTSYhieJkGln0CvrWMDZq15X0=;
	b=id86j7IRQzGAn1H5ajie8eitI1zehw7SNSzPbcEnNC7e3V1q6xF741V7FXSjf6K0la
	lo6lIt7A6zCE1xOFAKydKWCpoWpft0Csi5192mEAKxO274B5d+dmbRsO4flW9XX4Z2Xh
	zFf1dK6y7KN71lSPgsYSfFIXfUutJzuRj84/9WAndrQGX8ruhO3rkCrAZ0s/H6rxtRqS
	5d2PMeZ9AzswwPPbFXo5fSH0OYDBW8WnZX6mT79TTqks+dqHgBKS5BY33OGNg8zbfiok
	CWlVyspv4azqXLQanMSjt2ATw80JRfKJ/w4JTRf1Oy1ovxG/eSHohx6F0YK3lqwJLiC5
	TX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Ls8P1DAYLtILfOl5JvTSYhieJkGln0CvrWMDZq15X0=;
	b=temqf79N1CBcIKRTMokb7G0dMZK2i1niR58dqc59IL5vUGy+ftq291XGwENGV2uf5E
	sB/Cj24EKma/076scH3uafKNcOW2Oo7UIwYbU20MdFJJ5BwzzKn0Vr0ofwaj5pSnmIX1
	0jRbBmDqsd2HAvX8aSOCcjYCjEY8V3wTyYZ9ZPZ/bvhlOC7hJltXGoDNPRiv9HfvbsDM
	DUmqH76Atu0CNMVLPlDrBZuez3JL6bE6NmEE8bKReOhpiNojzkUVDfUw5ihAw7iYVX3/
	Vnpf/9sZqmNT10/R7xMNsvgaS5ZWFQUDIIenGC/lCOzaChePYe1KwyErNXEG9Ijiiwrd
	UpYA==
X-Gm-Message-State: AKwxytcwMXpCH/jH6C1n8zrBedNwvImspnG7ER4sHzSvnla21Hqv9Hol
	iUvOOnz4eOu4PHSdcX7CzfUO0eQXyan7vYmhyrkbFw==
X-Google-Smtp-Source: ACJfBovcPteCRTRxG0DNr7wonZWrep3/ND9kaDdrasytbVX/0VbXz6L4YNb7nPZ+fl6nSnBUnl5cfQAs+yEXG01Adoo=
X-Received: by 10.36.215.69 with SMTP id y66mr24235663itg.10.1516225435543;
	Wed, 17 Jan 2018 13:43:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 13:43:35 -0800 (PST)
In-Reply-To: <59b242ee-84fa-72b7-6335-5238c6d8b3cd@windriver.com>
References: <20180116132559.27794-1-ross.burton@intel.com>
	<CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
	<59b242ee-84fa-72b7-6335-5238c6d8b3cd@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 21:43:35 +0000
Message-ID: <CAJTo0LaJqU9Q4AZ_GELbaZtHWBsZ6+M-nhNM-BVhLYd6M3oBcw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Wed, 17 Jan 2018 21:43:54 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc447c415e0562ffbecb"

--94eb2c0afc447c415e0562ffbecb
Content-Type: text/plain; charset="UTF-8"

On 17 January 2018 at 20:57, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2018-01-17 11:18 AM, Otavio Salvador wrote:
>
>> On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton <ross.burton@intel.com>
>> wrote:
>>
>>> The Ninja backend is faster than Make for large projects (takes three
>>> minutes
>>> off webkitgtk:do_compile for me), so use it by default.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>
>>
>> I tried to test this but it did not apply in master. Could you rebase it?
>>
>>
> On my 64+64 core system that is shared, it reduced a webkit compile
> from ~ 17 minutes to ~12 minutes for just the compile stage. YMMV.
>
> $ cat webkit-before-compile.log
> 3.29user 0.50system 17:39.98elapsed 0%CPU
>   (0avgtext+0avgdata 28532maxresident)k
> 0inputs+176outputs (0major+16335minor)pagefaults 0swaps
>
>
> $ cat webkit-after-compile.log
> 2.70user 0.47system 12:09.24elapsed 0%CPU
>    (0avgtext+0avgdata 28292maxresident)k
> 0inputs+160outputs (0major+14634minor)pagefaults 0swaps
>
> I'm going to try to build world (oe-core + meta-oe + ...).
>

Good win :)

There appears to be a small number of upstreams that break with ninja, so
I'll rework this patch so that the backend is an option but default to
Ninja.

Ross

--94eb2c0afc447c415e0562ffbecb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 January 2018 at 20:57, Randy MacLeod <span dir=3D"lt=
r">&lt;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">ran=
dy.macleod@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On 2018-01-17 11:18 AM, Otavio Salvador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton &lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The Ninja backend is faster than Make for large projects (takes three minut=
es<br>
off webkitgtk:do_compile for me), so use it by default.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
</blockquote>
<br>
I tried to test this but it did not apply in master. Could you rebase it?<b=
r>
<br>
</blockquote>
<br></span>
On my 64+64 core system that is shared, it reduced a webkit compile<br>
from ~ 17 minutes to ~12 minutes for just the compile stage. YMMV.<br>
<br>
$ cat webkit-before-compile.log<br>
3.29user 0.50system 17:39.98elapsed 0%CPU<br>
=C2=A0 (0avgtext+0avgdata 28532maxresident)k<br>
0inputs+176outputs (0major+16335minor)pagefaults 0swaps<br>
<br>
<br>
$ cat webkit-after-compile.log<br>
2.70user 0.47system 12:09.24elapsed 0%CPU<br>
=C2=A0 =C2=A0(0avgtext+0avgdata 28292maxresident)k<br>
0inputs+160outputs (0major+14634minor)pagefaults 0swaps<br>
<br>
I&#39;m going to try to build world (oe-core + meta-oe + ...).<br></blockqu=
ote><div><br></div><div>Good win :)</div><div><br></div><div>There appears =
to be a small number of upstreams that break with ninja, so I&#39;ll rework=
 this patch so that the backend is an option but default to Ninja.</div><di=
v><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c0afc447c415e0562ffbecb--
