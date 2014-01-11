Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7B65F602DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:16:46 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so5177223wes.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zMgCobNtirWyBke6+cEoMVGYPbiyFzxYJcpw4e+5OJ4=;
	b=c93i9XFe4WHx7mpyDnXf+p+yVrF21lonQMq+HoYwMpxYW6xBR9Z01ZfTzyzcKTVL6w
	zkrPxnBUkQkArOoYiR5VapdymDv6Byescjyg9644LROMg0W8Abs94tu0vxTkGWfKOJtA
	ljXKNSkgEPx8VInCXsaTFqnVsO7sAskEcXJrd/iPlnM443Mrwm6dcAHUPjlLPpr14V2m
	hTzYRigFvbUAhKf4yPK7N+KrUZY39xbCPmC0A2cc5P+/eZy425tXEXMsl+EsUD/lf5mJ
	XEmI6c3+b9H+JRvY7GDQA8VQ9amu5b0zOnPcDUbheAVlPD2ZUK/SJhhAkNUSMHBL5890
	qssA==
X-Gm-Message-State: ALoCoQnmwRW1aZRTm9LH//kdEaMxmdcdggil+P+FtHp60mi350NtvmhxLZISAhgK/S/Jo//UttiS
X-Received: by 10.194.173.163 with SMTP id bl3mr13975704wjc.10.1389453407046; 
	Sat, 11 Jan 2014 07:16:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Sat, 11 Jan 2014 07:16:27 -0800 (PST)
X-Originating-IP: [5.13.221.193]
In-Reply-To: <8969D90B-28E6-4C07-A113-93A9C033EFAD@dominion.thruhere.net>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
	<8969D90B-28E6-4C07-A113-93A9C033EFAD@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 11 Jan 2014 17:16:27 +0200
Message-ID: <CAK18fxGFcszrKH30mhDUAU-sjrJa2t7dHshXj-TWkSnGye1AEw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Sat, 11 Jan 2014 15:16:46 -0000
Content-Type: multipart/alternative; boundary=089e013c6220c26f5504efb35471

--089e013c6220c26f5504efb35471
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 11, 2014 at 5:10 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 11 jan. 2014, om 16:08 heeft Andrei Gherzan <andrei@gherzan.ro> het
> volgende geschreven:
>
> > Avoid a confusion when including thumb in TUNE_FATURES. In the curent
> behavior,
> > if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm"
> which makes
> > no sense for me as a default behavior. Obviously I can change this by
> using
> > ARM_INSTRUCTION_SET = thumb. But this seems strange and confusing. So
> let's do
> > it the other way around: have thumb instructions as default when
> TUNE_FATURES
> > contains "thumb" and switch to "arm" instructions when
> ARM_INSTRUCTION_SET is
> > "arm".
>
> Since ARM_INSTRUCTION_SET is unset for most things this will change the
> default, are you sure that this is what you want?
>

I am aware of that but still, do you find it normal to add thumb as
TUNE_FEATURE and get your self with arm instructions flag?
And generally people adapt if changes make sense :)

ag

--089e013c6220c26f5504efb35471
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 11, 2014 at 5:10 PM, Koen Kooi <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion=
.thruhere.net</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Op 11 jan. 2014, om 16:08 heeft Andrei Gherzan &lt;<a href=3D"mailto:andrei=
@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt; het volgende gesch=
reven:<br>
<div><br>
&gt; Avoid a confusion when including thumb in TUNE_FATURES. In the curent =
behavior,<br>
&gt; if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be &quot;-mar=
m&quot; which makes<br>
&gt; no sense for me as a default behavior. Obviously I can change this by =
using<br>
&gt; ARM_INSTRUCTION_SET =3D thumb. But this seems strange and confusing. S=
o let&#39;s do<br>
&gt; it the other way around: have thumb instructions as default when TUNE_=
FATURES<br>
&gt; contains &quot;thumb&quot; and switch to &quot;arm&quot; instructions =
when ARM_INSTRUCTION_SET is<br>
&gt; &quot;arm&quot;.<br>
<br>
</div>Since ARM_INSTRUCTION_SET is unset for most things this will change t=
he default, are you sure that this is what you want?<br></blockquote><div><=
br></div><div>I am aware of that but still, do you find it normal to add th=
umb as TUNE_FEATURE and get your self with arm instructions flag?</div>

<div>And generally people adapt if changes make sense :)</div>
<div><br></div><div>ag</div></div>
</div></div>

--089e013c6220c26f5504efb35471--
