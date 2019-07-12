Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B86A7F14B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 14:17:26 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g20so20602970ioc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZH6VBCZfuFLMCY0gAMtwTOkT3oxFALQWXeJJsWoW8LU=;
	b=xeqrz3uzuXXCUaamKcdAN1LMpStYc23HiXATLoi6Ev+fp2/3NityWyCvH6akZNaDmH
	HPi/CJ5DcBAOkK4Gli/EKS5n+/NkeMOKzzPZ/jZo/XBYtcXLP4BDqNg/wwNf6AaVWIp0
	xJXBJ+UKMKv6iCJ6LOrQKiAMiJBsKYwSg4F+m7g6yKvX+S3katu9mTuhg01Gh7Wwj0mL
	2eWkTW91gyKcY+f0cQ+o0fe2qUg5xFusk6qVXMNvYuSdEcqzcG+1OTx4TVQeQf0E0OZj
	OLtejHGWekplXJlM40oMLiIV+odaGbRj3r5i8h7gJ5cx5oDD5spDXmmDbRduYANG5X7y
	zijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZH6VBCZfuFLMCY0gAMtwTOkT3oxFALQWXeJJsWoW8LU=;
	b=BLlUj7O/q01tNxjpbGLPsNyMYf26HruK8s9BHdKF5JmyJNsCQJ6S3MEs1a+6p6uDWf
	Qh+/ZsN3mH/IAcujTzMMyNs51jpXnGFHq/+gZ407/jlRowpoVPbwAhbybmG4hWbUGIfl
	CulGl2CoYIbE3WXoke71I4DkQa2ql0yC0gfTW7u94xqyJoHX75YnMUxqdzfi6MyIDGkI
	y028EGP8TnhWn1huPV6UpB/ErwvZmkqOQwchFyOn6sfhn0Rrri2eUSVasq8dGp+N+QTz
	+XCjKYIrNuY9Yeuo/nQ38cp2eeti/YLWPPsvcmJH6CsYyMphXmofwekVP19a0uiIXU/8
	VV6A==
X-Gm-Message-State: APjAAAVa0UIc2xqg3juxhPzsPjATBCDuN1vROrBriW579FR9kC/k9yvW
	gv99lhtwBrop3ElgjoI8ezQhNz08JpiN5AEVRZ4c8g==
X-Google-Smtp-Source: APXvYqz64yR2ZfVLVG2Vdlybpw1z3S23qs5qkJ4OINAKmc0iBeaV3I34r2fLq5tzxrW5FZ8JKYtfNrxygotj2ec+qKA=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr10549198iop.187.1562941047607; 
	Fri, 12 Jul 2019 07:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190712140815.11304-1-jlock@vmware.com>
In-Reply-To: <20190712140815.11304-1-jlock@vmware.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 15:17:16 +0100
Message-ID: <CAJTo0Lb5xwSks4SX2PAWj9J0zhwuewyb0oMYq2m1ZHFZ9c_YRg@mail.gmail.com>
To: Joshua Lock <joshuagloe@gmail.com>
Cc: Joshua Lock <jlock@vmware.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-manifest: add entry to package the timeit module
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
X-List-Received-Date: Fri, 12 Jul 2019 14:17:26 -0000
Content-Type: text/plain; charset="UTF-8"

(discussed on IRC)

NACK, this is in python3-misc and I don't see a good reason to split
it out explicitly.

Ross

On Fri, 12 Jul 2019 at 15:09, Joshua Lock <joshuagloe@gmail.com> wrote:
>
> Signed-off-by: Joshua Lock <jlock@vmware.com>
> ---
>  .../python/python3/python3-manifest.json             | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 0803ac0033..17d41c34b9 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1131,6 +1131,18 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
>          ]
>      },
> +    "timeit": {
> +        "summary": "Simple way to time small bits of code",
> +        "rdepends": [
> +            "core"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/timeit.py"
> +        ],
> +        "cached": [
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/timeit.*.pyc"
> +        ]
> +    },
>      "tkinter": {
>          "summary": "Python Tcl/Tk bindings",
>          "rdepends": [
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

