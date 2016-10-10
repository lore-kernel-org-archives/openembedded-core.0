Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 88B606025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 11:37:18 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id z65so67537721itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6GMpPGOS95QQFVqI4yOTPOrfs0rs590T2bKMzZjkYAQ=;
	b=uz3krucyIxhxPnRblT1xjC5NjvnDhosAC9qz07COA/az89iAn4I7WL/ARWe3UIAK8B
	2x0swHsmyAKGvYkfJDMdXsouQHKfRVjvovJnkE6YKhzfdlSVD8c2YqYaj1cMWCVwNzLM
	0JYL3ovOcwWL1Yz46Sq8v6mfN2jcDsAcGTC5wxlK3kEP/PgC/DLnzV2bswS6idqqBdDp
	bhALDfx0mznD/6E8WcHiu8OjuNM1xZAet6XFoDF+IM6rFi/6h3mSOCt4iV9xs16ygKq9
	LpiWD7wQKleSYBwNbghRJbtHpfuUI4eDF/QfwCOjbEc5fmfpSpJIwukzaNEeL/auMIg7
	ZZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6GMpPGOS95QQFVqI4yOTPOrfs0rs590T2bKMzZjkYAQ=;
	b=QSlG6DNlwwgMnmiQG9LiurN+V1Be+JJe/QE8po7npNvTh/Zgq5HVTi+gh10V/HE3/w
	YwyxrAcpe/R7lPxB6MES8Sf3ERcKGeicrBKEa+H4OnBHnlSeav3Hpcu3j+v5R3sF5ni4
	ilswuxsFG3j7BFyii7wYD0cW9IaygLETEIINdCiMwWwEDB8G7APxe6+miBVR69HWFHvP
	tIITL9RhT/XnjcMtfRI8/karfG6uoN6ZxUbwIcof3VpfnHknmY2pfZ3RVeG9ImlhmNbK
	bIKuKx6wjPw8MP4oC4cmwxmp7fMb0YoxYzpYTijrOicGP+5XlK3efNkhR1+HAzXj5bkl
	ItJQ==
X-Gm-Message-State: AA6/9RkWIM5mYkboXn1RQOOIMMYWZu8cZsMhXHtv0q33sb6ul5CaDKU8S07Aqz8CdjDKtrFpdFMpymiybB539zlp
X-Received: by 10.36.153.194 with SMTP id a185mr9197016ite.70.1476099440607;
	Mon, 10 Oct 2016 04:37:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 10 Oct 2016 04:37:00 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABE4A8B3@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48ABE4A7CF@SESTOEX04.enea.se>
	<CAJTo0LY6StdX90T1WF+7z4PDQHNjZYv6wf8ba3vF_=LJ9aLgJA@mail.gmail.com>
	<3230301C09DEF9499B442BBE162C5E48ABE4A8B3@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Oct 2016 12:37:00 +0100
Message-ID: <CAJTo0LZvDLdR-8Vf6i3Og+9+kuAV_PMwih8GBEXqPbD8OuF0rw@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: CVE-2016-0634 -- bash prompt expanding $HOSTNAME patch for krogoth
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
X-List-Received-Date: Mon, 10 Oct 2016 11:37:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e518cf9a8a053e812ec8

--94eb2c08e518cf9a8a053e812ec8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 October 2016 at 12:35, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> I guess you mean striplevel? Right? It didn=E2=80=99t work with stripnum =
but it
> worked with striplevel:
>
>
Yeah, sorry, I've a cold trying to drown my brain.  pnum is the deprecated
name, stripelevel is the replacement.

Ross

--94eb2c08e518cf9a8a053e812ec8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 October 2016 at 12:35, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><=
span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;c=
olor:#1f497d">I guess you mean striplevel? Right? It didn=E2=80=99t work wi=
th stripnum but it worked with striplevel:<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Yeah, sorry, I&#39;ve a c=
old trying to drown my brain. =C2=A0pnum is the deprecated name, stripeleve=
l is the replacement.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c08e518cf9a8a053e812ec8--
