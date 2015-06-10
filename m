Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C41F6AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 11:00:16 +0000 (UTC)
Received: by qgep100 with SMTP id p100so14736711qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6ZyrwzHNJ8ESS90A2ZlY0CZAq5m5ilENdE31V7gOYgM=;
	b=J1f/OLIWbzN1pWMnvSOfDhidb3BOlhY7JYvu4egNwGV6i7ny0Rpi9REbeAFLCdh/wN
	+V7RXjpo6n0E+99osmQHVbjw14sRAcJd33jJGcEvI9HQSsW/Lb+fpmGwV++5+i/z+hle
	mY9/SE5LxittcYYZO9Zuww7BqBnonIMqXUtNKanX9ZGgq8wh63F6pM+VjMru5nMoonWv
	mQUshpe7dBJQS9PcOBLnsHTv+M4mNRzqAGb0/6DDDjcbWYLwF4hbKyI3y9zuBJCHj3QT
	KtSy7A2SQWMM9y0mphT5wXhi1hBEi6oPLhwvDP/WtFUzCWqrbuGmyDChR+VWdjLJ3lfx
	MqQw==
X-Gm-Message-State: ALoCoQkYmpiSbdK2HszyRvcxmljKzuxKafkOA9ZFujtbWNID++Tg88pLax0UaB22UA8tYo1fTb7k
X-Received: by 10.140.43.228 with SMTP id e91mr2949781qga.80.1433934017444;
	Wed, 10 Jun 2015 04:00:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 03:59:57 -0700 (PDT)
In-Reply-To: <3dad7b58e258a4fb34e78dc8a3145efe2525f6e2.1433840650.git.liezhi.yang@windriver.com>
References: <cover.1433840650.git.liezhi.yang@windriver.com>
	<3dad7b58e258a4fb34e78dc8a3145efe2525f6e2.1433840650.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 11:59:57 +0100
Message-ID: <CAJTo0LbWKgtFa0zvr7GVeKgN+ZAb643RhicforGSz_BBpO1AxQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libpostproc: fix installed-vs-shipped
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
X-List-Received-Date: Wed, 10 Jun 2015 11:00:20 -0000
Content-Type: multipart/alternative; boundary=001a113a34bcbdd25a051827c7d6

--001a113a34bcbdd25a051827c7d6
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 10:04, Robert Yang <liezhi.yang@windriver.com> wrote:

> When MACHINE=qemux86-64 and enable multilib:
> ERROR: QA Issue: libpostproc: Files/directories were installed but not
> shipped in any package:
>   /usr/lib
>   /usr/lib/libpostproc.so.52.3.0
>   /usr/lib/libpostproc.so
>   /usr/lib/libpostproc.so.52
>   /usr/lib/.debug
>   /usr/lib/.debug/libpostproc.so.52.3.0
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> [installed-vs-shipped]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

This commit log tells us in exact detail that there was a QA error when
multilib is enabled, but never mentions what the actual problem is or what
the fix is.  A more useful commit would be something like:

"libpostproc: pass correct libdir

Pass the right libdir to configure as otherwise it assumes $prefix/lib
which may be wrong"

Ross

--001a113a34bcbdd25a051827c7d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 9 June 2015 at 10:04, Robert=
 Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" ta=
rget=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":102" class=3D=
"a3s" style=3D"overflow:hidden">When MACHINE=3Dqemux86-64 and enable multil=
ib:<br>
ERROR: QA Issue: libpostproc: Files/directories were installed but not ship=
ped in any package:<br>
=C2=A0 /usr/lib<br>
=C2=A0 /usr/lib/libpostproc.so.52.3.0<br>
=C2=A0 /usr/lib/libpostproc.so<br>
=C2=A0 /usr/lib/libpostproc.so.52<br>
=C2=A0 /usr/lib/.debug<br>
=C2=A0 /usr/lib/.debug/libpostproc.so.52.3.0<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install. [inst=
alled-vs-shipped]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote><div><br></div><div>Th=
is commit log tells us in exact detail that there was a QA error when multi=
lib is enabled, but never mentions what the actual problem is or what the f=
ix is.=C2=A0 A more useful commit would be something like:</div><div><br></=
div><div>&quot;libpostproc: pass correct libdir</div><div><br></div><div>Pa=
ss the right libdir to configure as otherwise it assumes $prefix/lib which =
may be wrong&quot;</div><div><br></div><div>Ross</div></div></div></div>

--001a113a34bcbdd25a051827c7d6--
