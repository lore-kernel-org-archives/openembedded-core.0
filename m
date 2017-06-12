Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 05DEA78234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:07:14 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id y77so54101321ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 05:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S4RWPDhH/c9ZVwCjjDQ7vEZpBSj2CQN26FffsDkRayA=;
	b=fBrGEpg9jLbLsci4l7slEHcFxiFceKcmfpJV+m/XMgPYixXXVG0pd07Ku1eGKtZ0FP
	BgGeGIknVZKyiiOd8lh6Y8eJN9BapqA/mPCrrRKYpyI6gIgbFvuciUVb+0YjmaW3AeX2
	z+b9O5I36v6rMnRcVTQKv09gRgs76bpZnOxRrITlKHBbCAkuLwGVySI5OXPzr1MIHzZ6
	ygbIkR3Y0Ras5mUaYJL41klTKKJPjFCCMGTemFduJd7JA6yhy9Q3pVjrWk5JVMlHTP1/
	JYZYNBGSBdyjSRQ1GRSPFT0rt+aokkGSs9oEiJ7CVKinTvbMdN++rXpCtrX2MNlcAZTw
	OFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S4RWPDhH/c9ZVwCjjDQ7vEZpBSj2CQN26FffsDkRayA=;
	b=W7gAXVwAIASeVNychysFvAvUYQrECFR3Mw7YCBcIIknNpxQvBcc9KREOXRnUkN4uIE
	FGuZOjnK5VarTv2DY28ROdxr4UKB4oofSNRM40btD/U1Bae3DrhrDP0fZuBJs3/XRiwX
	t+gDKCxPswH/rbfV28lxsGlsheW3iZ4zYpW6N4M/669J587nsM4Zw7a/3+8zrYJSDYYn
	e9/z/laWcCnSOjWdFTSTgmWOV/8oQM9/LTRElDHicLkVdlDVkdwcj4v+qYIsdRJ8+mJp
	cqJloaHtdIcLnKTRMRFsz8IcJWbTUzE0ZTUZbXVx12UClybLJupO/EWqnOVnyTNKYzAl
	Kp6g==
X-Gm-Message-State: AODbwcCoMJmK1CdldU8v9ekL6GU1whaFVem8QwjiwTOsIlVXdKIAZCsP
	HFWlxJvi5LyWe+EW1sv1sriVcH7S8Q==
X-Received: by 10.107.172.5 with SMTP id v5mr52667239ioe.63.1497269236029;
	Mon, 12 Jun 2017 05:07:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.16 with HTTP; Mon, 12 Jun 2017 05:07:15 -0700 (PDT)
In-Reply-To: <CAJTo0LbmvxbMpbopc8g6Bh+VAq3S79qfzL0UvBb8s4ngPAzySA@mail.gmail.com>
References: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
	<CAJTo0LY_O+BctxPoraFsYpSnTBksq+Cz7e=UZT2bHYyzpt94aw@mail.gmail.com>
	<CACrLJgCAdBwC8jWSdAMxdHAEyuW31AQchSA=rHZ-5-UTbMMY5Q@mail.gmail.com>
	<CAJTo0LbmvxbMpbopc8g6Bh+VAq3S79qfzL0UvBb8s4ngPAzySA@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Mon, 12 Jun 2017 21:07:15 +0900
Message-ID: <CACrLJgB3bSVMYYR9rg6ex3p3kgT9U0U5CnDcY7eDFcX7iU1sog@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 12 Jun 2017 12:07:16 -0000
Content-Type: multipart/alternative; boundary="94eb2c05a8aaf264f30551c228ce"

--94eb2c05a8aaf264f30551c228ce
Content-Type: text/plain; charset="UTF-8"

Ok. Thanks for your comments. I'll add it soon

Thanks
Changhyeok

2017-06-12 21:03 GMT+09:00 Burton, Ross <ross.burton@intel.com>:

>
> On 12 June 2017 at 13:02, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>
>> I think that do_install_ptest is fine. Why would you think that?
>>
>
> packages/corei7-64-poky-linux/openssl/openssl-ptest:
>   * PKGSIZE changed from 6192634 to 26 (-99%)
>   * FILELIST: removed "/usr/lib/openssl/ptest/test/dtlstest.c
> /usr/lib/openssl/ptest/test/certs/pss1.pem /usr/lib/openssl/ptest/test/destest.c
> /usr/lib/openssl/ptest/test/md5test.o /usr/lib/openssl/ptest/test/rsa_test.o
> /usr/lib/openssl/ptest/test/evp_extra_test.o /usr/lib/openssl/ptest/certs/README.RootCerts
> /usr/lib/openssl/ptest/include/openssl/asn1.h /usr/lib/openssl/ptest/test/ocsp-tests/D3_Issuer_Root.pem
> /usr/lib/openssl/ptest/libcrypto.a /usr/lib/openssl/ptest/test/srptest.o
> /usr/lib/openssl/ptest/test/ocsp-tests/WSNIC_D2_Issuer_Root.pem
> /usr/lib/openssl/ptest/test/certs/rootCA.key /usr/lib/openssl/ptest/test/VMSca-response.2
> /usr/lib/openssl/ptest/test/ocsp-tests/WKIC_ND1_Issuer_ICA.pem
> /usr/lib/openssl/ptest/test/ideatest.c /usr/lib/openssl/ptest/test/certs/rootCA.pem
> /usr/lib/openssl/ptest/test/ocsp-tests/D1_Cert_EE.pem
> /usr/lib/openssl/ptest/certs/demo/73912336.0 /usr/lib/openssl/ptest/test/hmactest.o
> /usr/lib/openssl/ptest/test/maketests.com /usr/lib/openssl/ptest/test/smime-certs/smec1.pem
> /usr/lib/openssl/ptest/certs/demo/cbdbd8bc.0 /usr/lib/openssl/ptest/test/
> ocsp-tests/WKIC_D2_Issuer_Root.pem /usr/lib/openssl/ptest/test/verify_extra_test.c
> /usr/lib/openssl/ptest/test/serverinfo.pem /usr/lib/openssl/ptest/test/shatest.c
> /usr/lib/openssl/ptest/test/CAss.cnf ...
>
> (lots more lines)
>
> None of the test suite is actually being installed.
>
> Ross
>



-- 
Thanks
Changhyeok

--94eb2c05a8aaf264f30551c228ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok. Thanks for your comments. I&#39;ll add it soon<div><br=
></div><div>Thanks</div><div>Changhyeok</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">2017-06-12 21:03 GMT+09:00 Burton, Ross <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div cla=
ss=3D"gmail_quote">On 12 June 2017 at 13:02, Changhyeok Bae <span dir=3D"lt=
r">&lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"_blank">changh=
yeok.bae@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">I think that do_install_ptest is fine. Why would you think that?<div></d=
iv></div></blockquote></div><br></span><div class=3D"gmail_extra">packages/=
corei7-64-poky-linux/<wbr>openssl/openssl-ptest:</div><div class=3D"gmail_e=
xtra">=C2=A0 * PKGSIZE changed from 6192634 to 26 (-99%)</div><div class=3D=
"gmail_extra">=C2=A0 * FILELIST: removed &quot;/usr/lib/openssl/ptest/test/=
<wbr>dtlstest.c /usr/lib/openssl/ptest/test/<wbr>certs/pss1.pem /usr/lib/op=
enssl/ptest/test/<wbr>destest.c /usr/lib/openssl/ptest/test/<wbr>md5test.o =
/usr/lib/openssl/ptest/test/<wbr>rsa_test.o /usr/lib/openssl/ptest/test/<wb=
r>evp_extra_test.o /usr/lib/openssl/ptest/certs/<wbr>README.RootCerts /usr/=
lib/openssl/ptest/<wbr>include/openssl/asn1.h /usr/lib/openssl/ptest/test/<=
wbr>ocsp-tests/D3_Issuer_Root.pem /usr/lib/openssl/ptest/<wbr>libcrypto.a /=
usr/lib/openssl/ptest/test/<wbr>srptest.o /usr/lib/openssl/ptest/test/<wbr>=
ocsp-tests/WSNIC_D2_Issuer_<wbr>Root.pem /usr/lib/openssl/ptest/test/<wbr>c=
erts/rootCA.key /usr/lib/openssl/ptest/test/<wbr>VMSca-response.2 /usr/lib/=
openssl/ptest/test/<wbr>ocsp-tests/WKIC_ND1_Issuer_<wbr>ICA.pem /usr/lib/op=
enssl/ptest/test/<wbr>ideatest.c /usr/lib/openssl/ptest/test/<wbr>certs/roo=
tCA.pem /usr/lib/openssl/ptest/test/<wbr>ocsp-tests/D1_Cert_EE.pem /usr/lib=
/openssl/ptest/certs/<wbr>demo/73912336.0 /usr/lib/openssl/ptest/test/<wbr>=
hmactest.o /usr/lib/openssl/ptest/test/<a href=3D"http://maketests.com" tar=
get=3D"_blank">ma<wbr>ketests.com</a> /usr/lib/openssl/ptest/test/<wbr>smim=
e-certs/smec1.pem /usr/lib/openssl/ptest/certs/<wbr>demo/cbdbd8bc.0 /usr/li=
b/openssl/ptest/test/<wbr>ocsp-tests/WKIC_D2_Issuer_<wbr>Root.pem /usr/lib/=
openssl/ptest/test/<wbr>verify_extra_test.c /usr/lib/openssl/ptest/test/<wb=
r>serverinfo.pem /usr/lib/openssl/ptest/test/<wbr>shatest.c /usr/lib/openss=
l/ptest/test/<wbr>CAss.cnf ...</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">(lots more lines)</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">None of the test suite is actually bei=
ng installed.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></s=
pan></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Th=
anks<div>Changhyeok</div></div></div>
</div>

--94eb2c05a8aaf264f30551c228ce--
