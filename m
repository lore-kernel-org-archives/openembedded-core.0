Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6636010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:40:15 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n66so3416133qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uW6tHQN53iceFb2Zve+5C7ANUE8lDSgi6fp/t2bf8u0=;
	b=qOvKww3Il+VDOcL9ANcFpQTHDSV5aDDzGa8M9KYJ7OGetcCdUlyi0z/OHbHCnKssg3
	31qo1ztmfLugfJrc7yC+MvWjXEwyOAlxF9MYZ0x5aC27DZbq/wn0QFpJQOC8BRe0YAdd
	rcACsWbL+lpQO+odbz49dN6FLbSY9ARL13ebVaJ+LoVJZj41mshWRrlhQSQlJcJlE854
	bcfmVTX4Agn55iqQV98X3tjXRRKAkZbQBC2sSoMzPPUj3QTIj9Kb9iR8l8cES+yXoo9S
	+DOC9H++m99H5B1h363O/u9hMbWypO+78j7WJTrjAf2zDHSy3MMwF5404jk/4Mv3pVME
	gfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uW6tHQN53iceFb2Zve+5C7ANUE8lDSgi6fp/t2bf8u0=;
	b=Bo3UwqjE5xUbCegLc3uFLAqYPZiejnbLnh4EZro1lvq5wlsqCLD3t8E/xQnhiYkKPw
	CjeiMEC38YInbjJPUY2vsoXAnNowN71fEHKatrYNguYPeN+QDdaAKdeCRzXcmE0Xa0Vp
	s30tBhYTj53wJ886ggfXlmQSHDnkIBmKvfkfmSuzeUdTj4pBE0bRQULthM+0Z0N8LLqF
	1AffoYyux0PJ6O/As/TfpIaCP3DEHt9CzUuALfS+juvrDhOS1wJrS7yJDchLfTQb6Ckb
	ZoiF+Inkg6YvBTGAo+7tL12f0SmSURwRFIJXlQsJAGu+VgdYPpogxHNeG/U2YXjE1ZoS
	wZHQ==
X-Gm-Message-State: AE9vXwPeM5eDdh5qMO3QS6b9DehoRfnI3MK7r9nAMSLS1IlPZf4UKON14k0+3ZIxNrfZ8Lvbd1W3nBHwIDgFgQ==
X-Received: by 10.55.176.67 with SMTP id z64mr10803037qke.74.1472647216448;
	Wed, 31 Aug 2016 05:40:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 05:40:15 -0700 (PDT)
In-Reply-To: <1472641217.29583.81.camel@linuxfoundation.org>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
	<1472641217.29583.81.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 08:40:15 -0400
Message-ID: <CADkTA4OD_SY_NNySADMiv+n6dWEqj15dnn9mO5-_MSHSe5jb4w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/9] linux-yocto: v4.8 + fixes + configuration updates + RFC
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
X-List-Received-Date: Wed, 31 Aug 2016 12:40:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c06fece374d5e053b5d6694

--94eb2c06fece374d5e053b5d6694
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 7:00 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Just to update I have:
>
> * Put a runqemu patch in master-next that works with new and old
>   kernels to handle the dtb issue
>

Hmm. I tested 4.4 and 4.8 with the ones that I did.


> * Updated the musl patches in libc-headers
>

ok. Ignore my previous email on this one!


> * Updated lttng-* to avoid build failures with 4.8
>

What were you seeing here ? I built lttng and didn't see the failure ..
I'm wondering if I was held back on 4.4 when I did those builds. I'll go
investigate,
since that is rather annoying as I was explicitly covering perf/lttng to
rule that out.

Bruce


> * Switched the default qemu kernel 4.4 -> 4.8 in poky so we get
>   testing of 4.8
>
> I'm waiting on the next build so see what issues remain from here.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06fece374d5e053b5d6694
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 7:00 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Just to update I have:<br>
<br>
* Put a runqemu patch in master-next that works with new and old<br>
=C2=A0 kernels to handle the dtb issue<br></blockquote><br><div>Hmm. I test=
ed 4.4 and 4.8 with the ones that I did. <br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
* Updated the musl patches in libc-headers<br></blockquote><div><br></div><=
div>ok. Ignore my previous email on this one!<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
* Updated lttng-* to avoid build failures with 4.8<br></blockquote><div><br=
></div><div>What were you seeing here ? I built lttng and didn&#39;t see th=
e failure .. <br>I&#39;m wondering if I was held back on 4.4 when I did tho=
se builds. I&#39;ll go investigate, <br>since that is rather annoying as I =
was explicitly covering perf/lttng to rule that out.<br><br></div><div>Bruc=
e<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
* Switched the default qemu kernel 4.4 -&gt; 4.8 in poky so we get<br>
=C2=A0 testing of 4.8<br>
<br>
I&#39;m waiting on the next build so see what issues remain from here.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c06fece374d5e053b5d6694--
