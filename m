Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id F359478F63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:58:09 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id d189-v6so28139313oib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=GJ3b1bYk74ctDJs6VU7t47jqYJxZlp1MESE4FQqc18A=;
	b=Befww+j4JnnWzgOg1ZpEAEol6YVlIuOrsVpB/Qg51k+ZHO1jdPp/MfvxvPv5DvAlnW
	0kOqRI9xniwJSN19Sha5TE/xysGYqFgFMwcb3TYQHxf6KwS9kTq7TOm23nzGi0eEkTjo
	ZPOyNgbMsFhM2eZuf+SLuvnSbtWzgzKnjL2UEfl4I8gcwfUXVDpBfR917aTM3rNjjsZ2
	bU5vhejZJH0TunJ9WxcmKjgCjjkHZRtzgikoVN7uLXWJcPnEhlveDyc/00vJK5AGcV5w
	ZBZiaI3iXd+NunsTSKD3jTAN9EO5fUDn1tyoQLkL3Rhj2voEL2ZJUxA3F5STUsaDlN7K
	SPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=GJ3b1bYk74ctDJs6VU7t47jqYJxZlp1MESE4FQqc18A=;
	b=unl9O+lMQNvSoMYYbi1S/ruteJlGVG/qRov4EuCqvTWTTV3Hfxze83+Xryhu++B2ST
	hIoVHgknJa8Sl8ExgXaR7rAQyfa1xmfx9jefD4+t/7UD1mhvKp21pOD1BhcjEIfK/NNl
	x3+Sjnk2roJZzhFFNQ0Ib7O9hS2dcijlX8GmI9LNZDMDC7NJvzpLg3BWT8VoNPJqBBdE
	H0HO8f4M05zi4RRzWxmERuVUnsQQhqWVTErTotPB+iE/cakGBx5yzIn1JiUN7eBPy0xT
	Uj6KuR77LRqojsNrWN0I2lS8Ao3UD4FODqnpkLmUR47lkI/kKWFw1kiIeBKJ+lxVudLK
	2zWQ==
X-Gm-Message-State: AOUpUlGHi7ciqgzOoDWMm2AVU7Wl1ALdShcyRU9iSVejoGTySusjFFTF
	EUnlnqAuXxrlLlsl5J0fFoxn6oap
X-Google-Smtp-Source: AA+uWPymM6HZRFqcsw9rhJfP5k68RWuVX0FQGpVcMR5mE1swuHAjeT/N9/frCNaipjdE6OMZqYgNQQ==
X-Received: by 2002:a54:4197:: with SMTP id
	23-v6mr5336793oiy.352.1534175890736; 
	Mon, 13 Aug 2018 08:58:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:64f0:5919:ccc1:f72d?
	([2601:202:4180:c33:64f0:5919:ccc1:f72d])
	by smtp.gmail.com with ESMTPSA id
	l204-v6sm11672271oia.45.2018.08.13.08.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 08:58:10 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1534150507-171031-1-git-send-email-changqing.li@windriver.com>
	<b936607d-dd70-47a1-826e-b245a57a7c79@gmail.com>
	<CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <57f1ea3f-5bba-1daf-723e-e1d2b9feb06b@gmail.com>
Date: Mon, 13 Aug 2018 08:58:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: upgrade 9.11.4 -> 9.13.2
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
X-List-Received-Date: Mon, 13 Aug 2018 15:58:10 -0000
Content-Type: multipart/alternative;
	boundary="------------0E5A4D97D98E8DD7D10EEEAD"
Content-Language: en-US

--------------0E5A4D97D98E8DD7D10EEEAD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 08/13/2018 07:59 AM, Alexander Kanavin wrote:
> However, for the upcoming YP release, it's better to settle on
> something that expires later than 2020. How is 9.12.x currently?
I stand corrected. its 2021.

Here are our current ESV versions and their EOL dates:

  * BIND 9.9 Extended Support Version will be supported until June, 2018
  * BIND 9.11 is an Extended support version, and will be supported
    until December, 2021

BIND 9.16 will be our next ESV, followed by BIND 9.20, and every second
stable version after that will be ESV.


Please see : https://www.isc.org/downloads/software-support-policy/ if
you want more details. The reasoning was noted during the update to 9.10
-> 9.13 -> 9.11 emails/patches a few months back.

