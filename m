Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0A76171AA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 20:11:55 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id n6so45518745qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tgHPfiH7criJYRFjQgWhRAr98pnOGBqnqmnLY/iAx/Q=;
	b=qcbixndfw2HyPR6sFzLZubRmTCNlHiLhKgOToiC6Or20jULZjiiovf06sWh0Ob/A5E
	obIHWGg5zGGJ9GC6XLdermf2MZFPLznQNj5rwU5Qk8PxNADb2nUTv2qWLghValHK5wo3
	yuyfoASwlFtZeYeQ4UmtEBV4+anNRUv29/Hl2KgSrurlT1IOyfEG1a178FuzhRhXs731
	pIzDC2fLWEA7pMkbQZnpvAJUF2LnLVdTsrST+9GRyuVbuubmyWJlWWfPideeGnPen7fu
	SshjaqGutursDqrnjMJKwStu2cPOiSDpxlR4FHjatqIbkNwzSghqDtoDxk/tF9IJbWMs
	1IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tgHPfiH7criJYRFjQgWhRAr98pnOGBqnqmnLY/iAx/Q=;
	b=k9rBUhFnoGqd7uGbrNyXH3Sx+iU8qgO4IZUPGvmZCuQ5FVvypMG7QavavVSjOgnFoA
	nsAeslm2fKSpghFxFGIL45T1qnhnq6TkvIlbQ0LjvYh5u+uC1IzlTGzxrTqa+4uBm9oF
	GvOCbnuzqtjPqiAcynLIzzIOCtja8jhUAmthBfkytZfiuH8W4oD3AgQIbYu8r2JBppib
	EduYGu0Avg9/GQ4aO2pxb85e8pIJ8wqAWQD8J0gg70EDnH/j3th9I2CwGuQqb8SHfsmT
	mL0tOHPboulEOYxNHvlRGsT8ackmZE/9phv+e9CjmmBs7n9LIDYwWJGBV/5+ciNJGyzR
	1Zxg==
X-Gm-Message-State: ABUngveIdFMnL7Qrtaiz543WMfOAbArbEmBep2Hu3Cw8BdtHKBON9Evfq27W+q+RIne+4zsvQgOEjfMtCt+T56ni
X-Received: by 10.237.33.212 with SMTP id m20mr6335825qtc.130.1477944717001;
	Mon, 31 Oct 2016 13:11:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Mon, 31 Oct 2016 13:11:36 -0700 (PDT)
In-Reply-To: <1477552212-8536-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1477552212-8536-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Oct 2016 20:11:36 +0000
Message-ID: <CAJTo0LbZ=dQWK7XyUOz5My8iKje8DYgCMmkLPCTXeEicWoj9xg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] uninative: rebuild uninative for gcc 4.8 and 4.9
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
X-List-Received-Date: Mon, 31 Oct 2016 20:11:58 -0000
Content-Type: multipart/alternative; boundary=001a11498e00dae3f105402ed109

--001a11498e00dae3f105402ed109
Content-Type: text/plain; charset=UTF-8

On 27 October 2016 at 08:10, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> +    match = re.match(".* (\d\.\d)\.\d .*", output.split('\n')[0])
>

Debian uses this string:

gcc (Debian 4.9.2-10) 4.9.2

So your regex needs to be a bit more permissive, and it looks like grabbing
the second number would be more appropriate here too.

Ross

--001a11498e00dae3f105402ed109
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2016 at 08:10, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3fu" class=
=3D"gmail-a3s gmail-aXjCH gmail-m15804ff93a44e9dd">+=C2=A0 =C2=A0 match =3D=
 re.match(&quot;.* (\d\.\d)\.\d .*&quot;, output.split(&#39;\n&#39;)[0])<br=
></div></blockquote></div><div class=3D"gmail_extra"><br></div>Debian uses =
this string:</div><div class=3D"gmail_extra"><br>gcc (Debian 4.9.2-10) 4.9.=
2<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
So your regex needs to be a bit more permissive, and it looks like grabbing=
 the second number would be more appropriate here too.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11498e00dae3f105402ed109--
