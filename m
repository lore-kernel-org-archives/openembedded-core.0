Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0202978562
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:40:56 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t86so5018258pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=kNQkttI5uHl42V5yGTIcS0d0IEuhO+2/nVSrjpCnqHQ=;
	b=IMyOXJC/Anl/c5AHL9OiZ7LrG3SUKXxdwavLZ4jHC1vLyIC5fbUbDJSr9xA+6GUAkP
	SIzXsepkFjt54EN6Ars8VI71Qsn5EApDs1E+ykuOKu6d+jNH5QFXzAEyGdjQ5AWN5NMj
	j3v47bGHJ1mt4C1FzDQ5z7YXWuy0jzs/H3CIeSEY/SRWCrj8bDax/Rst2lWjcn45XQkW
	Nh69+QtSR9xfLBKuBrVGRcubnhNxPAUHcXHRgtjZoFzJLNYqiJM4G9qAkRKOvTa6x8aq
	DgcKZupZTTn280yapUaGqilKcsVOwVe3AdgvMEr/RDFhqbfhCq4ZO8v5dBTnwj8qaAtL
	S76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=kNQkttI5uHl42V5yGTIcS0d0IEuhO+2/nVSrjpCnqHQ=;
	b=daw8GQNbtpcEmgENOj0RMmlpS9rlg4WXQliD/nEfEtQew3fASLUokXBNlYGzQay/oT
	ox/i1CuXKg2J03I/VZM7YdOxC+FcqJ88ts/6nU6hSoEZ5T2mIZPRBjj015AdwcWTyEMU
	X2XTYqaFoLSfbBQetca+fHCCWyxzOFHzYYx+OYKZ+FycP/6w5K/MlPEA4pKxngyE7xPd
	aRUwo1UCjbHnDxxWzg6d1xBiFPpgH8U76Q1/mYz+pS4tPK/M2iaF3rmfk5+9/vsI4iW0
	5b7RJ/liOTvk06HbuuWhMw/SVwArjsdTxT2H8JQNZQBybaD2H+z235K1vewdIgA7Lbx1
	TSeQ==
X-Gm-Message-State: AIVw113B42YH3/PYLyNFuIIVcuy0rKWq6q5OvjNPh6618DkqY9aADAIk
	juUg4AUdlxfuw1PN
X-Received: by 10.84.241.207 with SMTP id t15mr18465704plm.347.1501522857900; 
	Mon, 31 Jul 2017 10:40:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b92e:2c89:e1d7:5c28?
	([2601:202:4001:9ea0:b92e:2c89:e1d7:5c28])
	by smtp.gmail.com with ESMTPSA id
	t3sm48484939pfb.147.2017.07.31.10.40.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 10:40:57 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
Date: Mon, 31 Jul 2017 10:40:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Mon, 31 Jul 2017 17:40:57 -0000
Content-Type: multipart/alternative;
	boundary="------------1E85766215426E58F620161B"
Content-Language: en-US

--------------1E85766215426E58F620161B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/31/2017 10:31 AM, Mark Hatle wrote:
> On 7/31/17 12:16 PM, Armin Kuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
>> index 5e832fa..dc1ba5e 100644
>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>> @@ -1 +1,26 @@
>> +DEFAULTTUNE ?= "armv8-a"
> do we want the '-a'?  The other arm (7) are of the format armv7a (no '-').
works for me either way.

While we are at it. How would we want ‘armv8.1-a’, ‘armv8.2-a’, 
‘armv8.3-a' formated as?

- armin
>
> --Mark
>
>> +
>> +TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"
>> +
>> +TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
>> +
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"
>> +
>>   require conf/machine/include/arm/arch-arm64.inc
>> +
>> +AVAILTUNES += "armv8-a armv8-a-crypto"
>> +ARMPKGARCH_tune-armv8-a ?= "armv8-a"
>> +
>> +# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
>> +ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
>> +
>> +TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
>> +TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
>> +
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
>> +
>> +BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
>> +BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"
>>


--------------1E85766215426E58F620161B
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
    <div class="moz-cite-prefix">On 07/31/2017 10:31 AM, Mark Hatle
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com">
      <pre wrap="">On 7/31/17 12:16 PM, Armin Kuster wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
index 5e832fa..dc1ba5e 100644
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ b/meta/conf/machine/include/arm/arch-armv8.inc
@@ -1 +1,26 @@
+DEFAULTTUNE ?= "armv8-a"
</pre>
      </blockquote>
      <pre wrap="">
do we want the '-a'?  The other arm (7) are of the format armv7a (no '-').</pre>
    </blockquote>
    works for me either way. <br>
    <br>
    While we are at it. How would we want ‘<samp>armv8.1-a</samp>’, ‘<samp>armv8.2-a</samp>’,
    ‘<samp>armv8.3-a' formated as?<br>
      <br>
      - armin<br>
    </samp>
    <blockquote type="cite"
      cite="mid:b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com">
      <pre wrap="">

--Mark

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','armv8-a','-march=armv8-a','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"</a>
+
+TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
+TUNE_CCARGS .= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','crypto','+crypto','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"</a>
+
+MACHINEOVERRIDES =. <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','armv8-a','armv8a:','',d)}">"${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"</a>
+
 require conf/machine/include/arm/arch-arm64.inc
+
+AVAILTUNES += "armv8-a armv8-a-crypto"
+ARMPKGARCH_tune-armv8-a ?= "armv8-a"
+
+# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
+ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
+
+TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
+TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
+
+PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
+
+BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
+BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"

</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1E85766215426E58F620161B--
