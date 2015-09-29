Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B25E67702D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:31:10 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so1374065qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TW0Sr/7R2fAFnux/dwNuv2OIM6muBJYIN1Cq6pUaCFE=;
	b=TF649pmnbqjbwvOaoqk26n1pRn40HytYp//8ggUK4sXPdZ6CAEr9SJDJS6n0hM1+Mx
	uMBevadQq0taNnvMNiyOHk2qIRWJr1OAeZVfTspO9Bjgfi8CgCJ6Q8V+Kh3o4ZeWTxlh
	w08fOTzgeaD4CNG38jZmRmfhbJi6VeB3W7hpxA3xlrDYFAj+py/HN2M67e/JuEcA3jRF
	JEraVpmr/UI3X80p+ukqY131pSVAZPAm9VdDRtULs3y8n2ORg1S5g467ddKtZ4u5A/fe
	TZTnhXh6MoCoorG9BqqEzPxDj3yUd2stydVlclZMNIo4T/w487yDfrkZK3G31/mBWCwK
	H8rA==
X-Gm-Message-State: ALoCoQn88xovj6GhjKw5oNYcmkNBMZDXcJrblbneBtabndSKEsnJwVl5cx212yRYL8Qu0dt2e81L
X-Received: by 10.55.221.24 with SMTP id n24mr28078116qki.64.1443526270157;
	Tue, 29 Sep 2015 04:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 29 Sep 2015 04:30:50 -0700 (PDT)
In-Reply-To: <1443087197-3274-1-git-send-email-george.l.musat@intel.com>
References: <1443087197-3274-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Sep 2015 12:30:50 +0100
Message-ID: <CAJTo0LZYd5cSH+Ct=iz7jDeJuAyJ3c0edddaWBGN3NC1ECHtPg@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runexported: Added default json file name as first parameter.
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
X-List-Received-Date: Tue, 29 Sep 2015 11:31:13 -0000
Content-Type: multipart/alternative; boundary=001a11466c488ecbb40520e12670

--001a11466c488ecbb40520e12670
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 10:33, Lucian Musat <george.l.musat@intel.com>
wrote:

>      (options, args) = parser.parse_args()
>      if len(args) != 1:
> -        parser.error("Incorrect number of arguments. The one and only
> argument should be a json file exported by the build system")
> +        args.append("testdata.json") #default file name
>

OptionParser is deprecated so if you do the fairly trivial port to argparse
then you can handle this directly in the option definitions (define an
optional positional argument with a default value).

Ross

--001a11466c488ecbb40520e12670
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 September 2015 at 10:33, Lucian Musat <span dir=3D"ltr">&lt;<a href=
=3D"mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":80=
d" class=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0(options, ar=
gs) =3D parser.parse_args()<br>
=C2=A0 =C2=A0 =C2=A0if len(args) !=3D 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.error(&quot;Incorrect number of argumen=
ts. The one and only argument should be a json file exported by the build s=
ystem&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.append(&quot;testdata.json&quot;) #defaul=
t file name</div></blockquote></div><br>OptionParser is deprecated so if yo=
u do the fairly trivial port to argparse then you can handle this directly =
in the option definitions (define an optional positional argument with a de=
fault value).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a11466c488ecbb40520e12670--
