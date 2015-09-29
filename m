Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD22A76FED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:42:00 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so3902949qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 07:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NOztXsjnBpbWtQOHqj1bZUJbKhHm5IQdIfdR6UxTtpI=;
	b=XVgO5cUG1/OXMlGZDcd3X+Vp5DmNKL7D2yijfjVSUmgyl+F1Zi9GpVMVp1/YIvcmGv
	iBnGXFEIz2gez/lmv9kJlaN/F/mX7FUae2oXIKi0z2gJU6lUWsiXvb9ziA0ycxzLVUea
	yJw1onqW9I0yo0n5mcep0QBPWzUwep4/MdoDIiVeZiHDY7v+gR0nfWs0BCr3wIpWOAm4
	5QJ15SkuWi1vSkkTfZZS1WhFn4fhXUKx9V2dxH5t27h5WNoFFCOT4HctalahLrh8whMR
	ujuBKTMjPW+J3ysneymZDjAkTVrmvwg8LWfsVY4g9jmg2zTmAq/9zrI8w7a54ou20kHY
	IoKg==
X-Gm-Message-State: ALoCoQnAhu1X5LPNR58DzwumfZ+5ou4NSeoRqxmH3mHgkSa3R6cJm7x2/w4CXoX5oX9rXnxNI5ev
X-Received: by 10.55.25.42 with SMTP id k42mr577800qkh.83.1443537720254; Tue,
	29 Sep 2015 07:42:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 29 Sep 2015 07:41:40 -0700 (PDT)
In-Reply-To: <560A8690.1050809@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442225233-18899-1-git-send-email-andrew.shadura@collabora.co.uk>
	<560A8690.1050809@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Sep 2015 15:41:40 +0100
Message-ID: <CAJTo0Lb3_VLJdSJbDzYuAQiBy4o-soxu_oMco8FEpYWqBx8sww@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] dbus: merge .bb and .inc
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
X-List-Received-Date: Tue, 29 Sep 2015 14:42:04 -0000
Content-Type: multipart/alternative; boundary=001a1147f2b00937b40520e3d110

--001a1147f2b00937b40520e3d110
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On 29 September 2015 at 13:39, Andrew Shadura <
andrew.shadura@collabora.co.uk> wrote:

> There hasn't been anything on this for two weeks already, has anyone
> considered merging these patches?
>

Sorry but they didn't quite make the M3 deadline (well, the patches did,
but reviewing didn't as we were heads down trying to fix the build).  If
you can rebase and resend when master re-opens (when 2.0 is released) that
would be much appreciated.

Ross

--001a1147f2b00937b40520e3d110
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Andrew,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 29 September 2015 at 13:39, A=
ndrew Shadura <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.shadura@collab=
ora.co.uk" target=3D"_blank">andrew.shadura@collabora.co.uk</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2df" class=3D"a3s" sty=
le=3D"overflow:hidden">There hasn&#39;t been anything on this for two weeks=
 already, has anyone<br>
considered merging these patches?<br></div></blockquote></div><br>Sorry but=
 they didn&#39;t quite make the M3 deadline (well, the patches did, but rev=
iewing didn&#39;t as we were heads down trying to fix the build).=C2=A0 If =
you can rebase and resend when master re-opens (when 2.0 is released) that =
would be much appreciated.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1147f2b00937b40520e3d110--
