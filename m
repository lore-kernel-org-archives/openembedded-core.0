Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7175760053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 13:17:00 +0000 (UTC)
Received: by qkap81 with SMTP id p81so86111227qka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=15F0CR9rW6EZYOjw3XflVYJmdmWZdAT3YJ+YdmOebPM=;
	b=fO6JO85MhMsr+PDklzOxdUZ9SNWRs8N0NxijIS+VFaHRmssVpWcXtCbQinqfGyH+TP
	33T1eg2dJMQbf/O1mOe/zzCeoKCvag6dU7r9XdD7Dxl+cIMt61BU/qyaPgRL4F6r6qPW
	fAZcG/ZUf6E1hs8GVpyHqRYd70zbMDBOQV0cHJSTVKpu0IWsiXrsZJ5zp9nSKzcm5kVP
	e5DPuYBlgxaiZEqIRD60/5VsLU3EnVAQ7W87o1+ea2ds4kWnSHjrZdBHcfhLK9Ax4NMa
	qVCnIzPaho+ZCXmXEJZX/l6xSrA3lSVYUEybBotr4SbxOgBbrMo1wv7dgwkw6mKy09zq
	yLZg==
X-Gm-Message-State: ALoCoQkycKuTR0UaoSEam6G4C82N4REzTNmkNR30L4lv6tQF8i8KTKiWIggz2bG1uSOKDCr4w3La
X-Received: by 10.55.221.199 with SMTP id u68mr40809879qku.83.1442409421121;
	Wed, 16 Sep 2015 06:17:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 16 Sep 2015 06:16:41 -0700 (PDT)
In-Reply-To: <8bf3ec997007d1d921f4dce21f55612da0dce585.1442389930.git.liezhi.yang@windriver.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
	<8bf3ec997007d1d921f4dce21f55612da0dce585.1442389930.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Sep 2015 14:16:41 +0100
Message-ID: <CAJTo0LbZTObHC+Urrc=3_EXWVaJb-_JeMnxO+=cRXsZySzM4PA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] subversion: 1.8.13 -> 1.8.14 since 1.8.13.tar.gz was gone
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
X-List-Received-Date: Wed, 16 Sep 2015 13:17:06 -0000
Content-Type: multipart/alternative; boundary=001a114997582ae2d7051fdd1d05

--001a114997582ae2d7051fdd1d05
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 08:52, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The subversion-1.8.13.tar.bz2 is gone from ftp, so upgrade to 1.8.14.
>

The FTP server only contains the latest release for each release series so
if they release a 1.8.15 the day after we ship Jethro we'd need to upgrade
subversion again.

The subversion archive is at http://archive.apache.org/dist/subversion/ and
includes all historical releases.  The recipe should use this URL instead.

Ross

--001a114997582ae2d7051fdd1d05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 September 2015 at 08:52, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><div id=3D":1jn" class=3D"" s=
tyle=3D"overflow:hidden">The subversion-1.8.13.tar.bz2 is gone from ftp, so=
 upgrade to 1.8.14.<br></div></blockquote></div><div class=3D"gmail_extra">=
<br></div>The FTP server only contains the latest release for each release =
series so if they release a 1.8.15 the day after we ship Jethro we&#39;d ne=
ed to upgrade subversion again.</div><div class=3D"gmail_extra"><br>The sub=
version archive is at=C2=A0<a href=3D"http://archive.apache.org/dist/subver=
sion/">http://archive.apache.org/dist/subversion/</a> and includes all hist=
orical releases.=C2=A0 The recipe should use this URL instead.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114997582ae2d7051fdd1d05--
