Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 137B971B59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 14:07:05 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id n6so28776946qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AAyuxa1Dj/msPh9rdYfFGqvh7qmwl8DbldK6EKdqD48=;
	b=fGPQiDmje7CvAeXnriRv8hk3TVmrnYti6D1CM9WX+vsFNP+lEQ6OUkk0LWuUjW0+tb
	NfTaH/tzvpm6aack7qlvIRP1Yy3qexzLyuk2ojwlM7+eq8hXgsWdgQKf4Zq0zAD8HyeZ
	LmfoP3ukZIQPi7MZHP4pJdDaxnMcJxlh/JfAO2bIW+YV6CBfZ9x3OJxtl5aV7Ucd9uDW
	wqHjAgpWjcYAgixOjwFFSLZb7wC/qBGOoLJFZhRdERo13IfRiIk8cIZ1n0DqHP/rBwz9
	h+/F1QJgc/BFNDJnlUE+flVWZwyLtJKwPk80uqySeefyV5MaiWnU/e27TiobRsibzwro
	Yqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AAyuxa1Dj/msPh9rdYfFGqvh7qmwl8DbldK6EKdqD48=;
	b=LuIyqZbkYrtGGx6Iz3Xk7aK4IPzP92AhfN1KoT3WedLTgw1D+OhVVrlFx+8C2gM39a
	fQVSUVgsfg6HJUNXHOpQRr1nsIV5LhJx31y5BvlMBy37Y0ocOuIVLIYCa1pUFShLqTw8
	Br8EUXgSjpZLu892rkFSgMu1rkSx9yKzyrNqXNuZRnOrGOhU0j+1Ir9F8Velj9s0dh6N
	iGnXMVuCQeaEwr3fZFnFKR5jw9V6p+4xOwIWk3Y1kgJBdL6T2QtfOaioj31NfJ6lfTv6
	ZZG/sAtoGsO8ZbADdlSWevjXDKVfWxw02E9BjaU1FN3sIiXifcdNt1DAzXmjuq928XWc
	L2nQ==
X-Gm-Message-State: ABUngvdhwOhFjzyhXVaJJK3MrQXs+0HG7PQFp5LhOrcdKs+ye5viuzfmq2fqMy2u6l8OC/LCPdn6wlOkE436hpVl
X-Received: by 10.200.53.69 with SMTP id z5mr8282587qtb.64.1478182026915; Thu,
	03 Nov 2016 07:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 3 Nov 2016 07:06:46 -0700 (PDT)
In-Reply-To: <13e6f9fa-fc42-68cf-3961-33c43d26e13f@linux.intel.com>
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
	<CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
	<CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
	<CAMKF1sp2Bft-bhJqT_C0siXFiHJyT8ouqoNQ2vmt-XGnJqw9Wg@mail.gmail.com>
	<13e6f9fa-fc42-68cf-3961-33c43d26e13f@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Nov 2016 14:06:46 +0000
Message-ID: <CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Thu, 03 Nov 2016 14:07:06 -0000
Content-Type: multipart/alternative; boundary=001a11405858a0e9a20540661273

--001a11405858a0e9a20540661273
Content-Type: text/plain; charset=UTF-8

On 3 November 2016 at 13:32, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Update to 7.12 for master branch please.
>

To ease backporting to morty, taking 7.11.1 and then 7.12 makes sense to me.

Ross

--001a11405858a0e9a20540661273
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2016 at 13:32, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":qo" class=3D"a3s aXjCH m1582a82958039971">Update to 7.12 f=
or master branch please.<br></div></blockquote></div><br>To ease backportin=
g to morty, taking 7.11.1 and then 7.12 makes sense to me.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11405858a0e9a20540661273--
