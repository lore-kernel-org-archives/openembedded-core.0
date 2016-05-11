Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 504B86011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 18:24:29 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id k129so7185341iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UKsgILaAxev2X1vZaRodYQgbsh1of/m+Kpvw1HF22C4=;
	b=TwGnocrivpvac/fPNZIxZQmXN809nTnAf7TuGdtCiW3VmKEr7DiSN+hzJipmnuT3cB
	STS7EP3J12DOAbDHeywb/RQxVeNTp/W6oWYd3yk3rSCYJyTP+1WRD46V0bYVszbRRQTt
	lMrwX5zQfm32eg2ABq2Yw3HrTCcPkQMs/2oyOMiN87MxRzGsRXQBO4j/IprMGtmuvks7
	LtTNv1O47UUT5jvK+mc8oJf8xf1RXCRgTWUpBYK88UZvkVsloFn4+hpdA4lvLA19v3I3
	yW6NYCszQrsqyo8rRCgNddcoj1s7hMzoiqGHMjT8YG26y4OAgzbuw2mQ0JQ2VxFxDWmF
	Nl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UKsgILaAxev2X1vZaRodYQgbsh1of/m+Kpvw1HF22C4=;
	b=FanGZaaBxUjbXI15r16O8MGNFRxPN+VViomewy6e/kzhoSzyIYmr0rBc5rytwx5Naq
	483AbULdUP8KnxJ0UTfc5miKVenjel++c2t7O957nPXTaAm8q7BZgr92gek1D7Z2BAMk
	4aa4X4CFkH5PrkgTBintaOHWHz7nfc7mmf0+gyOhmA/BfjFJ/RGq5VKUoVhHsfP9d3l7
	bIDVEY+y/8ZwViNUqaObojDJPBtlN/zVBU2bh4lFI0URG+9wnF01v8eiVUQp4Nae/G+l
	Rd6vqelqAOVFoGbSNEe8H/uS6ubOcY9F/xU9UOi4AHyIVukaPbv4aF3/pkPj16MXbVHu
	0Nqg==
X-Gm-Message-State: AOPr4FWKXfDgfM0fdaASWbIFnQ+adDco7hS3k/5Mb4w+HvIYO7369KyjNCw78hv3xmBMvYSXpIgw2pQO4ma7bw==
X-Received: by 10.107.147.7 with SMTP id v7mr4513333iod.3.1462991070219; Wed,
	11 May 2016 11:24:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Wed, 11 May 2016 11:24:10 -0700 (PDT)
In-Reply-To: <52f70664-5981-b80c-a596-1cda00506554@windriver.com>
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
	<b5bb8c60-377b-8885-54e8-aecdde4b94db@windriver.com>
	<CABcZANmj9PDNgLamFtJLyJ9CSBPC8u5Onpk_=mqhkwbdGbuxaw@mail.gmail.com>
	<52f70664-5981-b80c-a596-1cda00506554@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 11 May 2016 11:24:10 -0700
Message-ID: <CABcZANnYjcwciN2+Jp65ORmppa=DtcLceb7rg+p_kE3QeB9AWA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Wed, 11 May 2016 18:24:31 -0000
Content-Type: multipart/alternative; boundary=94eb2c055f680cfbdc053295275f

--94eb2c055f680cfbdc053295275f
Content-Type: text/plain; charset=UTF-8

On Wed, May 11, 2016 at 11:15 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 5/11/16 12:14 PM, Christopher Larson wrote:
> > Hmm, interesting. It doesn't actually appear to be using LDFLAGS from the
> > environment at all just now. I'll take another look. Thanks.
>
> CFLAGS and LDFLAGS should have been loaded and sanitized by the
> 'configure'
> front end.  If this is not happening any longer -- then behavior has
> changed (or
> my understanding of the behavior is wrong.)
>
> End result, everything specified in CFLAGS and LDFLAGS that is machine
> neutral
> (i.e. not -m32, or -march=i586) should be preserved and used (unless
> specifically removed for another reason.)


The configure script doesn't touch either one from the environment. The
CFLAGS env var is used as is in the makefiles. Cflags passed in via
--cflags= replace the arch cflags, however. Since we don't place anything
arch specific in cflags or ldflags, I don't see that this is an issue, and
it has a separate argument to handle arch specific cflags.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c055f680cfbdc053295275f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 11, 2016 at 11:15 AM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On 5/11/16 12:14 PM, Christopher Larson wrote:<br>
&gt; Hmm, interesting. It doesn&#39;t actually appear to be using LDFLAGS f=
rom the<br>
&gt; environment at all just now. I&#39;ll take another look. Thanks.<br>
<br>
</span>CFLAGS and LDFLAGS<span class=3D"aBn" tabindex=3D"0"><span class=3D"=
aQJ"> should have bee</span></span>n loaded and sanitized by the &#39;confi=
gure&#39;<br>
front end.=C2=A0 If this is not happening any longer -- then behavior has c=
hanged (or<br>
my understanding of the behavior is wrong.)<br>
<br>
End result, everything specified in CFLAGS and LDFLAGS that is machine neut=
ral<br>
(i.e. not -m32, or -march=3Di586) should be preserved and used (unless<br>
specifically removed for another reason.)</blockquote></div><br>The configu=
re script doesn&#39;t touch either one from the environment. The CFLAGS env=
 var is used as is in the makefiles. Cflags passed in via --cflags=3D repla=
ce the arch cflags, however. Since we don&#39;t place anything arch specifi=
c in cflags or ldflags, I don&#39;t see that this is an issue, and it has a=
 separate argument to handle arch specific cflags.<br>-- <br><div class=3D"=
gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--94eb2c055f680cfbdc053295275f--
