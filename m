Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 333D071D45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:10:13 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id x49so49594527qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ua1XdXXUth1g/8vne/iJOlHwGbAx0UvJO3G3vyqkGdo=;
	b=eaOp25g2wxCw888FXTPch6cc+Bp9nCbeWnePq0UbZFC5rmTDugEnlJa804dq70KEDz
	Vwhg+WX33CZ8oDel0CJmoQ5Hg9HXKNr4QQCT4srzTMbNeWFxgwpJX5RubTfN696VHMa+
	ErETJ4n97b584JYwoVHpE5MlaIilIWsFmGiLwLuglvJcABCiprMLl1H9OaOO9u9x82G3
	6mpO8NSntgGInTKNBecp5PGmUkcCNdaXCIoT+P/eBVU5aPRoZqS0cKVArrvCV4rbHyYX
	PYAv8v7KikmowgD+qpJMNuMyt6aS4mPp+6zyOd84ePyF8mZA23B749pYBedVSx472q5+
	8TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ua1XdXXUth1g/8vne/iJOlHwGbAx0UvJO3G3vyqkGdo=;
	b=go473IOmE/pK1DSebfXS3hMvDFceVij1DOFWFua4j32vUx/hBXOt4kg+gOXhvLOWEu
	OTgUjF1Skf/oEgfNOgmlVzuq0v+QjW3Md/GxMHU4Kq4VqjNGDrG8p8J+/XjujKwOoO4x
	FQ5VUNWsEscZt8ctHz1+onz/mjGEoZiQkH9NAxa9nZHmw5z0RNFg8s+kXxBCpO/V7xRf
	Rn5GURoc0bT/Tbx78lr0cZzBNHx36Cc44pDE8rouExaUfZ9KuPYtbuAdAucbaLwCIST/
	7bfNZVYDVt/k2gGKbdvHTBLEABGYyytOMKtEQUwlzcXqJr7VoCUlmi4v1qkztrFS46ll
	YTHw==
X-Gm-Message-State: AIkVDXKPg6DkLOHXQuNCcreRR3ZbAOiSNC64joTv1VRU4Qwtdnv+JYIwXxGxgqf4B2LqaW4gSP0PfAq9AKnKRJt9
X-Received: by 10.200.39.212 with SMTP id x20mr17332667qtx.109.1484320213910; 
	Fri, 13 Jan 2017 07:10:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 07:09:53 -0800 (PST)
In-Reply-To: <cover.1484312322.git.ross.burton@intel.com>
References: <cover.1484312322.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 15:09:53 +0000
Message-ID: <CAJTo0Lb=d7-mZLh=NqQRyXknytV1tm+ivi1QTR9W5vEbdiU2DQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 15:10:14 -0000
Content-Type: multipart/alternative; boundary=001a1135b542155a2e0545fb3b5e

--001a1135b542155a2e0545fb3b5e
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 13:00, Ross Burton <ross.burton@intel.com> wrote:

> Patrick Ohly (8):
>       recipes: anonymous functions with priorities
>       build.py: add preceedtask() API
>       runqueue.py: alternative rm_work scheduler
>       gcc-source.inc: cleanly disable do_rm_work
>       rm_work_and_downloads.bbclass: more aggressively minimize disk usage
>       rm_work.bbclass: clean up sooner
>       rootfs-postcommands.bbclass: sort passwd entries
>       insane.bbclass: print license text as part of QA message
>

This was retracted so please drop these too!

Ross

--001a1135b542155a2e0545fb3b5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 13:00, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2t4" class=3D=
"a3s aXjCH m15997eaab7b53979">Patrick Ohly (8):<br>
=C2=A0 =C2=A0 =C2=A0 recipes: anonymous functions with priorities<br>
=C2=A0 =C2=A0 =C2=A0 build.py: add preceedtask() API<br>
=C2=A0 =C2=A0 =C2=A0 runqueue.py: alternative rm_work scheduler<br>
=C2=A0 =C2=A0 =C2=A0 gcc-source.inc: cleanly disable do_rm_work<br>
=C2=A0 =C2=A0 =C2=A0 rm_work_and_downloads.bbclass: more aggressively minim=
ize disk usage<br>
=C2=A0 =C2=A0 =C2=A0 rm_work.bbclass: clean up sooner<br>
=C2=A0 =C2=A0 =C2=A0 rootfs-postcommands.bbclass: sort passwd entries<br>
=C2=A0 =C2=A0 =C2=A0 insane.bbclass: print license text as part of QA messa=
ge</div></blockquote></div><br>This was retracted so please drop these too!=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1135b542155a2e0545fb3b5e--
