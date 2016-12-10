Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id EB0C16B6EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 10:43:17 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id n6so38233799qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 02:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+lfnKaopGERCOChHU4FZxPq2m83L+Gj2KaDCHrFnVKE=;
	b=bJl43vMFG54Sh2T3+eX0quKEFltjqu60q6iIr4xUjb4DRIw5ACcYPScVwLJQeqSIVd
	VamcOlwWt9rPk8DoMiiIYPoWSatNp1cA6p90Wv3iemRAjK5dcLNi+evdXyiystejwLvE
	2DX7hDJUnNsJIzDdbLIukx1P6sFQisH+zJvxHFgPHIlw+q96h68GOoyehfs7lGgl62+w
	wX2JLXN+kLCEJghcPLeSLW+/rzBSQZAuv24gWJ/J0vk4MZyUEY1YmOE8Kqbc9Jc11FeL
	TowkU+UZ6z0oSEYJG2eJz6DWu0GfO3eRBz9YOzUpA9/8uAhbT3TgfcwHgcDkRVs0i0Gt
	igTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+lfnKaopGERCOChHU4FZxPq2m83L+Gj2KaDCHrFnVKE=;
	b=S3F/xEzqBC1aIkkwR3Z8hbHcna+dmwG9foL8wLSQAvf1MH2R99LiXrJdM4exv5AP6l
	a48hQaxcNAIZbee8g3/7DwZXRN3Y4Q3nLh4WWJiPkZIGECYn9ImxaZi9sbIphq3M2fjt
	N5c/vCjQLyS0tr8TOVsMjXwWL9r2lYF14Zz0hKRzQsEKNPkuPtl8osYDnNuq4TGReuWV
	GqDiTIh6eJ5AT+pV8VzY6O/ieMGBaUacF+9KpXduX3ZPj7zWYaExlbVWYmmkZolOg2zL
	PrpCXvi++Teq9MujNrpm/xhUQ3SbUnejdegVSzWHzofqb5GtxdG7WKNSQGABb0ksfiJD
	deXQ==
X-Gm-Message-State: AKaTC01UpIcE8p5UvUDcG00QyFUKjG5ISE2YVj5RoMQzyXMWbAJpwXUH5BIr7VF42c7XQQ8Qm/LIe8Uv3J3lOsYG
X-Received: by 10.200.57.54 with SMTP id s51mr71233204qtb.68.1481366598731;
	Sat, 10 Dec 2016 02:43:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Sat, 10 Dec 2016 02:42:58 -0800 (PST)
In-Reply-To: <20161210025613.1648-1-jackie.huang@windriver.com>
References: <20161210025613.1648-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 10 Dec 2016 10:42:58 +0000
Message-ID: <CAJTo0LaXmKPSRG1VgLXdOERkxuFSaqFX-D-7Oo9MTKY_ydcq1w@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcr: add missing dependencies for vapi
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
X-List-Received-Date: Sat, 10 Dec 2016 10:43:18 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8e6616705434b8910

--001a113a01e8e6616705434b8910
Content-Type: text/plain; charset=UTF-8

On 10 December 2016 at 02:56, <jackie.huang@windriver.com> wrote:

> +Upstream-Status: Submitted [https://github.com/GNOME/gcr/pull/4]
>

Did you get the message that GNOME doesn't take pull requests at github?

Ross

--001a113a01e8e6616705434b8910
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2016 at 02:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jack=
ie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":173" class=3D=
"a3s aXjCH m158e6ac8177a2587">+Upstream-Status: Submitted [<a href=3D"https=
://github.com/GNOME/gcr/pull/4" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/GNOME/gcr/<wbr>pull/4</a>]<br></div></blockquote></div><br>Did=
 you get the message that GNOME doesn&#39;t take pull requests at github?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113a01e8e6616705434b8910--
