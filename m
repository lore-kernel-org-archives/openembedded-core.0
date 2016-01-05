Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id D74DB6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:31:39 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mw1so13219416igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 06:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ATWS/2DEbd6m+Fvn5EWvG01ilib3C/FyOid+4dL/6oU=;
	b=oBi0k5rcWPomDRtTh/+l1lVQA82XP0aDcDAPjKjmijo/MWu4RMVuFugOgCxK7SzmTy
	XJv8A8YDE0Ht6icvGHGx8dQ1Q3xYVX+sIT8ePFLl7m4isq7yXyh5Hk+qJV3MdoTYDRHv
	vVwanniIRYVhMVezQQkvgjH2ZZuygozt8lRMXww/xXE5IFYsvCs5sSRK1zE0XgagycBe
	JxQfGkw7yfrPTOhXicLUoUuU85vn73RZNbRW/BwJFHTOKYnUr3I0ngpGcVNNHnTAJrWi
	Ps6+sDHMmazIfmBSQcGf4apVEZd51MnN1o3WxDHyDbrkEHRKce+4V8/HQ0NCF3HedCMm
	DlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ATWS/2DEbd6m+Fvn5EWvG01ilib3C/FyOid+4dL/6oU=;
	b=NKv2kVLKVXKaYtAGe1Sz382amZUaUemV/0L2mWX+pD9TB0FXLkbZZgzFPdiUwC08lK
	FUthIKgKGsgazYrgN0G1SuByqwYE8/5CBf3aJsCKUP0XFqsns/UDbkY6RNMx5QeWHZSY
	Ly1aN9LgPzH4NISuns+XCAxUP1LjjP/oS0nQ+rmk8DUm/ONrPaFYEOX7jJ6neA6FqroZ
	8qXjOrdo0KQKkgcc+m3pZFCFcEfST0BqNzbK4vtshq/AwcEPX9ZR0iDFgQOVIFf6H5V1
	q8UZLm9CdZQwNgA7B9EjMvgo2UkbxNgCUXuoP9ueIjzy6niDNi7+yiUOd79rSGXPCK6R
	bI5w==
X-Gm-Message-State: ALoCoQmsn6/dfSx+dQtOmjT2PFxs5bbKr1/GO1z9lWmMcSCMfid4eDICaEAgNNSRmy4PXcqdEFeVnqKpCuhFPyFPm7MA3G3kSkTkb2tiFlDYD1RnQLOXOhY=
X-Received: by 10.50.22.33 with SMTP id a1mr3841066igf.52.1452004299125; Tue,
	05 Jan 2016 06:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 06:31:19 -0800 (PST)
In-Reply-To: <20160105162239.21706269@adi-pc-linux>
References: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
	<3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
	<20160105134150.GA2574@jama> <20160105162239.21706269@adi-pc-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 14:31:19 +0000
Message-ID: <CAJTo0LZE2vzpyaw4KLNRxPJjaVHYCTRtiA0qim25Y8zPAhQ45Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Jan 2016 14:31:42 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca197677fe05289718b8

--047d7b10ca197677fe05289718b8
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 14:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> Yes and also if there are no x11 dependencies in this packagegroup,
> then it should be renamed to packagegroup-core-sato.
>
> I'll resubmit. Thank you.
>

Don't - sato is explicitly X11 based.

Ross

--047d7b10ca197677fe05289718b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2016 at 14:22, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3z4" class=
=3D"a3s" style=3D"overflow:hidden">Yes and also if there are no x11 depende=
ncies in this packagegroup,<br>
then it should be renamed to packagegroup-core-sato.<br>
<br>
I&#39;ll resubmit. Thank you.<div class=3D"yj6qo ajU"><div id=3D":x1" class=
=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>Don&#39;t =
- sato is explicitly X11 based.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--047d7b10ca197677fe05289718b8--
