Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id EDDA36013C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 10:49:12 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s11so548075qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 02:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Nf20XlTXNS596U/9BPF1+2KE9WeQGYOsJD84irDCehw=;
	b=ivcg1RxmFqa7G1NhaPrSi+xB1RWpeSf81C0DoyBPyxMEnCEnI+2keKfiW/TYZWa9AX
	JaTNCTCD4txJs71A/cpByasjyeIzR9jwxNoO0Q+0d74G4BOQxMXb4pECoAatKikOL2QU
	O7r9FXdtKossS9NOkEksaYHJldX4uOxWKYkJ5Bzw3adZj/YeJcVC36eqsqyOFm3Fh/lr
	CApiI8C1qiTmexXhWP2QAi9cu/5nZdfm1aw0WMx0qmKv0UlMxAsqAWouKB2pcQ83wdv6
	roIv9hF7Au+MH6DME7sM9maVD+scROEahJ/Y3S58vznJk94SH0XMlslTZ6P3DfD7w38w
	iMEg==
X-Gm-Message-State: ALoCoQnHGNepHWcQtqVQW7bf0W/H8NwjEQacOh8vxzuODTGGyDhKH+IgtCHkbdLwRXzcCyxsp0oH
X-Received: by 10.224.7.197 with SMTP id e5mr63969785qae.64.1423046954210;
	Wed, 04 Feb 2015 02:49:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 4 Feb 2015 02:48:54 -0800 (PST)
In-Reply-To: <54D14BEF.5040509@mentor.com>
References: <345DD4F0215D4B4CB8356943BA192C9913E976EE@kihagwinex02.int.kistler.com>
	<CAJTo0LYD0B91NSZ=NC=ZKemczYkkKKQvjnvsmfKqT0tz4C28zQ@mail.gmail.com>
	<54D14BEF.5040509@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Feb 2015 10:48:54 +0000
Message-ID: <CAJTo0La3Eq2s-ByoWMh7-K5BX6aUZxHiAb6e2qAdFaGxpx9iZw@mail.gmail.com>
To: Nathan Lynch <Nathan_Lynch@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: run ptest for specific packages or layers
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
X-List-Received-Date: Wed, 04 Feb 2015 10:49:16 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4347219050e40f068

--001a11c223f4347219050e40f068
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 22:30, Nathan Lynch <Nathan_Lynch@mentor.com> wrote:

> Should it specify perl-misc and perl-modules instead of just perl?
>

Yes, the ptest packages should add all the dependencies they need.

Ross

--001a11c223f4347219050e40f068
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 22:30, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Nathan_Lynch@mentor.com" target=3D"_blank">Nathan_Lynch@mentor.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xq" clas=
s=3D"a3s" style=3D"overflow:hidden">Should it specify perl-misc and perl-mo=
dules instead of just perl?</div></blockquote><div><br></div><div>Yes, the =
ptest packages should add all the dependencies they need.</div><div><br></d=
iv><div>Ross=C2=A0<br></div></div></div></div>

--001a11c223f4347219050e40f068--
