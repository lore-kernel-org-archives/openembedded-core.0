Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4C677042
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 16:09:57 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x131so156652776ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tluOzUzWM1w/E3NPJS9jDC6LIteIVVNDNzxFg1MpSRs=;
	b=ACqo6lYy6huEjlfK0SdJU2kzR8aMkrDhPuiJcS4yCYDGZtAtmXD/aitCXr9R74GUp1
	cODBBqCimK3CaEYhvT39dkkqI8z2hhW5opCASM0oI7MmlWUFC79xsidFa7EvLweL3Y0+
	cXgM+bfpgzRFRDjNJdI8ak5ync0AmnAR1naNwRNu1RwyyH8v/+hESsiFXd5pMJJPERpw
	ChKikhpkwj1bYpINirVIFSeaCUkjbrpcvSIXUXcx5wKW+FsrjYnlr1kbNCo2xSrffINE
	Gy3YGi/hfk5JvMstPIDZwnIQGwvpJPAIIxoxwuzwzn9DcXi/Rj+5JjF/aySMH5j1O2yN
	zpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tluOzUzWM1w/E3NPJS9jDC6LIteIVVNDNzxFg1MpSRs=;
	b=evk95nXaZNyI+yQoVSGkgk3m/3gy0tCmlgFiuHY8CtHBP15qMi810Mm1GdO+yrpI+L
	f2BK5uJSraBMnsC3QDj5QaJPT3198w0oCZzbyqtiN/yyVbH7JlGkNuWwqS5JXSygmtDS
	WS5WlQKMnIPc3tEC8Si8Hfpc2M89Q5PwpP2FNkqwuCryDqXnVQNvn0kdELQdHSpJI/wD
	MdCBb3V8bYs+SJSu/o02CLd4IyU1/Ub9UnoeefGIqV0UFE9l2rHDa5jB0Z3ebtoDgI8/
	9Q74ZMOfuIkmu3+ctHANKjZJgI+lGO+EvIlGaQDTP/Xy7S4gv32maXMer5UiWbWqRprb
	UPFA==
X-Gm-Message-State: AEkooutkwI6gnE193ClHeivnxnoyq11Oz16tAp5WcLXfUPzsS+gd4WT2cXll4FbbiJDdVOyxbsM4UaMEwrIfrh/S
X-Received: by 10.107.138.212 with SMTP id c81mr29499735ioj.148.1471968597716; 
	Tue, 23 Aug 2016 09:09:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 09:09:37 -0700 (PDT)
In-Reply-To: <1471897513-13103-1-git-send-email-ross.burton@intel.com>
References: <1471897513-13103-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 17:09:37 +0100
Message-ID: <CAJTo0LZB=JZd78XzKnQdhcga4nn-DmbADH5fR0GV7jsz48+LUg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-weston: add sudo to image explicitly
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
X-List-Received-Date: Tue, 23 Aug 2016 16:09:58 -0000
Content-Type: multipart/alternative; boundary=001a113ed932636d10053abf65b0

--001a113ed932636d10053abf65b0
Content-Type: text/plain; charset=UTF-8

On 22 August 2016 at 21:25, Ross Burton <ross.burton@intel.com> wrote:

> This is a very rough image for testing purposes, and the OE automated tests
> expect that non-minimal images have sudo in (for the RPM tests), so
> install sudo
> explicitly.
>

Retracting this, there's a better fix.

Ross

--001a113ed932636d10053abf65b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 August 2016 at 21:25, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":237" class=3D"=
a3s aXjCH m156b3edb6f3f511e">This is a very rough image for testing purpose=
s, and the OE automated tests<br>
expect that non-minimal images have sudo in (for the RPM tests), so install=
 sudo<br>
explicitly.</div></blockquote></div><br>Retracting this, there&#39;s a bett=
er fix.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113ed932636d10053abf65b0--
