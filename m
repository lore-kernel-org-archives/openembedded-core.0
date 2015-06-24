Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 53A6675A0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 14:16:48 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so22377988qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 07:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VVwrKmb0eXtdbkt+JML6kmgjFPvaHNF6w8W6bZyskVY=;
	b=c1/8QaFa7NXgjvWSH34yAK7J/hISrYiP4B7EgR3eDrcy0ZCH9jP/UzDemUuXwF3lE7
	vbwgQN67LJ2FR/7FtejfUatNj48LxCOJRf/zvReWaD7kyWRLechfpUwiaCx5oo5xFleE
	Tn1DGroxoImqjorc8t77sRm8Yr/sIsK8yq8RIczH1QRYHIqF78PzDAgki13BOxIUmaLy
	y5Z+pOdUiO2Dl60gt6MlzDZw66fhQLngHGNaM/bC6XlEkpBGru4FEwfA+Ke1SADdPe9H
	C4W7boW2VEMVKnlNuUC9RumAkdGjp6XANBw+lVYaxuVVOQQahcu6Eog7GvyStxmAv9/L
	Jdzw==
X-Gm-Message-State: ALoCoQl3GJzIIocLAi6WRiw7WBG6Oq8nI+w/F/A77/uOSIJ1vtfYgLhkmLTKZYaWb95AT9b/lyoB
X-Received: by 10.140.88.5 with SMTP id s5mr51276585qgd.59.1435155409768; Wed,
	24 Jun 2015 07:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 24 Jun 2015 07:16:30 -0700 (PDT)
In-Reply-To: <558A0AF1.8060204@windriver.com>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
	<558A0AF1.8060204@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jun 2015 15:16:30 +0100
Message-ID: <CAJTo0LZx+nUqwQKwGcO7G7xHHQkYF0Gp8p2bsGageFKLcM74Lw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Wed, 24 Jun 2015 14:16:49 -0000
Content-Type: multipart/alternative; boundary=001a11c1187465a9fe0519442810

--001a11c1187465a9fe0519442810
Content-Type: text/plain; charset=UTF-8

On 24 June 2015 at 02:42, Rongqing Li <rongqing.li@windriver.com> wrote:

> #warning _FORTIFY_SOURCE requires compiling with optimization (-O)
> [-Werror=cpp]
> |  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>

So security_flags and debug build are mutually exclusive, and no amount of
fixing recipes one by one will fix that.  This is a compiler warning
(presumably the result being that fortify isn't enabled in debug builds)
that the mmc-utils build is treating as an error, so a more reasonable fix
would be to remove -Werror from the build which is a reasonable thing to do
- only the developer of software should use -Werror as it causes untold
amounts of pain on everyone else if something changes (say, gcc adds a new
warning).

Ross

--001a11c1187465a9fe0519442810
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2015 at 02:42, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":m3" clas=
s=3D"a3s" style=3D"overflow:hidden">#warning _FORTIFY_SOURCE requires compi=
ling with optimization (-O) [-Werror=3Dcpp]<br>
|=C2=A0 #=C2=A0 warning _FORTIFY_SOURCE requires compiling with optimizatio=
n (-O)</div></blockquote></div><br>So security_flags and debug build are mu=
tually exclusive, and no amount of fixing recipes one by one will fix that.=
=C2=A0 This is a compiler warning (presumably the result being that fortify=
 isn&#39;t enabled in debug builds) that the mmc-utils build is treating as=
 an error, so a more reasonable fix would be to remove -Werror from the bui=
ld which is a reasonable thing to do - only the developer of software shoul=
d use -Werror as it causes untold amounts of pain on everyone else if somet=
hing changes (say, gcc adds a new warning).</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross=C2=A0</div></div>

--001a11c1187465a9fe0519442810--
