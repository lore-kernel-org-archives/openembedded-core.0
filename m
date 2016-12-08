Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC0E6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 14:41:50 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x190so451371963qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 06:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tAQ1EyRcAECJWGqtLotEEI84n1dKfG2pEe55RGnophE=;
	b=bCXL7dmKud6vn6vtJr8Z/Ua5RVYmA7mZMldXTgBFtPV4m+zseN9q28JiwSS1rLs5cm
	bcaweXTMXUL7s2EGf1MF/1ZdZXtKjZo+kgU/SxayXl3CEal8BSxf1DWIjmQNOp43ihlv
	KEL9gzIGwy2vFC+seN/aYe5FFduAPOnqRpjJeGi8ezzSeP+8XqbWaPOX915RQ2FpbFwG
	zCLQYjaDmEuwEWcuzqukPOQzCaF0wKNQtgjutl/1r3CbqrEeM5BnbODEr/L73GDs4ZMG
	9KRMIhV9aYb60SicSN18yavWmhMBbrhqzYKLvVIbIL1Iknv6XhBXsLo3WAp3OPoNNgNn
	zlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tAQ1EyRcAECJWGqtLotEEI84n1dKfG2pEe55RGnophE=;
	b=MnGI7zkTKr2CYTFE4veLKPxeCBL9hxaLu8+X+J4J/0bXBFie7HQHhhrIQ41Mczg0OQ
	qxF0GzEUX/PJsnynmCG1GoL+nkkNJ97Y84/rV//x+EtaOZuvmRa+auXTOU3pzwZ+jveY
	dOwJgKEqhhbq9BBd7zrAMpIFfdjhUQkHVKO877LjHmjxO/CEEvAEXwE23wcWa+vF/VaE
	yp8SVt7Y0bP/RDAcRKWZFMxOJ8ElU4y4np8UKvXzQ+o4U2Ru753Vmz697FUcME6TdZGZ
	CYVFP9Y7wGYgwXxhFs0SXQWkYNIsoU1kFOhO4Pu3uER+FvNBq0Lmuk3vyicz9emce+f4
	BvaQ==
X-Gm-Message-State: AKaTC03lBb8q25XJis5oJBN1eQw0jDlrgH5X8HkNoaDb7ObWOCPcq7Q1y59dBVVPwpJmI8v9rRrpD6WDDxOWoKGg
X-Received: by 10.55.207.78 with SMTP id e75mr75296955qkj.36.1481208103523;
	Thu, 08 Dec 2016 06:41:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 06:41:22 -0800 (PST)
In-Reply-To: <2b7e685f6ff33f4c12d0f4d025db3689df43ad83.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
	<2b7e685f6ff33f4c12d0f4d025db3689df43ad83.1481142664.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 14:41:22 +0000
Message-ID: <CAJTo0LYP1kqqLOy6w_L_bh1uAF8pta8d7mZQyJgF2r=zaiLUhg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 16/32] oeqa/core: Change name of d to td
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
X-List-Received-Date: Thu, 08 Dec 2016 14:41:51 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8d9c372054326a244

--001a1145b7b8d9c372054326a244
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 December 2016 at 20:32, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> The d variable references the test data into a test context, so
> makes a more sense to call it: td (test data).
>

Can you squash this into the commits where they are introduced (don't need
to see your working, etc).

Ross

--001a1145b7b8d9c372054326a244
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 December 2016 at 20:32, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.lim=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":21" class=3D"a3s aXjCH m158dafcd106879a7">The d variable refere=
nces the test data into a test context, so<br>
makes a more sense to call it: td (test data).<br></div></blockquote></div>=
<br>Can you squash this into the commits where they are introduced (don&#39=
;t need to see your working, etc).</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b8d9c372054326a244--
