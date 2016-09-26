Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 988E36025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 11:56:04 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id x93so89826995ybh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dfoBA2HKJMvZpb0iM8lUdrBOaSJDpiYkM2TN/T7mv9E=;
	b=1Vk28Dqu/8m054qUTsxjonRNvH+4Ulg7fNMfWjHIDZLZTBnBYPyntRCDPxbhy/Huy6
	BjpET4ZOL7jv3PNjrsREH3okDhoCkrvCxOqXA3CHlKajuZ+lQFOC25AcZ27dtPy5eMv2
	MLjLQQmjNIus9BWwjLkcOJ9dA9+BnKHe8M3/jtPPGsdm3ro5mrq1cZCjbqOtdxxWekQA
	frvAtknKaCsiClISbwpkhWs3j9tL/zuzR4x4r6ZHGPH5Tno5NozKxHRWr04VsRc5p0LG
	9x9J4tJqJkLrsnEiz9gY3L8V6ZjFO4VYdaf2oF/KrkWb9RjP0KcDCTrZ6A74pgf1bhx5
	gAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dfoBA2HKJMvZpb0iM8lUdrBOaSJDpiYkM2TN/T7mv9E=;
	b=Hx2UMWnJOxFbDApsKOiXk4U1VWkr61Bw2cyXGmNyJecZOxjZZYZLYZsXxHka8QbKUk
	Pll8iUGxIpa2YRJG9dFCSZfNqs3NjoujQAH5HkTNOGkF9mbx2YUgxahl5i1bm/WFkwc9
	Hf1fXB32UxIBsMKAsIgMdA8umx0h8eSSjNA7567m2uwnCAJvVVHvCxeBF9Enrtc/xrT2
	jLJ5zMUTcG18wrESlBLQm+y+YEPNjk2RUzp0sZj1tprbAsui6/qJjb8mlAY3fV+hLKZ9
	Skxf0a8HBPO1RBKf/d+OPmOW7Hcdu39FhE2ivuoYi6baScyX0o6VRQ9FCdst6qTPxezg
	3NEg==
X-Gm-Message-State: AE9vXwNoiKj7KF1tdv9ev6YxAWGgeSoV/8+ntt0v8T8Q7OeQH2RHdlrwM9h+vFr0VgPelsIR1B7VGwD00xMSBAtM
X-Received: by 10.37.221.194 with SMTP id u185mr16808714ybg.135.1474890965504; 
	Mon, 26 Sep 2016 04:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.206.3 with HTTP; Mon, 26 Sep 2016 04:55:35 -0700 (PDT)
In-Reply-To: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
References: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 26 Sep 2016 14:55:35 +0300
Message-ID: <CAHiDW_Fy0fK2CEh8MAOeR0WmCPJ_=mweSzVk1FbL-RyRSoqGRw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: defining default locale (LANG/LC_ALL)
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
X-List-Received-Date: Mon, 26 Sep 2016 11:56:05 -0000
Content-Type: multipart/alternative; boundary=001a114bca22150573053d67d0f6

--001a114bca22150573053d67d0f6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 September 2016 at 13:46, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> May be this is a FAQ, but I could not find any helpful documentation.
>
> What is the best way to define a system wide default locale setting (LANG
> and LC_ALL) for OE based Angstrom style images?
>

systemd provides system wide locale settings through /etc/locale.conf, all
services will inherit these (note that LC_ALL is not supported). I expect
these should just work in OE.

I'm not aware of anything quite like that for non-systemd though.

Jussi



> Regards,
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114bca22150573053d67d0f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
6 September 2016 at 13:46, Steffen Sledz <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:sledz@dresearch-fe.de" target=3D"_blank">sledz@dresearch-fe.de</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">May be=
 this is a FAQ, but I could not find any helpful documentation.<br>
<br>
What is the best way to define a system wide default locale setting (LANG a=
nd LC_ALL) for OE based Angstrom style images?<br></blockquote><div><br></d=
iv><div>systemd provides system wide locale settings through /etc/locale.co=
nf, all services will inherit these (note that LC_ALL is not supported). I =
expect these should just work in OE.=C2=A0</div><div><br></div><div>I&#39;m=
 not aware of anything quite like that for non-systemd though.</div><div><b=
r></div><div>Jussi</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Regards,<br>
Steffen<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
DResearch Fahrzeugelektronik GmbH<br>
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany<br>
Tel: <a href=3D"tel:%2B49%2030%20515932-237" value=3D"+4930515932237">+49 3=
0 515932-237</a> mailto:<a href=3D"mailto:sledz@dresearch-fe.de">sledz@dres=
earch-fe.de</a><br>
Fax: <a href=3D"tel:%2B49%2030%20515932-299" value=3D"+4930515932299">+49 3=
0 515932-299</a><br>
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;<br>
Amtsgericht Berlin Charlottenburg; HRB 130120 B;<br>
Ust.-IDNr. DE273952058<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114bca22150573053d67d0f6--
