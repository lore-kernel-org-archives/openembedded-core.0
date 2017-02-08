Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id ED44771B0B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:08:09 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s186so121168325qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tSpc5Nfeebv0ef415Bk6bNimkNihpQ2bjYhjOCLhyrM=;
	b=tCzKiancWDM8p+09VZnhGvV5rjO1dW0Ml2yN+JZcZxrJyh8YI3haG6W9aQeqbFbWKW
	i5WUWegReT/367R7mHOOtyp09lkbuTSP9Y//cBN4FRpxlfxTr/9qMS3Oxk55fIhK7PAH
	SMqk2P7Dg4nKyNaaERAu7wXIlFVlyZW7XhqYSCgnQ9cm4n7Fqn3uaDrXxLOla+QJqjFB
	GW8hFSBT7b10HQllyOL9YW265Pp4tZMErdLxIYcA4AaflsjzFjcJnz3LDbSNx/lzPSjz
	ghaC0B3w2MpY9LhtLx9EixJKIBCeGeGflGx/WqauHU1OUkGSdr9jO1Dt1QeolIV7lErS
	flrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tSpc5Nfeebv0ef415Bk6bNimkNihpQ2bjYhjOCLhyrM=;
	b=bcGtob2pc3h2n48h4JENGawe4FBOuOm6pZbKC5Xmk3nMfUJC5tPeZs+XfoCJcscmgS
	nktd3eJyO8h0G3jgI1N5FC1YHuJKMr1XEGTr+rOnTW+wnQ9NJxMvGXFWSXa/4Sfrs/NF
	BYTDOOefzNA8FNzf1mVcsxkRpJkmRLcrSmb8w8xLnodezjlpwwvYDe8YKE7Frn++kB9+
	zq/OkajSEIY3eYSWaNt2KwjJOXy/mzzQ58vlvGJ1H0RPFW8qfzQAoVTnbmSD2hCIU8hb
	PugZP3Su/m+7caNKKPjxXwKv/CuJKIcfcArniMP2Cg3v4rE7gpwp+Ddh+hxjzhuTFw6V
	GyLg==
X-Gm-Message-State: AMke39nR2xMsCXjz76g9hszuX9p8SHwNyYfli3AZ7q7QqCaFdH1kcjJzlAxj0uKv+MQMV/WlaIKPABbUitjiZ8uG
X-Received: by 10.55.183.133 with SMTP id h127mr21425776qkf.121.1486559290120; 
	Wed, 08 Feb 2017 05:08:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 05:07:49 -0800 (PST)
In-Reply-To: <be58fe5939122a5d815e54d09182438ba92592a8.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<be58fe5939122a5d815e54d09182438ba92592a8.1486523726.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 13:07:49 +0000
Message-ID: <CAJTo0LZD0VWvdTW+kgPw6GujNGVuT4+bY9OvvduY3OuS2RJ+4w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/13] bash: update patches for 4.4
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
X-List-Received-Date: Wed, 08 Feb 2017 13:08:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600566cee520548048e17

--94eb2c0600566cee520548048e17
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 03:17, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> - Do not compile and install examples which caused
>   do_package_write_rpm failed.
>

Is it just uname that fails?  If so we can delete it from
do_install_append().

Ross

--94eb2c0600566cee520548048e17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2017 at 03:17, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ci" cla=
ss=3D"a3s aXjCH m15a1bba2cbd9d14b">- Do not compile and install examples wh=
ich caused<br>
=C2=A0 do_package_write_rpm failed.<br></div></blockquote></div><br>Is it j=
ust uname that fails?=C2=A0 If so we can delete it from do_install_append()=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--94eb2c0600566cee520548048e17--
