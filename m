Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 67C236F45A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:10:36 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so770540ykq.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=JaiFGceoM8G8zSrhwVG2Ang98w5bTGLc1XmYnlkOPNg=;
	b=Gc4vsby/QMmT4t7738BUVeESx0Rl+vYC2FWRGLEcIFTfmPHZ0qVG4F/zccAU1lzypv
	ZErhPk7Ztujwe4EmJUYfI7QNHs2Or9Ah0EDK6kTRncE5r1UO40cgzXwTYIRU7e8KYTdx
	16sl7aHAR7JVR8LaYtjZ6CIs1ejqnHwKdmoaqz4FafrKl+CvwRSov423rV8tAI4iUTdr
	HTNsAKm+p3yBn0Laj/xMvB82WCoqHRfDQ+9+kgDnvzu35e4YXv2Wl4oXhXD9XrJUgzYj
	4X5k14lZqbpwb3g0aVSaHV/TyCjp4W8xOHXBmdc6BEY1ewy4UCsg8zJ4tqHAM1ByC38p
	5PIw==
MIME-Version: 1.0
X-Received: by 10.236.207.73 with SMTP id m49mr11011749yho.5.1393697437279;
	Sat, 01 Mar 2014 10:10:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Sat, 1 Mar 2014 10:10:37 -0800 (PST)
In-Reply-To: <530F9913.4080704@gmail.com>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
	<20140227142404.GB3534@lpalcu-linux> <530F4D46.1060401@enea.com>
	<20140227151815.GC3534@lpalcu-linux> <530F9913.4080704@gmail.com>
Date: Sat, 1 Mar 2014 15:10:37 -0300
X-Google-Sender-Auth: oYQZKSnEkdJsU3P7PiWPz9eL9Kc
Message-ID: <CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Sat, 01 Mar 2014 18:10:38 -0000
Content-Type: multipart/alternative; boundary=089e016350c8ac6a7604f38f78df

--089e016350c8ac6a7604f38f78df
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello David,

On Thu, Feb 27, 2014 at 4:59 PM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

>
> On 2014-02-27 16:18, Laurentiu Palcu wrote:
>
>> On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nystr=F6m wrote:
>>
>>> On 2014-02-27 15:24, Laurentiu Palcu wrote:
>>>
>>>> Hi David,
>>>>
>>>> My comments/questions below.
>>>>
>>> Thank you for your detailed comments on the RFC.
>>> I will return with V2, where your comments are addressed when the
>>> general approach is Acked.
>>>
>>> What do you think about the general approach ?
>>>
>> I think the approach is ok. I don't know a simpler way than this to add
>> package feeds into the image.
>>
>
> OK, there seems to be no screaming objections from other parties either.
>
> I'll resend v2
>

I understand why you are adding this here but I think it'd be good to the
settings to be put in a package so in a product we may add extra
repositories updating the package.

I am trying to think now how this could be done (or optionally done).

What you think?

Other point, PACKAGE_FEED_URIS could be change to PACKAGE_FEED_URI as it
matches SRC_URI for example.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e016350c8ac6a7604f38f78df
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello David,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Thu, Feb 27, 2014 at 4:59 PM, David Nystr=F6m <span dir=3D"l=
tr">&lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank">davi=
d.c.nystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D""><br>
On 2014-02-27 16:18, Laurentiu Palcu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nystr=F6m wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
On 2014-02-27 15:24, Laurentiu Palcu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi David,<br>
<br>
My comments/questions below.<br>
</blockquote>
Thank you for your detailed comments on the RFC.<br>
I will return with V2, where your comments are addressed when the<br>
general approach is Acked.<br>
<br>
What do you think about the general approach ?<br>
</blockquote>
I think the approach is ok. I don&#39;t know a simpler way than this to add=
<br>
package feeds into the image.<br>
</blockquote>
<br></div>
OK, there seems to be no screaming objections from other parties either.<br=
>
<br>
I&#39;ll resend v2<br></blockquote><div><br></div><div>I understand why you=
 are adding this here but I think it&#39;d be good to the settings to be pu=
t in a package so in a product we may add extra repositories updating the p=
ackage.</div>
<div><br></div><div>I am trying to think now how this could be done (or opt=
ionally done).</div><div><br></div><div>What you think?</div><div><br></div=
><div>Other point,=A0<span style=3D"color:rgb(80,0,80);font-family:arial,sa=
ns-serif;font-size:13px">PACKAGE_FEED_URIS could be change to=A0</span><spa=
n style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:13px">=
PACKAGE_FEED_URI as it matches SRC_URI for example.</span></div>
<div>=A0</div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a hr=
ef=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystems=
.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-10" class=3D"" title=3D"Call with Google Voice">+1 (347) 903-975=
0</span></span><br>
</div></div>

--089e016350c8ac6a7604f38f78df--
