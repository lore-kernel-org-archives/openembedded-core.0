Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8267695E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:40:39 +0000 (UTC)
Received: by qkcs67 with SMTP id s67so47462220qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MdQfeqfhMwEjK6OQZipYEI5aPURlHP330bCOsrqrCqQ=;
	b=HPpI6OvLXdQ20rOaUq/G7Q6XXJRspMsY3+Ah0B22t0O5+vgJLutHPVpHr7Ms/QwHng
	Ayd9xR1dA02k4zr4JNUmlLa860ca4RLsbIor5+cjqCopQiLOt2S79xOSXmBGPXcE6M0J
	tkwwSsq48/kxf6DRg0h2R9m8vMYgj6P/zZRe3BTQdDqVUhGveryxBQ+gzFHysKhWL+oV
	BM1Oj7NgqA65U5gGX3t6J39q8+ZsMzclZ9u5XNaZ+e9YgEeYdkRvEuew5aSwdoFqd/r6
	SLCRq9d/OjYJ9+Khx2KLD6YFxMptGZXcjNjYtAgZ0WrzKKhhON6nh6NMbvGdU6rdkmc1
	h6vg==
X-Gm-Message-State: ALoCoQn5sv/U+MRHpEcDTQcqefN8lhA6G4CjZ+5FLOgl0ZYWlnV1f68gdQa86f0v/pHyO59exwtm
X-Received: by 10.55.20.207 with SMTP id 76mr21252880qku.67.1439304039091;
	Tue, 11 Aug 2015 07:40:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 07:40:19 -0700 (PDT)
In-Reply-To: <CAJ86T=XSFiXWE_69rGzJkxUd45QT_KhDoRsuWFpEXB5xD3=8+g@mail.gmail.com>
References: <1439244450-10472-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJ86T=XSFiXWE_69rGzJkxUd45QT_KhDoRsuWFpEXB5xD3=8+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 15:40:19 +0100
Message-ID: <CAJTo0LaKVE-EZRjJezOD8gJHVd+Pk4JB51P6UceZ27b8W=J1JA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mc: Fix QA warning RDEPENDS of util-linux-libmount
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
X-List-Received-Date: Tue, 11 Aug 2015 14:40:39 -0000
Content-Type: multipart/alternative; boundary=001a11400532f963f6051d0a153d

--001a11400532f963f6051d0a153d
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 00:54, Andre McCurdy <armccurdy@gmail.com> wrote:

> I guess adding util-linux to DEPENDS would be the correct fix. The
> runtime dependency on libmount will then be detected automatically.
>

Yes, that's right.

Ross

--001a11400532f963f6051d0a153d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 00:54, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"=
mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qn" class=3D"a3s=
" style=3D"overflow:hidden">I guess adding util-linux to DEPENDS would be t=
he correct fix. The<br>
runtime dependency on libmount will then be detected automatically.</div></=
blockquote><div><br></div><div>Yes, that&#39;s right.</div><div><br></div><=
div>Ross=C2=A0</div></div></div></div>

--001a11400532f963f6051d0a153d--
