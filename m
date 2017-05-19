Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2994460621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 11:56:35 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id k74so58852741qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=wZBPO8hcaBmlFyHlzzs8i+CkzG2qvy2Mb7RxMwmI+M8=;
	b=2Sh7NfVFex4Yuc0bAhRfe6qdNkB8eY4ChFf9Y2iqnIXp49PLqK4f00JageVe594JKo
	WAlckdlmijbWOCHyS696IwOq+UaI7EesMfUUJHg21gFHK7T2Zp7YwxvAi02ufoV9mahV
	Dk917Il4TESvqDlvVMSsMzhrwMSfiQ4mFywwO93xChf5r8OroJC3LiDbVza7yPk58ePL
	Z4OrblKI7ZmrJG2InZs8ZGyit2lchbIcBrg3+1g010eHQ1EjcK9B8Y+PIT/UNlUGSKNV
	yLj3CNJZgiQACVmLuiQ1YPogNYnZkJUQYBCIeBdlfavhVVlUonN2smFz029Hi7dg7+Zu
	rVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=wZBPO8hcaBmlFyHlzzs8i+CkzG2qvy2Mb7RxMwmI+M8=;
	b=rpVupqp2KQcxFeVUHrgwtdg6PlCcnENxIY2+0PKMgiWE+T/R3XXzr7Bz+1qoS4aQCt
	YIdpWuYhZk0ZK6fgoVkHpwJHZ65WmA3ymIewzZ6qWuOfvfDHGOWRLBxo9cjCaBBr6FjD
	TowGUI/CgYbkRK+E+lOai2wVgsCgDG0zDWBvehEDTvpgD8ofFEP93wP3LAHYoMNwrZe8
	6xGDuF67KOUsmH2uap8hKwkJNy+6w9d4MF0gjUWd3vHi/qyk4wMvqGGdU4FsRMymMbaQ
	4IUSdmhI3qJ9evkYnkLsuOL+fQIrAJ0z0ymJ2ac63AKfV29d8ciddELPIdEOPCHl8V1O
	YnUQ==
X-Gm-Message-State: AODbwcB8B5LbfobNxUkRzmp/cnheKy2riTsB0vVuEWHi2zxyKMNl6tP+
	AbSYTIj00rkGbgAUD/GVWEFWp1l9osZK
X-Received: by 10.55.40.41 with SMTP id o41mr9126520qkh.3.1495194996802; Fri,
	19 May 2017 04:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 19 May 2017 04:56:16 -0700 (PDT)
In-Reply-To: <20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
	<CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
	<20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 12:56:16 +0100
Message-ID: <CAJTo0LZmtYMT2Z2N19J85dXi5JnOfPxXBMX=rwEuwcaq1GeiAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Fri, 19 May 2017 11:56:36 -0000
Content-Type: multipart/alternative; boundary="001a1140a35aa7965c054fdf3620"

--001a1140a35aa7965c054fdf3620
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 10:02, Anders Darander <anders@chargestorm.se> wrote:

> As fas as I can (in a recent kernel), whoami is only used in
> scripts/mkcompile_h. And there, it's only used if $KBUILD_BUILD_USER is
> empty. I'd rather see that we set $KBUILD_BUILD_USER to something
> deterministic in our kernel.bbclass.
>

Definitely this.

Ross

--001a1140a35aa7965c054fdf3620
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 10:02, Anders Darander <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:anders@chargestorm.se" target=3D"_blank">anders@chargestorm.se</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2bt" class=3D=
"a3s aXjCH m15c1ff271a7b44b9">As fas as I can (in a recent kernel), whoami =
is only used in<br>
scripts/mkcompile_h. And there, it&#39;s only used if $KBUILD_BUILD_USER is=
<br>
empty. I&#39;d rather see that we set $KBUILD_BUILD_USER to something<br>
deterministic in our kernel.bbclass.<br></div></blockquote></div><br>Defini=
tely this.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1140a35aa7965c054fdf3620--
