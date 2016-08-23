Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id C18837318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:25:26 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n128so156567624ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yRVBNGjiefzBVFdj0xvrfAMbxlhh5U7VEtnf653Xt8Y=;
	b=WQoXuPdrW9gBggDo4lxPSKlfnGtF2Jj02TQQCAAioygAbk/5H1PlrVcXZeLK31cm/5
	GoTCqeFKy+rG9sa/l92lzzLx7WnDA6AMmyXRzw9gMiJau1tjFTbzg44MJMcZDNYsY0I6
	UhfFqJ2tcbjAES/2lBtFZzekBYOh4EVsKk0E1su9sUdJhrWpcYvfPW9uP5SXdCsCSNPx
	qyS2a7e9JgNSKY+M1k5A6EU9Mfz8QluH+GY+pnTsBRC46EKHBQ+GiwPVEuEIrVk30vzb
	qdRsYL1wCAEbmIsjg/pFktRsYJTscPY162jbD6yzphpwlWYTe0X6JMkQVmeAgaW/AuCF
	EMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yRVBNGjiefzBVFdj0xvrfAMbxlhh5U7VEtnf653Xt8Y=;
	b=UpEKwDpBh1RF1GPiFfuRHjV2bndd6xLO0AG4OnPPXz1eOpZnXqw9+/b78JdnFmpxPT
	iEmRByuhWT71H1IulALblRum6Rn6zjcGr6+vViYSpVFL8RvX5HaXiMt4HhqGKmrg1WLk
	2MukzAawOojNQUPJlJlzgshm4JuDqAl0cuC7RHhZYgH/MGlavCuVwxLd6sL9wZ5Z/1um
	+wu2yj8J5YWkIMQ3fOebFBpGogVnkZ1R9WcFu46CQV/O793gRB/94UpcWo/gGGu2uwOq
	BZ9rlgiij5EmDiv/DylBEBltqcLqo+dHCLx9JI6v88q8CFZok4je0Ac+4H4KUFQ1pCmJ
	A0SQ==
X-Gm-Message-State: AEkooutNuFHWDfInvYVMf+ayJgZlJtTfFi38no8j0NYooXp0BbyUvPWri9Zx9XJv5g9orokKaBfMgb4cJCZrO4to
X-Received: by 10.36.20.204 with SMTP id 195mr22614088itg.83.1471983927079;
	Tue, 23 Aug 2016 13:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 13:25:06 -0700 (PDT)
In-Reply-To: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>
References: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 21:25:06 +0100
Message-ID: <CAJTo0LbYUFLWAhiM+WF3dYzrcLksTLDCQUDqDVr4w0m9050jdA@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Tue, 23 Aug 2016 20:25:27 -0000
Content-Type: multipart/alternative; boundary=001a1143e4e416c39d053ac2f777

--001a1143e4e416c39d053ac2f777
Content-Type: text/plain; charset=UTF-8

On 19 August 2016 at 10:33, Andrew Goodbody <andrew.goodbody@cambrionix.com>
wrote:

> The sed at line 70 fails as it is being executed in an empty build
> directory and so there is no config.mk.
>

For fame and glory, can you send a tested patch to fix this?

Ross

--001a1143e4e416c39d053ac2f777
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2016 at 10:33, Andrew Goodbody <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.goodbody@cambrionix.com" target=3D"_blank">andrew.goodbod=
y@cambrionix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":259" class=3D"a3s aXjCH m156a22c8989e4746">The sed at line 70 fai=
ls as it is being executed in an empty build directory and so there is no <=
a href=3D"http://config.mk" rel=3D"noreferrer" target=3D"_blank">config.mk<=
/a>.<br></div></blockquote><div><br></div><div>For fame and glory, can you =
send a tested patch to fix this?</div><div><br></div><div>Ross=C2=A0</div><=
/div><br></div></div>

--001a1143e4e416c39d053ac2f777--
