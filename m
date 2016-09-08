Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E93F6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 19:02:37 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id x125so31126520oia.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 12:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=efwH+uVPXB9ofjEvefd5N5MuaUiBPKCtlafZVZtp1a8=;
	b=SLG2xCNSPsumaHahpLMlmgjVacjH1tsMTYbzYa6+LCA5kYsCki8AybmF2ViVzoJvh7
	u/6e0ZA47HWZVTIf7KCEjwjWHchM7lzNvi5gCjcTMoJIGXevQZHDmgfHxd8qVn+wAq+C
	6BgfPvoO9svbnBURUrRf6upV8ebHj8gWw5EqZJmJR9Xp/jlu3k8dyivxg7bxnJ8+hCe4
	I/x57sduYguJFpF037yUWkXuxvSVDV8M326RQfraEpnqHRZyfU6liuJIBux/EoeeXMi3
	gngjl+Xv0DDiWPsDYEvh7udUHnfAWFxCYmZ4xZd9JiWscWtuhj0Pum4BVb3eP9jBiaoH
	4u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=efwH+uVPXB9ofjEvefd5N5MuaUiBPKCtlafZVZtp1a8=;
	b=MpWB9JBJ6OgqLOoRZr3GxBtFa/ajNRnfskh5Z+gIFd2hNz1IRTa9cnF0SLN98Xy8LS
	Y63+8MuoxILBSZStF4jVIeCJhA7zjj0F4NvT9dCkJENiSXdF/eiAkA2GbdEfWnMzgT6Y
	XmxohtGmLhDpUFephfdyqtpXkomOIYUWxt9jVClouLfZH+OgdJopT+J0UeCwggaWG93S
	FmridtPVxx2wGX1oKwe6i6WsKzeGDmrtzRfhDBG6iHu3qvwuIdu5zR0FVNxwVO9idsjd
	UW97cXxdMSjpVcdRMPbKTAer0akjfoMao4Z3ndK+VwmCfawCtRgs6twHJf6SHkUzLb8+
	NHIA==
X-Gm-Message-State: AE9vXwOk/YbfMYt9sLIgmIRyOjE/WLDadtBbEVSDkOM9by3EXKGicEs1VG3/oKDx5Cvr5zOGFlSsoCXnDEXNZgSH
X-Received: by 10.202.240.134 with SMTP id o128mr1677282oih.166.1473361357802; 
	Thu, 08 Sep 2016 12:02:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 12:02:17 -0700 (PDT)
In-Reply-To: <CABcZAN=EN4rHOX=Mt-4HEWrYf3JJzGB6eAHKEyCW+6OUBKagPA@mail.gmail.com>
References: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
	<CABcZAN=EN4rHOX=Mt-4HEWrYf3JJzGB6eAHKEyCW+6OUBKagPA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 20:02:17 +0100
Message-ID: <CAJTo0LYdxEY_4T64KwMNPUmjK0E57_M27aJC_X-yngp1aUyxuA@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts: add tool to scan for bashisms recipe shell scripts
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
X-List-Received-Date: Thu, 08 Sep 2016 19:02:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c09630e5baf66053c03ac1d

--94eb2c09630e5baf66053c03ac1d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 September 2016 at 19:29, Christopher Larson <clarson@kergoth.com>
wrote:

> Afaik, you should be using =E2=80=98with=E2=80=99 to ensure the temporary=
 files are
> cleaned up after use.
>

Yes, probably, this code actually predates the Py3 migration.  Didn't get
any warnings though.

Ross

--94eb2c09630e5baf66053c03ac1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 19:29, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_e=
xtra">Afaik, you should be using =E2=80=98with=E2=80=99 to ensure the tempo=
rary files are cleaned up after use.<br></div></blockquote><div><br></div><=
div>Yes, probably, this code actually predates the Py3 migration.=C2=A0 Did=
n&#39;t get any warnings though.</div><div><br></div><div>Ross=C2=A0</div><=
/div><br></div></div>

--94eb2c09630e5baf66053c03ac1d--
