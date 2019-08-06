Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7EF7F38C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 20:32:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w24so38324838plp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=FYdrsx9zapiT241QZAsnZAzC4rCt2bJJJaWXXB3LpMk=;
	b=duKKGP65bBEjQdMfTZHiy9bN8NIUyXlWSpO+jnmWmAFrr32KJ8piBoKy2GvaI6lQRf
	R7AN87UzzCLDWKti8/84TciYxhhxwgeXd04NWs4U2dpD8QKtXEp5RBFTukSOwGPS4e6k
	hsqPbqmhD0YPXM1HMQnNNyeScyvYo5mkoN9aINoI2XJCMjRMVg9KCbkrLQ9crfHjP+7U
	9/Ln+PnBZqBJmURT70UXLajLGEv5Q3ltV1fHikUVSAEOS0goN3JA0MPxM9o9lfN8eI5y
	oCqN7FV2PfqECIfBxuu7qKui06z66FX7CeymlFpFdCnTrbtJoPWsK0DROgCHdXYdlkEX
	8J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=FYdrsx9zapiT241QZAsnZAzC4rCt2bJJJaWXXB3LpMk=;
	b=Hzvm3ZMXN3n0gBOyy71lA6MvkkH0eb1FthG4iZ7B3zlQtAwuJPcNrbGpQh7z3EDNUd
	TISCSi1YBT+6exfhBqwSSd9NorGOYPUSzLySc/nqYfd2vJ8fdaOQ6ocorcd/dttqXxVF
	+JCcgmFUYixZuNkLNvFFr3Hpk7RqjmAz8z9jQCTHwTb8n9MvHaKg986zhQRPvB709qZ3
	Xv0ZpHOlwnki0qIRiLq07Jhyl93Dz0dEyhXpAv96U+FbHoKNuNQdvW5e4Zmjk2HRaHq6
	tk06woBBmEIPcjoUq/gNvthszCna812AZlNtOCZeh0+FTxUqHeTPY/WKHIeNye6dytMD
	ucFQ==
X-Gm-Message-State: APjAAAVni8KPqel5iV6YGqc5ooKz7WqRLGsSzuJ7HhCu4O+1yOTlQP1U
	6xKOjOe7s22Jk8ZH/kzXMSZTmHtT
X-Google-Smtp-Source: APXvYqxytTz969ihCYsu6EPFt32tFg+vOT2jgwXtLLQWWSQA9tKj17YYIlBaFUmjFMhs8uwXRyg3EQ==
X-Received: by 2002:a17:902:b789:: with SMTP id
	e9mr4785279pls.294.1565123533182; 
	Tue, 06 Aug 2019 13:32:13 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id i9sm18947714pjj.2.2019.08.06.13.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 13:32:12 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190804000313.34500-1-raj.khem@gmail.com>
	<542cb1bf478aac542ec319a84fb6c3b4a1be097a.camel@linuxfoundation.org>
	<04bfdf5f-0026-a541-d842-d225313c37e9@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f13592b2-0461-c997-c1b1-a53c817e8d02@gmail.com>
Date: Tue, 6 Aug 2019 13:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <04bfdf5f-0026-a541-d842-d225313c37e9@gmail.com>
Subject: Re: [PATCH] musl: Update to master tip
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
X-List-Received-Date: Tue, 06 Aug 2019 20:32:12 -0000
Content-Type: multipart/alternative;
	boundary="------------6AB24FE64F62BC1DFB6FC53E"
Content-Language: en-US

--------------6AB24FE64F62BC1DFB6FC53E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Khem,

do you know if this update includes  CVE-2019-14697?

Fix:
https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441

or
https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441

https://git.musl-libc.org/cgit/musl/patch/?id=6818c31c9bc4bbad5357f1de14bedf781e5b349e

- Armin

On 8/6/19 9:03 AM, Khem Raj wrote:
> On 8/6/19 3:48 AM, Richard Purdie wrote:
>> On Sat, 2019-08-03 at 17:03 -0700, Khem Raj wrote:
>>> Fix for RISC-V build regression
>>>
>>> 64bit time syscall plumbing
>>>
>>> Changes are here [1]
>>>
>>> [1] 
>>> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> This didn't pass automated testing for qemux86 or qemux86-64:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900
>
> seems ssh test failed. I will check
>
>> Cheers,
>>
>> Richard
>>
>>


--------------6AB24FE64F62BC1DFB6FC53E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Khem,<br>
    <br>
    do you know if this update includes  CVE-2019-14697?<br>
    <br>
    Fix: <br>
    <a class="moz-txt-link-freetext"
href="https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441">https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441</a><br>
    <br>
    or <br>
    <a class="moz-txt-link-freetext"
href="https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441">https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441</a>
    <br>
    <a class="moz-txt-link-freetext"
href="https://git.musl-libc.org/cgit/musl/patch/?id=6818c31c9bc4bbad5357f1de14bedf781e5b349e">https://git.musl-libc.org/cgit/musl/patch/?id=6818c31c9bc4bbad5357f1de14bedf781e5b349e</a><br>
    <br>
    - Armin<br>
    <br>
    <div class="moz-cite-prefix">On 8/6/19 9:03 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:04bfdf5f-0026-a541-d842-d225313c37e9@gmail.com">
      <pre class="moz-quote-pre" wrap="">
On 8/6/19 3:48 AM, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Sat, 2019-08-03 at 17:03 -0700, Khem Raj wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Fix for RISC-V build regression

64bit time syscall plumbing

Changes are here [1]

[1] 
<a class="moz-txt-link-freetext" href="https://git.musl-libc.org/cgit/musl/log/?qt=range&amp;q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f">https://git.musl-libc.org/cgit/musl/log/?qt=range&amp;q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">This didn't pass automated testing for qemux86 or qemux86-64:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900">https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

seems ssh test failed. I will check

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Cheers,

Richard

</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------6AB24FE64F62BC1DFB6FC53E--
