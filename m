Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA3CF7FE0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 16:02:46 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id n27so6818701vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kShiUhV/I/dDrLp3d9NJl4Mg+Jz4QTelE1O3+NcjDto=;
	b=fEjcw210FcoapwBojFT27ANKauM5/jDLHS9gZ5nenwlxDnBkUZRf8XlR2gk1RLADkQ
	0MBW3XAIlXw6Ur/hVF/gBddAvXJNEhHv1zst8Hh4G/j3AMYeyARNilP0+8y7MvuXod1n
	dky+EHEmW3tP/C3aMXVUkRGQ9HH60o25UanEoKQPLpEsJizTlV478UYjODWWK++Ex0z+
	wjof/490q92m6C6/2UMCyiHPpfeDDjLrfc2gIuGjoGAcFHzGFCLHhIpsdwpv7DHYp0mb
	xuMa569thOvUhem6PtiDr3wmFCUaJlL/oSCr28pMcvnAe0nOqXJnUbRqbzxBug1K697N
	j4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kShiUhV/I/dDrLp3d9NJl4Mg+Jz4QTelE1O3+NcjDto=;
	b=Tor7vjDNKFl4SRvY7G3xBk9UPY8jtNp/Tj9iHn+QyL8bPyZ/S/wOdbakr4oH5G4Kpx
	o7JV5f2RlY7ZYcx5lRDsij5dA9b+v7TpAcRf4ZJmj/ZtBYMTkx/Whfokhlzn0GSlf/h/
	t3NOpCF3ZOwU959oqhL3V/2CqkPREveshmCUfTCU1SqLJsQzk9GAbBfjCDtinwD/z/JV
	n7m85EvFtCjKqAHGzvcXi/zkjjqrH+3e3afSVYr3XgnXRiL6ArjS08PZkfS4mUiP+HeV
	aBY6SugvRzZJfE6oH0fkgKNXEQ+q5dB+ySWLscnrO9GFf+R6nO3wIPT4ECUT85aoYEi6
	zkcA==
X-Gm-Message-State: APjAAAUiF5VzVU5rcYdjqjMe2dCfHRPLj0LtoJSbHntzFjiAbQzRdoUr
	UirDiFYBjAjRUA6cJNNX2XW9bxm8xA9gzCDTjfQ=
X-Google-Smtp-Source: APXvYqwUUt709Fc3REVIFcTpJdorImZUD+22G6gKli7tJGV1YYPFzW4lOiWgReo3bk3M8gCxLTXHxNLmeg27VA4kVZs=
X-Received: by 2002:a05:6102:d1:: with SMTP id
	u17mr3229673vsp.23.1576598567794; 
	Tue, 17 Dec 2019 08:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
	<b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
	<CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
In-Reply-To: <CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Dec 2019 17:02:36 +0100
Message-ID: <CANNYZj-mywh64iuGoUPVkMTJm8ka4m4a6UYVY3cOd2+hVvU62A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Tue, 17 Dec 2019 16:02:47 -0000
Content-Type: multipart/alternative; boundary="0000000000009640990599e87598"

--0000000000009640990599e87598
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Dec 2019 at 14:25, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

>
> In an effort to try and get to the bottom of which patches cause which
>> failures I ran the gettext updates pieces by themselves (patches 2-5).
>>
>> systemtap fails:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354
>>
>> the main a-full build in case there are other issues:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580
>>
>> I know there is a fix for the check-layer/mingw pieces in master-next
>> of meta-mingw, just forgot to set that branch.
>>
>
> Thanks, there are also failures in meta-gpl2, for which I will also make
> patches.
> Systemtap issue is now fixed.
>

I have now sent the meta-gplv2 patches to yocto@ and the patchset for
gettext+systemtap here.

Alex

--0000000000009640990599e87598
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 16 Dec 2019 at 14:25, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
In an effort to try and get to the bottom of which patches cause which<br>
failures I ran the gettext updates pieces by themselves (patches 2-5).<br>
<br>
systemtap fails:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/1354" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/1354</a><br>
<br>
the main a-full build in case there are other issues:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/580" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/83/builds/580</a><br>
<br>
I know there is a fix for the check-layer/mingw pieces in master-next<br>
of meta-mingw, just forgot to set that branch.<br></blockquote><div><br></d=
iv><div>Thanks, there are also failures in meta-gpl2, for which I will also=
 make patches. <br></div><div>Systemtap issue is now fixed.</div></div></di=
v></blockquote><div><br></div><div>I have now sent the meta-gplv2 patches t=
o yocto@ and the patchset for gettext+systemtap here.</div><div><br></div><=
div>Alex<br></div></div></div>

--0000000000009640990599e87598--
