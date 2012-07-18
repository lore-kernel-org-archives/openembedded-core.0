Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nate.ewest@gmail.com>) id 1SrUSB-0004II-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:38:11 +0200
Received: by wgbds1 with SMTP id ds1so3843866wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=Arif9ePVfGT0/in68L8rO5j0ao76tQuiq988b4qGcs8=;
	b=s18KxT+P9BuBslLBwVdTed0Svjb4UppuQpxDCxrVKdS6jGwK9gNMZ2TFHTSnlY1DX4
	fF3oxQf0px3gB7Pu6OVKvvMSqRxdAAv1KIkAcG/LrTrxKrZI80HF/oFdvwG7mz1m5LbU
	qpGd2ppS3ppU8UVXxF+1RbbLM2x5PZfLFixn0hudegICFaJSG6sBzZWtYslk/ej3XLqT
	Kk1Yeh8Qqj3srUeZSpe78irBNZKehl1GhhHzjSwhM884aamrODbwBDGsHWwWqcceNtR6
	zIS+jVP/4DkqlMu1alxXsZaVDK/Bs0i0a5QsechxUwe8rLxb+d+N7FmzAMTUH7QEYFCM
	4B7Q==
MIME-Version: 1.0
Received: by 10.217.1.202 with SMTP id n52mr560377wes.21.1342618010834; Wed,
	18 Jul 2012 06:26:50 -0700 (PDT)
Received: by 10.194.47.42 with HTTP; Wed, 18 Jul 2012 06:26:50 -0700 (PDT)
In-Reply-To: <CACFtY+KW+VfCKmaWTkO5vjw3k7fmR2Awfb31YUZc2cAhXCEi0A@mail.gmail.com>
References: <CACFtY++ekHacLd5VLvfEabKxkdTFxSzfa6oU+aRbS5br_PzDxA@mail.gmail.com>
	<500607D1.1010009@linux.intel.com>
	<CACFtY+KW+VfCKmaWTkO5vjw3k7fmR2Awfb31YUZc2cAhXCEi0A@mail.gmail.com>
Date: Wed, 18 Jul 2012 09:26:50 -0400
Message-ID: <CACFtY+L3N-CBUaGc2=SrRpnPQ1Rwtmca0t+Z0ouZcNK08b4iJQ@mail.gmail.com>
From: Nathan West <nate.ewest@gmail.com>
To: Saul Wold <sgw@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] point prelink.conf to ${IMAGE_ROOTFS}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: nateewest@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 18 Jul 2012 13:38:11 -0000
Content-Type: multipart/alternative; boundary=20cf301e2e7d9ad92b04c51a9d0b

--20cf301e2e7d9ad92b04c51a9d0b
Content-Type: text/plain; charset=ISO-8859-1

Wow I'm bad at this. Sorry again about that reply only to you!

On Wed, Jul 18, 2012 at 9:24 AM, Nathan West <nate.ewest@gmail.com> wrote:

