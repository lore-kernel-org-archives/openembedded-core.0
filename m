Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D305F7D1EE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:18:23 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f23so9807522ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=WcsRkuuvM0VNK+QNXmRVBj9v/e3H+xSln9msatCLo6o=;
	b=MelRJgv0gg0tnrVhhnIG28rvhUNll7TFUJv4lKWj0NjjdFDp3ZHnWLEAjiIf7MgDeG
	3CTRXZH01LYji/ErPM3AeZ83zqGnf4+V+N6zlvEDxa9EFpyrnXyzs6ijiaDi5HnegJyr
	0XJo+PpKVPPhlMQJLOaUpazv51vlLUPqFA4T763+jJk2z1Ur184RsswfuVsk6NlMMcUi
	i20SkPGI2Z/LeQ1AmG06VbYD4gFu1dAcDW969j7BHz0NKGs1KPE0VQj/ImD0nACNDVN5
	NbxHWa07QXcbswHPT3pTSSYsvUky2joroOMi2SL5FIJSq9YD4eX9OsZaA4+okmrKvChY
	iv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WcsRkuuvM0VNK+QNXmRVBj9v/e3H+xSln9msatCLo6o=;
	b=DMst1EEStBpllmBVIUfHz/gcCiRuiUZDfb9iT3UG3lei1ZsP0ap40u2zoAB90o9vqF
	A1w0Led20OH0jxpfro2fqD6unmmbdK9x5Sf8yepoW00B5bhp8ahWJrJEv+wb638Bj8x6
	HuQJPkZsKMx+3TgDPybzLWDIaOcseaE1ugvpviogip6ECG8B6Bh9Qh2KYsuXdyver8SH
	EiA/I1ctCwVfj1TPbHUgY4te5RsF+LGG4kjjRWeQF5bKynMOR4ooBYvNrMSL1iQmIPKe
	lDtHt+yNkcmle+icMLEAMkJLyzvYRyvbLOZf/V57uHqp85R0rI37FxJ0zRBscHjKtMZ2
	yNVA==
X-Gm-Message-State: APjAAAW9P3+ZZzVfNNRuzX8OUdQhAbV1TTS48Ph7aRET1KDu5phCN31I
	Woi6uLLns+xzqQJZDEvvq1gxKFyzwCM=
X-Google-Smtp-Source: APXvYqyet3ZRAxcdKPsRoe2JfQnH9p2XuX4On+VUhMIWH4kuzWt94/5afKDDmpGft4fUrq2NpGro+g==
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr664805ljk.129.1554160704062; 
	Mon, 01 Apr 2019 16:18:24 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r27sm2165772lfn.87.2019.04.01.16.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 16:18:23 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190401222438.26872-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LZ7PSj5_X8t_n2C9sMktpOfYd79q6M69q4b3vpRkih4=Q@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <66007396-8ceb-4ce5-7d33-2223c4fcf1dc@oleksandr-kravchuk.com>
Date: Tue, 2 Apr 2019 01:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ7PSj5_X8t_n2C9sMktpOfYd79q6M69q4b3vpRkih4=Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: update to 0.1.11
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
X-List-Received-Date: Mon, 01 Apr 2019 23:18:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ross -

I wonder that as well.

As someone rather new to the YP, I would sensitively like to learn why,
so I don't waste your time in the future again, because I have not
ignored the warning/error. I have simply not seen one.

On 02/04/2019 01:13, Burton, Ross wrote:
> For me:
>
> ERROR: libcomps-0.1.11-r0 do_patch: Command Error: 'quilt --quiltrc
> /data/poky-tmp/master/work/corei7-64-poky-linux/libcomps/0.1.11-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch 0002-Set-library-installation-path-correctly.patch
> patching file libcomps/src/CMakeLists.txt
> Hunk #1 FAILED at 52.
> 1 out of 1 hunk FAILED -- rejects in file libcomps/src/CMakeLists.txt
> Patch 0002-Set-library-installation-path-correctly.patch can be reverse-applied
> ERROR: libcomps-0.1.11-r0 do_patch:
> ERROR: libcomps-0.1.11-r0 do_patch: Function failed: patch_do_patch
>
> I've always wondered why some people have this as a silent "it's
> already applied" and others get a fatal error.
>
> Ross
>
> On Mon, 1 Apr 2019 at 23:24, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../libcomps/{libcomps_git.bb => libcomps_0.1.11.bb}          | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>  rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.11.bb} (92%)
>>
>> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
>> similarity index 92%
>> rename from meta/recipes-devtools/libcomps/libcomps_git.bb
>> rename to meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
>> index ff6820851f..cf6f46484d 100644
>> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
>> +++ b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
>> @@ -9,8 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
>>             file://0001-Add-crc32.c-to-sources-list.patch \
>>             "
>>
>> -PV = "0.1.10"
>> -SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
>> +SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
>>
>>  S = "${WORKDIR}/git"
>>
>> @@ -22,4 +21,3 @@ EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIR
>>  OECMAKE_SOURCEPATH = "${S}/libcomps"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>> -
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

