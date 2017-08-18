Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC21780A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:55:26 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id r199so35087930vke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ul/CeG2YgQfyGSsn9OPNuuwCGh7QxxE3uG+kOhk7Auk=;
	b=qj0gxDu9f8D0OHjyvhVmc2KjPtki9a914YbmT+zKdMLbQQmaK/dQJwYUcB3yFjtWYP
	HZh8vPJSZTTI/Z7LVd06V1WVOb9x7myIhPCokfdBalNt3xlt+msTgF3tKad1L3UnYuwx
	WPmnohl5tYMZwlf629l26WdTph4YbIYqhXT1qGyoNKLPgjJ/n+esX+6jQsmWjrpI/vqZ
	m1HOy9dtPXSf03IZXCN/yPGOHW0VW8NsjTUIOQ80vIisUlz7u6t9VxU8zpacocSNpSHQ
	saqVTF6lyPXqHWenkojwbCIWkIhcoF562VNCr7rrL6mN7KHIwuT9xAcqn3dIrdgZ5z40
	obUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ul/CeG2YgQfyGSsn9OPNuuwCGh7QxxE3uG+kOhk7Auk=;
	b=CxxlKRc1JbwuPIqXhqhob2OLHS/Ebbjt5PcaISMnmSSVmfBkZRaIZFxfF80s9MvFRS
	RUAXYhdp/B09d7BHAR6o+vieG4TUAGSYaxKRKUyUL5mIvgxU5QThLbfej0lHMdplhEHN
	IcxzgNdLdLjP1gJZgKEXcjbP38YWRQuJYg5ND4Wt1XASwB8OPznlqIpP7kdPz3gj7h0d
	EPhQWoLZSfwR4I3BE883GHpShlrOt52x+4CH1CmYfHe3zeUGZfsIXnxlVlHVI9m82bSe
	+I/wHZxwcJDFsfkeNXOeOCc37GJRgmOMCrF6+DPs1Qu3BV7b2Sy0kW68IvK8QwdpJONk
	Yn4A==
X-Gm-Message-State: AHYfb5hwp+Pr7EB0SBBrBx+XnQhMtokLJZSkyPXdNglb5CnfN5WxgJ44
	piQ8Sp5pic9DoGs+Czh0XEqyue/SrQ==
X-Received: by 10.31.156.135 with SMTP id f129mr6526984vke.90.1503082528025;
	Fri, 18 Aug 2017 11:55:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 18 Aug 2017 11:55:27 -0700 (PDT)
In-Reply-To: <3082288d-055f-50a4-c81e-6483d324d706@linux.intel.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
	<CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
	<de4a91fe-0dc0-208e-1b2e-3e0e897fdd12@windriver.com>
	<3082288d-055f-50a4-c81e-6483d324d706@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Aug 2017 20:55:27 +0200
Message-ID: <CA+chaQdz6DPvUZ2bnHk_tAnWUkrQW5Epj=ZWtMgrbSiL-38Szw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 18:55:27 -0000
Content-Type: multipart/alternative; boundary="001a1140f27026b26505570bac2b"

--001a1140f27026b26505570bac2b
Content-Type: text/plain; charset="UTF-8"

I don't know why they care about it, but yes it will take long time:
https://www.openssl.org/blog/blog/2017/08/17/fips/

On Fri, Aug 18, 2017 at 8:41 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 08/18/2017 08:56 PM, Mark Hatle wrote:
>
>> Even with that patch to rename openssl10 back to openssl we still need to
>>> solve
>>> the openssl-native which wasn't reverted back to 1.0.
>>>
>>> Upstream nodejs isn't going to be openssl-1.1 for a bit longer as
>>> explained:
>>> https://github.com/nodejs/node/pull/14761
>>>
>>
>> I wanted to pull out a specific comment from the above link that shows
>> one of
>> the reasons why OpenSSL 1.1 support is delayed by many:
>>
>> 7 days ago: shigeki commented:
>>
>>> We're also waiting for FIPS support of 1.1.x. They are now working on it
>>> as https://www.openssl.org/blog/blog/2017/07/25/fips/.> ...
>>>
>>
>> Until the OpenSSL 1.1.x FIPS work is further along, a lot of projects
>> (and major
>> distributions) are going to wait to deploy it.
>>
>
> What I don't understand is why node even cares about FIPS? FIPS compliance
> is needed to win software supplier contracts with one certain government; I
> haven't seen any other reasons.
>
> Another point is that getting FIPS done will take a very long time,
> possibly two years or more, and this work is just starting now with no
> clear funding or completion date (see the openssl blog link). Meanwhile,
> all major desktop linux distros have 1.1 by default already; seems to me
> that they don't care.
>
> Alex
>

--001a1140f27026b26505570bac2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know why they care about it, but yes it will t=
ake long time:<div><a href=3D"https://www.openssl.org/blog/blog/2017/08/17/=
fips/">https://www.openssl.org/blog/blog/2017/08/17/fips/</a><br></div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 18,=
 2017 at 8:41 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On 08/18/2017 08:56 PM, Mark Hatle wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Even with that patch to rename openssl10 back to openssl we still need to s=
olve<br>
the openssl-native which wasn&#39;t reverted back to 1.0.<br>
<br>
Upstream nodejs isn&#39;t going to be openssl-1.1 for a bit longer as expla=
ined:<br>
<a href=3D"https://github.com/nodejs/node/pull/14761" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/nodejs/node<wbr>/pull/14761</a><br>
</blockquote>
<br>
I wanted to pull out a specific comment from the above link that shows one =
of<br>
the reasons why OpenSSL 1.1 support is delayed by many:<br>
<br>
7 days ago: shigeki commented:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
We&#39;re also waiting for FIPS support of 1.1.x. They are now working on i=
t as <a href=3D"https://www.openssl.org/blog/blog/2017/07/25/fips/" rel=3D"=
noreferrer" target=3D"_blank">https://www.openssl.org/blog/b<wbr>log/2017/0=
7/25/fips/</a>.&gt; ...<br>
</blockquote>
<br>
Until the OpenSSL 1.1.x FIPS work is further along, a lot of projects (and =
major<br>
distributions) are going to wait to deploy it.<br>
</blockquote>
<br></span>
What I don&#39;t understand is why node even cares about FIPS? FIPS complia=
nce is needed to win software supplier contracts with one certain governmen=
t; I haven&#39;t seen any other reasons.<br>
<br>
Another point is that getting FIPS done will take a very long time, possibl=
y two years or more, and this work is just starting now with no clear fundi=
ng or completion date (see the openssl blog link). Meanwhile, all major des=
ktop linux distros have 1.1 by default already; seems to me that they don&#=
39;t care.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a1140f27026b26505570bac2b--
