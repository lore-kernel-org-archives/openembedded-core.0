Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2395677D08
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 10:15:39 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c195so14977541itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Snf9sK9VQw+GGkrHkNMs0/ALZM8p0rEIv6OZmxHwq5o=;
	b=VXzcLZznfz6u3mzP5gxhfiQRjxFaGhYcTgjCsQV1eK6zXdTSsx35t0t74GRB8P4ica
	ITBRAWm2qXaDlJ/fj+zWEQMTkxDv2Qzui5XXr1p0A7NrnyoZGu7kjxRWJ28YGBcdC1kL
	A6NaMWga9laT5Yd7GvmjD0hpV6ryj2JBxdB/D010410zRhKFPDqlsbMQ9iDdqmXDDWxu
	YoM7Fyl7sdYrEAjMen1CVmFUN2cv086sAPw2m6FGiYclXIX057iFF9vPwDuu6B54YIdh
	lI3PKtaNeI5VcMgq1fPu7ccn2CeEYWekHxW+F1S5wHoIC4FfiR8EhFRHXb5JPspp6ldG
	I2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Snf9sK9VQw+GGkrHkNMs0/ALZM8p0rEIv6OZmxHwq5o=;
	b=N5rEhf8D9n3kNcpymgXVkB1S9EpdSRnaP+bI3HGaSvEqorCfW0oMI52N3JNNDrEKer
	a/bpoS3Q3EoukzwH7ylbI7oQ9XpeVcomA3j+pUWtOiePtw9eN3LyUgzuL7z/CzAREJ8o
	0VkvQpOTTvRNpXM5Oqg2fFPYthGsgNvYUbn0AmHe22vFv2q3uKhI6ji8JAAD4ij6CRQU
	bMmJfafGHtsNRFlfaloK5VWz1WDi3G/4LcymzLODJgolyglUmRhseTt/EXMgToVoCOib
	ir6hAMfQK8OxNh8P9RSAkR7mAeNdMhqZU48w9L7Ww3ozT9tKin3LyHP2y7xOXp9QEsHp
	SocQ==
X-Gm-Message-State: AHPjjUhWEjrW+EeIz98y20gRa/2MupQ+I71aVoNT2MvPWbplPFkYvYof
	Y1zVK+K+eNEOeDw9HlIPZ9w3Sj9R9LetnPTXQwudpg==
X-Google-Smtp-Source: AOwi7QCnXHgXtgcYmSuGNBWhANNnGdnt4SRnURsASkrkVPiTp2rlElVqi5z7dR4G/ALR9dPUo9embxH/Qk5M7LAgwuQ=
X-Received: by 10.36.150.4 with SMTP id z4mr29252436itd.48.1507112141394; Wed,
	04 Oct 2017 03:15:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 03:15:20 -0700 (PDT)
In-Reply-To: <bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 11:15:20 +0100
Message-ID: <CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 10:15:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea98d33051055ab5e3fd"

--94eb2c07ea98d33051055ab5e3fd
Content-Type: text/plain; charset="UTF-8"

On 4 October 2017 at 07:20, Andrej Valek <andrej.valek@siemens.com> wrote:

> I have compared no/suid links between these versions. So, I was trying
> to enable the same applets like in older version and do not enable the
> new one. Some applets could not be disabled (they are automatically
> enabled) due to dependencies.
>
> For this version of defconfig the new applets are:
> chrt
> cttyhack
> init
> lzcat
> mdev
> nproc
> setsid
> xzcat
> partprobe


This doesn't quite match what I'm seeing by comparing old and new links in
the postinst:

$ diff then now
44c44,45
< update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50
---
> update-alternatives --install /bin/sh sh /bin/busybox.suid 50
> update-alternatives --install /bin/sh sh /bin/busybox.suid 50
122a124
> update-alternatives --install /usr/bin/lzcat lzcat /bin/busybox.nosuid 50
128a131
> update-alternatives --install /usr/bin/nproc nproc /bin/busybox.nosuid 50
167a171
> update-alternatives --install /usr/bin/xzcat xzcat /bin/busybox.nosuid 50

Note the two lines installing an alternative of /bin/sh to busybox.suid.

Assuming they should have alternative links installed, the following
applets are still disabled too:

 chrt
 cttyhack
 init
 mdev
 setsid
 partprobe

Ross

--94eb2c07ea98d33051055ab5e3fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 October 2017 at 07:20, Andrej Valek <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej.v=
alek@siemens.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">I have compared no/suid links between=
 these versions. So, I was trying<br>
to enable the same applets like in older version and do not enable the<br>
new one. Some applets could not be disabled (they are automatically<br>
enabled) due to dependencies.<br>
<br>
For this version of defconfig the new applets are:<br>
chrt<br>
cttyhack<br>
init<br>
lzcat<br>
mdev<br>
nproc<br>
setsid<br>
xzcat<br>
partprobe</blockquote><div><br></div><div>This doesn&#39;t quite match what=
 I&#39;m seeing by comparing old and new links in the postinst:</div><div><=
br></div><div><div>$ diff then now</div><div>44c44,45</div><div>&lt; update=
-alternatives --install /bin/sh sh /bin/busybox.nosuid 50</div><div>---</di=
v><div>&gt; update-alternatives --install /bin/sh sh /bin/busybox.suid 50</=
div><div>&gt; update-alternatives --install /bin/sh sh /bin/busybox.suid 50=
</div><div>122a124</div><div>&gt; update-alternatives --install /usr/bin/lz=
cat lzcat /bin/busybox.nosuid 50</div><div>128a131</div><div>&gt; update-al=
ternatives --install /usr/bin/nproc nproc /bin/busybox.nosuid 50</div><div>=
167a171</div><div>&gt; update-alternatives --install /usr/bin/xzcat xzcat /=
bin/busybox.nosuid 50</div></div><div><br></div><div>Note the two lines ins=
talling an alternative of /bin/sh to busybox.suid.</div><div><br></div><div=
>Assuming they should have alternative links installed, the following apple=
ts are still disabled too:</div><div><br></div><div>=C2=A0chrt</div><div>=
=C2=A0cttyhack</div><div>=C2=A0init</div><div>=C2=A0mdev</div><div>=C2=A0se=
tsid</div><div>=C2=A0partprobe</div><div><br></div><div>Ross</div></div></d=
iv></div>

--94eb2c07ea98d33051055ab5e3fd--
