Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 516FF6C10B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:48:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b20so1703764lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9JrBiUtxrR6KulaL9O4CU3mTycbNg7YVNAN0ycPkEfU=;
	b=JWtQJ/3/qS0KDB2zsl3e0ZXAZuX+XboCvaQYpWrT7i/Qqtrxr6bFU8b8rGzW8N7nz/
	QZaJ3zhc2XAUM9VYz18TyA8p0+XjvTktSUJxAhH9a0cuRfONlN+xm61W+YL4Bgz2VNZf
	YQrCjfYAkB+99lNF2QjEGJa3yJ55Nsybw5ExzgQSrTGrosc8PkvoG5C596F95/pq5pNS
	vfP8qWnLkPaUPiWrDqUI8rSPWUAwHuDQX7IJo53xbNY3o5oQwKmlzoUIqhZdRNeAakYX
	aKol1eFpCIf95AXk20VbIltUfkugahVaSHwWkTwwCY33uDMGO1DD8Zomp+DL8Gwy3B+o
	xTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9JrBiUtxrR6KulaL9O4CU3mTycbNg7YVNAN0ycPkEfU=;
	b=sMIThGW1F8dxJgvWVsbTHh75UkCy89stqL4KMWys5kQdgdFoLkgBjP66K3RyabWfIJ
	ITcqTAVQIslj62G/X0tl3OmDbQwHtlLeO284yf/Kyen8QNvlHWVufVUD/ruo14kmSI+8
	DFqGVwr00KRO0Pn/0+E/zRMd2Xr7GyjFRpAtc+pdKJ+IU5/josWFuSk8HY5swbeEP6U+
	EvNRlsgijm5uH/Jsp14WpgSj0MsDbE0Li3OCgIsuVnfUHgp6KRxgzfU6w2DeLJ2UrQSa
	fn9xhxF1Bm/vzOicNlZ6LEsOa46/IaicFsZpxTc2labyJVmhxaA/Wupr4fNdIRt4Dorl
	KvbQ==
X-Gm-Message-State: AA+aEWa3u5x3vBXrPnQzxtoDBNgIDCPfodccZ6oOjRlSjkfXB1Rx3dMn
	xha2k3RmAu3sx7mqBm34MtcHx0ZjUzG8dKRf3saDNA==
X-Google-Smtp-Source: AFSGD/VJl8LKrEOiK1AxAs1Oc+Z9PuceN++4sTwDDanZf3AeB6bpdgpjyJhzHqWyLUpo6NanVTn6bEnqb5Utix0gti4=
X-Received: by 2002:a19:22c2:: with SMTP id i185mr16641965lfi.2.1545320925898; 
	Thu, 20 Dec 2018 07:48:45 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
	<CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
	<CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
In-Reply-To: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 15:48:34 +0000
Message-ID: <CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>, james.feist@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 15:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > Well, I built core-image-sato core-image-weston with AR=gcc-ar
> > RANLIB=gcc-ranlib globally and it worked fine.
>
> Please build a lot more. These images cover only handful of recipes
> there are problems like
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576
>
> which we might have to contend.

That bug from two years ago suggests that the gcc-ar wrapper isn't
required if GCC has been configured properly.  I guess we need a test
case.

Ross

