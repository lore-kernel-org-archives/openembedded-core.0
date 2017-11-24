Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 809A1784D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 15:29:45 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 72so2132575itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p/IZiTvYi0E1n30b720tm5zY2SQatQsjG7JkZVvtd0I=;
	b=VA+sIx3OFXOsfe91tfHbthOseOUq6bNzDBKccW2aGfP/Xj2tnfnJGui/l2KJnNf5xE
	h0TW0stlWtucd4X7u4r4r1zgl/rqgh/YkDM5Sd3yyjV6xKIwc41c5JjuPU/J/rz5fEf8
	uEpXpLNI5YuuDokiBaRSl+QrltWr8boYEPH9nSPrR34bgBVSW/WM8Fi/tnRmyx1vETLq
	i7Gj10wgx9hPR80PvIVzqZZklxQUKw80CmVbVnU6Ln5r7HKD7BIGx2/2MBgJabv9KWlP
	BuwlPfp+SSxbaL1npoke5QBfTr7l6zUCbb5pN6XwPCqaqYqPfqDKqcWdKADixR8u3GAx
	OWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p/IZiTvYi0E1n30b720tm5zY2SQatQsjG7JkZVvtd0I=;
	b=MMmhdcIffvFbjfjjarpZg0unkjS5LaSvFgZiMOUf+mnfJGV1BNNrKTLvBm326aDf5L
	DxKOCvJtCIa6qHhz5dn0xMq7y2zktVPauCt2Ui5u4/w8piEnvyqJcBA7fuOsCVgIFMrU
	QiWRD0C8X7C77rHUdRd7J9AYbHidYi0We7n/EOowfdlJZ7ikcdYKkWDArvqUeSkU/VFi
	foa4Tz09+Nirctv5PAF4yvnRds115v4+RqwZoULPi6YK00Zzis+w25iu57pd0YlcPkSn
	4fjFeX2N1Ntlj/SC2vidUv21f9eN71Xq8ZcUhNwWej64u8VZKQ+IoM3RuvX9Ehmi0ETx
	BfmA==
X-Gm-Message-State: AJaThX54qj2Snf1oQg9hbx0Xv7RJeQqiwFjnrTddBpU8vanUxYEXYlz3
	EJKkbql+6a5E9V593+Zn79jxzNKUDPyc1oANIl5CIA==
X-Google-Smtp-Source: AGs4zMbydkcBi4k48q1c7Qd74HR1jvEgLovnBBqAXKdspeAzOaK1SRorhnDa386WpFoIVqo/0u08dnrorH6hb0psHO8=
X-Received: by 10.36.93.5 with SMTP id w5mr11134847ita.124.1511537387487; Fri,
	24 Nov 2017 07:29:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 07:29:27 -0800 (PST)
In-Reply-To: <5A17A0F6.9090904@windriver.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
	<CAJTo0LY=Wii9Ys1R1Ny3U3X1T-J=MgVCXXDA7d4HH6n5vLtqcw@mail.gmail.com>
	<CAJ86T=Wd0wCJbRAS+H3kDC2tg+51UsY_KwRjZKq46VEK+Y0NdA@mail.gmail.com>
	<CAJTo0LbAMCEPOwE9SHNbtuGuO=63GHP8wYh3O9jG27U3xJKNAA@mail.gmail.com>
	<5A17A0F6.9090904@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 15:29:27 +0000
Message-ID: <CAJTo0LaYTLzqZ3g46gC2EbFv9cB9A_u_yMzYfagmSDWeGGyu2Q@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Fri, 24 Nov 2017 15:29:46 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c0bdc55055ebc398e"

--001a1143f14c0bdc55055ebc398e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, please.

Ross

On 24 November 2017 at 04:32, Zhixiong Chi <zhixiong.chi@windriver.com>
wrote:

> Hi Ross,
> Is your meaning that I regenerate this patch based on
> poky-contrib:ross/mut2 branch?
>
> Thanks.
>
>
> On 2017=E5=B9=B411=E6=9C=8823=E6=97=A5 19:58, Burton, Ross wrote:
>
> Thanks Andre.  There's a glibc 2.26 upgrade pending and this doesn't appl=
y
> on top of that, can you rebase?  poky-contrib:ross/mut2 is where I'm
> staging the toolchain updates.
>
> Ross
>
> On 22 November 2017 at 00:50, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Tue, Nov 21, 2017 at 3:05 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > What glibc release is this in?  We've an upgrade patch pending that
>> bumps it
>> > to 77f921dac17c5fa99bd9e926d926c327982895f7.
>>
>> It's currently in the glibc master branch only (ie hasn't been
>> backported to the 2.26 release branch).
>>
>
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036 <+86%2010%208477%207036>
>
>

--001a1143f14c0bdc55055ebc398e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, please.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 24 November 2017 at 04:3=
2, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D"mailto:zhixiong.chi@windri=
ver.com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Ross,<br>
    Is your meaning that I regenerate this patch based on
    poky-contrib:ross/mut2 branch?<br>
    <br>
    Thanks.<div><div class=3D"h5"><br>
    <br>
    <div class=3D"m_-6671565565886527906moz-cite-prefix">On 2017=E5=B9=B411=
=E6=9C=8823=E6=97=A5 19:58, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Thanks Andre.=C2=A0 There&#39;s a glibc 2.26 upgrade=
 pending
        and this doesn&#39;t apply on top of that, can you rebase?
        =C2=A0poky-contrib:ross/mut2 is where I&#39;m staging the toolchain
        updates.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 22 November 2017 at 00:50, Andre
          McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.c=
om" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span>On Tue, Nov 21, 2017 at 3:05=
 PM, Burton, Ross
              &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank=
">ross.burton@intel.com</a>&gt;
              wrote:<br>
              &gt; What glibc release is this in?=C2=A0 We&#39;ve an upgrad=
e
              patch pending that bumps it<br>
              &gt; to 77f921dac17c5fa99bd9e926d926c3<wbr>27982895f7.<br>
              <br>
            </span>It&#39;s currently in the glibc master branch only (ie
            hasn&#39;t been<br>
            backported to the 2.26 release branch).<br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
    </div></div><span class=3D"HOEnZb"><font color=3D"#888888"><pre class=
=3D"m_-6671565565886527906moz-signature" cols=3D"72">--=20
---------------------
Thanks,
Zhixiong Chi
Tel: <a href=3D"tel:+86%2010%208477%207036" value=3D"+861084777036" target=
=3D"_blank">+86-10-8477-7036</a>
</pre>
  </font></span></div>

</blockquote></div><br></div>

--001a1143f14c0bdc55055ebc398e--
