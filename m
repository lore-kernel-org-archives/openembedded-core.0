Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id E83D577442
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 15:23:22 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k19so6949791ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=oLg9vKuTgcTvha3sBVeFhEaeITUj+libXXTXHdwWD0k=;
	b=nURgvXSiUpFJMux7J0IG8exlcRnPARPg1KAlRBlcPmvjDzYZLnbprVGg7sxtv9qtti
	kspN1REc+X1QNvB9i6lQjbmx8vPaf5w2W602mrC4ojCTXRremTO6+lvkNpOrL+0WEiwN
	dbt0ez+6AXNm5o1mgSCsCfFRxKvRZM7mUds0iQ+cVAT1eBpeEbtLXGTIgRH8yTgT0wVZ
	V+tuX2OGMMsOgza1h7Fci2Fs7qaYfgUjaB0xz0mltWZhjgbY3/9pP0E2oDJQ8C99bD5/
	KwFs9qDX2Wqot7aYs7TGFKy9WSKbjUNi0ixBGBfPBXfLL1yYqYOVrFjG4rovDQTztwly
	/ZlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=oLg9vKuTgcTvha3sBVeFhEaeITUj+libXXTXHdwWD0k=;
	b=vidWNDKwkj29SaWGk/eZxAyilk/C+zON0JCVbzQSgxC3YmcLcpBwfzgndRytmxi+lZ
	F1DLPWnzFBFe3cvKHwjfwmf+ck3KVmSr5Mh3COaQerkrFowU853EjvY+/Zd0h1CeXcDI
	+usJ7V5lDACRNhlVDoWKOEb8ZE0LdG8vwYxtQMlb0hTMMpifOe96j4LLoRERlv41anl4
	P+vN6wMM5gkosIiesygGvKulgt1GPhw8cCk+hRoizxGdKr/NKMI5vEquS3LptyVWeLG/
	S2KIeOSjy8KTWrUjFYXdfxs5hGP/Xbpsgp1y5NqO+7R8jrdp57iNI3T2KuUmx/HLLg5l
	ofFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=oLg9vKuTgcTvha3sBVeFhEaeITUj+libXXTXHdwWD0k=;
	b=bF8xRDZzKCP8ZK0JktVeK0x6G51Bk/jyySRAaD612tvrmb5an+YukVGw3H+fUorl0O
	a/8raOam6oTteogxujqPCz62FfuPc6kptRWqJJNc6FnYHtcvOp4MRVp9lGYT5W9lJFGE
	4ojbuKAezKGH1eiHnEz9VQPZpTtyw4KLarpfYJ82HkBCSIf5QcBmaYkIQLJ0saxf6CSN
	Ozaz9Vu2wKtJsul5pY1N45dRnd+znsrOKTqdWUC2mdRJd3AG2VgSS/o+drnViGFfcG0r
	KtaCxNqxL1CCYz1LDU++odJaTciqb//tfypQ+amTVkDx3lR/b90yxFMfNhm3rw909PEj
	1wgg==
X-Gm-Message-State: ALyK8tIO5u5MvdlKAVB+MUlCTWtHHlNA2cE2dqL12mEYEfbLW3X0BwazR21i/hiMkyVC504a99uQeNuXr371UQ==
X-Received: by 10.107.131.222 with SMTP id n91mr1376336ioi.126.1464881003269; 
	Thu, 02 Jun 2016 08:23:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 2 Jun 2016 08:23:03 -0700 (PDT)
In-Reply-To: <1464852717.9588.12.camel@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1464852717.9588.12.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 2 Jun 2016 08:23:03 -0700
X-Google-Sender-Auth: nRHdIPhtZ9m8FFtTG92yIrdpUMk
Message-ID: <CABcZAN=nZo3oMWZYyP=tUrZwC55HaR_6TM6Tmd9ES-Jtoor=cA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Python3 for bitbake/OE merged
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
X-List-Received-Date: Thu, 02 Jun 2016 15:23:24 -0000
Content-Type: multipart/alternative; boundary=001a113ebd8cd6977105344d2f99

--001a113ebd8cd6977105344d2f99
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 2, 2016 at 12:31 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I just watched things break on the autobuilder as trying to keep the
> python3 patches in sync with all the other changes coming in was
> proving tricky and not really a productive use of my time.
>
> I've therefore merged the python3 patches and bitbake is now using
> python3. If there are any further issues, we can fix in master. This
> may mean some other patchsets need to rebase.
>

Huzzah!
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ebd8cd6977105344d2f99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jun 2, 2016 at 12:31 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":oa" class=3D"a3s aXjCH m1551006f434af00d">I just watche=
d things break on the autobuilder as trying to keep the<br>
python3 patches in sync with all the other changes coming in was<br>
proving tricky and not really a productive use of my time.<br>
<br>
I&#39;ve therefore merged the python3 patches and bitbake is now using<br>
python3. If there are any further issues, we can fix in master. This<br>
may mean some other patchsets need to rebase.</div></blockquote></div><br>H=
uzzah!<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBa=
ke, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engin=
eer, Mentor Graphics</div>
</div></div>

--001a113ebd8cd6977105344d2f99--
