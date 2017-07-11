Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD6678164
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 21:57:13 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 16so4772013qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fQ/v0GxaXbB3TPfOJMrOFtgBEtC7PySVLNQ1oYwU3+A=;
	b=eIgWYnKJId/vD/JLnNqCnK4qwqzCIPNfp0JFq6LKrJYGvkvSrwKir8bf84Z34Z8HvJ
	GZa/JYbwCXd+10Yh+dL7bw40KrcQFoqzRpZpMJphahAuNrt/bXf6DhLp5GoVeHMwxmN1
	ol/Ny8JkU/Wm3d4E5q96bcpYKfR0vs/Ag9Y71ZyluAJJfVI2TxXawy8BzsOORBkw9v2C
	d0+i9EhuAFNBxNT68ITg889l1uNktiv+Y6Pd+9qFpaQXHPhTGFOVJinqPkOJk/5O/EqP
	UFLWtBRwFazAw11eVDn6GkmDrcSby8Q2GpO0FWv/MMsaZ93rfOsXBOGC7mnw030vG2pj
	FglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fQ/v0GxaXbB3TPfOJMrOFtgBEtC7PySVLNQ1oYwU3+A=;
	b=nofgHqKIgpTSMHTZtzUau60oLAjjTvgcnVGgDXuVQD+mqTy1b/sXfJWs0tdoi6Mxnz
	p9ZVUlQVwT27dz7iM0R7m8IiS+ApLhcX10g5ji8uhdMbkU7ZJmVfqVGGb3wV+iqkic/T
	t6ug2hAKOzRCO3ElfCdIYO9hc6Pn2MEzhdq4rtxQkpdLB8P4H9UYxiBj+POR07xu3gTS
	wUtuwjifiqX5YNJ/1hWnCnt9ivKGCG38W5KP3wNV1isplw53UOglEEBfH+2GkU7nWHeR
	KbTmWh57Y3pN5fHH+2NyU5q6IJNcFZAfjjJxVmBTxdJepM0HknQzIfW9U0/WrGokXe0M
	ukww==
X-Gm-Message-State: AIVw113UlcnGqN6mIhspUv8YBGnWwD2SHgz81ownJkOGpZQk2wicF85f
	Ug900Hhw2VbXtCmXAYAFjo2UxU7cnm4w
X-Received: by 10.55.79.145 with SMTP id d139mr2719837qkb.32.1499810234469;
	Tue, 11 Jul 2017 14:57:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 14:56:53 -0700 (PDT)
In-Reply-To: <CAJTo0LYdpnpQ7PrcjSRT2-KgmHiF5SXGEzxJUd0y3etb+MO3Yw@mail.gmail.com>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
	<20170711101241.GB3263@jama>
	<CAJTo0LYqWR3BVaT3bhKxv--rdocGW0MN9Pk6zQw-2sKEAQiVXQ@mail.gmail.com>
	<CA+chaQfym0xhN6NVHMEob_K94XbzY2PGEeoUzuCLsxoxKaijCw@mail.gmail.com>
	<CAJTo0LYdpnpQ7PrcjSRT2-KgmHiF5SXGEzxJUd0y3etb+MO3Yw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 22:56:53 +0100
Message-ID: <CAJTo0LbOJSwrV6kMYi34Ekf38FrgtUmYaEMwRU1OKt4WV5y2Mg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 21:57:14 -0000
Content-Type: multipart/alternative; boundary="001a114a7efe41a7f7055411c829"

--001a114a7efe41a7f7055411c829
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 13:45, Burton, Ross <ross.burton@intel.com> wrote:

> I just replicated this and yes your failure is gold specific.
>

Fixed, patch on the list, and sent it upstream.

Ross

--001a114a7efe41a7f7055411c829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 13:45, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
I just replicated this and yes your failure is gold specific.</div><div cla=
ss=3D"gmail_extra"></div></blockquote></div><br>Fixed, patch on the list, a=
nd sent it upstream.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a114a7efe41a7f7055411c829--
