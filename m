Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1789601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 17:59:12 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so1139331qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=XUVKUfzbEJbU4GYZ+XTeWUDlkcYtxrZlXpukILDzsnY=;
	b=fJnwJogniS8fkL3KUZrfxAN++FLD3iNjn1ypIH+xZY25yMcjaTqc0YmZNo/4SJoGzj
	5LeNCp3Ma9vDAb61j1wx9tqEuJaCa94OzO+gfn8DjWA06LvOG7rpkU8I/Q7VhfvhngzB
	CpQiVD2oKYbifHITamzsfKC8f3GWa9MQFb5div6nrjMtBtgUz3vRFZiVeGj42bIze0ii
	Q2VcYgW543SmcZJPaP0juD8B70X9H149J0ge0Z0w0jB6SlMKG6rayZtMEmAA850d72kb
	IKicSRdw22VmxkElx+W7ndUs5Yp/0+tv/vepFCy+me0xlUvNWpt6oJ1B8ITwUSq5lo09
	LRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=XUVKUfzbEJbU4GYZ+XTeWUDlkcYtxrZlXpukILDzsnY=;
	b=lDS0HK98nSFBaYNNo/T+O0AP4gTUyFDODqR06QOD+TRNmbzJgx5retipfL07z/Jo2s
	UPvY0uX9I/q6LCubQCqXK5rJRzGGVvHH78xECdBKpgP+KA6Dw8/uB/t+Eh7qNtQyGTHU
	Dos9YSP8Lv9JcsT2thEk2IfGcondseWutIhwfWGhO2m8Nt4ZKAYoQl7Or886/Xzmsv3+
	S0x6e5HnZHCdw2HIW7Or09s3gFSyBAFr3h9oOOy5VPrE75Fpl4Jwe9NrJ21GdoODMVEr
	GFTK135xck4ic2T5faPJ67vZBO7QOFiK4AdNe2DGyU2WFX9OtHrR8z27yxlnx1SVSZr4
	5wuQ==
X-Gm-Message-State: ALyK8tLV9NOqbrWgFknkxABp/Xi9kg29pNGPbNrU3gI0UNIFzV63G8H8ZkQSxJxINRoycv1fNzJ+hvjzCPooJA==
MIME-Version: 1.0
X-Received: by 10.200.48.141 with SMTP id v13mr18604366qta.76.1468173552731;
	Sun, 10 Jul 2016 10:59:12 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sun, 10 Jul 2016 10:59:12 -0700 (PDT)
Received: by 10.55.214.83 with HTTP; Sun, 10 Jul 2016 10:59:12 -0700 (PDT)
In-Reply-To: <CAMKF1sq1oH4c96XyTX1CK7pZgLYgjHEQKmjJ4ndS9GyV4A1zZg@mail.gmail.com>
References: <20160709232717.22380-1-raj.khem@gmail.com>
	<CAJTo0LbkQBgu89Ow79weX5mVPwtWewtkUeDzkc39+Mz9VHN85w@mail.gmail.com>
	<CAMKF1spk0f9xpNUUaqpLvx4aAPZ0cAU9NgG8eYLPtC7ziBDU2g@mail.gmail.com>
	<CAMKF1sq1oH4c96XyTX1CK7pZgLYgjHEQKmjJ4ndS9GyV4A1zZg@mail.gmail.com>
Date: Sun, 10 Jul 2016 10:59:12 -0700
Message-ID: <CAMKF1sowh1yCm_0StdEjZJ1GWvSTanV3N-rFJmAS=B8=zaZf8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] v86d: Accept aarch64 as build host
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
X-List-Received-Date: Sun, 10 Jul 2016 17:59:15 -0000
Content-Type: multipart/alternative; boundary=001a113a94b61449eb05374bcbf4

--001a113a94b61449eb05374bcbf4
Content-Type: text/plain; charset=UTF-8

On Jul 10, 2016 2:53 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 10 July 2016 at 00:27, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +       local m=`uname -m`
>> +       if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" =
"i386" ]; then
>> +               echo "n";
>> +-      elif [ "$m" = "x86_64" ]; then
>> ++      elif [ "$m" = "x86_64" -o "$m" = "aarch64" ]; then
>> +               echo "y";
>> +       else
>
>
> Surely this entire block is wrong for cross-compilation - looking at
uname to determine what to build for the target?

Yes it is however the recipe is limited to x86 and now that we add a non
x86 build host this is a compromise I came up with. Hopefully we wont have
folks adding host architectures to Build oe on so regularly. Otherwise we
wont need cross compiling ;)
>
> Ross

--001a113a94b61449eb05374bcbf4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Jul 10, 2016 2:53 AM, &quot;Burton, Ross&quot; &lt;<a hre=
f=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 10 July 2016 at 00:27, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0local m=3D`uname -m`<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$m&quot; =3D &quot;i686&quo=
t; -o &quot;$m&quot; =3D &quot;i586&quot; -o &quot;$m&quot; =3D &quot;i486&=
quot; -o &quot;$m&quot; =3D &quot;i386&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot=
;n&quot;;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 elif [ &quot;$m&quot; =3D &quot;x86_64&quot=
; ]; then<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 elif [ &quot;$m&quot; =3D &quot;x86_64&quot=
; -o &quot;$m&quot; =3D &quot;aarch64&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot=
;y&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;<br>
&gt;<br>
&gt; Surely this entire block is wrong for cross-compilation - looking at u=
name to determine what to build for the target?</p>
<p dir=3D"ltr">Yes it is however the recipe is limited to x86 and now that =
we add a non x86 build host this is a compromise I came up with. Hopefully =
we wont have folks adding host architectures to Build oe on so regularly. O=
therwise we wont need cross compiling ;)<br>
&gt;<br>
&gt; Ross<br></p>

--001a113a94b61449eb05374bcbf4--
