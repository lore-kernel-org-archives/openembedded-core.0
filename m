Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id F009E783E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:38:09 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c10so27504491qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=svjErx0qqyZrh1NoWJWMKPB2lG/Vumuk7w/0RcDEmFg=;
	b=Y/ZysARWhPJc8bE/0oTTiog0HO5gI1ptSsVJQQ4fBWUx5I2ilyaDMoo4DLAusMkMcX
	Fj/UK7RXt+d2b2pXxqSzVmQE45AqF0lt6Pm3+7H2/sxv4rAh5dDu7KpS1Hixb5YqYR8/
	drDH9c4FPeyw3qvL+DOWHgG2TDjIsyCad4n77iqyBbg9Su6P3L4sxxAFLZaRfyf7euGe
	WUqHm3UzoSzsGf6iKmPeW9kbdTNFD2tcdPZ11/oN0NKQgU8uYFPm0xodLQlfdb3E15t4
	fv4e7nV5iN6VyhMGgYxfJunJo1mc8QbYeb76u/IY3zAE21zx14O2d6jhgAGlhnkWm+ei
	/utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=svjErx0qqyZrh1NoWJWMKPB2lG/Vumuk7w/0RcDEmFg=;
	b=Twx+Mzeu8v+fsuuELRZltK0MYL7ZdFGAvukpUe6PBP5uzEH1If4FhER2wZZfQWCoG7
	s3co8kqyL90BGby6yocS7x65Iq9yW8TNcKYJYFADK9WCSFHv4triNxVrpzBm48Hyb1yF
	+Ne6lHMgxOX2Ho5IXnAsZKyfnK2sucrYBbUXjiy/M2JRHezT0SOjTBj4kKb3okbBQQH+
	wcNXy1NlV8KIfG66oFnIrJ5xpv13fUZcgR0E/mrI9UfMZ09rPpsUOunN1bY0FF/LW3rB
	JREMumlBmnQnnziu81MRjC0NG5RX41v/0cNEmK7FvErOOzNd96Pe8nfMQykpzzf7JiWd
	RQtw==
X-Gm-Message-State: AKS2vOzGVVzFxWbPZ+apl1RVEoAUmSQlrddzQQ9zdDgQKXb7++g/G3aY
	hjFiMQOFJgIw0uD3QAyY6O/ebO2jRXsv
X-Received: by 10.55.31.162 with SMTP id n34mr7402300qkh.46.1497544690869;
	Thu, 15 Jun 2017 09:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 09:37:50 -0700 (PDT)
In-Reply-To: <2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
	<CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
	<2607b2d4-c37f-5693-1002-db17f9e1024d@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 17:37:50 +0100
Message-ID: <CAJTo0LavpmZCQPHSTrsuJwEZHLT2eAhKLQR8A7Fj3kX6BTC0wg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Thu, 15 Jun 2017 16:38:10 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f855bd110552024bf3"

--001a1147e5f855bd110552024bf3
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 17:17, Martin Kelly <mkelly@xevo.com> wrote:

> I am no expert, but running qemu -cpu help just says:
>
> kvm32 - "Common 32-bit KVM processor"
> kvm64 - "Common 64-bit KVM processor"
>
> My best guess is that, running on qemu without kvm, both cases will be
> slow (since it's all software emulation). But, using qemu -kvm, it should
> be fast as long as you run on a native CPU that is core2duo or better, as
> the native instructions can just be exposed and passed through to the host.
> Since core2duo is very old by now, it should be fast for virtually everyone
> building on x86.
>

Right, I did some digging.  Assuming you have KVM enabled then in the
general case the -cpu option is irrelevant as the instructions are handled
natively.  -cpu just changes what CPUID flags the userspace sees, and so
this is the Right Thing To Do.

Ross

--001a1147e5f855bd110552024bf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 17:17, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":o8" class=3D"a3s aXjCH m15c=
ac8c4d2e0031d">I am no expert, but running qemu -cpu help just says:<br>
<br>
kvm32 - &quot;Common 32-bit KVM processor&quot;<br>
kvm64 - &quot;Common 64-bit KVM processor&quot;<br>
<br>
My best guess is that, running on qemu without kvm, both cases will be slow=
 (since it&#39;s all software emulation). But, using qemu -kvm, it should b=
e fast as long as you run on a native CPU that is core2duo or better, as th=
e native instructions can just be exposed and passed through to the host. S=
ince core2duo is very old by now, it should be fast for virtually everyone =
building on x86.</div></blockquote></div><br>Right, I did some digging.=C2=
=A0 Assuming you have KVM enabled then in the general case the -cpu option =
is irrelevant as the instructions are handled natively. =C2=A0-cpu just cha=
nges what CPUID flags the userspace sees, and so this is the Right Thing To=
 Do.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1147e5f855bd110552024bf3--
