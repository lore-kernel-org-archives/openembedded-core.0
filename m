Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C546D60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:57:52 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id s63so36659193ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/omH/ZO6APKuv9bnfJv0nTIzbJyPzZEcFXJ+92mqPyw=;
	b=PdLV+igwLOWM15GZQYllQQECFaQfwHJIGPFsWHiNOv5aFFlaICrfXZQqRve4mK3NwG
	3+uvOGA0GkDheD52xdlCwG/FeWe/+x1Xylv/DXgPob7ZCVXu8+YX6v5jifYFipjUTHqW
	LehJo5TmuPK/LHfnt2/u8PylnKp7algJ54j68mtFdySADp3gMIEgkOnVSVhsV7icAsQ8
	7b2udACHSEjgpq8nLRHmnGkc1ysE3kgwJbs4TcclSnE4IuHd+BdAZsHrCdzbRQiXJzVb
	Dp2XnSXkRDLs7BLUYPnDgjafb0U7CvogQmwoRhwtdnBTzuykrqzxd4eArzw9LRRmLE9T
	Ru3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/omH/ZO6APKuv9bnfJv0nTIzbJyPzZEcFXJ+92mqPyw=;
	b=fsdDFYjXYK/Xa4wVXr7YAsUAR6IBoCR4bjzGvzkY+QYCLWPBoVq69Z9Y1biGv7caA1
	sNU9+Txl6dwgCYUgoKtZT9vkoE5B37ui9S++VPtyNneiWC7he3ETqACXVDPiAQTEwOjk
	QvGnu+XNsPnCZ4J+fV8SZ75UXFnD3StGH+5RQPQlbQx1uURrYaOKvz/JI/qsVxV4D3O9
	DTNTw9X9xIAV25iXeUFJNjehb27gCzDkHp5SX1eIotBLu3CDMiJq8BFdLUe/IzSkocDa
	gTEkHFn5xdAjkIx18HKg2J2/2Y/xCqP3zIFMYNwWwHFpw6js5HEtCAsVDDVShYXqRl0Q
	KrRg==
X-Gm-Message-State: ALyK8tIqXaidNPNXVPTj5BPgwUY0zYgTkkiwJB3hdwtSAbaR8kClyFCl1Nyln+sXmubxlkizFwtuE4Cefz1mCESs
X-Received: by 10.107.138.201 with SMTP id c70mr37023170ioj.148.1466593073113; 
	Wed, 22 Jun 2016 03:57:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 22 Jun 2016 03:57:33 -0700 (PDT)
In-Reply-To: <18032fc6b17d21b4fcb431114a6000042b38e3d9.1466069361.git.Qi.Chen@windriver.com>
References: <cover.1466069361.git.Qi.Chen@windriver.com>
	<18032fc6b17d21b4fcb431114a6000042b38e3d9.1466069361.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jun 2016 11:57:33 +0100
Message-ID: <CAJTo0LYpa5AMtaiOT_9L851vTyMbcNuPSWjdvmWQJq=EhJYzhA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] recipetool/create.py: fix LICENSE value
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
X-List-Received-Date: Wed, 22 Jun 2016 10:57:55 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a275f650535dbcf06

--001a113e8e6a275f650535dbcf06
Content-Type: text/plain; charset=UTF-8

On 16 June 2016 at 10:30, Chen Qi <Qi.Chen@windriver.com> wrote:

> When there multiple license in a repo, the LICENSE value be created as
> something like "LGPLv2.1 GPLv2", which causes the following warning.
>
> LICENSE value "LGPLv2.1 GPLv2" has an invalid format - license names must
> be separated by the following characters to indicate the license
> selection: &|()
>
> Fix it by using '&' to join multiple licenses.
>

This behaviour is intentional, as recipetool isn't smart enough to read the
licensing terms and decide if there are multiple licenses in aggregate (&)
or a choice of licenses (|).  The solution is to list all the licenses that
have been found, let bitbake throw a warning, and the person creating a
recipe comprehend the licensing situation and add the relevant operations.

Ross

--001a113e8e6a275f650535dbcf06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2016 at 10:30, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":4h0" class=3D"a3s aX=
jCH m155588cf4b54ba0a">When there multiple license in a repo, the LICENSE v=
alue be created as<br>
something like &quot;LGPLv2.1 GPLv2&quot;, which causes the following warni=
ng.<br>
<br>
LICENSE value &quot;LGPLv2.1 GPLv2&quot; has an invalid format - license na=
mes must<br>
be separated by the following characters to indicate the license selection:=
 &amp;|()<br>
<br>
Fix it by using &#39;&amp;&#39; to join multiple licenses.<br></div></block=
quote></div><br>This behaviour is intentional, as recipetool isn&#39;t smar=
t enough to read the licensing terms and decide if there are multiple licen=
ses in aggregate (&amp;) or a choice of licenses (|).=C2=A0 The solution is=
 to list all the licenses that have been found, let bitbake throw a warning=
, and the person creating a recipe comprehend the licensing situation and a=
dd the relevant operations.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a113e8e6a275f650535dbcf06--
