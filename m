Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECD860BCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:21:49 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id x123so3382503vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YtfW8ihFdhoQO69ge6PamulXbFnJ/kgHPRhIh+rt2/w=;
	b=ROHrdsDBpf2AVFhkj1pb6zl4vw2Z9qvf86Ko/DvYeFtM4WUVzk8/cfcjomWIkbOT5L
	793/7gwgFNmWNRN8THKYAYKSOFslt1xe+mBs5CWymagqqX+oMchqwQliHVV0Jf6oV7+8
	hfXPvlFFyTx3jzt3uLQze/8Ti1lgyzLxenadjF1k2UOOvJrDRq5vQN05McNuD62i/5WL
	aQYcVjxwnTZzgSpqvQNWJbG5eIrg6OlatnaD1qRKg20vliCP/p8ltjsjocw0S15iGpHH
	OjvmBx1melndy2JKiGgXsZUOTVfYEFAQiE8nHdkJRFAetTzUO1mWdvmah1+QNuao4ips
	z3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YtfW8ihFdhoQO69ge6PamulXbFnJ/kgHPRhIh+rt2/w=;
	b=WrC2RoH4JFa0iFaGxmUvVtvB0rHc7/I5qIB8CfAcUztY8ZNVewU/SNCOoBmUpHzs72
	rLJ9whcRI9kimADRs2XSefKFHwZ4Flu6fPwcZCqBbPZ+9qKh5txKq99hlEBMRZw/SHBV
	bfpv7MoG0juUGDPiekYwZn8NKPZtQqFguFYq+YIJ/zHb5eutb+Wo70KljGLHE/mxS8i3
	byRagGwkHZARlKmb5xGnO/i08fOaUnK4KUDZ5UBi/0THGXOJeI+Cz2iGdmnWdmA6gqaH
	JM8ArXLQqZX1PTrEffZ5Ief+qGJcFK9Mb5LFPQxe1tsjB93EwOfLxjZCrDfid/jHgy2K
	VBGw==
X-Gm-Message-State: APjAAAUdVFB7j3OEQe4fEnUGep8JGBu0vKX+MnwQdSMrzE/WdE5FJdfU
	N+GcDxPmH0n4SSDAws+kjeL2p1yPkZ+8NYaiYPw=
X-Google-Smtp-Source: APXvYqxthYUORK+FOEPIfZ/4cdCD/7MpY/Oho6/axBu8pXZis5NVAgefCGb0OD+qU6yYtEyZv5tPtOrFxYfJEEzE710=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr1457662vsg.35.1581582110271; 
	Thu, 13 Feb 2020 00:21:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 09:21:39 +0100
Message-ID: <CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 08:21:49 -0000
Content-Type: multipart/alternative; boundary="000000000000ddac54059e70c750"

--000000000000ddac54059e70c750
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2020 at 07:38, Khem Raj <raj.khem@gmail.com> wrote:

>   libsolv: Enable rpm packageconfig by default only if rpm O_P_M is
>     enabled
>   dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm
>

I'd like to request that these two are held back until we figure out what
is going wrong with the rpm test (see separate thread).

Alex

--000000000000ddac54059e70c750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 13 Feb 2020 at 07:38, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 libsolv: Enable rpm packageconfig b=
y default only if rpm O_P_M is<br>
=C2=A0 =C2=A0 enabled<br>
=C2=A0 dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm<br></blockqu=
ote><div><br></div><div>I&#39;d like to request that these two are held bac=
k until we figure out what is going wrong with the rpm test (see separate t=
hread).</div><div><br></div><div>Alex<br></div></div></div>

--000000000000ddac54059e70c750--
