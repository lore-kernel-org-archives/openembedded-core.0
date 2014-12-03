Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE9560030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:57:07 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id w8so10591085qac.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 09:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EzEWIGLm7gg149JHhQtGrJvIM+8Y65u2jzrcdkEUNxA=;
	b=AxM04qhInRWR3SJN2C9fxTSmMS2Q0J7RFWGgwEDf5Z1DajkD6YvcDQBIP5eVPXsfO9
	D0qxs21YOI0q4ZkElKoG1OtRh6wqnX8nQSEyLytgoKkJs1E9apBuAtQq+VtTP02l3AEc
	J3NeUDWsV0LWVYiwXjpZ3IV4rfOfnuDlMU+oY5E/RYwVxtrwBp4qp3MkxC7FORi83+GT
	uVtj7mXF2ZqPQM1d/7XNhqoVsEdekIuJJkCOZrhRkF/4Z4xYH0O0dBC8uiOj61uEhWZ9
	9LBmLqRGimqB4ut/xpNhEth0o2/8n4LcNvky1wSry0ggUfpZhx64iF1/GBZrduSABlsw
	0B0A==
X-Gm-Message-State: ALoCoQkiAeTuni7nxyqgBzVutKbtIKMqq0JTwhpGPMsEudMRiigC3xTTuGm14UMVQ1TopKnQIMb6
X-Received: by 10.224.92.205 with SMTP id s13mr9880442qam.52.1417629427414;
	Wed, 03 Dec 2014 09:57:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 09:56:47 -0800 (PST)
In-Reply-To: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
References: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 17:56:47 +0000
Message-ID: <CAJTo0LY4Y6eWLUMvBLjwnKNy=KLoxh3Knien+HgOB5ZqXrmkRg@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] python: Building without SSLv3 support
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
X-List-Received-Date: Wed, 03 Dec 2014 17:57:07 -0000
Content-Type: multipart/alternative; boundary=089e015375e4726c34050953927f

--089e015375e4726c34050953927f
Content-Type: text/plain; charset=UTF-8

On 3 December 2014 at 08:09, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> Building python without SSLv3 support when openssl is built without
> any support for SSLv3. "OPENSSL_NO_SSL3" is defined in the openssl
> headers (opensslconf.h) which is located in /usr/include/$arch/openssl/
>
> Backported from:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=768611#22
>

This should be applied to master first, and then backported to any stable
branches.  Can you re-send in a form that applies to master?

Ross

--089e015375e4726c34050953927f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2014 at 08:09, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8yf" class=
=3D"a3s" style=3D"overflow:hidden">Building python without SSLv3 support wh=
en openssl is built without<br>
any support for SSLv3. &quot;OPENSSL_NO_SSL3&quot; is defined in the openss=
l<br>
headers (opensslconf.h) which is located in /usr/include/$arch/openssl/<br>
<br>
Backported from:<br>
<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D768611#22" t=
arget=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D768611=
#22</a><br></div></blockquote></div><br>This should be applied to master fi=
rst, and then backported to any stable branches.=C2=A0 Can you re-send in a=
 form that applies to master?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--089e015375e4726c34050953927f--
