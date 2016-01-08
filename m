Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7B97D605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:12:18 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q21so286887276iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OzxbHMyLVHiQEYnFQcKxsWMV1qVGFJmu0igAJfkPht0=;
	b=gptJaK+zUM0tw5MTHZBeEMcQv9L8loKj97Q8ct1fNawbYY5j3N/q/AVx8rqfmr4LZx
	nH1HHag7rgcaLK5/cjazx+g3vpSfnmqvYtu9tfxTTiNx5SN89hM0JSNX7ol6Y49rN+XM
	B0ROCjPdhCxFjJY3FaNNrsTrnA0TVNU1ohZz1nFkQtLFWtwWgza63ygUa3z1BYsCQnxK
	pC81bP4PBrM8r+kyy4tJltTvqQ59Cl8hbBBqlNMrrWqxQocirgmvSONyb3ij9XV2ZwU2
	dx8HFmN8yJiOZ5qfzK1cmrYuTa9NiCIZPA4DiGjjBCa/FWfLjRVynfn8RLOg4PhLplNE
	KDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OzxbHMyLVHiQEYnFQcKxsWMV1qVGFJmu0igAJfkPht0=;
	b=HDPW6/YLIzF1bfkV0ljXD6jCIiwbjaASK997hggVx/V6BiL8kePD+19sk0xdZD2+/S
	0Ac62bTTF0YV1oSiswX+2BwCg4Ma1BAV4IsJkbPS4KxxHOXhxQLyjnK/XRKmkIulujpA
	ejMt+zJAZ7FmXY4F3bPvEpCaX89KZd/dlrqTxnMHA87INulN85le0iY9DpiXJbKvrI7O
	rXCzXbeM56LNejVxqxT2W0n9XMpWcUt+H59fHCCW1XylfDhuj2E9cnoIh7uv/7IUPXe7
	DQ4/A7D4KatqaQdeWQCgUHyvQftfVFm5Zi0rEl5ggLD63lRFDv6qe66pMAxfYoP7fLbY
	TH2g==
X-Gm-Message-State: ALoCoQlGrbNDqDqr8RMEfE5FyfB/mRB6BUgIGKB99jOJuAe1BWwNHHmago87NbDawUJ43SflukqVplnCB1HZSLGMMM7IVmFh7mnb+Myvgb2jWqOUnh/6sHs=
X-Received: by 10.107.164.161 with SMTP id d33mr93234730ioj.148.1452262339660; 
	Fri, 08 Jan 2016 06:12:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 06:12:00 -0800 (PST)
In-Reply-To: <CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:12:00 +0000
Message-ID: <CAJTo0LZZhpUtmaKpkHf-NCtRBAt2KRx8cVoSpOQEH9eheFTP8g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:12:20 -0000
Content-Type: multipart/alternative; boundary=001a1141c976e06ba70528d32c23

--001a1141c976e06ba70528d32c23
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:

> |                  int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
>

ftw != fts, of course.

Looks like FTW_STOP etc are glibc-specific.
https://github.com/commodo/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch
seems reasonable, assuming it works.

Ross

--001a1141c976e06ba70528d32c23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 14:00, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags =3D FTW_DEPTH=
 | FTW_ACTIONRETVAL;</div><div class=3D"gmail_extra"></div></blockquote></d=
iv><br>ftw !=3D fts, of course.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Looks like FTW_STOP etc are glibc-specific. =C2=
=A0<a href=3D"https://github.com/commodo/openwrt/blob/master/package/devel/=
oprofile/patches/100-musl.patch">https://github.com/commodo/openwrt/blob/ma=
ster/package/devel/oprofile/patches/100-musl.patch</a> seems reasonable, as=
suming it works.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1141c976e06ba70528d32c23--
