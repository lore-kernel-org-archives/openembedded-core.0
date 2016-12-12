Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 11B9F71A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:55:43 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so76057516qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sfotl8mTWUbnS0Pe4ydNnSuzQSpMtf7gW/x0JR6OAGo=;
	b=vYMdsJLRaQCuFTNRZ/E5c3ygcgFGVYXDJlWVeEnpkJxjsl3egcMgEZLQ5PSz/L5BU5
	fRmvlpnegmR7wKVsWe1M5HrH39uyI/aOty8TJQ4A/q2G6cz3W3XTS2qvvRM91imY4dPC
	/TUD16cpe6UaJJ83WjAHxc+uOHTTzFcS0h/pKsb70z7gUj/5t8RvnIf9NxZSR/yY6s21
	VZE0OzzBkFw3+i1/8ofN7KPPIHn5Eam1SIAd8EJXiJSlM/xboynGVmxQXaP1hvjQHI06
	s8U04AIhKvJ+/nqPsipRcIE6iMqKVxHCi7hYs2gbvF2Uk+d5KKb8Rz/fvDQYmJ8/sfgq
	xRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sfotl8mTWUbnS0Pe4ydNnSuzQSpMtf7gW/x0JR6OAGo=;
	b=ApjoxkYaawBSA10iu5fML+Y9dLx6tV/lWL17e9LkfqoLlJBRrBssWUtJ/nt0UTjdbx
	SDsGDnHS9sgSbSnqEAiXxYyfXMfrj9UxWETAx2sdsvgdg9gZYYN6qiqTVPUHeRn07JeW
	WS4vcCcGs/q2j2lg5z7e2WbWOsIFnnAydYriw4cyCCy27ftU2s3hcY8EHP7bCIhsYLlg
	QaS1uh7QRJ4q0BN8xEQcIjnW8hRQc8fUavPdQIftueRiTJyUOY8UstFzJonXecVKZD9A
	GaOP6cJTxr08txW+fGMOB1M3JdWB+j+xAXxaiDpvJR3USP6DqcygQ8DoKLbsKCdQ0TYO
	V8kg==
X-Gm-Message-State: AKaTC025f1+JtNN4+hMl4mJv7lY36NmW/3M2chumfDpK6nbtPBE8EnnrtNFsbI9aL2Kn1ip7LaUYqtF8XX/w7ffq
X-Received: by 10.237.61.42 with SMTP id g39mr88920329qtf.65.1481550944324;
	Mon, 12 Dec 2016 05:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 05:55:23 -0800 (PST)
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC0143F6AB@ATNETS9912WMSX.ww300.siemens.net>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LaQJYV17g0oc3Os_uqa+a33tGXJwya4s-jDpotweBEBwA@mail.gmail.com>
	<D55698ECEC159B488D62A508E18D7FEC0143F6AB@ATNETS9912WMSX.ww300.siemens.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 13:55:23 +0000
Message-ID: <CAJTo0LaEpW94oxfJB77h5zrp4OhhCavfutT-bkhXhx_cOQ9sLA@mail.gmail.com>
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libxml2: Necessary changes before fixing CVE-2016-5131 Fix comaparation with root node in xmlXPathCmpNodes and NULL pointer deref in XPointer
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
X-List-Received-Date: Mon, 12 Dec 2016 13:55:44 -0000
Content-Type: multipart/alternative; boundary=001a1142a3eac0e319054376759b

--001a1142a3eac0e319054376759b
Content-Type: text/plain; charset=UTF-8

On 12 December 2016 at 13:53, Valek, Andrej <andrej.valek@siemens.com>
wrote:

> I think, there was a web-page delay. Patch 3/3 is already there:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-December/130046.html
>
>
Yeah, obviously posting about it meant it arrived. :)

Ross

--001a1142a3eac0e319054376759b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 13:53, Valek, Andrej <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"Ms=
oNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quo=
t;sans-serif&quot;;color:#1f497d">I think, there was a web-page delay. Patc=
h 3/3 is already there:
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-D=
ecember/130046.html" target=3D"_blank">
http://lists.openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-De=
cember/130046.html</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Yeah, obviously posting a=
bout it meant it arrived. :)</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1142a3eac0e319054376759b--
