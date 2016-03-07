Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 373A673167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 13:50:32 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id z76so29597825iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hEKB1TuGzbRtifTPX6GRHlXhrRjtlzyMfwX/QFFkXy4=;
	b=fi0X9adx07aqesHT7h5rw1k7yIjwspWujPGF0s11bB9iMW1XDgP/xCs1ZpnOrKCcYM
	VsF6wMq9VSQEj4rg9aPDzq2wqplldE+32vZ32Ll1VHIdlewCC+n0h6UkjvbnAk5hEb1s
	tuTrDQO5uY3c0mFwBhV+6pOWMMPAGAq4sjKdsV4J5RtnxOdtZEKiUPMsGZQ9pOq/BBPU
	x0AeFeryHqHF6KdtDu/k0dGbHsoauOrbEoNhw4OLMAD72pKOOiI9hSmAPVvpD9Xf3fI+
	HhbD5I4H4wwPQ0Tf8BAZ5ZHvKzTc8M9Kno/UBITSR8qPZTASFbDIx8wnmYjVKpvWWEz3
	/zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hEKB1TuGzbRtifTPX6GRHlXhrRjtlzyMfwX/QFFkXy4=;
	b=VJwxnrlzJH5pRs0GfraYYf3t8h981F6H+e/nkuLnbh2xu0ml1Y6GQlrwjRdE1vo+bR
	vi1ofIjjed1tuiBIDhND0dc1GhCK5FxG6xyh4joLUJKSQ7XDE+83Yu83yUpqSyh3KAIX
	rShtvyaFGlYF3bqd/CFQS5zpnAxSt0vLIroID8jr1zwqXaDSj2S55zYv2cDF5UE/9ym8
	P9rl0j3Rck3MGrCyPBys25TP/zoZI+lfRfbc6WnrZWQCCdfg/1Hp082y4WYJeEzMsZ7J
	GDq1O9spsEcl5QMHofbMn4bEy+09aEHIfakiv+zNJ1TIloriKk4EIdkxiqpZc6bOLlqq
	3T6A==
X-Gm-Message-State: AD7BkJLL4t8KuSxzQkjViO2JT1Zk0V5Rtologm8cw7gMeAeK+oAKv3x36GUE7k+cmCOQ7ELOQoKQGASgscQdq2QT
X-Received: by 10.107.137.92 with SMTP id l89mr23478241iod.133.1457358633013; 
	Mon, 07 Mar 2016 05:50:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 05:49:19 -0800 (PST)
In-Reply-To: <7DE201B3-FFD4-4FBD-899B-F7FF7119B733@gmail.com>
References: <7DE201B3-FFD4-4FBD-899B-F7FF7119B733@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 13:49:19 +0000
Message-ID: <CAJTo0Lb3sEjS_YVN4WWZVZB4NyRGSD+zGqsfeJyC9sj-g6VD1Q@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] udev: udev_run is /run, not /var/run (since ea647cd9 2013-05-26)
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
X-List-Received-Date: Mon, 07 Mar 2016 13:50:33 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4a1ac48052d75bfd2

--001a113ebdb4a1ac48052d75bfd2
Content-Type: text/plain; charset=UTF-8

On 28 February 2016 at 11:38, Jens Rehsack <rehsack@gmail.com> wrote:

> -       echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
> +       echo 'udev_run="/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
>

oe-core has eudev now so this would need rebasing, but I can't see any
mention of udev_run in the eudev sources and in udev 182 /run/udev was the
default so I'll send a patch to just delete this line.

Ross

--001a113ebdb4a1ac48052d75bfd2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 February 2016 at 11:38, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":20l" class=3D"a3s" =
style=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;udev_run=3D=
&quot;/var/run/udev&quot;&#39; &gt;&gt; ${D}${sysconfdir}/udev/udev.conf<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;udev_run=3D&quot;/run/udev&quot;&#39;=
 &gt;&gt; ${D}${sysconfdir}/udev/udev.conf</div></blockquote></div><br>oe-c=
ore has eudev now so this would need rebasing, but I can&#39;t see any ment=
ion of udev_run in the eudev sources and in udev 182 /run/udev was the defa=
ult so I&#39;ll send a patch to just delete this line.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebdb4a1ac48052d75bfd2--
