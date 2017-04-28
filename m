Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7D08C77E4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 19:28:25 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id g60so58225796qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nsnRhwvzVb9GdmgY0iBfHOCepjgHLDxbjmXAWinLytA=;
	b=QF6MLqs73PAqDBtHDvZ+tQYNYgBxe3jMkkGIiuGFXeSRBVGD1VRlfk4jiWFpWKBHxH
	AMRobmqkcYfDSCdHiXr4tqDBUmgGmMnIIsoJBU2gAjEghkfNvRSIDhjPNgNYwPA/QIP/
	7sAXOgZK3rWgwlc86H0xz+yxHPju+6QnlqC06Ahqw0fe92X7OGxO7MbeK9E53NJULT8T
	P6zKN4mx6/jJio9y/ToVhKfUTDu015mt3V0URj5wSlO0DaxVn22NbhDoldR2Z479bBMG
	Lau23Lk/Y43TLyv8se1DQm3RjNN1eysKxUnQkNc6pPXRHo1Y3eg1kqvX3nAsrcGk6oa6
	YtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nsnRhwvzVb9GdmgY0iBfHOCepjgHLDxbjmXAWinLytA=;
	b=bouRpN55B0iHA4Rij1q/AbKnuFPTCZlDSrosurqIayagZranKPdTHdSV2qX+//1OUx
	XlnPr/Fpr1DzEgbzANIyfszHh7zblgYAWole2eYEw8paVJz2zAhjn4xD139BUFo7gDja
	dN96C7gV1/Gtdfbmrh4cK7awr45+aKaDdrc5MnjGsXkderbufFmnAX0UXoNxkxwQRURv
	I0mt21BBL1A708U0W3Y1uvzXevJohL4oK6c1WB5+FgFPlEtwkPetSPiuDQFjiYI8GdX+
	6i4W45XLly4PNsL9AZqoAmhvM91eEdOF2/5kn2OWH9ufB6bSEP453kIHNYDPw39gR0DD
	CseA==
X-Gm-Message-State: AN3rC/6VHSoiYVZ7qh4Wnu7+l00ZGSDiZUT89ejAFTvRrBXcvaltwokt
	j229AlITIk5ASOSr1vHUawLVML47xQyv
X-Received: by 10.200.34.162 with SMTP id f31mr12237286qta.65.1493407707236;
	Fri, 28 Apr 2017 12:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 28 Apr 2017 12:28:06 -0700 (PDT)
In-Reply-To: <CAMRMzCA9gE7M1NGgkF=DpnHd4sAF3aAHo=guuhY7yEWQieYo4Q@mail.gmail.com>
References: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
	<1493385304.3156.5.camel@iki.fi>
	<CAJTo0LZsEnqepWkqtEubN04A6+XYzcj+wpATT8jg20pGk1hF4w@mail.gmail.com>
	<CAJTo0LYbd9c=hAPRtQpLEpHPMnO-yoRFvvJ58-K+ZwWmVUiuMg@mail.gmail.com>
	<CAMRMzCA9gE7M1NGgkF=DpnHd4sAF3aAHo=guuhY7yEWQieYo4Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Apr 2017 20:28:06 +0100
Message-ID: <CAJTo0LbAXpKARn+B27fWkbAH6MZ76J1G2QM0fGsrQaReONJ4SA@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Fri, 28 Apr 2017 19:28:27 -0000
Content-Type: multipart/alternative; boundary=001a114027ece523c4054e3f13d1

--001a114027ece523c4054e3f13d1
Content-Type: text/plain; charset=UTF-8

On 28 April 2017 at 19:01, Marc Ferland <ferlandm@amotus.ca> wrote:

> Tested with opkg HEAD revision. I also tested with 0.3.0 but it seems the
> 'compare-versions' command was broken...
>

Thanks for verifying.

Yes, it was.  I tried writing a test case for this last year, discovered
that opkg had three commands to check version that behaved differently, and
rpm5 had no programmatic way of accessing the comparison logic...

Ross

--001a114027ece523c4054e3f13d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2017 at 19:01, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ferlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Tested with opkg HEAD revision. =
I also tested with 0.3.0 but it seems the &#39;compare-versions&#39; comman=
d was broken...<br></blockquote><div><br></div><div>Thanks for verifying.</=
div><div><br></div><div>Yes, it was.=C2=A0 I tried writing a test case for =
this last year, discovered that opkg had three commands to check version th=
at behaved differently, and rpm5 had no programmatic way of accessing the c=
omparison logic...</div><div><br></div><div>Ross</div></div></div></div>

--001a114027ece523c4054e3f13d1--
