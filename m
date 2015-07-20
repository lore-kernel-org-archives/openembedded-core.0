Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id ABEF065CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:49:56 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so70577668qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 07:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yT4E+01UBqnFUNZpn3IWubhKCHu498Ml+SHH7YpzVKc=;
	b=dEFWN0lufkGwSwR3MeQMcSY3iJWSrlIi3YnakVV9CXaPCuwetmilW2BSlkWVx+AovX
	y3H4OxiM5ir376XvqXdxmB6kv/br7R19zRro2hT4szD3y1kWmBgD4jIt5nH3jBhnkh1P
	syB9iHexb0bDg7tM3GWBfswc18qXYWiVn3zn2HMFRI/vNi8f85+VP/ggSf4C8PobGLqe
	VnR4GeS8Rc0vSdnqinBN65J5hsPUX43IVzu+t7TFN54yUAvo2rikk61l0JUYWxN5ujOC
	5Pz+0LSilwE/o/cm7eL/cGmMYQe6ujtdwJqjMGixKMd3JBs/4E2jjCPvEZaWGR8wfJoF
	l63g==
X-Gm-Message-State: ALoCoQn0lMKTcIqRALD7p6SclTo7GJueFlma9lIOpM8TS+l5Rt4aQSy11qOyQWyd3uCQMDhBH9t/
X-Received: by 10.141.28.211 with SMTP id f202mr42617781qhe.93.1437403796390; 
	Mon, 20 Jul 2015 07:49:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Jul 2015 07:49:36 -0700 (PDT)
In-Reply-To: <CAJTo0Lajwx-z1DX9W6ovxYU99F6g0tBXyxZBhf73LWjcGe8tCw@mail.gmail.com>
References: <1436965490-8865-1-git-send-email-costin.c.constantin@intel.com>
	<CAJTo0Lajwx-z1DX9W6ovxYU99F6g0tBXyxZBhf73LWjcGe8tCw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 15:49:36 +0100
Message-ID: <CAJTo0LYHhv5WPDY_kJ86jRaBhJDXtcdO3t+OT85V-J++_R5v4A@mail.gmail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/devtool: add useful failure messages for some test cases
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
X-List-Received-Date: Mon, 20 Jul 2015 14:49:58 -0000
Content-Type: multipart/alternative; boundary=001a114218c6aee0a0051b4fa61c

--001a114218c6aee0a0051b4fa61c
Content-Type: text/plain; charset=UTF-8

On 20 July 2015 at 14:40, Burton, Ross <ross.burton@intel.com> wrote:

> I think this patch is responsible for the devtool failures in
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio
> .
>

I take it back - I think the problems are due to Chris's patch.

Ross

--001a114218c6aee0a0051b4fa61c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2015 at 14:40, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
I think this patch is responsible for the <span class=3D"il">devtool</span>=
 failures in=C2=A0<a href=3D"https://autobuilder.yoctoproject.org/main/buil=
ders/nightly-oe-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio" =
target=3D"_blank">https://autobuilder.yoctoproject.org/main/builders/nightl=
y-oe-selftest/builds/78/steps/Running%20oe-selftest/logs/stdio</a>.</div></=
blockquote></div><br>I take it back - I think the problems are due to Chris=
&#39;s patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a114218c6aee0a0051b4fa61c--
