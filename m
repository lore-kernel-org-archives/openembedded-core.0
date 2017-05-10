Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id ADFC571AB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 11:04:00 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id k74so25134295qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7rL1GD/Z/rKzb/Ii4RD/rk12tfy4BteiEbzXHn1MDvg=;
	b=mTeXi7h7BYI3o2gxIsSpqyn3mEKvPBbo2HZTNBNO4uOfdArkrENiZ5VLXDuXboAXjc
	1iYISHAgRKTEw5hojL9oXwIFT32k6EcyuwNyYro+QRtCflS1xvvIVJFtF84i0g9Y0x65
	IWAgnQh8d8CTte8j445aIjKylM+xteNqL0vFlSTr8MKNrSLBhJjnEIQZitSFbpF5oVx4
	SuwxTdE4v0r3FqIQ/3hLM/MOE7tJNrj+k6tTuxxRgS897RguZ4cdsTN4tJNAAdguvvx0
	SZErhwOkv4dBVr+IZpRV8QHCPsMUDa+BmjIC4MFR8+KibZIeoAOeoVV9CsZM0qdZCIA+
	AH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7rL1GD/Z/rKzb/Ii4RD/rk12tfy4BteiEbzXHn1MDvg=;
	b=Rw+2ROwbJXrGuEH3RtJxo5UO3pY7XHJpHysI9WxavQ1DHIGN+6bUI2oDy7SxPSHDy7
	wxba5wZk6rpROFbxJrPbln4EfONh/WyrGbAhFqwORa6nAKKWyU15HzDgOvsexUE6+Re8
	nsEt7H4gvqTpEfQ8OuUdGBMYyYUA2F2950LJLgCzK5VYrp1SGaWO6KT/O9E3YNIA6R3c
	opXYgUqihrnsout5mJqmV6whiTZ7gqeamaGcb/O4nspV9stmBCh8PjrdA47jywBAGr6J
	cpiAw8LMfBduihjBy6tzmyB8z/1VSv+2bVK0X87NgnBQ13Dq81dVySDeTuZXr9iJgGcq
	gi/g==
X-Gm-Message-State: AODbwcAWwOjOkGGblRjLiTXLEw8wpIyb4KY9KCfuHJiW2jfqQPbDri1A
	RlHq2QzxqwWz9341C+j6bQtif9BJcLIm
X-Received: by 10.55.187.1 with SMTP id l1mr5294383qkf.36.1494414241444; Wed,
	10 May 2017 04:04:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 10 May 2017 04:03:41 -0700 (PDT)
In-Reply-To: <20170510093529.6651-4-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
	<20170510093529.6651-4-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 May 2017 12:03:41 +0100
Message-ID: <CAJTo0Lbbi+TQ3NNidi__VnaHowe_dt1bh86kbX+GuDtCQ1_bBQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/11] sysprof: update to 3.24.1
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
X-List-Received-Date: Wed, 10 May 2017 11:04:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c046c9202512e054f296ed7

--94eb2c046c9202512e054f296ed7
Content-Type: text/plain; charset=UTF-8

On 10 May 2017 at 10:35, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +FILES_${PN} += "${datadir}/icons/ ${datadir}/appdata"
>

We're going to see this more often, so it's probably worth adding appdata
to gnomebase.bbclass.

Ross

--94eb2c046c9202512e054f296ed7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 May 2017 at 10:35, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1g9" class=3D"a3s aXjCH m15bf1b72ae25a884">+FILES_${PN} +=3D &=
quot;${datadir}/icons/ ${datadir}/appdata&quot;<br></div></blockquote></div=
><br>We&#39;re going to see this more often, so it&#39;s probably worth add=
ing appdata to gnomebase.bbclass.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--94eb2c046c9202512e054f296ed7--
