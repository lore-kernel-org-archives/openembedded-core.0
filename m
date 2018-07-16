Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 72E0074596
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 14:19:05 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id 125-v6so21746385vke.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5NZ5Zv6suEOOp32DTEkbgMJdBSkiOomLT0DDobjGhdQ=;
	b=YbjtnfpdJ/c9eUsDlt6w2NzDyWLDIiQ5Mw9XQNpXJU1+u3BvqA6J0XWWG8a3yan0U9
	mhWCKg7z3YlILhRTyiZwMpxQHyznayBxzUpQHD9dKeuXn0+2lkVeTLzk+ea5nRqTAR+j
	Kw6/h0hipVdjkywbRxTUWZj31V1KsNdJRA4lOD/wglBC9bMBsf3udWyjLh0nkaw4u6Mk
	30jDNiHiuldMuOgnT9Qig+h0rrjd0nk7OVIn1XPN0x1uJHmU9AntFN+opz1cdtdia5Nc
	sTKrQzhN+ePadFgIu70wXXAELKGVE7rNBR40rmWQ3HTMT1hZB85HXuckr9JAUG5C8XHS
	rfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5NZ5Zv6suEOOp32DTEkbgMJdBSkiOomLT0DDobjGhdQ=;
	b=GdnV4QP7zScfBkN2+DnxGRI6dUgA9HqB6aIDddVrLWBYn/7AedgmxujPO+9ZB57pNg
	mXpi4HdLK76PwfxbswJRiG3BDuISGbHmwDlOzSQ7cfLNA0rv0CPyFbXVqrucdnLNvDLK
	gs1bkIYD3+ltayfNULKrTlGYrnHIhtn+PHRCDSssOMs5V0IPBunP6uMz3fbWijXSg6Wc
	l1xqN6TaMont9y7AcxTbk58QUT3TolVpqhZ2OnF+iOXYQV9laskcDKkjKdWsD72+mPY3
	Kr7P+CbA0N7V0tiLK0Mqo7oDUOszy91yOSN9eHcwHDUW6qIU09EHAQOE7rdGysLo9hWm
	8frA==
X-Gm-Message-State: AOUpUlHDtK6Sdgku6/yipLypfsg6m/ZCBRfkZPvbDAENtyG+XXSzxg/A
	bWQZPSlzsgsdHYxQb+/jxyWhIzPtvMk1KXokS1g=
X-Google-Smtp-Source: AAOMgpfxTtA2gM6wqJ7k4BkL8hrefI2WwrP99vBG5Er+RMTMbIPTxMOfv9BFo2kpc4O448/R/BzqcBA2ORjd2xcO0Yg=
X-Received: by 2002:a1f:992:: with SMTP id
	140-v6mr10212607vkj.182.1531750746103; 
	Mon, 16 Jul 2018 07:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
	<CANNYZj_M=6Ku76j2y=fvdEyN2xvv=8avg4NK-zmg9gs5Ur5nXw@mail.gmail.com>
	<CABPh3UNKtJ-Nd9r1VtFfeOMAHome5xJGmh-Hfw_qGCbjMxWoig@mail.gmail.com>
In-Reply-To: <CABPh3UNKtJ-Nd9r1VtFfeOMAHome5xJGmh-Hfw_qGCbjMxWoig@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 16 Jul 2018 07:18:55 -0700
Message-ID: <CANx9H-AaXcGjX_D3CBYeXXcFWpezkMkjmpHXxj-TmxjLnAphpQ@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [HELP] ptest & ptest
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
X-List-Received-Date: Mon, 16 Jul 2018 14:19:05 -0000
Content-Type: multipart/alternative; boundary="0000000000001b221905711e8310"

--0000000000001b221905711e8310
Content-Type: text/plain; charset="UTF-8"

http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb
http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
On Mon, Jul 16, 2018 at 1:41 AM nick83ola <nick83ola@gmail.com> wrote:

> Hi Alex,
> thanks for your response.
>
> Do you or anyone else have an example about an actual python package that
> use ptest (possibily using distutils/nose/py.test)?
>
> Thanks
> Nick
>
> On Tue, 26 Jun 2018 at 16:07, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> The Yocto documentation has general information:
>>
>>
>> https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest
>>
>> Alex
>>
>>
>> 2018-06-26 14:57 GMT+02:00 nick83ola <nick83ola@gmail.com>:
>> > Hi all,
>> >
>> > I have a python3 package that launch a py.test test suite from
>> > setup.py and I have created a recipe for it using setuptools3
>> >
>> > Anyone has some hint about how to add a ptest target to run the tests
>> > into the final image (or better in a qemu test image)?
>> >
>> > there are some recipe/documentation that I can look at about creating
>> > -ptest target for python packages?
>> >
>> > Regards
>> > Nicola Lunghi
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001b221905711e8310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-python/=
recipes-devtools/python/python-cryptography_2.2.2.bb">http://cgit.openembed=
ded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-c=
ryptography_2.2.2.bb</a><br><a href=3D"http://cgit.openembedded.org/meta-op=
enembedded/tree/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb">=
http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-dev=
tools/python/python-pygpgme_0.3.bb</a><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Mon, Jul 16, 2018 at 1:41 AM nick83ola &lt;<a href=3D"mailto:=
nick83ola@gmail.com">nick83ola@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div>Hi Alex, <br></div><div>thanks f=
or your response.</div><div><br></div><div>Do you or anyone else have an ex=
ample about an actual python package that use ptest (possibily using distut=
ils/nose/py.test)?</div><div><br></div><div>Thanks<br></div><div>Nick<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 26 Jun 20=
18 at 16:07, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">The Yocto documentation has general information:<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.h=
tml#testing-packages-with-ptest" rel=3D"noreferrer" target=3D"_blank">https=
://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-pack=
ages-with-ptest</a><br>
<br>
Alex<br>
<br>
<br>
2018-06-26 14:57 GMT+02:00 nick83ola &lt;<a href=3D"mailto:nick83ola@gmail.=
com" target=3D"_blank">nick83ola@gmail.com</a>&gt;:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I have a python3 package that launch a py.test test suite from<br>
&gt; setup.py and I have created a recipe for it using setuptools3<br>
&gt;<br>
&gt; Anyone has some hint about how to add a ptest target to run the tests<=
br>
&gt; into the final image (or better in a qemu test image)?<br>
&gt;<br>
&gt; there are some recipe/documentation that I can look at about creating<=
br>
&gt; -ptest target for python packages?<br>
&gt;<br>
&gt; Regards<br>
&gt; Nicola Lunghi<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001b221905711e8310--
