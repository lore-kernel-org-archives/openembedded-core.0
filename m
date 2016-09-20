Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5550A606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 15:00:31 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x192so26179506itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QjJ7VvHybMCoBI0p0z/+IGupzrocS/50FrFdVvZW71U=;
	b=YkGeKbcCvlGwiau5V+GHD47Tc21/VXkpDUtYA6jxI/Sr3fc6mNQkhgocJPSMb98uto
	eUciWFgT3SGORocjmWipiS9szNZnZCBLJWamlxT0daLMRDujd+tTwaaerlx0acaBFz9U
	s3RTmzMp47FMfD2j+ZYT6Hs/pzF5FdNgFo/o+vHUc/45qzE9rGJvWIcvrIiZn1VzoBO1
	FAgES9CAFoJOj9fKBqJhC/n/dulF2+ja1PHfSbk11+s13TTQTdXUlLSqyLruLAI9MsXR
	h2BsQtALjviY7PAY3/J9MOQeBHoq2jtCYJ7VjjKdvFMJmMEO9H5hyznGk6eVoovQldZG
	rYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QjJ7VvHybMCoBI0p0z/+IGupzrocS/50FrFdVvZW71U=;
	b=hoS8Qx6Z5aTGKkI+D/htsWb1TAi+2EbSrwf9HCSGvqh0g+nJ+gvV4qkx99vLIJOpdh
	btxE1Bjmv+9F14ZJBsLWbisN2Pbjmzx9qPj+D5a8p/ulXtZM8AuBpT1UDHkA7IxIMgCG
	4qh7LGnU5L5DmQioRk2yh4f0JgIxoSXPEolQidJnd2nqY6DQjTCgYLNGM2LX64VhXIg+
	B/5IkiCjPhHEL/+0gImNUkK1FH+GRzqyIMzpZVnpHde+//f1ExA3TNMOOnVtUdd27jJy
	+KgGzy2Lvn1T/LVlFf4fx0xXlZ16ywtpmHGdPB6ypc6Zyetyr0EYRUQWZuAUzXTApmHl
	yNjg==
X-Gm-Message-State: AE9vXwO6SOEL11NSZpCNDoLo9zuZIScS/UGi+pPF2z1QG9bTqbY0FVEELt78oWGg4k0NdODwzspSIOfh4wSt/NRt
X-Received: by 10.36.189.202 with SMTP id x193mr4794559ite.74.1474383633212;
	Tue, 20 Sep 2016 08:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Tue, 20 Sep 2016 08:00:12 -0700 (PDT)
In-Reply-To: <00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
	<00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Sep 2016 16:00:12 +0100
Message-ID: <CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Tue, 20 Sep 2016 15:00:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c19de20b8bf7e053cf1b078

--94eb2c19de20b8bf7e053cf1b078
Content-Type: text/plain; charset=UTF-8

On 20 September 2016 at 09:15, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> -Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org]
> +Upstream-Status: Rejected [Sent email to rpm-devel@rpm5.org]
> +http://rpm5.org/community/rpm-devel/5655.html
>

Considering upstream has explicitly rejected this patch, why should we
accept it?

Ross

--94eb2c19de20b8bf7e053cf1b078
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 September 2016 at 09:15, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"=
mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":oj" cl=
ass=3D"a3s aXjCH m15746aa47dadab15">-Upstream-Status: Submitted [Sent email=
 to <a href=3D"mailto:rpm-devel@rpm5.org">rpm-devel@rpm5.org</a>]<br>
+Upstream-Status: Rejected [Sent email to <a href=3D"mailto:rpm-devel@rpm5.=
org">rpm-devel@rpm5.org</a>]<br>
+<a href=3D"http://rpm5.org/community/rpm-devel/5655.html" rel=3D"noreferre=
r" target=3D"_blank">http://rpm5.org/community/<wbr>rpm-devel/5655.html</a>=
</div></blockquote></div><br>Considering upstream has explicitly rejected t=
his patch, why should we accept it?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--94eb2c19de20b8bf7e053cf1b078--
