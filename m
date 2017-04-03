Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id CB67460765
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:25:19 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id p22so120576905qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ayb5kzSqVxeErfo4WtMOhGUwiDixuCiLxbxYQaQmTdo=;
	b=Ybsl9BLPYxC3TZO+J987f1Kh7xcVDmsKT2xBciKeI+ZCMIB0egyZSzDLeVudzUoCDA
	07Fgln1RkgUjmJPhttLu2gJ+mbaODL73c6pFPFzii77kzeii2Ri1KInoR6YnXotjDOZ/
	SwubG3XwqpXeFAyd1R5DL6DMyQ2XpNYmMkoVjucAYZRnFUwnFwvlHUX424CwkNEBEWe9
	kE0pAm5cvNDuoeI1VWn1GoZQ7RJB3X6Ah6S0D3v/kDaCL8xp3ZsxTQfskT/Saai72Fh5
	pyyUf1okbYvjZVpOIgBiyNTO37fAv0OTRS+XxROrXZRSUygo+eUaE2sBSDsvtF5QL8Ry
	7Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ayb5kzSqVxeErfo4WtMOhGUwiDixuCiLxbxYQaQmTdo=;
	b=egBji3O5MrAd9XhUl9gfl2fVPXcejmqL45eZdcfyn/mc/jvRbmNGH5bAeNnoghpVem
	haFLCx8yxN+AnF98x3bTwTitEgL1tEoZhptJxut1ONztC6DRqh0U8M6BAZtAgvf7aQ1B
	0t9trMF7iLFMplvPaj6IFrZ3643ngHOs++D0qrRn08qqGhqSa87tqk/0MyV1bnaHDRhU
	cI/2VuysL0gukfqwIcMSZtBBHwYxtEKe0826zaLjH7KGf8aDgIeRUVTrSegoRYxBAPci
	/r75A9lnF/AmIhXZ/V/EhFqbDC7WBreMLUcJoorwApYAybUPR0WsNdQYgM8MkUnvQJfj
	xNRg==
X-Gm-Message-State: AFeK/H2hPcN5alFGs4Lqwv16aaEImgr6VvZXKQbM3o85cWtaso1yyWisl+KsTaLrmMl/O1jnTHs3cHocUJyt10sf
X-Received: by 10.55.107.196 with SMTP id g187mr17133011qkc.77.1491240320773; 
	Mon, 03 Apr 2017 10:25:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 10:25:00 -0700 (PDT)
In-Reply-To: <CAJ86T=WFKTpB=ZAffa0_zttrh3uEjuKV+1gLcvmxcgkxPhTb-Q@mail.gmail.com>
References: <1491221074-30437-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=WFKTpB=ZAffa0_zttrh3uEjuKV+1gLcvmxcgkxPhTb-Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 18:25:00 +0100
Message-ID: <CAJTo0LZW1_=jroQsTQ5E+hz0LpCz3tOaWvVH-pB6X9Bj4gzPyg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Mon, 03 Apr 2017 17:25:20 -0000
Content-Type: multipart/alternative; boundary=001a114fe39698631b054c4671a5

--001a114fe39698631b054c4671a5
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 18:03, Andre McCurdy <armccurdy@gmail.com> wrote:

> > +EXTRA_OECONF_append_class-native = "--without-simd"
>
> Missing space?
>

Argh.  V3 incoming.

Ross

--001a114fe39698631b054c4671a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 18:03, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div=
 class=3D"">&gt; +EXTRA_OECONF_append_class-<wbr>native =3D &quot;--without=
-simd&quot;<br>
<br>
</div></div>Missing space?<br></blockquote><div><br></div><div>Argh.=C2=A0 =
V3 incoming.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div=
>

--001a114fe39698631b054c4671a5--
