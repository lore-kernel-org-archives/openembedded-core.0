Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe7Bj-0007TF-EW
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:05:23 +0200
Received: by wyg30 with SMTP id 30so4566456wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 08:01:34 -0700 (PDT)
Received: by 10.216.8.80 with SMTP id 58mr6185101weq.0.1309878094177;
	Tue, 05 Jul 2011 08:01:34 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.189])
	by mx.google.com with ESMTPS id n17sm2310949wed.40.2011.07.05.08.01.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 08:01:33 -0700 (PDT)
References: <cover.1307895912.git.koen@dominion.thruhere.net>
	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
	<29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
	<4E0D0211.5040102@linux.intel.com>
	<5A258184-4045-4BAE-AE15-F5ADDBD62B77@dominion.thruhere.net>
	<1309875430.20015.717.camel@rex>
In-Reply-To: <1309875430.20015.717.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <B8FD72A4-2F8C-48AF-AA13-E686D39ADB01@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 5 Jul 2011 16:01:26 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 15:05:23 -0000
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-3-858406978

--Apple-Mail-3-858406978
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 jul. 2011 om 15:17 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Fri, 2011-07-01 at 08:50 +0200, Koen Kooi wrote:
>> Op 1 jul 2011, om 01:09 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 06/30/2011 03:33 PM, Koen Kooi wrote:
>>> I believe that this has been discussed elsewhere.
>>=20
>> Let's post the outcome here then, since I still want this patch to go in.=

>>=20
>>>> Op 12 jun 2011, om 18:26 heeft Koen Kooi het volgende geschreven:
>>>>=20
>>>>> The ext3 format is pretty much mandatory for qemu usage, so always cre=
ate it.
>>>>>=20
>>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>>> ---
>>>>> meta/conf/machine/include/qemu.inc |    2 +-
>>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>=20
>>>>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/in=
clude/qemu.inc
>>>>> index 9ef242f..e908f69 100644
>>>>> --- a/meta/conf/machine/include/qemu.inc
>>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>>> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-kdriv=
e"
>>>>>=20
>>>>> MACHINE_FEATURES =3D "kernel26 apm alsa pcmcia bluetooth irda usbgadge=
t screen"
>>>>>=20
>>>>> -IMAGE_FSTYPES ?=3D "tar.bz2 ext3"
>>>>> +IMAGE_FSTYPES +=3D "tar.bz2 ext3"
>>>>>=20
>>>>> ROOT_FLASH_SIZE =3D "280"
>>>>>=20
>=20
> Well, I've mentioned this once in a reply but for the record if we start
> using +=3D in machine files this makes the values much harder to change
> and for anyone to exclude either tar.bz2 or ext3 from the variable.
>=20
> I'm therefore concerned this change makes things less usable.

currently I get no ext3 images which breaks the qemu scripts.

I currently have no way of saying "I always want tgz and the native formats"=






> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--Apple-Mail-3-858406978
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body bgcolor=3D"#FFFFFF"><div><br><br>Op 5 jul. 2011 om 15:17 heeft R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; het volgende geschreven:<br><br></div=
><div></div><blockquote type=3D"cite"><div><span>On Fri, 2011-07-01 at 08:50=
 +0200, Koen Kooi wrote:</span><br><blockquote type=3D"cite"><span>Op 1 jul 2=
011, om 01:09 heeft Saul Wold het volgende geschreven:</span><br></blockquot=
e><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>On 06/30/2011 03:33 PM, Koen Kooi wro=
te:</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>I believe that this has been discussed elsewhere.</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br><=
/blockquote><blockquote type=3D"cite"><span>Let's post the outcome here then=
, since I still want this patch to go in.</span><br></blockquote><blockquote=
 type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>Op 12 jun 2011, om 18:2=
6 heeft Koen Kooi het volgende geschreven:</span><br></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>The ext3 format is pretty much mandatory for=
 qemu usage, so always create it.</span><br></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>S=
igned-off-by: Koen Kooi&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koe=
n@dominion.thruhere.net</a>&gt;</span><br></blockquote></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>---</span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
meta/conf/machine/include/qemu.inc | &nbsp;&nbsp;&nbsp;2 +-</span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>1 files changed, 1 insertions(+), 1 deletions(-)</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>diff --git a/meta/conf/machine/include/qemu.inc b/meta/con=
f/machine/include/qemu.inc</span><br></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>index 9ef242f..e908f69 100644=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>--- a/meta/conf/machine/include/qemu.inc</span><br></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>+++ b/meta/conf/machine/include/qemu.inc</span><br></blockquote></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -3,7 +3,=
7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-kdrive"</span><br></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span></span><br></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>MACHINE_FEATURES =3D "kernel26 apm alsa pcmcia bl=
uetooth irda usbgadget screen"</span><br></blockquote></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>-IMAG=
E_FSTYPES ?=3D "tar.bz2 ext3"</span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>+IMAGE_FSTYPES +=3D "tar.b=
z2 ext3"</span><br></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span></span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>ROOT_FLASH_SIZE =3D "280"<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote></blockquote></block=
quote><span></span><br><span>Well, I've mentioned this once in a reply but f=
or the record if we start</span><br><span>using +=3D in machine files this m=
akes the values much harder to change</span><br><span>and for anyone to excl=
ude either tar.bz2 or ext3 from the variable.</span><br><span></span><br><sp=
an>I'm therefore concerned this change makes things less usable.</span><font=
 class=3D"Apple-style-span" color=3D"#000000"><font class=3D"Apple-style-spa=
n" color=3D"#0023A3"><br></font></font></div></blockquote><div><br></div>cur=
rently I get no ext3 images which breaks the qemu scripts.<div><br></div><di=
v>I currently have no way of saying "I always want tgz and the native format=
s"<br><div><br></div><div><br></div><div><br></div><div><br></div><br><block=
quote type=3D"cite"><div><span>Cheers,</span><br><span></span><br><span>Rich=
ard</span><br><span></span><br><span></span><br><span></span><br><span>_____=
__________________________________________</span><br><span>Openembedded-core=
 mailing list</span><br><span><a href=3D"mailto:Openembedded-core@lists.open=
embedded.org">Openembedded-core@lists.openembedded.org</a></span><br><span><=
a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</=
a></span><br></div></blockquote></div></body></html>=

--Apple-Mail-3-858406978--
