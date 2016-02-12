Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 81F3B731C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 14:21:50 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id xg9so10425106igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=K9D+6072Z3Z5Q0GPFbwUEvFf/1U++PW0GJ4unhO4zwA=;
	b=e6hj3HU+chYUncbTFthqaZ3oiqqe9j1Gb0e7OfT/xC4wl+X94J7IkwCi1oW0/BgULX
	TGoTK8QmUhTO3sGqyA1Hyfg7ogscrcOr8tyRR2eNmo8CJLbqIQG+DjtnANpCU2YC1V74
	gtbcZgmXBgc5xe2mbN30W2c7un5RZ1e7zLVRhyXZ/aadDh0xhtjGlQCSKGmKmaU8r9Lg
	hTMlw9OAWbNFeTWYs1ldPilK9ThgyYNc9Rvcj5WkEw89IuyW0rD7cHM+mtTZAmwcupVT
	YJQURbJ4URAkkckA0Rcz9Gw2Lxqfo0lCrZThFEU/n3SwyotYlTnNWqffyipnsvztM9nQ
	gMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K9D+6072Z3Z5Q0GPFbwUEvFf/1U++PW0GJ4unhO4zwA=;
	b=XBvcCRLy3E7ExJU/zeE3h+YWeo1muxst50gaXMSr06vinv3CPev9mg/CytStDd+qpN
	xgFYg56CWCEVboncb8ux7cO2C9GdRwkRfuKV/07DkGZhlOCP92VffZrPx035jZwPMxn/
	Ulk6/C1RPVEw5VTbWx7YMbeAip7BfqAowoXKKEuiMJlwnV9lW9fYnZxW6CULz9JD6J6p
	IpBDXrEkSIrvKoU9iiYS+zBI02o5NgwLWCaRsWpWJ6XtmcLwoAsQsTl99uQcTJqRHN7T
	4wt/6IIN16Pa+6BA8A3rdKKf0KW2g9ZaLJTTBWHsPbPpPKxsdzAAv1P2bKnfokH2aoaZ
	stQg==
X-Gm-Message-State: AG10YOQAeNBi70MicZ/dNvcgas2WTyQEI1B4IdEvxTYCkohGIDG4I++jMNA45htvZm9h4rXTDM6QKf1snTSM2K2o
X-Received: by 10.50.111.111 with SMTP id ih15mr4476422igb.78.1455286910873;
	Fri, 12 Feb 2016 06:21:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 06:21:31 -0800 (PST)
In-Reply-To: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 14:21:31 +0000
Message-ID: <CAJTo0LYz=rsEXk8yuwUosknAbN8d4JPNeqV7RBtBt_KF8e1gQQ@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 14:21:50 -0000
Content-Type: multipart/alternative; boundary=089e0149be345e8ee1052b93637d

--089e0149be345e8ee1052b93637d
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 12:15, Dmitry Rozhkov <dmitry.rozhkov@intel.com>
wrote:

> "
> a lower-case string (mostly numeric, no spaces or other
> characters outside of 0-9, a-z, ".", "_" and "-")
> identifying the operating system version
> "
>

To quote from the paragraph above:

"Variable assignment values should be enclosed in double or single quotes
if they include spaces, semicolons or other special characters outside of
A-Z, a-z, 0-9."

If the Clear updater is failing to handle quoted values then that's a bug
in their parser.

Ross

--089e0149be345e8ee1052b93637d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2016 at 12:15, Dmitry Rozhkov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dmitry.rozhkov@intel.com" target=3D"_blank">dmitry.rozhkov@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":2jl" class=3D"" =
style=3D"overflow:hidden">&quot;<br>
a lower-case string (mostly numeric, no spaces or other<br>
characters outside of 0-9, a-z, &quot;.&quot;, &quot;_&quot; and &quot;-&qu=
ot;)<br>
identifying the operating system version<br>
&quot;</div></blockquote></div><br>To quote from the paragraph above:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&quot;Varia=
ble assignment values should be enclosed in double or single quotes if they=
 include spaces, semicolons or other special characters outside of A-Z, a-z=
, 0-9.&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">If the Clear updater is failing to handle quoted values then that&#3=
9;s a bug in their parser.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--089e0149be345e8ee1052b93637d--
