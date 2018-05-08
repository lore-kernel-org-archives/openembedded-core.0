Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6536C74C3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:25:20 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id q72-v6so5363776itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sudu2jDy9JHd1cS0YdbCPy263FeRavZMHz7mIuKzxR8=;
	b=VRt0AvvBRXHwWhXpYBu8B23l5HOH50apqKKjPvaPkURhvFJYGhhmLcqBC2kvnuAfVT
	20q3T1QY6ulBdnYy64qv+ZSPkG91krYlQDvFvYf0N3aUt0gAY8QW7u+hWQfzbRT5R8Ta
	UFuG6DkIla376iEln9BtT6cBD1uz7mFclBhW8MF9v+Zn4NFR0Dy0JqrAAx4Qa7zCACqs
	0JSM3l6OvHk9u8QN5PR80NFx0PwOzDjLfOee6XYijGhGRn9Ge0nCTTZB08o/JjMgXAtu
	9DkmQ5kDj4AASrHlLHS/22HYN+ssRnqZPHgbZVso3lbCALBVsV/YUDhmbUYfgmWA63md
	4tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sudu2jDy9JHd1cS0YdbCPy263FeRavZMHz7mIuKzxR8=;
	b=KaZG3ZRAyVlnmijw5Du4P0F7NLsJITe9nJF7f/G4hwo61K20Eeou+NW0kJbBPGkunq
	DuBNMid64zzrAvPZ3+ocOIPqEQHgaQdtwlfKVIaFo9qbCI1zE3bIIMQPrlmRH+rc6bNw
	cwh1jjPZ0EpGOYjv9DB5zB95Os+CQjeoziF7WqMpfdd0+5F5jCIGu1ubgbyjEMygxfd2
	Vs7PYm9DHlaUiAc6bXbQZpEFGnD+Fj1Yc3ExEsM1zRAHm/OUcIoaGCe28uzDVWLiL0dg
	owLqyblz+LMqUhh41hUlJzXvQApWuZVz8zxSQXOEEewVuOdJ6sMed4hdksXeUZ7mB3kY
	R0Qg==
X-Gm-Message-State: ALKqPwdzEmJ81CV9k4PB5k3odKjxeFpOFPdHOI1a175xTUIqzn1tt7p9
	grhSpNYgo1oHItGAAwXfB5KQkwuU/xI78XvmfghOxw==
X-Google-Smtp-Source: AB8JxZoQTH2F0Z6+Bhtyd3eBtfpJswg3CNtyxSmrHd1d426roifea/M9HH3G8Ba6ObRLgayncr9yq6yAd2ItXqFqekw=
X-Received: by 2002:a24:3a0a:: with SMTP id
	m10-v6mr5336851itm.45.1525771522102; 
	Tue, 08 May 2018 02:25:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 8 May 2018 02:25:01 -0700 (PDT)
In-Reply-To: <d9e02702-1b1f-3560-3bbb-11ee04be8524@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CA+chaQfzfNip1UE1WWy2v=T6rWkYkSLTZS-FRek2hP9W=T_3_w@mail.gmail.com>
	<d9e02702-1b1f-3560-3bbb-11ee04be8524@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 May 2018 10:25:01 +0100
Message-ID: <CAJTo0LZ=NKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Tue, 08 May 2018 09:25:21 -0000
Content-Type: multipart/alternative; boundary="000000000000957eba056bae5da3"

--000000000000957eba056bae5da3
Content-Type: text/plain; charset="UTF-8"

CCing Halstead who does.  Hopefully the autobuilder.yocto.io cache has
a babeltrace-1.5.5.tar.bz2 tarball we can add to the mirror?

Ross

On 7 May 2018 at 11:17, Alexander Kanavin <alexander.kanavin@linux.intel.com
> wrote:

> On 05/04/2018 10:51 PM, Martin Jansa wrote:
>
>> Can you please upload the tarball (I assume you still have it from the
>> time you were testing the upgrade to 1.5.5) to:
>> http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.5.5.tar.bz2
>> or
>> http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2
>> so that it's covered with default mirrors.bbclass as well?
>>
>
> I don't have upload rights to that.
>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000957eba056bae5da3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">CCing Halstead who does.=C2=A0 Hopefully the <a href=3D"ht=
tp://autobuilder.yocto.io">autobuilder.yocto.io</a> cache has a=C2=A0babelt=
race-1.5.5.tar.bz2=C2=A0tarball we can add to the mirror?<div><br></div><di=
v>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 7 May 2018 at 11:17, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On 05/04/2018 10:51 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Can you please upload the tarball (I assume you still have it from the time=
 you were testing the upgrade to 1.5.5) to:<br>
<a href=3D"http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.5.=
5.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproje=
ct.<wbr>org/mirror/sources/babeltrace-<wbr>1.5.5.tar.bz2</a><br>
or<br>
<a href=3D"http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2" rel=3D=
"noreferrer" target=3D"_blank">http://sources.openembedded.or<wbr>g/babeltr=
ace-1.5.5.tar.bz2</a><br>
so that it&#39;s covered with default mirrors.bbclass as well?<br>
</blockquote>
<br></span>
I don&#39;t have upload rights to that.<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--000000000000957eba056bae5da3--
