Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 885606FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 15:32:30 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id o67so469177572iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 07:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YqH95MutxPgMZHS8dP8Lr2DkxPCcBqJyRqKglI3RhAg=;
	b=hl4lt4ouGLiSVAdm2XOmPim2cfrLN+sRIuBye6rskblpNnWh63ufgaUtIy8bVjBJb5
	4os2ITQBONMiw5MiURdskry+2bpvQ6zk3PmOt3AtkEBK0wFtpJZxcfYGNdVKRjWahC1j
	jxQnidw/vhf6ekQhZnNrAzdL6xIfSpCb0k9pHX4eNJw6jYLA7nWgzwjpGptyaahVkuOQ
	Aj5YW5v476J4uSc335igFmD3m+Dg6OQyIBQupc18yhojDiDBHOH+OoOnjOnOoxZqmWMZ
	QIjT0mqn0YWWUXP3ln1BLDF5uC1kO8Q0k8LbSVPLDYKPphJBvOinWk5R3yfR79+AXyBE
	KGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YqH95MutxPgMZHS8dP8Lr2DkxPCcBqJyRqKglI3RhAg=;
	b=GDUBQCbEOZAy3HriGkMfhQC3yAuetdd2WEnX+g6wW3CPZntiy2Ds34IOVeCF8Apxit
	3uy5xupN73i/h6uyAfDlOAnRgCaLqplkYGpizjtDeRwv0+iMt5YfARJFNLMn55ijw7fN
	KjtC/3RneSDcokclN3BxP3asmOGPspkBJMKAgv9aopdqWs1OMomDju7ALUlfHUQ+LyUY
	5qTopIkqHglSuXlPW0C9QP/EpglUW73BWGh36d4+injn+0bN73ZqEcj+8maBGFpIaoez
	4EE18zzHhrCiVV/OTnbumscVyyXITBrTrCCfmyRGaggd+RoIf2IguCToxKSADPn7j/Ru
	oshg==
X-Gm-Message-State: ALoCoQn33j8Nt4gg0QgxPJoWquqRHDyJk4YfQ6pv/lJwWbGY4/TDNih7BT0R8XLMo9fwpLqh6/SSaZtxDXYkpGbA9sD4K6AlXgnW6V5O0CohnopHT5PgZQs=
X-Received: by 10.107.135.104 with SMTP id j101mr57006407iod.133.1452007951450;
	Tue, 05 Jan 2016 07:32:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 07:32:12 -0800 (PST)
In-Reply-To: <20160105172502.5420d4ef@adi-pc-linux>
References: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
	<3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
	<20160105134150.GA2574@jama> <20160105162239.21706269@adi-pc-linux>
	<CAJTo0LZE2vzpyaw4KLNRxPJjaVHYCTRtiA0qim25Y8zPAhQ45Q@mail.gmail.com>
	<20160105172502.5420d4ef@adi-pc-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 15:32:12 +0000
Message-ID: <CAJTo0LYTz-Dz3cbaJMFf8eRFa=mtj8Yx-4HWSOBfZhjBbyuJTg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] x11vnc: remove all references to moved package
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
X-List-Received-Date: Tue, 05 Jan 2016 15:32:32 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92285759052897f263

--001a113ebe92285759052897f263
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 15:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> Just one more question: When you say don't are you referring only to the
> image rename or also to the removal of the distro feature check?
>

Both.  Don't rename the packagegroup, don't remove the check.

Ross

--001a113ebe92285759052897f263
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2016 at 15:25, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1f1" class=
=3D"a3s" style=3D"overflow:hidden">Just one more question: When you say don=
&#39;t are you referring only to the<br>
image rename or also to the removal of the distro feature check?<br></div><=
/blockquote></div><br>Both.=C2=A0 Don&#39;t rename the packagegroup, don&#3=
9;t remove the check.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ebe92285759052897f263--
