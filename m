Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id F111360053
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 07:03:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so18734709wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 23:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=KfqK66wxE9/wyGI3awPsUtDfDSyUJO7Kt1WEBOcxK/w=;
	b=JZzaOeIbEZY1hTQYsmqjiIbVuYozGQ9ivkgBtDfqAHwKkN1Bau5u5U9C70z/PjY9P+
	uNFgcF+BXr9c7dAQ3D62xtMT6MCzhybM4T26XcqeRiD7lhfy8eG1+4U2yTxmKKIK5g75
	J3vtVFLUtCo4YF4Mh1sPRob2IYe2Kz/+FPYOI12SQqC3LgChZ9MbSEIk4cu7Kc+1Jwkp
	QuIUiKQUTjsiC/EifdBag6K2RNs2s1vRnrI4p2U0HO7MC6jzAi1XsG5oikDLpNfVB+DL
	7JXy/5oaR+TFUBAP0hiKGgn6MhYz9Wq7i8dirx/zYUPP0UCApe373Cq0xGOoy7wkYjxN
	HwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=KfqK66wxE9/wyGI3awPsUtDfDSyUJO7Kt1WEBOcxK/w=;
	b=YOzPZSXOc+3LrcdN9nsJDSmt3cVqJzAhnbaR4xvYYFHWt1q8/Rdz2A4/G8d3ztH3Pv
	AUSKozMQEvA52IkhaArNzim30QSUl7xQsyvXQOSfRSLwiRI2FaG3d8IuaknnQ/lcYjEN
	006OsvjKhMjWTLopbhcuws6o3Qcn78OHIfnRfgQmeDfGZwhZr1x8oNRhfraNExg2gpZt
	Dr7RAMLXS467t1M/dMUVkZPooMEf/tazDw6bdwNXF2alKz/DWQG893DC2A367THiZFNM
	fIh+cn3dP9ZfOLnEILPgdWcYS7mCAiRV1Ho7C+9iEnLtCliTk4WacFCzRaGL6CCVo8IK
	xEDQ==
X-Gm-Message-State: AD7BkJJsy0IkmyQNpXK7LOJyIvG8ULlvReUq41az5FV0+e5yy+JiLKVzQNgKdcm17pvI776jaUTt7sOpp5g9Zw==
MIME-Version: 1.0
X-Received: by 10.28.220.134 with SMTP id t128mr3788442wmg.61.1456988588647;
	Wed, 02 Mar 2016 23:03:08 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 2 Mar 2016 23:03:08 -0800 (PST)
In-Reply-To: <CAJ86T=UUi9twF-2U=ZA4hz8_xX88OSTEjwVf2dzjuysQkx8GTw@mail.gmail.com>
References: <1456904321-25059-1-git-send-email-akuster808@gmail.com>
	<CAJ86T=UbRRkZAV5-JEfhZs3TL_W0Hbb4bhcN0kJGZssj60OPOg@mail.gmail.com>
	<56D73BA0.5030408@mvista.com>
	<CAJ86T=UUi9twF-2U=ZA4hz8_xX88OSTEjwVf2dzjuysQkx8GTw@mail.gmail.com>
Date: Wed, 2 Mar 2016 23:03:08 -0800
Message-ID: <CAJ86T=V+vxEt_1WoK7tay55ei5o1a1dAgk=a652KufP6uxNX-g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: akuster <akuster@mvista.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][Drown] openssl: Security fix Drown via 1.0.1g update
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
X-List-Received-Date: Thu, 03 Mar 2016 07:03:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 12:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Mar 2, 2016 at 11:14 AM, akuster <akuster@mvista.com> wrote:
>>
>> On 03/02/2016 10:06 AM, Andre McCurdy wrote:
>>> On Tue, Mar 1, 2016 at 11:38 PM, Armin Kuster <akuster808@gmail.com> wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> CVE-2016-0800
>>>> CVE-2016-0705
>>>> CVE-2016-0798
>>>> CVE-2016-0797
>>>> CVE-2016-0799
>>>> CVE-2016-0702
>>>> CVE-2016-0703
>>>> CVE-2016-0704
>>>>
>>>> https://www.openssl.org/news/secadv/20160301.txt
>>>>
>>>> Updated 2 debian patches to match changes in 1.0.1g

That should be 1.0.2g (and the commit summary has the same typo too).