> Thanks Saul. Sorry about the duplicate there...
>
> I think we are both right somehow... I didn't have this problem using
> vanilla oe-core,
> it only appeared after setting up another oe-core through the angstrom
> setup scripts.
>
> Based on that it appears angstrom setup scripts somehow gave me a
> different version
> of prelink. After looking in the vanilla oe-core sysroots I do in fact see
> the --root option,
> but the angstrom setup scripts sysroots does not have it (I promise I
> checked before
> the patch! :-) )
>
> Anyway it looks like the --root is a problem with angstrom and I will take
> it over there,
> barring some insight from someone on this list.
>
> I do think the config change is still valid though. Starting on line 14 @
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/classes/image-prelink.bbclass#n14
>
> If there isn't one already a config is copied to
> ${IMAGE_ROOTFS}${sysconfdir}, then
> the prelink command leaves out the ${IMAGE_ROOTFS}.
>
> -Nathan
>
>
>
>
> On Tue, Jul 17, 2012 at 8:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 07/17/2012 03:16 PM, Nathan West wrote:
>>
>>> Hopefully I do this right. First time patching (ever! this is exciting
>>> :-) )
>>>
>>>  Welcome to the wonderful world of patching!
>>
>>
>>  The --root option doesn't work and isn't documented anywhere I could
>>> find, and without the ${IMAGE_ROOTFS} before the config file it was
>>> point to my native /etc/prelink.conf (which doesn't exist and probably
>>> would be useful if it did)
>>>
>>>  Which prelink are you using, it's possible you did not look at the
>> correct one.
>>
>> There should be a tmp/sysroot/x86_64-linux/usr/**sbin/prelink (if you
>> are building on a 64bit machine, otherwise i586-linux), that's the prelink
>> binary and a --help to that will show the --root option.
>>
>> It should not be using your host's /etc/prelink.conf, but the sysroot
>> version.
>>
>> The --root option should take care of it as it's described as follows:
>>
>>      --root=ROOT_PATH       Prefix all paths with ROOT_PATH
>>
>> So, the next question is what's going on to cause it to use your host's
>> prelinker instead of the native version that should be build as part of the
>> native tools?
>>
>>
>>
>>  Be gentle if I screwed up!
>>>
>> No worries.
>>
>>> -Nathan
>>>
>>>
>> Hope that was not too painful, let see how we can help you accomplish
>> what you are trying to do.
>>
>> Sau!
>>
>>
>>
>>>
>>> ---
>>>   meta/classes/image-prelink.**bbclass |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image-prelink.**bbclass
>>> b/meta/classes/image-prelink.**bbclass
>>> index 53ef47e..2d62f03 100644
>>> --- a/meta/classes/image-prelink.**bbclass
>>> +++ b/meta/classes/image-prelink.**bbclass
>>> @@ -21,7 +21,7 @@ prelink_image () {
>>> fi
>>> # prelink!
>>> -${STAGING_DIR_NATIVE}${**sbindir_native}/prelink --root ${IMAGE_ROOTFS}
>>>
>>> -amR -N -c ${sysconfdir}/prelink.conf
>>> +${STAGING_DIR_NATIVE}${**sbindir_native}/prelink ${IMAGE_ROOTFS} -amR
>>> -N
>>>
>>> -c ${IMAGE_ROOTFS}${sysconfdir}/**prelink.conf
>>> # Remove the prelink.conf if we had to add it.
>>> if [ "$dummy_prelink_conf" = "true" ]; then
>>> --
>>> 1.7.9.5
>>>
>>>
>>> ______________________________**_________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>>> openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>>
>>>
>>
>

--20cf301e2e7d9ad92b04c51a9d0b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Wow I&#39;m bad at this. Sorry again about that reply only to you!<br><br><=
div class=3D"gmail_quote">On Wed, Jul 18, 2012 at 9:24 AM, Nathan West <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:nate.ewest@gmail.com" target=3D"_blank"=
>nate.ewest@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Thanks Saul. Sorry about the duplicate there=
...<div><br></div><div>I think we are both right somehow... I didn&#39;t ha=
ve this problem using vanilla oe-core,</div>

<div>it only appeared after setting up another oe-core through the angstrom=
 setup scripts.</div>
<div><br></div><div>Based on that it appears angstrom setup scripts somehow=
 gave me a different version</div><div>of prelink. After looking in the van=
illa oe-core sysroots I do in fact see the --root option,</div><div>but the=
 angstrom setup scripts sysroots does not have it (I promise I checked befo=
re=A0</div>


<div>the patch! :-) )</div><div><br></div><div>Anyway it looks like the --r=
oot is a problem with angstrom and I will take it over there,</div><div>bar=
ring some insight from someone on this list.</div><div><br></div><div>

I do think the config change is still valid though. Starting on line 14 @=
=A0</div>
<div><a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/cl=
asses/image-prelink.bbclass#n14" target=3D"_blank">http://cgit.openembedded=
.org/openembedded-core/tree/meta/classes/image-prelink.bbclass#n14</a></div=
>

<div><br></div>
<div>If there isn&#39;t one already a config is copied to ${IMAGE_ROOTFS}${=
sysconfdir}, then</div><div>the prelink command leaves out the ${IMAGE_ROOT=
FS}.</div><span><font color=3D"#888888"><div><br></div><div>
-Nathan</div></font></span><div><div><div><br></div><div><br></div>
<div><br></div><div>
<br><div class=3D"gmail_quote">On Tue, Jul 17, 2012 at 8:48 PM, Saul Wold <=
span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blan=
k">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">



<div>On 07/17/2012 03:16 PM, Nathan West wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hopefully I do this right. First time patching (ever! this is exciting :-) =
)<br>
<br>
</blockquote></div>
Welcome to the wonderful world of patching!<div><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The --root option doesn&#39;t work and isn&#39;t documented anywhere I coul=
d<br>
find, and without the ${IMAGE_ROOTFS} before the config file it was<br>
point to my native /etc/prelink.conf (which doesn&#39;t exist and probably<=
br>
would be useful if it did)<br>
<br>
</blockquote></div>
Which prelink are you using, it&#39;s possible you did not look at the corr=
ect one.<br>
<br>
There should be a tmp/sysroot/x86_64-linux/usr/<u></u>sbin/prelink (if you =
are building on a 64bit machine, otherwise i586-linux), that&#39;s the prel=
ink binary and a --help to that will show the --root option.<br>
<br>
It should not be using your host&#39;s /etc/prelink.conf, but the sysroot v=
ersion.<br>
<br>
The --root option should take care of it as it&#39;s described as follows:<=
br>
<br>
=A0 =A0 =A0--root=3DROOT_PATH =A0 =A0 =A0 Prefix all paths with ROOT_PATH<b=
r>
<br>
So, the next question is what&#39;s going on to cause it to use your host&#=
39;s prelinker instead of the native version that should be build as part o=
f the native tools?<div><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Be gentle if I screwed up!<br>
</blockquote></div>
No worries.<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-Nathan<br>
<br>
</blockquote>
<br>
Hope that was not too painful, let see how we can help you accomplish what =
you are trying to do.<br>
<br>
Sau!<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>
<br>
<br>
---<br>
=A0 meta/classes/image-prelink.<u></u>bbclass | =A0 =A02 +-<br>
=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image-prelink.<u></u>bbclass<br>
b/meta/classes/image-prelink.<u></u>bbclass<br>
index 53ef47e..2d62f03 100644<br>
--- a/meta/classes/image-prelink.<u></u>bbclass<br>
+++ b/meta/classes/image-prelink.<u></u>bbclass<br>
@@ -21,7 +21,7 @@ prelink_image () {<br>
fi<br>
# prelink!<br></div>
-${STAGING_DIR_NATIVE}${<u></u>sbindir_native}/prelink --root ${IMAGE_ROOTF=
S}<div><br>
-amR -N -c ${sysconfdir}/prelink.conf<br></div>
+${STAGING_DIR_NATIVE}${<u></u>sbindir_native}/prelink ${IMAGE_ROOTFS} -amR=
 -N<div><br>
-c ${IMAGE_ROOTFS}${sysconfdir}/<u></u>prelink.conf<br>
# Remove the prelink.conf if we had to add it.<br>
if [ &quot;$dummy_prelink_conf&quot; =3D &quot;true&quot; ]; then<br>
--<br>
1.7.9.5<br>
<br>
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br>

--20cf301e2e7d9ad92b04c51a9d0b--
