Return-Path: <lchristina26@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE4470884
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:53:33 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so7786723igb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=paUwkN/7aQuiFdrRmo9XYfqgkcjfADHnrV/4j72b1KE=;
	b=nrfxk1jTdxj87GR81YjqXkYesj4bTcLjNUtRfhMPg9VOaHEZha+V1YIqF9dvMidLrK
	RmJ0OSj6OHVgoP+b8MR0sJhk7dYtijfoEfMp8vBrZbTWAgw0Qwb+OrI91K3+g3D5eBpU
	IT2wgB3eSs4h460NzfmVjfgVq7tVLchPde5s2rst930C3nlwsf79dB7cUa4B3aef+x6y
	nDU1zt5Dw97E6k2RPzDLAN0NbrsFK3Fh5fWZE2UVQhbAtQ6QdZnSEoHVpzEgY7/4erM0
	kmo46yn88SF73/zmfc4r0RPGRQ4zxp0BS6GLOy3PN8FAjhlxw7NQ032spNU/jMQRVXHu
	5/Ow==
MIME-Version: 1.0
X-Received: by 10.50.79.196 with SMTP id l4mr10107026igx.12.1406742814410;
	Wed, 30 Jul 2014 10:53:34 -0700 (PDT)
Sender: lchristina26@gmail.com
Received: by 10.64.11.102 with HTTP; Wed, 30 Jul 2014 10:53:34 -0700 (PDT)
In-Reply-To: <CAL0pqZ0w0qmwPUhtEOfc6DCMggH6t_ELWOxhpWPSCxETta-u9A@mail.gmail.com>
References: <CAL0pqZ0w0qmwPUhtEOfc6DCMggH6t_ELWOxhpWPSCxETta-u9A@mail.gmail.com>
Date: Wed, 30 Jul 2014 11:53:34 -0600
X-Google-Sender-Auth: ULp2ybZjKGFEj2cGSTeCKqw3UQA
Message-ID: <CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
From: Leah <leah@wolfssl.com>
To: openembedded-core@lists.openembedded.org
Subject: Add recipe to openembedded, adjust layer
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
X-List-Received-Date: Wed, 30 Jul 2014 17:53:38 -0000
Content-Type: multipart/alternative; boundary=089e01183f48bf160d04ff6cd593

--089e01183f48bf160d04ff6cd593
Content-Type: text/plain; charset=UTF-8

Hi,

I have a recipe - cyassl_3.1.0.bb, a lightweight ssl library that I would
like to add to openembedded. I am not sure as to the best location, perhaps
recipes-connectivity? Do I need to submit this recipe the same way I would
submit a layer?

Also, is there a way to edit my current layer's information(meta-wolfssl)
on the openembedded layer index?

Thanks,

Leah

-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26





-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26

--089e01183f48bf160d04ff6cd593
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><d=
iv><br></div>I have a recipe - <a href=3D"http://cyassl_3.1.0.bb" target=3D=
"_blank">cyassl_3.1.0.bb</a>, a lightweight ssl library that I would like t=
o add to openembedded. I am not sure as to the best location, perhaps recip=
es-connectivity? Do I need to submit this recipe the same way I would submi=
t a layer?<br>

<br>Also, is there a way to edit my current layer&#39;s information(meta-wo=
lfssl) on the openembedded layer index?<br><br></div>Thanks,<br><br>Leah<sp=
an class=3D"HOEnZb"><font color=3D"#888888"><br clear=3D"all"><div><div><di=
v>
<br>-- <br><div dir=3D"ltr"><div><div><div><p>
</p>Leah Thompson<br></div><a href=3D"http://www.wolfssl.com" target=3D"_bl=
ank">www.wolfssl.com</a><br></div><a href=3D"mailto:leah@wolfssl.com" targe=
t=3D"_blank">leah@wolfssl.com</a><br><a href=3D"tel:406-570-1389" value=3D"=
+14065701389" target=3D"_blank">406-570-1389</a><br>
</div>Skype: lchristina26<br>
<div><div><br><br></div></div></div></div></div></div></font></span></div>
</div><br><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div><div><div><p><=
/p>Leah Thompson<br></div><a href=3D"http://www.wolfssl.com" target=3D"_bla=
nk">www.wolfssl.com</a><br></div><a href=3D"mailto:leah@wolfssl.com" target=
=3D"_blank">leah@wolfssl.com</a><br>
406-570-1389<br></div>Skype: lchristina26<br><div><div><br><br></div></div>=
</div></div>

--089e01183f48bf160d04ff6cd593--
