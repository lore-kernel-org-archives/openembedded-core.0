Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5090F60190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:24:28 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id o2so2982503ioe.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M+Cs2RWEoeZWrPZxXRQC5RH45dc7mblq760RmJwj9qU=;
	b=usqXWD16+IsdUUNfy30FbSp7UrJBvafemc8IorsMAkFEt+EEQPdG3mJBTYCjeHPJhu
	aekF7/o4kEarYfkYS9vGQkBpAoF7JUd1LBV3BdAVgEDE9f2RiBKYI4TSEzqsZKGloGFt
	xMDTtRc9sadvLHhhqHXO4FpDlo7t3+Us3Jkczkc2q8dlC+qHv/uSvQBHc5xJ9jcCN9kq
	twgPIquE/6NDLQSv78UzZb/Jhbp0+lAHsEpP/wjYnQg87LYakWH3CxL7zBKQXi8Z0tFf
	2c7ZAl4sTrWFdVrV1h09PyEPfPypUXlWdM+sHo60vq42sNidnP7QnSCQNa0yD430UKLp
	73Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M+Cs2RWEoeZWrPZxXRQC5RH45dc7mblq760RmJwj9qU=;
	b=mx4/Py19ve4F8HKe/WD3LDbns7caPOLSrgeF7gqpmIWpgWZ9l5kH3ut9CqwRRZvBuR
	u1+KRTfZelQ+Px5KJHA3r/Ql5lMomdk8LqIqS92lN0W1blwngAj9gs5UOfm2K83lWQ//
	HmyL1nh/VWIwDbN4rOOvuxreuwKi9NGxBmBzqSiL8Y1Oie0CtUgfCHnUHKrXhugsGEtW
	3PQXJuKcJNqQXEkUO+F6jXGFJbRSNaf9WJxPH7ZNInxZmFXQcVyUBufGeld+EGNoNEek
	KpzUV06GqKvubI3BSSbRgO/Ss0THiabeLkZDtbjb4Xm6MK/hVaGkwx2EW3HFkvJBq6xI
	MxJQ==
X-Gm-Message-State: AKGB3mKn9nOFvteBmymNvbpy34T2h1qt/m50m0FoJ2aGSRadndM4wBQd
	QA48ihpKfxQhvKX0epm5yJYdPB7cqJVF8vkl+sfMvQ==
X-Google-Smtp-Source: ACJfBotzUwnlSZ9WCq01JNaA+nhnOHamifJazuk6Ih0o5o2kF8LhZ5uj0XHrS360KsTw6dRieUQiy/SwQdIdmVvc3VU=
X-Received: by 10.107.180.18 with SMTP id d18mr3079974iof.52.1513175070263;
	Wed, 13 Dec 2017 06:24:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 13 Dec 2017 06:24:09 -0800 (PST)
In-Reply-To: <9c348b48-b93c-f1b4-9ab5-707c3af2a947@windriver.com>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
	<9c348b48-b93c-f1b4-9ab5-707c3af2a947@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Dec 2017 14:24:09 +0000
Message-ID: <CAJTo0LYJ5X8QHgbggatAdMpPPH0Oj0m27TPEE1qBpO6N5fCH+A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Wed, 13 Dec 2017 14:24:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c06f0fc8bdf6905603986fb"

--94eb2c06f0fc8bdf6905603986fb
Content-Type: text/plain; charset="UTF-8"

On 13 December 2017 at 14:17, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> yow-bashfiel-d4 [/home/bruc...poky/build]> oe-selftest -r
> runqemu.RunqemuTests.test_boot_deploy
> Traceback (most recent call last):
>   File "/home/bruce/poky/scripts/oe-selftest", line 43, in <module>
>     from oeqa.utils import load_test_components
> ImportError: bad magic number in 'oeqa': b'\x03\xf3\r\n'


You've been switching between master and a pre-py3 branch, and Python is
stupid so the py3 binary is trying to run py2 compiled binaries.

find poky -name \*.pyc -delete will fix it.

Ross

--94eb2c06f0fc8bdf6905603986fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 December 2017 at 14:17, Bruce Ashfield <span dir=3D"=
ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">=
bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">yow<span style=3D"color:rgb(34,34,34)">-bashf=
iel-d4 [/home/bruc...poky/build]&gt; oe-selftest -r runqemu.RunqemuTests.te=
st_boot</span><wbr style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(3=
4,34,34)">_deploy</span><br></div></div>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/bruce/poky/scripts/oe-s<wbr>elftest&quot;, line 43,=
 in &lt;module&gt;<br>
=C2=A0 =C2=A0 from oeqa.utils import load_test_components<br>
ImportError: bad magic number in &#39;oeqa&#39;: b&#39;\x03\xf3\r\n&#39;</b=
lockquote><div><br></div><div>You&#39;ve been switching between master and =
a pre-py3 branch, and Python is stupid so the py3 binary is trying to run p=
y2 compiled binaries.</div><div><br></div><div>find poky -name \*.pyc -dele=
te will fix it.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c06f0fc8bdf6905603986fb--
