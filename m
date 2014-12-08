Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 976AC65E1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 20:52:28 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so4126529qcz.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 12:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IF95437WtFd6aSYyI8M/NtHPRRnMAA8Wu3D1if5OxD8=;
	b=d1OZks6NfvRdBWPsif2xlWn0HZ1MEcK6ga3DpfeuEoj4sM4eyqbIEp3tFjgo3N16Zm
	Js/QWGyoI95MyDQqVEZI8+QmhThvkmam5WmOGG1ju9l0n0dgSZVS5rD25Rjj3JTN0hSh
	T+4RrqdfcE8TiJDHHtAtOfaYyfjYZEhkZCHKVCGUMvcNNphhX6H6YKFyeyW32zT1tLhM
	xMOoGjjzsZFYoAfa1k0cZ8BlrZRFU6i2wDBdUv1O0qgT9uGJ/Y/aMhJW/u8ydXTYKQvN
	uNQQRUlnKbCkwn7yU92qMITAlbbKm5UgAmzcV2/KUJPavqX2BflDRFoifxgODNNqv5EM
	/6wQ==
X-Gm-Message-State: ALoCoQnCjDq9B1hR80VD3r0ZJ/ZhJJxaw71FkaD5jxu+FRNWoJvJW/MYX3TPK9sYUa/WNARx1hZj
X-Received: by 10.229.53.133 with SMTP id m5mr56398530qcg.28.1418071948682;
	Mon, 08 Dec 2014 12:52:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 12:52:08 -0800 (PST)
In-Reply-To: <da79c0d110feb7a11e082722c44a0f034afe5aa2.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<da79c0d110feb7a11e082722c44a0f034afe5aa2.1415350038.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 20:52:08 +0000
Message-ID: <CAJTo0LbaEMd3jn8W37awE1B5QjWZZ34ZoGnKM9xfmbWd_J0SXQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/24] gcc: Disable aarch64 multilib options
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
X-List-Received-Date: Mon, 08 Dec 2014 20:52:30 -0000
Content-Type: multipart/alternative; boundary=001a1133da32c48b330509ba9ae9

--001a1133da32c48b330509ba9ae9
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 at 08:51, Kai Kang <kai.kang@windriver.com> wrote:

> +Disable the MULTILIB_OSDIRNAMES and other multilib options.
> +
> +Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
> +systems where the libdir is NOT set to /lib64.  This is allowed by the
> ABI, as
> +long as the dynamic loader is present in /lib.
> +
> +We simply want to use the default rules in gcc to find and configure the
> +normal libdir.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>

This patch is missing an Upstream-Status header.

Ross

--001a1133da32c48b330509ba9ae9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 at 08:51, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1yf" class=3D"=
a3s" style=3D"overflow:hidden">+Disable the MULTILIB_OSDIRNAMES and other <=
span class=3D"il">multilib</span> options.<br>
+<br>
+Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on<b=
r>
+systems where the libdir is NOT set to /lib64.=C2=A0 This is allowed by th=
e ABI, as<br>
+long as the dynamic loader is present in /<span class=3D"il">lib</span>.<b=
r>
+<br>
+We simply want to use the default rules in <span class=3D"il">gcc</span> t=
o find and configure the<br>
+normal libdir.<br>
+<br>
+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">=
mark.hatle@windriver.com</a>&gt;</div></blockquote></div><br>This patch is =
missing an Upstream-Status header.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1133da32c48b330509ba9ae9--
