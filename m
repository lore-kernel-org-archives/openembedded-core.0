Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2036665CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 06:52:46 +0000 (UTC)
Received: by qgf3 with SMTP id 3so509583qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 23:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iGAbyPP2St/irf7B7101rgGVJWdrYQyaDxOhm+UD9QQ=;
	b=Cscd0A7xGtrTBYH1cFzNhnpTIMf0Wy6WBvRu/RCJunD7oAp4pYstyzvzEhxFonYTiv
	cSd97kZrzohvJV6oS3jMu8Jkg336Jz77kld1yN47WMSfTseuQQUjHcVA48FoAlXpwog4
	/mp93oEZ85qRbEy+7Ms6uS5I+p4cbSDgXQNXD5ngOgYOl2EYPjSoXOn6ximoL/vC2q8q
	ufagSmBQzeKAO1902UK1UO40Fm3KLVFugf1jxrwOQPpF/sW42D3Pu/NoRxBLwsphZqAa
	FJxQhOFS8d91memUgC/6fOizx2ervcMYR3hfAoHD8z5L9GHw1FizBo4wjnIWevSfntEY
	Cbxg==
X-Gm-Message-State: ALoCoQlkKPr3UVwxCh2w8jh03CItyccBxHhbvGcDIGPXnQQ+BlBHp90XmvJsIbKLuoSmtN6MjPWe
X-Received: by 10.55.23.84 with SMTP id i81mr64867921qkh.51.1426575167576;
	Mon, 16 Mar 2015 23:52:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 23:52:27 -0700 (PDT)
In-Reply-To: <1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 08:52:27 +0200
Message-ID: <CAJTo0LbvjhZ8nUzua80y+K23n7CS+sY7QcDYg3PqjJWLe+_fwQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel-yocto: split meta data generation from patching phase
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
X-List-Received-Date: Tue, 17 Mar 2015 06:52:49 -0000
Content-Type: multipart/alternative; boundary=001a1146fe621c0aea0511766a63

--001a1146fe621c0aea0511766a63
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 19:27, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> -       createme ${createme_flags} ${ARCH} ${machine_branch}
> +       createme -v -v ${createme_flags} ${ARCH} ${machine_branch}
>

Was adding -v -v intentional?

Ross

--001a1146fe621c0aea0511766a63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 19:27, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4fq" class=3D"a3s" style=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0createme ${createme_flags} ${ARCH} ${machine_branch}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0createme -v -v ${createme_flags} ${ARCH} ${mach=
ine_branch}</div></blockquote></div><br>Was adding -v -v intentional?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1146fe621c0aea0511766a63--