- armin
>
> Alex
>
> 2018-08-13 16:37 GMT+02:00 akuster808 <akuster808@gmail.com>:
>>
>> On 08/13/2018 01:55 AM, changqing.li@windriver.com wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> Is there a reason why this version was selected? 9.13 is still under
>> development and ISC in not recommending  this version for production.
>> 9.11 EOL is 2020.
>>
>> We should keep one long term version around if you need bleeding edge.=

>>
>> - armin
>>> ---
>>>  meta/recipes-connectivity/bind/{bind_9.11.4.bb =3D> bind_9.13.2.bb} =
| 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>  rename meta/recipes-connectivity/bind/{bind_9.11.4.bb =3D> bind_9.13=
=2E2.bb} (97%)
>>>
>>> diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/rec=
ipes-connectivity/bind/bind_9.13.2.bb
>>> similarity index 97%
>>> rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
>>> rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
>>> index 7522fdb..08ebd24 100644
>>> --- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
>>> +++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
>>> @@ -19,8 +19,8 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${=
BPN}-${PV}.tar.gz \
>>>             file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>>>  "
>>>
>>> -SRC_URI[md5sum] =3D "9b4834d78f30cdb796ce437262272a36"
>>> -SRC_URI[sha256sum] =3D "595070b031f869f8939656b5a5d11b121211967f15f6=
afeafa895df745279617"
>>> +SRC_URI[md5sum] =3D "01d0524016ac15ea3f4b6c77d99db0b2"
>>> +SRC_URI[sha256sum] =3D "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a=
8d6d8b574d9282651802"
>>>
>>>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>>>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>9(\.\d+)+(-P\d+)*)/"
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------0E5A4D97D98E8DD7D10EEEAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/13/2018 07:59 AM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com">
      <pre wrap="">However, for the upcoming YP release, it's better to settle on
something that expires later than 2020. How is 9.12.x currently?</pre>
    </blockquote>
    I stand corrected. its 2021.<br>
    <br>
    <p>Here are our current ESV versions and their EOL dates:</p>
    <ul>
      <li>BIND 9.9 Extended Support Version will be supported until
        June, 2018</li>
      <li>BIND 9.11 is an Extended support version, and will be
        supported until December, 2021</li>
    </ul>
    <p>BIND 9.16 will be our next ESV, followed by BIND 9.20, and every
      second stable version after that will be ESV.</p>
    <br>
    Please see : <a class="moz-txt-link-freetext" href="https://www.isc.org/downloads/software-support-policy/">https://www.isc.org/downloads/software-support-policy/</a>
    if you want more details. The reasoning was noted during the update
    to 9.10 -&gt; 9.13 -&gt; 9.11 emails/patches a few months back.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CANNYZj_Fmqpz1bS8XMDsReaeg1s9wBQ2JWLCDt0_MMez-S_tKQ@mail.gmail.com">
      <pre wrap="">

Alex

2018-08-13 16:37 GMT+02:00 akuster808 <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre wrap="">

On 08/13/2018 01:55 AM, <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="">
Is there a reason why this version was selected? 9.13 is still under
development and ISC in not recommending  this version for production.
9.11 EOL is 2020.

We should keep one long term version around if you need bleeding edge.

- armin
</pre>
        <blockquote type="cite">
          <pre wrap="">---
 meta/recipes-connectivity/bind/{bind_9.11.4.bb =&gt; bind_9.13.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.4.bb =&gt; bind_9.13.2.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.13.2.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
rename to meta/recipes-connectivity/bind/bind_9.13.2.bb
index 7522fdb..08ebd24 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.13.2.bb
@@ -19,8 +19,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz\file://0001-lib-dns-gen.c-fix-too-long-error.patch\">"https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
 "</a>

-SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
-SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
+SRC_URI[md5sum] = "01d0524016ac15ea3f4b6c77d99db0b2"
+SRC_URI[sha256sum] = "6c044e9ea81add9dbbd2f5dfc224964cc6b6e364e43a8d6d8b574d9282651802"

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/bind9/">"https://ftp.isc.org/isc/bind9/"</a>
 UPSTREAM_CHECK_REGEX = "(?P&lt;pver&gt;9(\.\d+)+(-P\d+)*)/"
</pre>
        </blockquote>
        <pre wrap="">

--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------0E5A4D97D98E8DD7D10EEEAD--
