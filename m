Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id CDA71776E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:42:30 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id y76so218026041qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 02:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l1G8z8vSkFKei5IX9z4qRvGywsSp9Lwz+TRnBB6Sz6w=;
	b=qdx/09CZ9uY+sNtSzMd80d3njBeK07n/ZxDtE3OJlqeZDhhvjnamAdxpdVb1DPnV6L
	awz/XAOn6YyVGdskkQCKpBrgyj0G+Yo/5Tq8UrBFsn+HOCevEWG2pztSofkm8UBpmPkm
	DCgFmN6LJfspOdoFc3W8B3ovbga4Xivm945XYBHwFOzPbANlXRwy/s8fX0d5EB27nNE9
	GC1+NaojeWceO1uQmA7GMteNwqjxpu9/rFl6kpAKwAqchOK82A1poVJUfeHXj+hHrBDO
	YchwPIkxmfmZmXaAg+FG3odT0doqs8QlOd6hFufNabhFaAckzP6gnPSsodZL4PUUN6pl
	Bt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l1G8z8vSkFKei5IX9z4qRvGywsSp9Lwz+TRnBB6Sz6w=;
	b=EYNhdjOkuwxKafY30eSBAeV8Lzfi9CfZUYfksr6+F9eeY1JBHIkYaQi4Ve68eU9/cj
	pI972nHw3eKYzsyIVQNZ4Kc64wKz9vXLn0bhNMhLzcNjVFqIXs7Uny5eNbIzEOKgSlmk
	Kq7guy9XKoWeLHCMOTqn1ra/weryu3guWefMjO5y2EC5yd+sJE9t4NESJCjsCbWTgINY
	CI0FDwIuuzc3ShE4uKUwcdNLbeIg1N72p0rCSmHrGlSmcufGEJ/nQTWeMWDsXKRlq+uM
	XRiT58ZVK5sKN3VjAenYjqXYdpCXmhBPziO7Bh9YuyN55pbfdc4GsZFJch1tsbnU1/QT
	KyHw==
X-Gm-Message-State: AMke39lRhI0PoL06AuuN81/nVA0yZ6hYLIZYFbNtMtlVbmzcuxuuGmjrYaylRXCrzi5Um1rXXiaMm5z/OJ7HfXsl
X-Received: by 10.55.3.151 with SMTP id 145mr29540811qkd.244.1489398151554;
	Mon, 13 Mar 2017 02:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 13 Mar 2017 02:42:11 -0700 (PDT)
In-Reply-To: <1489332452-19584-1-git-send-email-akuster808@gmail.com>
References: <1489332452-19584-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Mar 2017 09:42:11 +0000
Message-ID: <CAJTo0LZqLtX8zHtfTLOnF8g9t12GoTxM8ABipGJmrGdKZx5ruQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH] license class: try alt encoding when copying license file
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
X-List-Received-Date: Mon, 13 Mar 2017 09:42:31 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a0c105e8054a998740

--94eb2c0b93a0c105e8054a998740
Content-Type: text/plain; charset=UTF-8

On 12 March 2017 at 15:27, Armin Kuster <akuster808@gmail.com> wrote:

> Try another encoding if utf-8 fails in file read.
>

I sent a patch for this last week (just taking bytes instead of guessing
encodings, which will still fail if the encoding isn't UTF-8 or 8859-1)

Ross

--94eb2c0b93a0c105e8054a998740
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 March 2017 at 15:27, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":45g" class=3D"a3=
s aXjCH m15ac32210a55af5c">Try another encoding if utf-8 fails in file read=
.<br></div></blockquote></div><br>I sent a patch for this last week (just t=
aking bytes instead of guessing encodings, which will still fail if the enc=
oding isn&#39;t UTF-8 or 8859-1)</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--94eb2c0b93a0c105e8054a998740--
