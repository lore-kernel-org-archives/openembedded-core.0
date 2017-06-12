Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 318DF78234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:03:48 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id w1so122167395qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0KZjebqjqR0/Q+IX3ywumuGDzA8KyOCo5nOpFsClXoU=;
	b=WqngslMT7rebQTVOktzRub1WCbdr6xJvY/zkNhBVddZqn1nnk5xBh1ojgFAjq2MrPO
	0nn5BgKcq0maitb1FzYlq3oACwndjak8TWA/IvfjpPp3wmhjJjo1d54pTHb7YaQidnfR
	QHBaBEwMtR2rkENOwhO/o8mUoQxW2gAOuIx1nRnygdYrlsQJO3nrQu2AYDjBed3daCHx
	OVyDGF7jT6wVujeTe6fEwF8izzTfwqiWguALv40pnp+6r4QH7gkQXBT2Bo5urqYilCm1
	1+qNE62KzwW4F4t+ZRVhsIaS6aRwbmz9+hTsDVidiIxQi0zfv0dQYml9aoPjqmGAVXcf
	62ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0KZjebqjqR0/Q+IX3ywumuGDzA8KyOCo5nOpFsClXoU=;
	b=MsXwaYX5qRTFvD3G0u/i/Ir62agtBK5rg/MR3hxXkO7pQ2FYPBTJHy7MWv/x1pddpl
	WqOlk/sU+9LN2zPlZFDalvO9JbCeZF5CkjLWk9ZX1jIypYXnwhdJW0RLIh3T55kPqC0c
	1mE4B+bP2AqGZk9dAuZlg0hNfOLEj0sZyVrlvFWWTH/OFFyT/E+stPrJqWNp2q9XZm8X
	16Gup8p7HJA+DwkTF3bvAeWUp9mkPsPq6kpxJWBp+CHYl7AStFosp/b7ZCa02Hi/dKi+
	YqQlot+v3qzQurv9WkJKBOoD0YkiNhnFAuFNej/csY2xZlE8JNp0GNZQcwWKy5Mky1Ja
	/A6Q==
X-Gm-Message-State: AKS2vOwVIva9Lr1fvDjkl914i+LJgFD7OqvRDIIoj7x4kfjLXvhh3PeG
	lQLUKUUeFD7oA20DEr+IXMVHgQvu6z8X
X-Received: by 10.55.214.221 with SMTP id p90mr5287440qkl.228.1497269029977;
	Mon, 12 Jun 2017 05:03:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 12 Jun 2017 05:03:29 -0700 (PDT)
In-Reply-To: <CACrLJgCAdBwC8jWSdAMxdHAEyuW31AQchSA=rHZ-5-UTbMMY5Q@mail.gmail.com>
References: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
	<CAJTo0LY_O+BctxPoraFsYpSnTBksq+Cz7e=UZT2bHYyzpt94aw@mail.gmail.com>
	<CACrLJgCAdBwC8jWSdAMxdHAEyuW31AQchSA=rHZ-5-UTbMMY5Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Jun 2017 13:03:29 +0100
Message-ID: <CAJTo0LbmvxbMpbopc8g6Bh+VAq3S79qfzL0UvBb8s4ngPAzySA@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 12:03:49 -0000
Content-Type: multipart/alternative; boundary="001a1147a418ab007e0551c21c87"

--001a1147a418ab007e0551c21c87
Content-Type: text/plain; charset="UTF-8"

On 12 June 2017 at 13:02, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:

> I think that do_install_ptest is fine. Why would you think that?
>

packages/corei7-64-poky-linux/openssl/openssl-ptest:
  * PKGSIZE changed from 6192634 to 26 (-99%)
  * FILELIST: removed "/usr/lib/openssl/ptest/test/dtlstest.c
