Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 742977321C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 13:19:38 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id u186so21599995ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VYWipGps3GD77m9SFbHR1lfrrLovuQB9aNDGFAbt740=;
	b=XUCWlE1ZfTenAm8AKeEQwgtm+jLkJt/cRGAIMz2TPfmVBfDlRtPxISM6kUh1MlKOM3
	fNXDUvctqWQBXJEga+YHN1H6qA+vWtKhumRGp4DegAXaB+nhtlBsQF+1BPmEwIUa4tXe
	S2YbSNiMCAwmeVE7K0R8+LstRWUgors+3OU2Ut3HV/9Z2/GJED3u5UQTqJeNeMYHOVkR
	vyIbH8TjE3reHYZ4x2yGtARYQNVs13cN45nns10rF0oIPFCtQFwsx3VwPt/+/b6dThfW
	Je2dkGcOJTM/vjqEAvRiX+7P1j1gnM/ryvfa3KATpr7IhyMiL/Ix5AR0BbCaF1ghHAuC
	lVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VYWipGps3GD77m9SFbHR1lfrrLovuQB9aNDGFAbt740=;
	b=b65euGtFqV92awgcFmmsucOjbDoTjcyyzVNzUslxr8qmy+EIZBji+jtwlsCOy97q40
	hoz3swzhZorNezFNWoT9ejyinBLxm5CPX8XRMq4QO5b/FLqiOAcB3NEt7Sr7+sJ1gLUt
	QyD5T4nojQVNpObzehlYok9gNIYpnfw6eIUmEKrohCeTGTyuHoP054u8Wq8HvsEl6yhb
	ElJe8YFLLn/AmCA12rxFaPm7IdOm8GRP64aY0u2tOPovUqV6Ynlzwa04GrBvMO3Makb2
	lJAr4NHjW4q7Vz5HfOzAEfa8VnaR+IPiI4hUc6aIifO8lHfcL/nFE6rmntA1MmtWlXRp
	oe/A==
X-Gm-Message-State: AEkoouupeP+EsN7i0m14T6rMbKYczbnsNQBaKuNvR1PWkMGZGEwBCL8gZIkRWmk3HCOvA5uRUX+QDCA1xbdo6Ro9
X-Received: by 10.36.121.204 with SMTP id z195mr4419173itc.22.1470403178750;
	Fri, 05 Aug 2016 06:19:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 5 Aug 2016 06:19:18 -0700 (PDT)
In-Reply-To: <1470402935-5261-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470402935-5261-1-git-send-email-s.mueller-klieser@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Aug 2016 14:19:18 +0100
Message-ID: <CAJTo0LaEA7hroi6fgNrf_3z0MvL5ckBz3cu4YvUqcq7m1GGZpw@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: fix installed-vs-shipped for bat
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
X-List-Received-Date: Fri, 05 Aug 2016 13:19:38 -0000
Content-Type: multipart/alternative; boundary=001a114aa466257f1b053952ebaf

--001a114aa466257f1b053952ebaf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 August 2016 at 14:15, Stefan M=C3=BCller-Klieser <
s.mueller-klieser@phytec.de> wrote:

> +       if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'false', 'true',
> d)}; then
>

This means the script is installed if bat isn't selected, which I don't
think you meant.

Ross

--001a114aa466257f1b053952ebaf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 August 2016 at 14:15, Stefan M=C3=BCller-Klieser <span dir=3D"ltr">&lt=
;<a href=3D"mailto:s.mueller-klieser@phytec.de" target=3D"_blank">s.mueller=
-klieser@phytec.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":1rn" class=3D"a3s aXjCH m1565ad8f9329ca04">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;bat&#3=
9;, &#39;false&#39;, &#39;true&#39;, d)}; then<br></div></blockquote></div>=
<br>This means the script is installed if bat isn&#39;t selected, which I d=
on&#39;t think you meant.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a114aa466257f1b053952ebaf--
