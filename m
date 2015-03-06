Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id B60996017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:10:20 +0000 (UTC)
Received: by qgdq107 with SMTP id q107so11916407qgd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 04:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n65A7hkc9ZLEFBZmkdTf0GBGWWgPH/QQt55FRts7ies=;
	b=R2bz0eggzURK+S+aub+ak8rWQ42BZ30ZKX026ZwNLMCdwCfsD9G/dHvlhBp+BNlVzX
	i19+UnRDVlutrEB+DSDY6YQgvHEC7Nc/8tGZ5uhSzSe299YKG2HvU+0pWaEU7W77r4BQ
	QrK1Mno70d4MAUWKvPeR7gIQjamIdkTOF+FCgDlNKQ25uZ2tg6abeSKLt2Slluu3Z+SE
	MDP6mNNByQpPc7zAXA06+0rVXXqO+aHKQZ2E6o4rUnFPvaD2P2AJkAsHz/vgorR7NNa0
	Akj5ADl6sJwzsQ8a3FdzPdTegZcNm6p7hLjlqR/4sfcRgpojqDedXx2IcAzyrLwX1pyZ
	uoxQ==
X-Gm-Message-State: ALoCoQmjs9zB0NxQXjl1pFCNvIr9us2m1XNf+e3Hk3AMSFgY9YdJ37ImAm4Qlt4NQh7G30GyeQPu
X-Received: by 10.55.41.106 with SMTP id p103mr27665872qkh.102.1425643821338; 
	Fri, 06 Mar 2015 04:10:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 6 Mar 2015 04:10:01 -0800 (PST)
In-Reply-To: <008e0da7a6c62109e58ea1418062b988cc68d8ef.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
	<008e0da7a6c62109e58ea1418062b988cc68d8ef.1425634271.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Mar 2015 12:10:01 +0000
Message-ID: <CAJTo0LazeFECH=QX1CEqtGLKPqMkt-xy0UuDzMazC6GSH+W_+g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 12:10:21 -0000
Content-Type: multipart/alternative; boundary=001a11406c9a8c5a2205109d917a

--001a11406c9a8c5a2205109d917a
Content-Type: text/plain; charset=UTF-8

On 6 March 2015 at 09:32, Robert Yang <liezhi.yang@windriver.com> wrote:

> +SRC_URI = "
> https://github.com/xinetd-org/xinetd/archive/xinetd-2-3-15.tar.gz \
>

Have GitHub changed their archive behaviour?  Last I heard the archives are
cached for a while but can be re-generated at any moment, resulting in a
checksum change.

Ross

--001a11406c9a8c5a2205109d917a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2015 at 09:32, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zl" cla=
ss=3D"a3s" style=3D"overflow:hidden">+SRC_URI =3D &quot;<a href=3D"https://=
github.com/xinetd-org/xinetd/archive/xinetd-2-3-15.tar.gz" target=3D"_blank=
">https://github.com/xinetd-org/xinetd/archive/xinetd-2-3-15.tar.gz</a> \<b=
r></div></blockquote></div><br>Have GitHub changed their archive behaviour?=
=C2=A0 Last I heard the archives are cached for a while but can be re-gener=
ated at any moment, resulting in a checksum change.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11406c9a8c5a2205109d917a--