/usr/lib/openssl/ptest/test/certs/pss1.pem
/usr/lib/openssl/ptest/test/destest.c /usr/lib/openssl/ptest/test/md5test.o
/usr/lib/openssl/ptest/test/rsa_test.o
/usr/lib/openssl/ptest/test/evp_extra_test.o
/usr/lib/openssl/ptest/certs/README.RootCerts
/usr/lib/openssl/ptest/include/openssl/asn1.h
/usr/lib/openssl/ptest/test/ocsp-tests/D3_Issuer_Root.pem
/usr/lib/openssl/ptest/libcrypto.a /usr/lib/openssl/ptest/test/srptest.o
/usr/lib/openssl/ptest/test/ocsp-tests/WSNIC_D2_Issuer_Root.pem
/usr/lib/openssl/ptest/test/certs/rootCA.key
/usr/lib/openssl/ptest/test/VMSca-response.2
/usr/lib/openssl/ptest/test/ocsp-tests/WKIC_ND1_Issuer_ICA.pem
/usr/lib/openssl/ptest/test/ideatest.c
/usr/lib/openssl/ptest/test/certs/rootCA.pem
/usr/lib/openssl/ptest/test/ocsp-tests/D1_Cert_EE.pem
/usr/lib/openssl/ptest/certs/demo/73912336.0
/usr/lib/openssl/ptest/test/hmactest.o /usr/lib/openssl/ptest/test/
maketests.com /usr/lib/openssl/ptest/test/smime-certs/smec1.pem
/usr/lib/openssl/ptest/certs/demo/cbdbd8bc.0
/usr/lib/openssl/ptest/test/ocsp-tests/WKIC_D2_Issuer_Root.pem
/usr/lib/openssl/ptest/test/verify_extra_test.c
/usr/lib/openssl/ptest/test/serverinfo.pem
/usr/lib/openssl/ptest/test/shatest.c /usr/lib/openssl/ptest/test/CAss.cnf
...

(lots more lines)

None of the test suite is actually being installed.

Ross

--001a1147a418ab007e0551c21c87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2017 at 13:02, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I think that do_=
install_ptest is fine. Why would you think that?<div></div></div></blockquo=
te></div><br><div class=3D"gmail_extra">packages/corei7-64-poky-linux/opens=
sl/openssl-ptest:</div><div class=3D"gmail_extra">=C2=A0 * PKGSIZE changed =
from 6192634 to 26 (-99%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIST=
: removed &quot;/usr/lib/openssl/ptest/test/dtlstest.c /usr/lib/openssl/pte=
st/test/certs/pss1.pem /usr/lib/openssl/ptest/test/destest.c /usr/lib/opens=
sl/ptest/test/md5test.o /usr/lib/openssl/ptest/test/rsa_test.o /usr/lib/ope=
nssl/ptest/test/evp_extra_test.o /usr/lib/openssl/ptest/certs/README.RootCe=
rts /usr/lib/openssl/ptest/include/openssl/asn1.h /usr/lib/openssl/ptest/te=
st/ocsp-tests/D3_Issuer_Root.pem /usr/lib/openssl/ptest/libcrypto.a /usr/li=
b/openssl/ptest/test/srptest.o /usr/lib/openssl/ptest/test/ocsp-tests/WSNIC=
_D2_Issuer_Root.pem /usr/lib/openssl/ptest/test/certs/rootCA.key /usr/lib/o=
penssl/ptest/test/VMSca-response.2 /usr/lib/openssl/ptest/test/ocsp-tests/W=
KIC_ND1_Issuer_ICA.pem /usr/lib/openssl/ptest/test/ideatest.c /usr/lib/open=
ssl/ptest/test/certs/rootCA.pem /usr/lib/openssl/ptest/test/ocsp-tests/D1_C=
ert_EE.pem /usr/lib/openssl/ptest/certs/demo/73912336.0 /usr/lib/openssl/pt=
est/test/hmactest.o /usr/lib/openssl/ptest/test/<a href=3D"http://maketests=
.com">maketests.com</a> /usr/lib/openssl/ptest/test/smime-certs/smec1.pem /=
usr/lib/openssl/ptest/certs/demo/cbdbd8bc.0 /usr/lib/openssl/ptest/test/ocs=
p-tests/WKIC_D2_Issuer_Root.pem /usr/lib/openssl/ptest/test/verify_extra_te=
st.c /usr/lib/openssl/ptest/test/serverinfo.pem /usr/lib/openssl/ptest/test=
/shatest.c /usr/lib/openssl/ptest/test/CAss.cnf ...</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">(lots more lines)</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">None of the test =
suite is actually being installed.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div></div>

--001a1147a418ab007e0551c21c87--
