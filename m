Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id A154273078
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:46:43 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id r45so21049331qte.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ye9DoebwAWS1/xpoWcSMJNkjyMVc0i+FCA+s2L7qSzQ=;
	b=H+WLGPa7QVzaF5hSFjBhNimXEhmqMYYSJGHhhAKJxUrchu7VAfzbZsQ6mgqS8SUvR0
	8O7TZbUH8toVJe6oa0gEA5MPT4AetlOKhNZdfCUTB6Xifv5JpTIdZa74QUWO3EDO9s7a
	MN2qvj8UkjROvaNiBDnetsiu3KVEL7HtacbzGSfAJLIQ4tsZMjVTxf/SHPgEGiXI6Db2
	yNjU5u3CbttUsAgAdUfzaRg6w1a4fGfuwXZZfTR5KzJpbNSx62z9/fbMJfHA43tu60nI
	MVdcAqrKtcJZgerg7ysgtEUz51zx9qEMFjV0Ewk0SFiJqoo1DqhglpSCRTyaMMgqSsrp
	/XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ye9DoebwAWS1/xpoWcSMJNkjyMVc0i+FCA+s2L7qSzQ=;
	b=EGTbZPtEE+IWmaGQxN1uMdr8Jk9O2Q9UY7AV+Mt2GI9/kdu2H48xZGKTMhmE0o00TD
	EikAYtOiccpqY91DtMqwCOEnfYxd2Q6R0TcoUKOsG3kRXWFuWG5m3LaER1gLYJhH80fp
	wRGvtFH21zyHWbD0RSqcnSdP2XZmgm3EXGF8xV6fXcFsYXbpFkHGBKs/lwBTGGgj6Cym
	CCdJV38B9DWGsOe7oZ3U2eOKZn+JNtc8pAuj2gz/joONsKuw9aN0iYYtrJoHcGCmcWvj
	8VKFCZ3O4zuwdxcXn5WQtLUIdPy5eIeNHywQoHANm6SrSOq+wwaN9fnYZ+v2N+FvU0Ok
	7AOw==
X-Gm-Message-State: AMke39lhWHlq0rqM3Um4mqLpVRKAEkd8OPNwHafBPOb3jhVgyy6ZwMNtKoqo1ePedlptjfRX8OM42rZrUZ5j2ruf
X-Received: by 10.237.32.230 with SMTP id 93mr3648204qtb.144.1487954804441;
	Fri, 24 Feb 2017 08:46:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.41.102 with HTTP; Fri, 24 Feb 2017 08:46:18 -0800 (PST)
In-Reply-To: <1487953650.10512.14.camel@intel.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
	<1487946072.10512.9.camel@intel.com>
	<d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
	<1487953650.10512.14.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 16:46:18 +0000
Message-ID: <CAJTo0LbKggUJcqTKXU8sMeG=4VmpHHJ8uBFPTH7=S0GN4h96EA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork not picking changes from the ML
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
X-List-Received-Date: Fri, 24 Feb 2017 16:46:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9b9c8fba54054949796c

--94eb2c0c9b9c8fba54054949796c
Content-Type: text/plain; charset=UTF-8

On 24 February 2017 at 16:27, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Let me clarify that my original proposal was to reply only to the
> original author. That was meant to keep noise down on the list. However,
> perhaps it should also go to the list?
>
> Then others can help check that Patchwork works, as the original author
> might not be aware that a response is missing. It also tells everyone
> the relevant link in Patchwork.
>

As long as patchworks ignores the email it sends, that's not a terrible
idea.

Ross

--94eb2c0c9b9c8fba54054949796c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2017 at 16:27, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D=
"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2u8" clas=
s=3D"a3s aXjCH m15a70f36ef5ca09a">Let me clarify that my original proposal =
was to reply only to the<br>
original author. That was meant to keep noise down on the list. However,<br=
>
perhaps it should also go to the list?<br>
<br>
Then others can help check that Patchwork works, as the original author<br>
might not be aware that a response is missing. It also tells everyone<br>
the relevant link in Patchwork.</div></blockquote></div><br>As long as patc=
hworks ignores the email it sends, that&#39;s not a terrible idea.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--94eb2c0c9b9c8fba54054949796c--
