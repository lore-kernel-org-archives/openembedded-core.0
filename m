Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 33BC171CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:37:26 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id e189so1289061ioa.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 04:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4jlCjwxMfHh7IIYFV1f0nsHSYU3RZiL2Kyr73C2me/0=;
	b=XqV6pfTwYYpDWXbTyMRt05rM6LbwqoLX2xZd30M9M+7jNBVbcX2ybBtLBinJ0RxOue
	qzdPipUuroPg6fAm4hrX5TjKHOvq09XgKy8+ZkYDaWGQk+4DpD6oNk3grQiuDRCCY1es
	jIkqGyYBtHx9WDyoYzNZRuHrAuOLN6yaPU6UBGsiWEhXCtOVTDadHPeTNwRkVKAxZCsP
	uxrMNceTuHWFocfgu+iahw6IsijiC6zU0cBl3QjI1m6I2vBXIQwpVCJCl8Yr1ExW0xp2
	Ao8UZPOvMlgX/rjkGas7zwWP80dCya92dtWVzXRwSy7mqxNm+wYD/WYPMJHYimAEbC0D
	pPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4jlCjwxMfHh7IIYFV1f0nsHSYU3RZiL2Kyr73C2me/0=;
	b=FIq2+Rql2Oag0dOMfdYeYzSuko5VwiZ8hyJLH3iK8ygOkHfv7ReTa0PZutflIf8QmM
	IExSdSiE8NxK6jxYQ7EE4hkHNcJpB0Kdvz31lAQhfwh8lgURcnjCe9/4d4iSk1eyFRi2
	7AGVBhOTNCwlaTDA29N2QCtMdTEVtzyqpU+b0ru6az+kGyG0QNVHW//tfI8rOTe7fKix
	okBq8dNHJ8INXRLAeJsr5QqJWflqWuAakVugnSS5rh4ZQIo0m3fWRG3IEd3rlwuk/bM4
	Mo42jx/YKSny6q/gJU3CqzLrH32g92WwRZnOyDWV8SJv3wDUZIyUSyZEaB7YxWjzGDVS
	oFqQ==
X-Gm-Message-State: AMCzsaVecJWyWgvW5mJcI3tZHvt8oaElRmkPahdNQcBK1SVNMDut4iXh
	qHEDhYmWaUVBgqaft73FALVo/JoY5SIjDq+FT+NTDA==
X-Google-Smtp-Source: AOwi7QC9/yEg+wvssWEwZTGmAZZXXYEhj0wQ9HV4LuizgqKy4nQK62RvDxZbFcRd1KN6aUHxf0X69CPNhZRK+n6J0q4=
X-Received: by 10.107.133.92 with SMTP id h89mr6250580iod.208.1506598647968;
	Thu, 28 Sep 2017 04:37:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 04:37:07 -0700 (PDT)
In-Reply-To: <CAP9ODKq6rzVbzwxWbwzeW4Y71eXNSaHJOPvAXZxSvU1-CQKRtQ@mail.gmail.com>
References: <CAP9ODKq6rzVbzwxWbwzeW4Y71eXNSaHJOPvAXZxSvU1-CQKRtQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 12:37:07 +0100
Message-ID: <CAJTo0LZELSTX08VNZze3V299CtoFrH=jXhXsxOJc9xiv-KxHfA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Go SDK automated test
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
X-List-Received-Date: Thu, 28 Sep 2017 11:37:27 -0000
Content-Type: multipart/alternative; boundary="001a113ff7d03b5254055a3e553a"

--001a113ff7d03b5254055a3e553a
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 20:17, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello folks,
>
> I did try to understand the automated test infrastructure but ended
> lost on how the code was designed. So instead I wrote down a step by
> step test so someone which knows better the autotest infra can
> translate it.
>
> git clone https://github.com/golang/dep go/src/github.com/golang/dep
>
> . /opt/oel/17.1-snapshot/environment-setup-i586-oel-linux
>
> export GOPATH=$PWD/go
>
> cd go/src/github.com/golang/dep
>
> i586-oel-linux-go build github.com/golang/dep/cmd/dep
>
> This will generate a dep binary on the $PWD; is it possible to someone
> wrap it on OEQA test?
>

Thanks Otavio, that's really useful.

Can you file a bug with this in (and CC me)?  It's a good exercise for a
new QA engineer.

Ross

--001a113ff7d03b5254055a3e553a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 20:17, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hello folks,<br>
<br>
I did try to understand the automated test infrastructure but ended<br>
lost on how the code was designed. So instead I wrote down a step by<br>
step test so someone which knows better the autotest infra can<br>
translate it.<br>
<br>
git clone <a href=3D"https://github.com/golang/dep" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/golang/dep</a> go/src/<a href=3D"http://gi=
thub.com/golang/dep" rel=3D"noreferrer" target=3D"_blank">github.com/golang=
/dep</a><br>
<br>
. /opt/oel/17.1-snapshot/<wbr>environment-setup-i586-oel-<wbr>linux<br>
<br>
export GOPATH=3D$PWD/go<br>
<br>
cd go/src/<a href=3D"http://github.com/golang/dep" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/golang/dep</a><br>
<br>
i586-oel-linux-go build <a href=3D"http://github.com/golang/dep/cmd/dep" re=
l=3D"noreferrer" target=3D"_blank">github.com/golang/dep/cmd/dep</a><br>
<br>
This will generate a dep binary on the $PWD; is it possible to someone<br>
wrap it on OEQA test?<br></blockquote><div><br></div><div>Thanks Otavio, th=
at&#39;s really useful.</div><div><br></div><div>Can you file a bug with th=
is in (and CC me)?=C2=A0 It&#39;s a good exercise for a new QA engineer.</d=
iv><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ff7d03b5254055a3e553a--
