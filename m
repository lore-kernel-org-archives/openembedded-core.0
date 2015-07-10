Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9AE7589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:42:02 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so21275351qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=di2TCr5T9MDslHHWi5KCoKttQr7s6JGZaRamuYkXlGY=;
	b=GrjYbx+3xotGiZPBZjEkKySPsr6XB8jsrVdj4OKv0LbOT0F57YwAl3XUHlTYKq0GTQ
	ooUM8L9qHcg4xJzEJoIHUudwUUUkVoOB6RxfOdVnCfAivBpvWzCkmoEBW92hCbF3k+oM
	vXB2ixMVBM9d0v2e/Jbmtcyg7BbCeCvHyJpuyuCxdyPHL+qdT+5j0qnDmEmx95K0IP+k
	x1CZgGCLmmXb62C048l2fJr3MT2GTEtJTPmZ6O22/68cHP6Sy7qliRREiT45Uv/okgmq
	g5VTzfARSzHYbQRGBUh4jJrOzpsJxB2QgVksTobGlSwCOLmU/TcEiUGDqDLC0+CGd+th
	cK2Q==
X-Gm-Message-State: ALoCoQnNAJPDwxjNnxWpD2/r+Zqp6CeoOgKo4DzmwEyUAgfrGxoLVZb4UQJvCbyrxTw0N+blsojO
X-Received: by 10.140.196.129 with SMTP id r123mr39073432qha.93.1436568122730; 
	Fri, 10 Jul 2015 15:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:41:43 -0700 (PDT)
In-Reply-To: <1436368635-6078-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1436368635-6078-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:41:43 +0100
Message-ID: <CAJTo0LbTQ6DRt4aX9fdL+vs425drKqSNHfXRZ8F-+YDZp05EzA@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime: Added 4 new runtime test cases
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
X-List-Received-Date: Fri, 10 Jul 2015 22:42:06 -0000
Content-Type: multipart/alternative; boundary=001a11433952a6b5c9051a8d1462

--001a11433952a6b5c9051a8d1462
Content-Type: text/plain; charset=UTF-8

On 8 July 2015 at 16:17, Daniel Istrate <daniel.alexandrux.istrate@intel.com
> wrote:

> +    @testcase(963)
> +    def test_connmand_file(self):
> +        """
> +        Summary:     test connmand file
> +        Expected:    connman-applet should be ELF32 binary
> +        Product:     BSPs
> +        Author:      Lucian Musat <georgex.l.musat@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
>

What's the point of this test case?  Checking a random binary is a 32-bit
ELF seems a bit strange, especially as it means it will always fail on a
64-bit machine.

Ross

--001a11433952a6b5c9051a8d1462
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2015 at 16:17, Daniel Istrate <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.alexandr=
ux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1k2" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 @=
testcase(963)<br>
+=C2=A0 =C2=A0 def test_connmand_file(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0test connmand file=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 connman-applet should b=
e ELF32 binary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0BSPs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0 Lucian Musat &lt;<=
a href=3D"mailto:georgex.l.musat@intel.com">georgex.l.musat@intel.com</a>&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AutomatedBy: Daniel Istrate &lt;<a href=3D"mai=
lto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@intel.co=
m</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;</div></blockquote></div><br=
>What&#39;s the point of this test case?=C2=A0 Checking a random binary is =
a 32-bit ELF seems a bit strange, especially as it means it will always fai=
l on a 64-bit machine.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11433952a6b5c9051a8d1462--
