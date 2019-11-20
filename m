Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id ADF9B7F847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:59:46 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id n4so717787qte.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pkAy4rJjRu7tBmnQ6HPayzDLAlIYLK/BDQJv9L0vFYM=;
	b=cpQhRlEtUN03I1xhpiMb5Li8OknL6FGOxzKUHkDYB/Ka8gvYxm6RNFgflQmhEzR601
	bRIeB69eP1ml/CxX7EwNItgYQSx9XUiGMfA/nmBnS7gqHWhwNrXPVaWJw+22VYpiLvN/
	8cYvKf3y97dE2nHVbSByf1bjlgsBcQh/EloSCO/vlVnpwkxNoQIx/+2tR8/fsBx7MWLv
	vyP5oHI2TO52D+GBbO2Aoy+/gjqw61Ein2blBcDkoSl3raQ7TabltBTEdpND4h1pbX4l
	eagHh9p7p7tqol8IlXgQHgLsFxZ4J0pbYE7fcJ6ITZPwbZVVMiuYBiTC2IMQmgr+yykJ
	PaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pkAy4rJjRu7tBmnQ6HPayzDLAlIYLK/BDQJv9L0vFYM=;
	b=hsnkPj0HGJNyuy7hqP7bylUtqBTm3+O3JT/NRiYG1huJfEFUsCSo6Mh2iXwv/T1ovC
	bdeSHYYO7mTb6RovreqX08pwrNbHGEVxV19DBDEsd51+Qxn0mg4LgVd9/UvWUQV0nClu
	jqcH01ikIqIEooouqtgeUlrkV7rVc1hY+W5n7O9BPWsRmH/PAK/dTl6ZH/ZvUhx5g8gO
	PzcSoFXxG5fjDCHvmn14htNTXJ6p0f6PK6l4aIchmkLc4vdrE1wH9eECt9E6ihZStZGP
	WWnSMXRy9qgjjfL8kCNLyRkaVaVqXMOucAiYI5SHsNLJ+4XEcD56Hq8NGSixI/jwzSLm
	PAtg==
X-Gm-Message-State: APjAAAUOPq8p02QpmnQ12Hz1ulBLbEvxRlBq0+NgXmtVk19+SSCe8Fgl
	BEyAkgIj013R+6eqOV2kczJJlueREBJiywYEnU/I6Q==
X-Google-Smtp-Source: APXvYqw6wQwW0w0UByBf5ItkEUDZr4uaftFQzXJhDlMcAbCrTYQDkW0nP9fqypllKqGcQ0/Lu+t5ojm31N/unQN0YaU=
X-Received: by 2002:ac8:f88:: with SMTP id b8mr4219411qtk.382.1574276387461;
	Wed, 20 Nov 2019 10:59:47 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<001301d5-bfe4-8e8f-996e-b0779b0d6703@intel.com>
In-Reply-To: <001301d5-bfe4-8e8f-996e-b0779b0d6703@intel.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 20 Nov 2019 18:59:35 +0000
Message-ID: <CAD0U-hL=WmM0=N=inSgxcRUqTbY_f-KX4qYru+SsPSg8fgHoRw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 18:59:46 -0000
Content-Type: multipart/alternative; boundary="000000000000da7e040597cbc81c"

--000000000000da7e040597cbc81c
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 18:28, Ross Burton <ross.burton@intel.com> wrote:

> On 20/11/2019 18:18, Ryan Harkin wrote:
> > Now it builds fine. However, I no longer have /usr/bin/openssl in my
> > disk image.
>
> $ oe-pkgdata-util find-path /usr/bin/openssl
> openssl-bin: /usr/bin/openssl
>
> Did you try adding openssl-bin to your image explicitly?
>

No, I hadn't even thought about that, as it was already working before I
updated.

I added openssl-bin to my RDEPENDS for my packagegroup, right after the
openssl entry. I tried to manually bitbake openssl-bin, and it complained:

$ bitbake openssl-bin
[snip]
ERROR: Nothing PROVIDES 'openssl-bin'. Close matches:
  openssl
  openssl-native
  openssl10
  openssl RPROVIDES openssl-bin

So I guess that isn't the problem?


>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000da7e040597cbc81c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 18:28, Ross Bu=
rton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
0/11/2019 18:18, Ryan Harkin wrote:<br>
&gt; Now it builds fine. However, I no longer have /usr/bin/openssl in my <=
br>
&gt; disk image.<br>
<br>
$ oe-pkgdata-util find-path /usr/bin/openssl<br>
openssl-bin: /usr/bin/openssl<br>
<br>
Did you try adding openssl-bin to your image explicitly?<br></blockquote><d=
iv><br></div><div>No, I hadn&#39;t even thought about that, as it was alrea=
dy working before I updated.</div><div><br></div><div>I added openssl-bin t=
o my RDEPENDS for my packagegroup, right after the openssl entry. I tried t=
o manually bitbake openssl-bin, and it complained:</div><div><br></div><div=
>$ bitbake openssl-bin<br>[snip]<br>ERROR: Nothing PROVIDES &#39;openssl-bi=
n&#39;. Close matches:<br>=C2=A0 openssl<br>=C2=A0 openssl-native<br>=C2=A0=
 openssl10<br>=C2=A0 openssl RPROVIDES openssl-bin<br></div><div><br></div>=
<div>So I guess that isn&#39;t the problem?</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000da7e040597cbc81c--
