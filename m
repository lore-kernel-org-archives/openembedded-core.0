Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 78E4F74BA2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 15:18:18 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id w3-v6so788231pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2S6ueEcdv7WCIUrbMkRqdak0WjCDsLgd2DITaslCi4w=;
	b=CSkNOG7M0GutuAVsKL+NvlJ7b0MiOuWnqtS12mQw/q39Jpb4EPjtfy8mp5JLyi9iB3
	+XtzEonkHQTGjCs3k/LPquly1V2HFca3wLS9FWhN139EVakqXkWisZXVyowr1Wo4HaWi
	2xNl8TQzu1gqBe6txhpakzWPplivKUFu09Kyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2S6ueEcdv7WCIUrbMkRqdak0WjCDsLgd2DITaslCi4w=;
	b=MBPU6VUzo3JwV8qySzrs+XDDm5XfL7jxzXlxypvOU1daeQxl9Q+v8FHRJ6W4uLah31
	CZqMtmnM2ncytyxt5i4sIYL3l0LcACEQhXcU8MYeyvHL+8mk0C1SXLdCix+0HbBmyZSj
	wYYwVk9Q/G88LaCA2pzWAxZngQbeN8ZcWP2QXp1tdEyMITlddPlglBuSpx608k9mrP21
	h7Gb8ZuywDtiUWShCZNe4tTfkrbTABQYfPDPsqnKMTD3pjNGHSKuCwb5U87t0u810bWx
	EEmtVaCLdAbNMDtJkgvhQzaYVWShQtzl/MgnT/KioZOyUve7Vcz0qDghxizqJzRiolAE
	X7xA==
X-Gm-Message-State: ALQs6tBps8Pbq4KWOkGYyxNw3r+L3TsYZZWtnjjroS9pmTanWr49xkzb
	MXZZbhieeH8klZvwX8Xj1h0mIs8d6rU=
X-Google-Smtp-Source: AB8JxZox/tV76v2+RMyXiyjQlqpexiHGC3sYLCbd8GoY+RKqvBSyGWjE0j2S3LPfD2CP3PsfJQ3cWw==
X-Received: by 2002:a63:be0a:: with SMTP id
	l10-v6mr17795886pgf.295.1525792698833; 
	Tue, 08 May 2018 08:18:18 -0700 (PDT)
Received: from yct-lpt.lan ([172.58.41.64]) by smtp.gmail.com with ESMTPSA id
	u86sm57421471pfg.71.2018.05.08.08.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 08:18:17 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CA+chaQfzfNip1UE1WWy2v=T6rWkYkSLTZS-FRek2hP9W=T_3_w@mail.gmail.com>
	<d9e02702-1b1f-3560-3bbb-11ee04be8524@linux.intel.com>
	<CAJTo0LZ=NKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Openpgp: preference=signencrypt
Autocrypt: addr=mhalstead@linuxfoundation.org; prefer-encrypt=mutual; keydata=
	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
	3/NAP+ls2GeZmVDZ
Organization: Linux Foundation
Message-ID: <e4ae44d3-6128-65f3-b215-d49b72f867de@linuxfoundation.org>
Date: Tue, 8 May 2018 08:18:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ=NKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Tue, 08 May 2018 15:18:18 -0000
X-Groupsio-MsgNum: 111120
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="GmxuIhywewQ1ydEoEJ8nOjj12dL7cNbOe"

--GmxuIhywewQ1ydEoEJ8nOjj12dL7cNbOe
Content-Type: multipart/mixed; boundary="5Tn38oIwwinYBWk7C3c6ZHehqA5i92GVl";
 protected-headers="v1"
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>,
 Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <e4ae44d3-6128-65f3-b215-d49b72f867de@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/14] babeltrace: switch over to git
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
 <20180504123244.43049-14-alexander.kanavin@linux.intel.com>
 <CA+chaQfzfNip1UE1WWy2v=T6rWkYkSLTZS-FRek2hP9W=T_3_w@mail.gmail.com>
 <d9e02702-1b1f-3560-3bbb-11ee04be8524@linux.intel.com>
 <CAJTo0LZ=NKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gmail.com>
In-Reply-To: <CAJTo0LZ=NKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gmail.com>

--5Tn38oIwwinYBWk7C3c6ZHehqA5i92GVl
Content-Type: multipart/alternative;
 boundary="------------26A38787479D82E6B768DC6B"
Content-Language: en-US

--------------26A38787479D82E6B768DC6B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

That file is now available from the yoctoproject.org link you provided.
It probably appeared a few days later. Is there any issue now?


On 05/08/2018 02:25 AM, Burton, Ross wrote:
> CCing Halstead who does.=C2=A0 Hopefully the autobuilder.yocto.io
> <http://autobuilder.yocto.io> cache has
> a=C2=A0babeltrace-1.5.5.tar.bz2=C2=A0tarball we can add to the mirror?
>
> Ross
>
> On 7 May 2018 at 11:17, Alexander Kanavin
> <alexander.kanavin@linux.intel.com
> <mailto:alexander.kanavin@linux.intel.com>> wrote:
>
>     On 05/04/2018 10:51 PM, Martin Jansa wrote:
>
>         Can you please upload the tarball (I assume you still have it
>         from the time you were testing the upgrade to 1.5.5) to:
>         http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.5=
=2E5.tar.bz2
>         <http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.=
5.5.tar.bz2>
>         or
>         http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2
>         <http://sources.openembedded.org/babeltrace-1.5.5.tar.bz2>
>         so that it's covered with default mirrors.bbclass as well?
>
>
>     I don't have upload rights to that.
>
>     Alex
>
>     --=20
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>

