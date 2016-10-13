Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E703D71A03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 20:01:57 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id r30so98070032ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=55KwDq/mdmjB43wKJRMQKRVr1t32dRlJ3NucYD31IIM=;
	b=SPqU1x02mNcMqvSruSp9Y/Ng072GKAG4L+5SD4vVz5vWUpc/beXFPnCbqr0za/58BX
	s875J7VldDpbyG/KtZg0nU169rOYrdtOU3CWk4UciL3FMmQxAEJSLe6H6Ryn6aDehEd+
	rv/Q93bMXIV7EHDLIR5w+AI9H+P+hWe3H82pt9UO3Cl7bcNpFSwF5xvgRrNLhkwB18Ri
	ck3pmmh7KYN+UETULgSNQSLfw9Ohylh9zjs/ABc0U/LapGvDhQpFWB8EMVln5uefimSe
	Slcx8dYyi4J7t8AOGn9bwuO9Gs/JFs2l5gKzwSd7Gqx61wXp2XCxEqjdem0RIJeUgBNI
	bDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=55KwDq/mdmjB43wKJRMQKRVr1t32dRlJ3NucYD31IIM=;
	b=S1mMuuuUBOxqQVdOWbnzfDzaPB0Fbjkxb+vzmKWqrTZ5+BzOgi44TwVraWTh1Ft0gz
	IBmuvO27nu3AjaRWIFCATNIEHc3tdXR/IkKAYA5T/YZiNHHda8dIJx4UWG9NkFCgtnnh
	haKmstX+qhkDaWtOSiHTabKiPOtLmiVFKy/K/T/HEUe76XrPgi+3RYrNAyoyxVsGZ4dp
	qcoR6Tzev9lMUBzgxOc9tKN2osKWXe1CKbtqGhx7JFr1qjR6v/ygImWjczEC+C1bNZvR
	riYNMQ7bvjAkcoL+hzCdv0RLUJAzFptABxKlixyjyuORWKBdEw/viDlEillJr7LsNWcd
	PlSg==
X-Gm-Message-State: AA6/9RlomoQW6yaBd8KTISypWZAF5zmMetFgZe77bwz87aRW7FxqBGro7YiMYBn07RqnvxaaB0hJ8rFfbIyUg+n6
X-Received: by 10.107.5.72 with SMTP id 69mr8281777iof.132.1476388918746; Thu,
	13 Oct 2016 13:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 13 Oct 2016 13:01:38 -0700 (PDT)
In-Reply-To: <1474120545-9100-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1474120545-9100-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Oct 2016 21:01:38 +0100
Message-ID: <CAJTo0Lbz9rqgu2pbhM+uPFdtrWyYaSteNTB8FVixmi-Y-3d=Cw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add two patches for bind
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
X-List-Received-Date: Thu, 13 Oct 2016 20:01:58 -0000
Content-Type: multipart/alternative; boundary=001a113efe2c0da041053ec49559

--001a113efe2c0da041053ec49559
Content-Type: text/plain; charset=UTF-8

On 17 September 2016 at 14:55, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1.CVE-2016-2775.patch
> [security]      getrrsetbyname with a non absolute name could
>                 trigger an infinite recursion bug in lwresd
>                 and named with lwres configured if when combined
>                 with a search list entry the resulting name is
>                 too long. (CVE-2016-2775) [RT #42694]
>
> 2.CVE-2016-2776.patch
> [security]      It was possible to trigger a assertion when rendering
>                a message. (CVE-2016-2776) [RT #43139]
>
> Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
>

The patches themselves need CVE, Signed-off-by, and Upstream-Status tags.

The commit message needs a better short summary (at least, "fix two CVEs",
ideally better).

Ross

--001a113efe2c0da041053ec49559
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 September 2016 at 14:55, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":yl" class=3D"a3s aXjCH m157bbc92da16eacc">1.CVE-2016-2775.patch<br>
[security]=C2=A0 =C2=A0 =C2=A0 getrrsetbyname with a non absolute name coul=
d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trigger an infinite=
 recursion bug in lwresd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and named with lwre=
s configured if when combined<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with a search list =
entry the resulting name is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too long. (CVE-2016=
-2775) [RT #42694]<br>
<br>
2.CVE-2016-2776.patch<br>
[security]=C2=A0 =C2=A0 =C2=A0 It was possible to trigger a assertion when =
rendering<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a message. (CVE-2016=
-2776) [RT #43139]<br>
<br>
Signed-off-by: zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.co=
m">zhengrq.fnst@cn.fujitsu.com</a>&gt;</div></blockquote></div><br>The patc=
hes themselves need CVE, Signed-off-by, and Upstream-Status tags.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The commit mess=
age needs a better short summary (at least, &quot;fix two CVEs&quot;, ideal=
ly better).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a113efe2c0da041053ec49559--
