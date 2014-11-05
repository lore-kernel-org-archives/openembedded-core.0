Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id EF7FF71FBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 12:29:12 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id dc16so372070qab.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 04:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hE9VYcLk6dVvF9AspdXyIUZbUKm1ykC9ordY4CYIayM=;
	b=VfXRqmDZLklBJVIktel0AthljLs4NpLNr+tphJBr3B3Zmv3622jxtpRRZ1H17xfOmu
	BIrXGRIOIl2LrtveVHKWXVNuxfGtioHJK9Xp3vhh9gXOtkKtMh36uDdPH0ucpprw8Rrh
	akuZsQuxV4GmWHctnXQ1JG27smUcChtJzLgU02Pdg0Vtb1ntQAPrU3jEaaz6psdYlIej
	KO770U7RqFdZQRIfb8Auaa96Xz8Oz3vAZcUVbFEys7n0+B4RlpaMnJRpyst2477oKM35
	GGuHdhL5GHtn0b5Uvx6rH9Izn8Pc71tyYIANRE2Q5secRGDloCOyGsoWoHp4aQz5of9u
	RsQQ==
X-Gm-Message-State: ALoCoQnk3Yb9u2lI78U8xEPI4Zqp2Hgs3D0E87hqcL/tU/r3AAyFixomDmb94g3AnjtbNweGnhCm
X-Received: by 10.224.2.135 with SMTP id 7mr89006172qaj.64.1415190552623; Wed,
	05 Nov 2014 04:29:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 5 Nov 2014 04:28:52 -0800 (PST)
In-Reply-To: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
References: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Nov 2014 12:28:52 +0000
Message-ID: <CAJTo0LbRCv3AYRyO0WOwVHy7aeGYpeB42GNZV=D=G7BbhxtvjQ@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix for CVE-2014-3566
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
X-List-Received-Date: Wed, 05 Nov 2014 12:29:13 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa2dd46c05071bba9a

--001a11c3defa2dd46c05071bba9a
Content-Type: text/plain; charset=UTF-8

On 5 November 2014 12:23, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> OpenSSL_1.0.1 SSLV3 POODLE VULNERABILITY (CVE-2014-3566)
>

Clearly this isn't for master, so what branch is this intended for?  If the
patch is for something other than master, please put it in the subject ie
[PATCH][dizzy].

Ross

--001a11c3defa2dd46c05071bba9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2014 12:23, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4c3" class=3D"a=
3s" style=3D"overflow:hidden">OpenSSL_1.0.1 SSLV3 POODLE VULNERABILITY (CVE=
-2014-3566)<br></div></blockquote></div><br>Clearly this isn&#39;t for mast=
er, so what branch is this intended for?=C2=A0 If the patch is for somethin=
g other than master, please put it in the subject ie [PATCH][dizzy].</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a11c3defa2dd46c05071bba9a--