--=20
Michael Halstead
Linux Foundation / SysAdmin


--------------26A38787479D82E6B768DC6B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>That file is now available from the yoctoproject.org link you
      provided. It probably appeared a few days later. Is there any
      issue now?<br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">On 05/08/2018 02:25 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJTo0LZ=3DNKRiew4kcGp-inDums7A1Uhe9gEKF2n1GWE0Cp959w@mail.gm=
ail.com">
      <div dir=3D"ltr">CCing Halstead who does.=C2=A0 Hopefully the <a
          href=3D"http://autobuilder.yocto.io" moz-do-not-send=3D"true">a=
utobuilder.yocto.io</a>
        cache has a=C2=A0babeltrace-1.5.5.tar.bz2=C2=A0tarball we can add=
 to the
        mirror?
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 7 May 2018 at 11:17, Alexander
          Kanavin <span dir=3D"ltr">&lt;<a
              href=3D"mailto:alexander.kanavin@linux.intel.com"
              target=3D"_blank" moz-do-not-send=3D"true">alexander.kanavi=
n@linux.intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
              class=3D"">On 05/04/2018 10:51 PM, Martin Jansa wrote:<br>
              <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                Can you please upload the tarball (I assume you still
                have it from the time you were testing the upgrade to
                1.5.5) to:<br>
                <a
href=3D"http://downloads.yoctoproject.org/mirror/sources/babeltrace-1.5.5=
=2Etar.bz2"
                  rel=3D"noreferrer" target=3D"_blank"
                  moz-do-not-send=3D"true">http://downloads.yoctoproject.=
<wbr>org/mirror/sources/babeltrace-<wbr>1.5.5.tar.bz2</a><br>
                or<br>
                <a
                  href=3D"http://sources.openembedded.org/babeltrace-1.5.=
5.tar.bz2"
                  rel=3D"noreferrer" target=3D"_blank"
                  moz-do-not-send=3D"true">http://sources.openembedded.or=
<wbr>g/babeltrace-1.5.5.tar.bz2</a><br>
                so that it's covered with default mirrors.bbclass as
                well?<br>
              </blockquote>
              <br>
            </span>
            I don't have upload rights to that.<br>
            <br>
            Alex
            <div class=3D"HOEnZb">
              <div class=3D"h5"><br>
                -- <br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href=3D"mailto:Openembedded-core@lists.openembedded.org=
"
                  target=3D"_blank" moz-do-not-send=3D"true">Openembedded=
-core@lists.openem<wbr>bedded.org</a><br>
                <a
                  href=3D"http://lists.openembedded.org/mailman/listinfo/=
openembedded-core"
                  rel=3D"noreferrer" target=3D"_blank"
                  moz-do-not-send=3D"true">http://lists.openembedded.org/=
<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Michael Halstead
Linux Foundation / SysAdmin
</pre>
  </body>
</html>

--------------26A38787479D82E6B768DC6B--

--5Tn38oIwwinYBWk7C3c6ZHehqA5i92GVl--

--GmxuIhywewQ1ydEoEJ8nOjj12dL7cNbOe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzowQ2UYmQerfiW8/amSWNbpCWpUFAlrxv7YACgkQamSWNbpC
WpWbPw//cFEcxraxw6Yh9UmJ4cm41yXTgcpF4meIHxD7xzHNnnwHQDN06fBnkd6l
+Fm6sRctN8/zh50WHGZG2tHIknjXtQ2Homnfv4aHlBQDboIOtdauj+F731cednzG
K2+6K9zQqYm3BcTI2KgFaYcB3kl+Ar+bodltx3FieaNIRNE2M1sT/nnb2llpno8j
TL2b/0H95bqOXJbOHMP2foLDJG4q9rSUoSxrpgdyfkb+0SnC9l7URD/3+85gEROO
BlrNGPAXODNrTyU9cwMrFTWeQa5emPJbHc0712o7oHQz1qVw1C4Krbq1/plf9Pkx
v1POlRBAvLEiqrsn44vFUlQX9oGs41ICtLMB7y/uDSgM5ccHIoAuWbU6vEAMuzDe
7cfYxPOgcul3jLEIaDWKWqIkCTpEv7wRia0sSpoFMx4zICNyNxW9gyB55u2fanT1
sZV76nAQzDFYJ5cYxpZUwaOISuNhkaGJWQ3aXPfn8g1GshfS1LWjgGDrZ/aF0D5T
Apw3pGdTNQ5ycFAQPusrs8KrIUtELGwK1LDO7LN9s4mdoTmUbRgml/VB/R7Nl1iC
o5NQMsLol8T5I9t7ra6viKUjAbOnqVEakVjokJWi8pkCE9XO4e/BACrc4/ZzmLLe
hSD24D5ha/a6WIUJ0sSAN31/3cQiBybPk2jAodv8RwXfNSyR2fU=
=Ng55
-----END PGP SIGNATURE-----

--GmxuIhywewQ1ydEoEJ8nOjj12dL7cNbOe--
