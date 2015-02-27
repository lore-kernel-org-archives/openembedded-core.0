Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0883873751
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:02:52 +0000 (UTC)
Received: by qcqi8 with SMTP id i8so13361416qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 04:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e94ffqeNyAWFkUsBaX3MLPIvS6et82lDQaChZH6kor4=;
	b=iOiSQ0zY5e//QjijwfgInPALT0iN8nsBmhna4unKkuhR0Iz29PZppiDMwzt7sVoZ0s
	pmnYOIjLXcNMY8OVKm8L8hoCSmRjWd9pkLQa5LQjPObGPPKo9vn/vicXYFJjcj+s0ca7
	aEQ1FqjOU0o6eBLU6EvQmJMaHP6qhO6V7AagRpr+1mRS41Y/ek6uGOqhA7asqyxp7fPn
	G5IAX72+Ge+bNFsMswH+OewepyLWaM0y+fhxUh2uuHho+zDbfXvxVL60a3O87Okptkyl
	KnwcqgdpMCGLuBJAEwPcP+gRuDu0Lvwo/gso6yW3H7gxA7ZIwuXzYyeN+uSSOYQmsTqB
	o/pA==
X-Gm-Message-State: ALoCoQmhm65W1Pq5dU2AZZHVdXpjt7mWm6gaztVopcqtQRV37+GUSnN0zymIC/qrmbMmTazUdi3P
X-Received: by 10.55.50.74 with SMTP id y71mr285149qky.51.1425038573491; Fri,
	27 Feb 2015 04:02:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Feb 2015 04:02:33 -0800 (PST)
In-Reply-To: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
References: <1424832475-20806-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Feb 2015 12:02:33 +0000
Message-ID: <CAJTo0Lax5EpeTy2y0PUGt+x3hM90U6V=oMaTnLGgRi8LtPGikw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 12:02:53 -0000
Content-Type: multipart/alternative; boundary=001a11470ce2f778be051010a52a

--001a11470ce2f778be051010a52a
Content-Type: text/plain; charset=UTF-8

On 25 February 2015 at 02:47, Khem Raj <raj.khem@gmail.com> wrote:

> 219 has been in the docks for sometime, the older patch got merged
> this patch is now upgrading 218 to 219
>

With this merged I'm now getting these warnings from QA:

WARNING: QA Issue: systemd rdepends on iptables, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: systemd rdepends on libxkbcommon, but it isn't a build
dependency? [build-deps]

Ross

--001a11470ce2f778be051010a52a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2015 at 02:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":68v" class=3D"" style=3D"overflow:h=
idden">219 has been in the docks for sometime, the older patch got merged<b=
r>
this patch is now upgrading 218 to 219</div></blockquote></div><br>With thi=
s merged I&#39;m now getting these warnings from QA:</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">W=
ARNING: QA Issue: systemd rdepends on iptables, but it isn&#39;t a build de=
pendency? [build-deps]</div><div class=3D"gmail_extra">WARNING: QA Issue: s=
ystemd rdepends on libxkbcommon, but it isn&#39;t a build dependency? [buil=
d-deps]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div></div>

--001a11470ce2f778be051010a52a--
