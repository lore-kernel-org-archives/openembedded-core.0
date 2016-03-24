Return-Path: <kad@kad.name>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9288E605FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 20:45:31 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id qe11so38182687lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=NCEZwfHzjsjALtVC06dtqaOG96H+N8nkfFFhkhvZgQ0=;
	b=zE1K3m8RX7H4fsqQ7kiNPC3qr3s1CQKbGwd5b67F/iACzVpNWFVscWF+DFbr8lJPGk
	TQTxMe2JpmBSjLUEa6I51JZnO2Z063phgh0kejxF7xGBwFTwMrcE0UeMm0nsj06AlTvb
	b15rIcexWp43+7ueBbpNx5jQMptFa7VpOt0SqiYdhtDH4u2BlqSZxIsIEUYh8c/GO5Ff
	MkHyK8sCCt5zC4VT7/uzSfW8RNnjkz9SF2/aGu6x2UocjMukCuvN8o44vy+nnkWvRqzx
	igpQIoLozmICbtXQ6qUDJ8c7ujAGxsndkfJdP2iIQd47usyFPdzLHiGGWdaP6/Rj7CnH
	Kwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=NCEZwfHzjsjALtVC06dtqaOG96H+N8nkfFFhkhvZgQ0=;
	b=CQgR40qC0DrWCJT/4g2DGcISyJ6d59HVcwF3OybH2ZlpVzwUoB7Trfr68zvzbdph2p
	JLQf9jb8uTwbxAGpJvksSvVA0gSwQZ99L6Y2qjU33LJY/1Rx6tlVKkPzHcUa5EucZnMz
	uTzrKiqHJeNFAldFAh3viufFwkTZzMt/aymt3ZmfLQPYAzs1/JOHT6+EcWmwK394ODmZ
	fKwGKSLGMKhuLiurNlybYyReXAGTZcmbrODTi4Xlg7BktOpysRlfLXXlAw9tZ5lhz2A2
	rNr2U4m1XYDYs2uQKzLSVnIrKLL0zksw/Mu+e22ELm5Fc9wpJShkorU9kIsH55oXiIf0
	XhqA==
X-Gm-Message-State: AD7BkJKPXmezxZAKjWO5Ue0XIcsR2I1nOw2pW3aA1WnfUzArJ9F9D0is27LrhocGpHfDtPr6LPCBcDuVEDSAyA==
MIME-Version: 1.0
X-Received: by 10.112.130.74 with SMTP id oc10mr4378806lbb.14.1458852330721;
	Thu, 24 Mar 2016 13:45:30 -0700 (PDT)
Received: by 10.114.160.16 with HTTP; Thu, 24 Mar 2016 13:45:30 -0700 (PDT)
In-Reply-To: <CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
Date: Thu, 24 Mar 2016 22:45:30 +0200
Message-ID: <CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 24 Mar 2016 20:45:35 -0000
Content-Type: multipart/alternative; boundary=047d7b3433e4f3e8f7052ed18655

--047d7b3433e4f3e8f7052ed18655
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 10:32 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Mar 24, 2016 at 1:16 PM, Alexander D. Kanevskiy <kad@kad.name>
> wrote:
> > Existing compress framework for producing various compressed versions
> > of images is powerfull enough to be extended for other uses, e.g. to
> > convert types of images.
> >
> > It is possible to use it also to produce image checksums at the time
> > of image generation. This commit adds support for all supported
> > at the moment coreutils hashing algorithms: md5, sha1, sha224,
> > sha256, sha384 and sha512
> >
> > Usage:
> > IMAGE_FSTYPES_append = " hddimg.sha256sum"
>
> I guess a common requirement is for hashes of the compressed images,
> not only the uncompressed image.


you can easily chain them.
" hddimg.sha256sum hddimg.xz hddimg.xz.sha256sum"


-- 
br, Alexander Kanevskiy

--047d7b3433e4f3e8f7052ed18655
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Mar 24, 2016 at 10:32 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu,=
 Mar 24, 2016 at 1:16 PM, Alexander D. Kanevskiy &lt;<a href=3D"mailto:kad@=
kad.name">kad@kad.name</a>&gt; wrote:<br>
&gt; Existing compress framework for producing various compressed versions<=
br>
&gt; of images is powerfull enough to be extended for other uses, e.g. to<b=
r>
&gt; convert types of images.<br>
&gt;<br>
&gt; It is possible to use it also to produce image checksums at the time<b=
r>
&gt; of image generation. This commit adds support for all supported<br>
&gt; at the moment coreutils hashing algorithms: md5, sha1, sha224,<br>
&gt; sha256, sha384 and sha512<br>
&gt;<br>
&gt; Usage:<br>
&gt; IMAGE_FSTYPES_append =3D &quot; hddimg.sha256sum&quot;<br>
<br>
</span>I guess a common requirement is for hashes of the compressed images,=
<br>
not only the uncompressed image.</blockquote><div><br></div><div>you can ea=
sily chain them.=C2=A0</div><div>&quot; hddimg.sha256sum hddimg.xz hddimg.x=
z.sha256sum&quot;</div><div>=C2=A0</div></div><div><br></div>-- <br><div cl=
ass=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--047d7b3433e4f3e8f7052ed18655--
