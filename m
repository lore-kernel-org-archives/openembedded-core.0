Return-Path: <tarek.elsherbiny@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 249EE60808
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 14:56:05 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id f73so4297762yha.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h5phhXktHNtOQMjHPatlPUEzqHZKRc/CAlEZFVaZlJc=;
	b=vZEMWd1Gbnd+DeCNYnWcXGRSYgqUNpvEdcFM6jy0B0Ut+pPljU9e1STwvtCH+l824b
	VSLQBq62/SQeDIs6VtnmWhow3sWKSDS8AKhJ+JWOKpUxt+yhM7kGHeDMPVnmJyoM20BP
	cJSn2wrdoiBm5bCFo90X31WS6n9njhKrD5I/BkWQVN666Snp3m9PQ08wDSySjoCcfPPC
	Se7R5tOoO6E3+tzL80g70QZwNdAylZeLwo+UFhrKU8+0T4cqG+YcD6iBg4qQCOKyBuz6
	p71RFY4GHDsnA6usxgP1E9LhHShPaIIRs00lNTPBps25dmtaHkPGB+7qiaRq7mnI1JfE
	QIMQ==
MIME-Version: 1.0
X-Received: by 10.236.177.100 with SMTP id c64mr24299117yhm.30.1399042565913; 
	Fri, 02 May 2014 07:56:05 -0700 (PDT)
Received: by 10.170.71.65 with HTTP; Fri, 2 May 2014 07:56:05 -0700 (PDT)
In-Reply-To: <5363A89F.6060709@topic.nl>
References: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA4705@IRSMSX105.ger.corp.intel.com>
	<CAB3sqta0_u-Uv4EKXd6Y9upxyQfDEQ9_m_H=OL=tmMFKRb_14w@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA474F@IRSMSX105.ger.corp.intel.com>
	<5363A89F.6060709@topic.nl>
Date: Fri, 2 May 2014 15:56:05 +0100
Message-ID: <CAB3sqtZjEU_WntKYh6SBKO7M+5gBTc2yJ9KtUu-Bf=mR_E=TpA@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: DNS when using Static IP
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
X-List-Received-Date: Fri, 02 May 2014 14:56:06 -0000
Content-Type: multipart/alternative; boundary=20cf303f656a2ac20c04f86bfbac

--20cf303f656a2ac20c04f86bfbac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have created  resolv.conf  manually using vi but every time I do a reboot
the file comes back empty. and the dns function is not working.

What is the best solution to this?


On Fri, May 2, 2014 at 3:15 PM, Mike Looijmans <mike.looijmans@topic.nl>wro=
te:

> When using DHCP, busybox's udhcpc script will write the DNS entries that
> the server returned into the resolv.conf file.
>
> In this case, I think you'll have to "provide" resolv.conf in some other
> way, there's nothing in ifup/ifdown that will modify resolv.conf based on
> keywords in the interfaces file.
>
> Mike.
>
>
>
> On 05/02/2014 02:49 PM, Iorga, Cristian wrote:
>
>> Not really, I just wanted to get a better overview of the issue that you
>> are facing.
>>
>> What image did you started from, if any?
>>
>> *From:*Tarek El-Sherbiny [mailto:tarek.elsherbiny@gmail.com]
>> *Sent:* Friday, May 2, 2014 3:31 PM
>> *To:* Iorga, Cristian
>> *Cc:* openembedded-core@lists.openembedded.org; yocto@yoctoproject.org
>> *Subject:* RE: [OE-core] DNS when using Static IP
>>
>>
>> No connman is not included.  Shall I include it and try?
>>
>> On 2 May 2014 13:01, "Iorga, Cristian" <cristian.iorga@intel.com
>> <mailto:cristian.iorga@intel.com>> wrote:
>>
>>     Hello,
>>
>>     What image did you start from, if any?
>>
>>     i.e., core-image-minimal, core-image-sato, etc=E2=80=A6
>>
>>     Is connman included?
>>
>>     Regards,
>>
>>     Cristian Iorga
>>
>>     YP
>>
>>     Intel Corporation
>>
>>     *From:*openembedded-core-bounces@lists.openembedded.org
>>     <mailto:openembedded-core-bounces@lists.openembedded.org>
>>     [mailto:openembedded-core-bounces@lists.openembedded.org
>>     <mailto:openembedded-core-bounces@lists.openembedded.org>] *On
>>     Behalf Of *Tarek El-Sherbiny
>>     *Sent:* Friday, May 2, 2014 2:05 PM
>>     *To:* yocto@yoctoproject.org <mailto:yocto@yoctoproject.org>;
>>     openembedded-core@lists.openembedded.org
>>     <mailto:openembedded-core@lists.openembedded.org>
>>     *Subject:* [OE-core] DNS when using Static IP
>>
>>
>>     Hi.
>>
>>     I'm trying to set my IP config to a static address.
>>
>>     iface eth0 inet static
>>
>>           address 192.168.55.45
>>
>>           network 192.168.55.0
>>
>>           netmask 255.255.255.0
>>
>>           broadcast 192.168.55.255
>>
>>           gateway 192.168.55.1
>>
>>           dns-nameservers 192.168.10.2
>>
>>     But I don't get the DNS server address to be included in
>>     /etc/resolv.conf
>>
>>     If I run in dchp mode, then the resolv.conf is updated with my DNS
>>     address.
>>
>>     Is there something I'm missing here in my setup?
>>
>>     --
>>
>>     /Tarek/
>>
>>
>>
>>
>
> --
> Mike Looijmans
>



--=20
*Tarek*

