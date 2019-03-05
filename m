Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2541F7C420
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:20:24 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id p73so6772905lfe.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=52twDeUuL3+ekfkGc7vR52j9iQd5joAUwMNkWBE1RcY=;
	b=mR28whLrqNG4W0gmUraZs47WTltdfd4vY0BOA4JOtrQUCRly7zuagTOp4Yo9kxzi8r
	qpypbxyL9AK4fQ2Gqz6l9PnBhBHV1xcJpTfcVHdD9lDQi7xBLb7rgCqjjXig5NCNyba6
	kwERnGuF5YTR66cv1mlBAV5oyb9kEgANNGKDU4NUpLa6eeoTJBSoUP1TPLFXpbPZEybX
	C0sdYp8Ks1qkq/tNkLIprlS1b/ROsianKNZGEHXu8hpVQlTc9wMIHtHuq2nvdXNbYXp6
	DAMNd+BTrofnNywRMNMH0EdyMG3diDqm2gs1RxlB+eCBDKRlyqSP8dD3zicp6Gaw00Uc
	4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=52twDeUuL3+ekfkGc7vR52j9iQd5joAUwMNkWBE1RcY=;
	b=pjfvfpiPyqMpsMQT1LXJ/+qdHaSKrJeiWGtC1ucWpsUM6eKj2PCQZQos5UyWIzh824
	xXuvzOdxbFyM03TD7z8oLDgkT5VUxQejktf4iXt/tunuTRMjWK5QJ5SmF/bLTdWL0iYr
	sPtDbnbIWaQUhmuh9bBuDvvJ1T4iOi77N3SOFYWiiHsvdOg6fZw7cOjRfNgAfWmJqDZv
	5e4A4iNcUfN5BdgwQJ9hmE2YFydrbMGzBAYqkjFd3xSpuv3RhFATf2hb8tsgQXij/oMi
	CiWmlrdMiki6K8Uvjh5SZ6f05hb3sz/mZmlDQQvyVMBlJi7mW1z7MB7Qmbfd38EEFV6O
	sb9A==
X-Gm-Message-State: APjAAAWsYzgY0+NDi/0tcNl542fZIA7Fc574dJ/mC60E4QyR9PJwXEDW
	1CQszwdW8kqj/2rvOMpNUfY0tQ==
X-Google-Smtp-Source: APXvYqwE5liwmZ2uTIMnlRM1oOqFzuxvibOm9Y9e4kgTPJDKg7o/GVhLc0p96rdZ6ZHxCctlQvxEQA==
X-Received: by 2002:ac2:5294:: with SMTP id q20mr2185609lfm.12.1551824425353; 
	Tue, 05 Mar 2019 14:20:25 -0800 (PST)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	k23sm2336224ljk.69.2019.03.05.14.20.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 14:20:24 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: akuster808 <akuster808@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190304041822.118083-1-oleksandr.kravchuk@pelagicore.com>
	<37c86bee-0222-7eab-c001-97dadee76def@gmail.com>
Message-ID: <617f87d5-2354-9b15-3980-a20b75d5fc9c@sashko.rv.ua>
Date: Tue, 5 Mar 2019 23:20:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <37c86bee-0222-7eab-c001-97dadee76def@gmail.com>
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][thud][PATCH] target-sdk-provides-dummy: add perl-module-overload
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
X-List-Received-Date: Tue, 05 Mar 2019 22:20:25 -0000
Content-Type: multipart/alternative;
	boundary="------------5969CC83EF98B686E3D47DDE"
Content-Language: en-US

--------------5969CC83EF98B686E3D47DDE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Apologies for skipping the commit message.

It fixes the following issue:

Error: 
 Problem: package perl-module-overload-5.24.4-r0.corei7_64 requires
perl-module-warnings-register, but none of the providers can be installed
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
conflicts with perl provided by perl-5.24.4-r0.corei7_64
 
On 04/03/2019 16:25, akuster808 wrote:
>
> On 3/3/19 8:18 PM, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> is this in master? What does it fix?
>
> - armin
>> ---
>>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> index edf07c4a23..13741f0a64 100644
>> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
>> @@ -26,6 +26,7 @@ DUMMYPROVIDES = "\
>>      perl-module-getopt-long \
>>      perl-module-io-file \
>>      perl-module-posix \
>> +    perl-module-overload \
>>      perl-module-thread-queue \
>>      perl-module-threads \
>>      /bin/sh \

--------------5969CC83EF98B686E3D47DDE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; margin-top: 0px;
      margin-bottom: 0px;">Apologies for skipping the commit message.</div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; margin-top: 0px;
      margin-bottom: 0px;"><br>
    </div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; margin-top: 0px;
      margin-bottom: 0px;">It fixes the following issue:</div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; margin-top: 0px;
      margin-bottom: 0px;"><br>
    </div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">Error: </div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"> Problem: package
      perl-module-overload-5.24.4-r0.corei7_64 requires
      perl-module-warnings-register, but none of the providers can be
      installed</div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><font size="3"><span
          style="font-size: 12pt;">  - package
          target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
          conflicts with perl provided by perl-5.24.4-r0.corei7_64</span></font></div>
    <div style="color: rgb(0, 0, 0); font-family: Calibri, Helvetica,
      sans-serif, serif, EmojiFont; font-size: 16px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; margin-top: 0px;
      margin-bottom: 0px;"> </div>
    <div class="moz-cite-prefix">On 04/03/2019 16:25, akuster808 wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:37c86bee-0222-7eab-c001-97dadee76def@gmail.com">
      <pre class="moz-quote-pre" wrap="">

On 3/3/19 8:18 PM, Oleksandr Kravchuk wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:oleksandr.kravchuk@pelagicore.com">&lt;oleksandr.kravchuk@pelagicore.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
is this in master? What does it fix?

- armin
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index edf07c4a23..13741f0a64 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -26,6 +26,7 @@ DUMMYPROVIDES = "\
     perl-module-getopt-long \
     perl-module-io-file \
     perl-module-posix \
+    perl-module-overload \
     perl-module-thread-queue \
     perl-module-threads \
     /bin/sh \
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5969CC83EF98B686E3D47DDE--
