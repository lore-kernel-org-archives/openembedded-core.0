Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9B5787C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:42:28 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id b77so5166175itd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yrovva1ruogaIxZfD03NVG8Hnr9wFpi89msFmMczYNE=;
	b=lBZ5zxdntCh5Md3VTAo0EWeYCKof30oZAe6zIhUgQC49iZGB+62mC0nu2SpAOPDCdP
	FVBvaOpWErmjEdReK5Nn6JCoyfmaTc/1nYKxwesjOBZZVEU4qZUDv8L2DMP38Lcg5ZiS
	EtEwqVCPBz6lTI+iSso7ecOsN1KWfH1OqVvElisXo6oUyU7aFuhykSg0SSqyMjW7443z
	1MJhFnocmki+YoR3k24eo8defHiiyzHSUo5U0w1Ga4Z3EecDS7JqpOWeHdXl4RA2jU1l
	2GIAZCILgkov3XAiYvwEBOb2LsnDDunkhQPiX5253bJpjldklIoXQwKwR9xt5LoRW0Qs
	7GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yrovva1ruogaIxZfD03NVG8Hnr9wFpi89msFmMczYNE=;
	b=SnfJfEVGcEOfJniQxyoHm8U6sv81sYAqdz8sUMPe77SH1GIkz2RBh3cRXVcLhcyKNf
	qYi5TYYQHm2lNpn6YiK61NBXv71UPOkmFFGquUr3TvHlJG4oMuR+EmTDm7lFWreKL/by
	sMRAYm0EwKG0Q1Ldn/NFcjqK/yT0OQUHwXqf5541zMJyXrydh+sroRrAlKWgFzWhCC80
	pjKivmCQRgJ/krXezYj1YW+XqFEPBE0uRJF0FpE97A325gRbZGtrc/FIUJW2N36eiQL4
	kipaTJVSAI+1TYlycRDXkjMFzPJHCTEE/R1mTeNGP4Upba7hBVniOv/AyquP8QRueQkh
	Uehw==
X-Gm-Message-State: AKwxytc9g+2ScsylV1FcqTS0r7TH9867pAe8U+1Kp8i0Ci5iTACLGl9c
	U5PylYD5WF2HQwXWSWuOJYZtCYGfV38FYs3c5ibR+A==
X-Google-Smtp-Source: ACJfBotsr84hNheDbUp3V2XMQuBrLsZwbdbzVcRzxlq/SCxjbSc8ocPQe3CbV/vp2By/F26ur/c4B9LzcFNrdLpmwKU=
X-Received: by 10.36.228.79 with SMTP id o76mr1629415ith.85.1515685350032;
	Thu, 11 Jan 2018 07:42:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Thu, 11 Jan 2018 07:42:09 -0800 (PST)
In-Reply-To: <ca739de3-59f6-e215-8ea5-8cbaf785cf18@linux.intel.com>
References: <20180111151834.4169-1-ross.burton@intel.com>
	<ca739de3-59f6-e215-8ea5-8cbaf785cf18@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jan 2018 15:42:09 +0000
Message-ID: <CAJTo0LbQ3_XRqR=766aptjnT43-cyRfYVE-49OzAw3B3WDRfoA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: use du --apparent-size when calculating rootfs size
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
X-List-Received-Date: Thu, 11 Jan 2018 15:42:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c1246dae15fd7056281fed6"

--94eb2c1246dae15fd7056281fed6
Content-Type: text/plain; charset="UTF-8"

On 11 January 2018 at 15:29, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 01/11/2018 05:18 PM, Ross Burton wrote:
>
>> We should pass --apparent-size to du when calculating how large the
>> rootfs is as
>> otherwise we get the actual disk usage, which if the files are compressed
>> by the
>> file system (such as ZFS) may be sufficiently smaller than the space
>> required by
>> the image that construction will fail.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>   meta/classes/image.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 4531aa2a57a..8e763e4d543 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -534,6 +534,7 @@ def get_rootfs_size(d):
>>       initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
>>         output = subprocess.check_output(['du', '-ks',
>> +                                      '--apparent-size',
>>                                         d.getVar('IMAGE_ROOTFS')])
>>       size_kb = int(output.split()[0])
>>
>
> Exactly same patch from Maxin caused failures previously, no?
>

Hm, I knew I remembered seeing this before, and found my patches from 2015,
but didn't see the ones from Maxin.  I'll dig the archives again.

Ross

--94eb2c1246dae15fd7056281fed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 January 2018 at 15:29, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 01/11/2018 05:18 PM, Ross Burton wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
We should pass --apparent-size to du when calculating how large the rootfs =
is as<br>
otherwise we get the actual disk usage, which if the files are compressed b=
y the<br>
file system (such as ZFS) may be sufficiently smaller than the space requir=
ed by<br>
the image that construction will fail.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/image.bbclass | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 4531aa2a57a..8e763e4d543 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -534,6 +534,7 @@ def get_rootfs_size(d):<br>
=C2=A0 =C2=A0 =C2=A0 initramfs_maxsize =3D d.getVar(&#39;INITRAMFS_MAXSIZE&=
#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;du&#39=
;, &#39;-ks&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;--apparent=
-size&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar=
(&#39;IMAGE_ROOTFS&#39;)])<br>
=C2=A0 =C2=A0 =C2=A0 size_kb =3D int(output.split()[0])<br>
</blockquote>
<br></span>
Exactly same patch from Maxin caused failures previously, no?<br></blockquo=
te><div><br></div><div>Hm, I knew I remembered seeing this before, and foun=
d my patches from 2015, but didn&#39;t see the ones from Maxin.=C2=A0 I&#39=
;ll dig the archives again.</div><div><br></div><div>Ross=C2=A0</div></div>=
</div></div>

--94eb2c1246dae15fd7056281fed6--
