Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD72E62137
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:21:36 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d63so18586199ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3zW/nE8RK/flqUK5fY9TNnOUh2OA3JH1Ahj/hHF3CAs=;
	b=ePW04o/4d6FMhZe6mqaGsR2YQ9qMTGjuEGJDQ7CyleFQkKsABKX5ZsawUIBhkegPf+
	9eFWFe94YcJT0z/ly/BWIJlDv0YM+tP9X7UL5IlRx5K459RThjZFWg+NKIoD1NdjXHF3
	MXMlYBAfGJsY9NrD/Mc0TGNGq5jbXd5yR/hMogtj1nakJcbJz5xPHoTbyCxzk7xe7Vm5
	zHLI+xH6omdGs9wiUAXxMN3AHWPOl1jVH4YiR0yaL1IgvjSYIApleCItbumvkxIjGjiM
	zvfP8QLTQI+rVtiI/t68FYMac1/fNsUYw7YrDZXss8/NkiEqfnUgbgI4SSuU5YsqWDWi
	Oovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3zW/nE8RK/flqUK5fY9TNnOUh2OA3JH1Ahj/hHF3CAs=;
	b=Eh6gofnxdk6ai9O6fnZWaJuVKIZAy3Up6wQdY+XVUWjHp6jjgCp7JR1nxYCY1e7E9f
	hEg2j44l4HOtkLUnEoeD+UUds4Q9sPD74wII9ZGYkSkJ7rhRNqvvhll8pNYMmToikZPr
	iVFOLvYmrprT9DLQpTw5ED88VKhFjDE087viX4XJMKXn6f7dw8YGaAfTGuR4gl7us0lp
	gNj2W8sKTuxRXEscF4/zUmpC9DJvhaYhLkOD7OWrYbp/tH5EsRo2e6HpkBjv/ey54hfY
	ZS88G2jrPApmou/H+0A1x2CiDIgzXL82es8cwwVsHbJKhgPMUDM7UIiSLpTl9jUjCMbX
	gVOg==
X-Gm-Message-State: AG10YOQt/MLWgO/O4BC8yjUxQxPZU5WXoIwX7RNdfJO+LWHx/DX6Nsj5iLNsYads1VDgcao2VNYvLqjs9ZXQjaRk
X-Received: by 10.107.3.220 with SMTP id e89mr30950908ioi.99.1455027696542;
	Tue, 09 Feb 2016 06:21:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 06:21:17 -0800 (PST)
In-Reply-To: <1455023303-8137-1-git-send-email-marex@denx.de>
References: <1455017471-6682-2-git-send-email-marex@denx.de>
	<1455023303-8137-1-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 14:21:17 +0000
Message-ID: <CAJTo0LbuO5c=Hv7LUHMpuOYtLG48YFN7t+ZpeTR+cjdHrpdXNg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/7] binutils: Repair nios2 PLT and GP handling
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
X-List-Received-Date: Tue, 09 Feb 2016 14:21:37 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cfdba60052b57089a

--001a113f0e7cfdba60052b57089a
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 13:08, Marek Vasut <marex@denx.de> wrote:

> Repair corner cases in nios2 PLT and GP handling. See the patches
> themselves for extensive detailed explanation.
>
> The patches don't contain the ChangeLog entries, since the changelog
> entries often cause trouble when applying the patch.
>
> Signed-off-by: Marek Vasut <marex@denx.de>


We've got binutils 2.26 in master now, can you rebase and retest this?

Cheers,
Ross

--001a113f0e7cfdba60052b57089a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 13:08, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">Repair corner cases in n=
ios2 PLT and GP handling. See the patches<br>
themselves for extensive detailed explanation.<br>
<br>
The patches don&#39;t contain the ChangeLog entries, since the changelog<br=
>
entries often cause trouble when applying the patch.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.=
de</a>&gt;</span></blockquote></div><br>We&#39;ve got binutils 2.26 in mast=
er now, can you rebase and retest this?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113f0e7cfdba60052b57089a--
