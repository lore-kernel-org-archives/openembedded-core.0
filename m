Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 171C877362
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:02:00 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id g6so117367042igt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=zdEItGJ7yxV7Zwl1rE4tlWxcQ1FyNIQ00AJmkNQ+MSw=;
	b=NJPBxYhS7xNjk0otDog1E2IW5e0wnMv2Asj4nR6nScQsnPouZ1ML3QsTqiRDkXx1VQ
	5tWvSR5sHI2EJwTpAAW2ky3ebI5sy7TuGDeHgLL/zKy0FALjKWRNVUm9/ohrkwmLLyqT
	arF0LbjGucBPjpsKHIGVuGiR3zsZHpW3XwZwXaG3sqhvdfuSM8F54GktYEPzbicEfrsS
	rsVKGH4b3DlrhiJF9DqDyybgvu/BgdJFEhzL8TEwu2yF78FuG+03U1G4D3MlhI4bfEMY
	hZ+1FGSQtg8yQnvqBif5PFguWrUI/Cj6xGy/D3VtGvtAlx0lK9FN+Um5U8VeoyCpqB86
	sciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-type;
	bh=zdEItGJ7yxV7Zwl1rE4tlWxcQ1FyNIQ00AJmkNQ+MSw=;
	b=Eho4ptUwod6zPSn4DjU2tTKB71/hCsrOcC/PtaLCg7djwvZ3fbfuJj+NVHZbnhuZ2Q
	lEbI8WQ7Wqzx///Ah9VqKfNReAtD3p72y7jtr68NAIwVkpnAeGazmfcbMr0V+r5BPqTj
	hvDMbYkNBPJR2Vzo41iUGrYP7pnrhWi4TSGCM+AQENwDme0/5/IJwl7mR9ESdWqpP+Fd
	NAzmWSUBpdEdagfrbTOVIXUAgzXJVQhCKEIRWH4a1jS7yz1sb90O9YlO1ITSwMfqnweE
	d4dRzdHLr79LUBdhQ12z2rQbGHh079LvBSl3IBMtSVcTN1Qeav0HKIlTXxekcMpsRshl
	XV2A==
X-Gm-Message-State: AG10YORWMB1cdByQv1DtykGKryua9U6rILK7cGQ4/CyZTMDNCzJTT+02P8eMeHO5nxTxhoG7M7L3WXXUOas5Pg==
X-Received: by 10.50.78.164 with SMTP id c4mr4727505igx.6.1456250521375; Tue,
	23 Feb 2016 10:02:01 -0800 (PST)
MIME-Version: 1.0
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LZdtxNJa3FPAthW02iS2n+-xvntVrGU1MwA5vWvh1FnXg@mail.gmail.com>
In-Reply-To: <CAJTo0LZdtxNJa3FPAthW02iS2n+-xvntVrGU1MwA5vWvh1FnXg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 23 Feb 2016 18:01:51 +0000
Message-ID: <CABcZANmW9zV90WeJdGhW85FP4C_hSjTJ89V+6cFP66cRnrGJ+g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, 
	Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 23 Feb 2016 18:02:01 -0000
Content-Type: multipart/alternative; boundary=089e0122f70a07de28052c73bf01

--089e0122f70a07de28052c73bf01
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 23, 2016 at 6:55 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 23 February 2016 at 11:36, Markus Lehtonen <
> markus.lehtonen@linux.intel.com> wrote:
>
>> Make sure that we have a pristine source tree after do_unpack.
>>
>
> Interestingly this fails on db-native rebuild for me, as db is playing
> games with S (it's not the top of the tarball).  I had a look at the db
> recipe, screamed a bit, and am testing a patch to make it more idiomatic.
> Let's throw this at the autobuilder and see what happens...
>

db isn't the only recipe doing that. The fetcher unpack method knows where
it's unpacking to, I think if anyone should be clearing out the destination
first, it should.

--089e0122f70a07de28052c73bf01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Feb 23, 2016 at 6:55 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@in=
tel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 23 February 2016 at 11:36, Markus Lehtonen <span dir=3D"ltr">=
&lt;<a href=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_blank">ma=
rkus.lehtonen@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div style=3D"overflow:hidden">Make sure that we have a pristine=
 source tree after do_unpack.<br></div></blockquote></div><br></div></div><=
div dir=3D"ltr"><div class=3D"gmail_extra">Interestingly this fails on db-n=
ative rebuild for me, as db is playing games with S (it&#39;s not the top o=
f the tarball).=C2=A0 I had a look at the db recipe, screamed a bit, and am=
 testing a patch to make it more idiomatic.=C2=A0 Let&#39;s throw this at t=
he autobuilder and see what happens...</div></div></blockquote><div><br></d=
iv><div>db isn&#39;t the only recipe doing that. The fetcher unpack method =
knows where it&#39;s unpacking to, I think if anyone should be clearing out=
 the destination first, it should.=C2=A0<br></div></div></div>

--089e0122f70a07de28052c73bf01--