--20cf303f656a2ac20c04f86bfbac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have created=C2=A0<span style=3D"font-family:arial,sans-=
serif;font-size:12.800000190734863px">=C2=A0resolv.conf =C2=A0manually usin=
g vi but every time I do a reboot the file comes back empty. and the dns fu=
nction is not working.</span><div>
<span style=3D"font-family:arial,sans-serif;font-size:12.800000190734863px"=
><br></span></div><div><span style=3D"font-family:arial,sans-serif;font-siz=
e:12.800000190734863px">What is the best solution to this?</span></div></di=
v>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, May 2=
, 2014 at 3:15 PM, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"mailto:m=
ike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">When using DHCP, busybox&#39;s udhcpc script=
 will write the DNS entries that the server returned into the resolv.conf f=
ile.<br>

<br>
In this case, I think you&#39;ll have to &quot;provide&quot; resolv.conf in=
 some other way, there&#39;s nothing in ifup/ifdown that will modify resolv=
.conf based on keywords in the interfaces file.<br>
<br>
Mike.<div class=3D""><br>
<br>
<br>
On 05/02/2014 02:49 PM, Iorga, Cristian wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"">
Not really, I just wanted to get a better overview of the issue that you<br=
>
are facing.<br>
<br>
What image did you started from, if any?<br>
<br></div>
*From:*Tarek El-Sherbiny [mailto:<a href=3D"mailto:tarek.elsherbiny@gmail.c=
om" target=3D"_blank">tarek.elsherbiny@<u></u>gmail.com</a>]<br>
*Sent:* Friday, May 2, 2014 3:31 PM<br>
*To:* Iorga, Cristian<br>
*Cc:* <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D=
"_blank">openembedded-core@lists.<u></u>openembedded.org</a>; <a href=3D"ma=
ilto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproject.org</a><b=
r>
*Subject:* RE: [OE-core] DNS when using Static IP<div class=3D""><br>
<br>
No connman is not included. =C2=A0Shall I include it and try?<br>
<br>
On 2 May 2014 13:01, &quot;Iorga, Cristian&quot; &lt;<a href=3D"mailto:cris=
tian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel.com</a><br></d=
iv><div class=3D"">
&lt;mailto:<a href=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cr=
istian.iorga@intel.<u></u>com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hello,<br>
<br>
=C2=A0 =C2=A0 What image did you start from, if any?<br>
<br>
=C2=A0 =C2=A0 i.e., core-image-minimal, core-image-sato, etc=E2=80=A6<br>
<br>
=C2=A0 =C2=A0 Is connman included?<br>
<br>
=C2=A0 =C2=A0 Regards,<br>
<br>
=C2=A0 =C2=A0 Cristian Iorga<br>
<br>
=C2=A0 =C2=A0 YP<br>
<br>
=C2=A0 =C2=A0 Intel Corporation<br>
<br></div>
=C2=A0 =C2=A0 *From:*<a href=3D"mailto:openembedded-core-bounces@lists.open=
embedded.org" target=3D"_blank">openembedded-core-<u></u>bounces@lists.open=
embedded.org</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-core-bounces@lists.=
openembedded.org" target=3D"_blank">openembedded-core-<u></u>bounces@lists.=
openembedded.org</a><u></u>&gt;<br>
=C2=A0 =C2=A0 [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core-<u></u>bounces@lists.ope=
nembedded.org</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-core-bounces@lists.=
openembedded.org" target=3D"_blank">openembedded-core-<u></u>bounces@lists.=
openembedded.org</a><u></u>&gt;] *On<br>
=C2=A0 =C2=A0 Behalf Of *Tarek El-Sherbiny<br>
=C2=A0 =C2=A0 *Sent:* Friday, May 2, 2014 2:05 PM<br>
=C2=A0 =C2=A0 *To:* <a href=3D"mailto:yocto@yoctoproject.org" target=3D"_bl=
ank">yocto@yoctoproject.org</a> &lt;mailto:<a href=3D"mailto:yocto@yoctopro=
ject.org" target=3D"_blank">yocto@yoctoproject.org</a><u></u>&gt;;<br>
=C2=A0 =C2=A0 <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.<u></u>openembedded.org</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-core@lists.openembe=
dded.org" target=3D"_blank">openembedded-core@<u></u>lists.openembedded.org=
</a>&gt;<br>
=C2=A0 =C2=A0 *Subject:* [OE-core] DNS when using Static IP<div class=3D"">=
<br>
<br>
=C2=A0 =C2=A0 Hi.<br>
<br>
=C2=A0 =C2=A0 I&#39;m trying to set my IP config to a static address.<br>
<br>
=C2=A0 =C2=A0 iface eth0 inet static<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 address 192.168.55.45<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network 192.168.55.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 netmask 255.255.255.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 broadcast 192.168.55.255<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gateway 192.168.55.1<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dns-nameservers 192.168.10.2<br>
<br>
=C2=A0 =C2=A0 But I don&#39;t get the DNS server address to be included in<=
br>
=C2=A0 =C2=A0 /etc/resolv.conf<br>
<br>
=C2=A0 =C2=A0 If I run in dchp mode, then the resolv.conf is updated with m=
y DNS<br>
=C2=A0 =C2=A0 address.<br>
<br>
=C2=A0 =C2=A0 Is there something I&#39;m missing here in my setup?<br>
<br>
=C2=A0 =C2=A0 --<br>
<br></div>
=C2=A0 =C2=A0 /Tarek/<br>
<br>
<br>
<br><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
<br>
-- <br>
Mike Looijmans<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div dir=3D"ltr"><i><font color=3D"#666666" face=3D"arial, helvetica, san=
s-serif">Tarek</font></i></div>
</div>

--20cf303f656a2ac20c04f86bfbac--
