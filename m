Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9BC6E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:38:46 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wn1so2577314obc.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 02:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2QEPXvMj5qNuLPCaZsnHdK0KPXlqgjUN1KbizBYZYGk=;
	b=c+M0YOqcBF1dQO8eBKyB27QxIn4+l/dc5L4L7uCCqmt6Eae3ZiMXpZamq4wwGDfpKl
	/1Ze+RvskcZfT51WyGUuIdKuS8Uhs7Y2qHYvWcS9y0za0NiNuxdU5x0Q3QtOt+CQ3AOL
	MDDR1rPhQz2GELUbAFnVBPpteB6IlwYRU6RMh0nwbeBu6UJbB0qDh+PZyl2wJHnzR+X1
	kchw0ycMagl0cGgk9JBZCZj3orLAJUqMb1PFoR0eI5EBxyDQ7MrhdyC32xMARLCnirW+
	fUXKNNP3Dxwdxce2P6u0Mm1+iVrteR2YDudh16i8VCWvBIAbadSYaFzHTLI1xi1r5+M8
	cQIg==
MIME-Version: 1.0
X-Received: by 10.60.63.235 with SMTP id j11mr840065oes.61.1389868727294; Thu,
	16 Jan 2014 02:38:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 16 Jan 2014 02:38:47 -0800 (PST)
In-Reply-To: <52D7A5F0.6090501@linaro.org>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
	<52D7A5F0.6090501@linaro.org>
Date: Thu, 16 Jan 2014 08:38:47 -0200
X-Google-Sender-Auth: un9k2VK8G3kyDBWxP9vDBrcsZ68
Message-ID: <CAP9ODKq+XKYP3ae=2tFdj5BATBUHUt6E-Wq8SzMpPebt9cN51g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Thu, 16 Jan 2014 10:38:47 -0000
Content-Type: multipart/alternative; boundary=001a11c24dbcc660e104f01407c6

--001a11c24dbcc660e104f01407c6
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> On 01/15/2014 12:22 PM, Otavio Salvador wrote:
>
>>
>>
>>
>> On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org
>> <mailto:koen.kooi@linaro.org>> wrote:
>>
>>     I've limited it to 64bit targets, but to be honest debug splitting
>>     doesn't make sense for grub since it won't run in your rootfs and
>>     attaching gdb is pretty much impossible.
>>
>>     Signed-off-by: Koen Kooi <koen.kooi@linaro.org
>>     <mailto:koen.kooi@linaro.org>>
>>
>>
>>
>> I'd prefer to remove the debug systems than skip the split. What others
>> think?
>>
>
> I'm not sure what you mean by that, do you mean using
> INHIBIT_PACKAGE_STRIP or something else?
>


Yes and be sure it has been stripped during build.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c24dbcc660e104f01407c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.or=
g</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 01/15/2014 12:22 PM, Ot=
avio Salvador wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi &lt;<a href=3D"mailto:koen.kooi@=
linaro.org" target=3D"_blank">koen.kooi@linaro.org</a><br></div><div class=
=3D"im">
&lt;mailto:<a href=3D"mailto:koen.kooi@linaro.org" target=3D"_blank">koen.k=
ooi@linaro.org</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 I&#39;ve limited it to 64bit targets, but to be honest debug splitt=
ing<br>
=A0 =A0 doesn&#39;t make sense for grub since it won&#39;t run in your root=
fs and<br>
=A0 =A0 attaching gdb is pretty much impossible.<br>
<br>
=A0 =A0 Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linaro.org=
" target=3D"_blank">koen.kooi@linaro.org</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:koen.kooi@linaro.org" target=3D"_blank=
">koen.kooi@linaro.org</a>&gt;&gt;<div class=3D"im"><br>
<br>
<br>
I&#39;d prefer to remove the debug systems than skip the split. What others=
<br>
think?<br>
</div></blockquote>
<br>
I&#39;m not sure what you mean by that, do you mean using INHIBIT_PACKAGE_S=
TRIP or something else?<br></blockquote></div><div><br></div><div><br></div=
><div>Yes and be sure it has been stripped during build.</div><div><br>
</div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http:=
//code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a>=
<br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c24dbcc660e104f01407c6--