>>> Could you give some details on why the linker version script is now
>>> required
>>
>> it has been part of openssl for over a year.
>>
>> See commit ( Better call Saul )
>>
>> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/openssl?id=10b689033551c37d6cafa284d82bdccd43f6113e
>>
>>>> and how it was generated?
>>
>> This is just an update from debian to support 1.0.2g. Have no idea how
>> they create that file.
>
> OK, yes, I see it now in the Debian openssl 1.0.2g patches:
>
>   http://http.debian.net/debian/pool/main/o/openssl/openssl_1.0.2g-1.debian.tar.xz
>
> It seems that Debian have been versioning openssl symbols for quite
> some time and we've inherited that via the Debian patches.
>
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=333349
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=180725
>   ...
>
> Perhaps some comments in the openssl recipe would be useful to make it
> a little clearer that we are providing Debian openssl and not the
> vanilla upstream version. Maybe even use Debian version numbers (ie
> 1.0.2g-1 in this case) and apply the complete set of Debian patches
> for each new release instead of keeping our own local copies?
>
>> If you don't have it this package wont build.
>>
>> It was there when you updated to 1.0.2f, which I suspect you did not
>> realize.
>>
>> Sorry I don't have a better answer.
>>
>> - Armin
>>
>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>  .../openssl/debian1.0.2/block_diginotar.patch      |   17 +-
>>>>  .../openssl/debian1.0.2/version-script.patch       | 4656 ++++++++++++++++++++
>>>>  .../{openssl_1.0.2f.bb => openssl_1.0.2g.bb}       |    6 +-
>>>>  3 files changed, 4668 insertions(+), 11 deletions(-)
>>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>>>>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2f.bb => openssl_1.0.2g.bb} (91%)
>>>>
>>>> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
>>>> index 0c1a0b6..d81e22c 100644
>>>> --- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
>>>> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
>>>> @@ -9,14 +9,15 @@ Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
>>>>  Reviewed-by: Dr Stephen N Henson <shenson@drh-consultancy.co.uk>
>>>>
>>>>  This is not meant as final patch.
>>>> -
>>>> +
>>>>  Upstream-Status: Backport [debian]
>>>>
>>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>>
>>>> -Index: openssl-1.0.2/crypto/x509/x509_vfy.c
>>>> +Index: openssl-1.0.2g/crypto/x509/x509_vfy.c
>>>>  ===================================================================
>>>> ---- openssl-1.0.2.orig/crypto/x509/x509_vfy.c
>>>> -+++ openssl-1.0.2/crypto/x509/x509_vfy.c
>>>> +--- openssl-1.0.2g.orig/crypto/x509/x509_vfy.c
>>>> ++++ openssl-1.0.2g/crypto/x509/x509_vfy.c
>>>>  @@ -119,6 +119,7 @@ static int check_trust(X509_STORE_CTX *c
>>>>   static int check_revocation(X509_STORE_CTX *ctx);
>>>>   static int check_cert(X509_STORE_CTX *ctx);
>>>> @@ -25,17 +26,17 @@ Index: openssl-1.0.2/crypto/x509/x509_vfy.c
>>>>
>>>>   static int get_crl_score(X509_STORE_CTX *ctx, X509 **pissuer,
>>>>                            unsigned int *preasons, X509_CRL *crl, X509 *x);
>>>> -@@ -438,6 +439,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
>>>> +@@ -489,6 +490,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
>>>>       if (!ok)
>>>> -         goto end;
>>>> +         goto err;
>>>>
>>>>  +      ok = check_ca_blacklist(ctx);
>>>> -+      if(!ok) goto end;
>>>> ++      if(!ok) goto err;
>>>>  +
>>>>   #ifndef OPENSSL_NO_RFC3779
>>>>       /* RFC 3779 path validation, now that CRL check has been done */
>>>>       ok = v3_asid_validate_path(ctx);
>>>> -@@ -938,6 +942,29 @@ static int check_crl_time(X509_STORE_CTX
>>>> +@@ -996,6 +1000,29 @@ static int check_crl_time(X509_STORE_CTX
>>>>       return 1;
>>>>   }
>>>>
>>>> diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>>>> new file mode 100644
>>>> index 0000000..29f11a2
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
>>>> @@ -0,0 +1,4656 @@
>>>> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
>>>> +===================================================================
>>>> +--- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure     2014-02-24 21:02:30.000000000 +0100
>>>> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure  2014-02-24 21:02:30.000000000 +0100
>>>> +@@ -1651,6 +1651,8 @@
>>>> +               }
>>>> +       }
>>>> +
>>>> ++$shared_ldflag .= " -Wl,--version-script=openssl.ld";
>>>> ++
>>>> + open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
>>>> + unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
>>>> + open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
>>>> +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
>>>> +===================================================================
>>>> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
>>>> ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld 2014-02-24 22:19:08.601827266 +0100
>>>> +@@ -0,0 +1,4608 @@
>>>> ++OPENSSL_1.0.2d {
>>>> ++      global:
>>>> ++              BIO_f_ssl;
>>>> ++              BIO_new_buffer_ssl_connect;
>>>> ++              BIO_new_ssl;
>>>> ++              BIO_new_ssl_connect;
>>>> ++              BIO_proxy_ssl_copy_session_id;
>>>> ++              BIO_ssl_copy_session_id;
>>>> ++              BIO_ssl_shutdown;
>>>> ++              d2i_SSL_SESSION;
>>>> ++ ...
>>>> ++ ...

