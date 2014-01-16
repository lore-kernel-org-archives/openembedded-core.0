Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 31C876E20F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 14:29:08 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x55so3225886wes.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DGTZc4UuwmF3uTeW7AlVTzYHx+YRXD3MhJ4L/FZ9dEU=;
	b=viZgl9K45jIqWVKJ6Q60RK0stjDQlyU4OWLM+vqKngoag6dCn/aPbmt0nfNxnoIEoG
	CpO6VS7vqCsj15rCo2F0ZUMDiyrQFGbftAhRscl+5JeoNNLZiwYZpbrbmrWSypeVll/w
	mEvpuHu2cX+A2JO1DStTmLoxpatraufLawikkCiwyd9RYFVnXHMsy1OS4UxX3cCyneTE
	Ork5ODm4K22HdpCmr5eF3sT4z8ygKRwyPz1luj38+LObHqtjhSQVP/ACagebsdxoVzoF
	egiAApMSvGUO3UYAbSCAXUClQ0xd32SUSzgkxEmb2FY82w6KA47YscG3QbYybqsBf3jW
	4ajw==
MIME-Version: 1.0
X-Received: by 10.194.236.9 with SMTP id uq9mr8632539wjc.31.1389882548554;
	Thu, 16 Jan 2014 06:29:08 -0800 (PST)
Received: by 10.194.201.102 with HTTP; Thu, 16 Jan 2014 06:29:08 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CDCC0F@IRSMSX105.ger.corp.intel.com>
References: <CABuzA3P2x+_N6ssGGR4zBEZNHiXBCYOf=-u-gSRs4QcanK74JQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CDCC0F@IRSMSX105.ger.corp.intel.com>
Date: Thu, 16 Jan 2014 14:29:08 +0000
Message-ID: <CABuzA3MnAYopgygx8QTokmm6yaWoYLz94Ev6dFyuXjf8_q3=EQ@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: avahi + latest airplay release from apple
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
X-List-Received-Date: Thu, 16 Jan 2014 14:29:08 -0000
Content-Type: multipart/alternative; boundary=089e01493de096122004f0173f4e

--089e01493de096122004f0173f4e
Content-Type: text/plain; charset=ISO-8859-1

Yes, this is the airplay source release from apple that will allow us to
support airplay on our devices. It needs a bonjour port but looks like
avahi does not implement the full API required.

I expect you're right -  I will try the avahi lists as well.

But if anyone is trying to do the same thing let me know.

Thanks
John



On 16 January 2014 13:43, Iorga, Cristian <cristian.iorga@intel.com> wrote:

>  Hello,
>
> By Airplay released by Apple, are you referring to an SDK or something
> like that to build devices with Airplay (sinker) support?
>
> In my opinion, I think your question should be better directed to the
> avahi developers.
>
> Regards,
>
> Cristian Iorga
>
> YP
>
> Intel
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *John
> Stirling
> *Sent:* Thursday, January 16, 2014 2:46 PM
> *To:* openembedded-core@lists.openembedded.org
> *Subject:* [OE-core] avahi + latest airplay release from apple
>
>
>
> I'm attempting to use avahi (0.6.31) with the latest airplay release from
> apple. Is anyone else attempting the same thing ?
>
>
>
> There are some issues -
>
>
>
> avahi dns_sd.h is missing a few defines needed by airplay (patch attached)
>
> DNSServiceGetAddrInfo doesn't exist in avahi and is called from airplay
>
>
>
> avahi HEAD doesn't seem to implement this function either and there
> doesn't seem to have been much activity since the 0.6.31 release
>
>
>
> Any advice ?
>
>
>
> Thanks
>
> John
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>

--089e01493de096122004f0173f4e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, this is the airplay source release from apple that wi=
ll allow us to support airplay on our devices. It needs a bonjour port but =
looks like avahi does not implement the full API required.<div><br></div><d=
iv>
I expect you&#39;re right - =A0I will try the avahi lists as well.</div><di=
v><br></div><div>But if anyone is trying to do the same thing let me know.<=
/div><div><br></div><div>Thanks</div><div>John<br><div><br></div><div><div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On 16 January=
 2014 13:43, Iorga, Cristian <span dir=3D"ltr">&lt;<a href=3D"mailto:cristi=
an.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Hello,<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">By Airplay released by Ap=
ple, are you referring to an SDK or something like that to build devices wi=
th Airplay (sinker) support?<u></u><u></u></span></p>

<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">In my opinion, I think yo=
ur question should be better directed to the avahi developers.<u></u><u></u=
></span></p>

<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Cristian Iorga<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">YP<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Intel<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><a name=3D"1439b4b792fdfd32__MailEndCompose"><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:#1f497d"><u></u>=A0<u></u></span></a></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;"> <a hre=
f=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=3D"_bl=
ank">openembedded-core-bounces@lists.openembedded.org</a> [mailto:<a href=
=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core-bounces@lists.openembedded.org</a>]
<b>On Behalf Of </b>John Stirling<br>
<b>Sent:</b> Thursday, January 16, 2014 2:46 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> [OE-core] avahi + latest airplay release from apple<u></u><=
u></u></span></p><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal">I&#39;m attempting to use avahi (0.6.31) with the la=
test airplay release from apple. Is anyone else attempting the same thing ?=
=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There are some issues -<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">avahi dns_sd.h is missing a few defines needed by ai=
rplay (patch attached)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">DNSServiceGetAddrInfo doesn&#39;t exist in avahi and=
 is called from airplay<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">avahi HEAD doesn&#39;t seem to implement this functi=
on either and there doesn&#39;t seem to have been much activity since the 0=
.6.31 release<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Any advice ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">John<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>
</div></div></div>
</div>

</blockquote></div><br></div></div></div></div></div>

--089e01493de096122004f0173f4e--
