Return-Path: <rudolf.streif@ibeeto.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 355A77DE92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 15:20:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n8so1306451plp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ibeeto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=zAGMcYEF7/HeUsk4olsmJjp3zz5o+ISqN6a3vpAITZ0=;
	b=ED/1HuNAvXBYsOWjzzRq5l/fpzqSb6YbHMK4MmMx+pmVtFWDqtfPJD9kgSkqfCcQd4
	unfmwk6Le8QjBu9SE3hxWaWmkSE3Yi1IcbdUL3Ki/LCmV9rqTCSD4RnPg0pMiCJZDP39
	D3APmixuP4tLPokYKoOoTda1h7hkDZ9jP95oHs7uZhIVVRrVZRmSppgQCreCXl2YyOuf
	wKfR9QQ7M3meByufD6qH3ZlwAZ4GoLiDWcBvn24lYFd1WXEpB8TwkVUXXRm8DbiE0rAJ
	pgLOK4gdwu/DFihOvBe4FPY/siw8q5M6Gdj+DXoDlT8RU1GqmkF4Pji4HLS0yNRMJF0X
	fk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zAGMcYEF7/HeUsk4olsmJjp3zz5o+ISqN6a3vpAITZ0=;
	b=HZ1+412uudiBr9Ucxgp7e22cmx2AE6+djiZqfTwg3RhHqPOTja7UC1b1LI13CwAvj+
	QKnWF6BXk4TD5ZNsn2cHdJbIWOe8XtO3jK6fWL3PtGs7VK2ynpAEzwni9yvxK1zbYpOE
	W8axt85wySeqNpjfkDJXwz3hU67XRa9glgsBUtbwbXg1w+FzMJSvvcg07F/DevAem2aX
	dlp6O6yEDEmNrw1MN38YyU80ztUGdPZm4gCEX7E1bf+xgLEs0PJAuFxWIJdMhyO8Njc5
	pubsKXioRA7Sa4EdEXZ4zRh4LuxnJEFMobCWkqsA1YNBjvynAPzQM/4OS0kRhk5zEPS5
	MENQ==
X-Gm-Message-State: APjAAAWDSYeuYsS87nGaBjos4ZIbwFnj7dc4Xgw5zhOknTyoxVJo5YK3
	SEpkXbyO9gmcDso7sMN/tm/X+Xc/7QU=
X-Google-Smtp-Source: APXvYqxgN/AWU9CGgMGbbNToEMQxvqcN0Lm1pPuJWw9i4J93DwbQXEbOP0ardEy9M+b1vPqO9TgE5A==
X-Received: by 2002:a17:902:f208:: with SMTP id
	gn8mr5974536plb.312.1557415256574; 
	Thu, 09 May 2019 08:20:56 -0700 (PDT)
Received: from rjs-zotac.ibeeto.com (ip68-7-84-58.sd.sd.cox.net. [68.7.84.58])
	by smtp.gmail.com with ESMTPSA id
	a80sm8506923pfj.105.2019.05.09.08.20.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 08:20:55 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	openembedded-core@lists.openembedded.org
References: <ae370e65-a910-2964-b31a-bb5b1b3636d6@ibeeto.com>
	<0d613343-91fb-8e22-ce9c-a23f2d98a4a9@balister.org>
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
Message-ID: <401f16e3-a616-916b-8e2d-6f6c66d55f12@ibeeto.com>
Date: Thu, 9 May 2019 08:20:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <0d613343-91fb-8e22-ce9c-a23f2d98a4a9@balister.org>
Subject: Re: [meta-oe] sip/sip3
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
X-List-Received-Date: Thu, 09 May 2019 15:20:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thank you, Philip. Yes, that worked fine. It's the solution I preferred.

:rjs

On 5/8/19 8:22 AM, Philip Balister wrote:
> On 05/07/2019 08:19 PM, Rudolf J Streif wrote:
>> With the recent update of sip/sip3 from 4.19.13 to 4.19.16 FILES has
>> changed:
>>
>> 4.19.13:
>>
>> |
>>
>> FILES_python3-sip3  =
>> "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/"
>> FILES_${PN}-dbg  +=
>> "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/.debug"|
>>
>> 4.19.16 (meta-openembedded @ 50108c18):
>>
>> |
>>
>> FILES_python-sip  =  "${libdir}/${PYTHON_DIR}/site-packages/"
>> FILES_${PN}-dbg  +=  "${libdir}/${PYTHON_DIR}/site-packages/.debug"|
>>
>> |
>>
>> |
>>
>> |
>>
>> |
>>
>> That causes an issue with PyQt5 which is installed in (python-pyqt5.inc,
>> meta-qt5 @ f4531ec8):
>>
>> echo "py_pylib_dir =
>> %(sysroot)/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> pyqt.cfg
>>
>> PYTHON_BASEVERSION = "3.7"
>> PYTHON_ABI = "m"
>>
>> This can obviously be fixed on either end, but I am not quite sure what
>> the right approach is.
> Does this help?
>
> https://github.com/meta-qt5/meta-qt5/pull/202
>
> Thanks for seeing this. Having these tools across two layers is tricky.
> The problem is the pyqt can be either in a qt4 layer or a qt 5 later.
> And python 2/3 versions.
>
> And the sip recipe really needs to spit out the module used for pyqt.
>
> Philip
>
>
>> Thanks,
>>
>> Rudi
>>
>>
>>   -----
>> Rudolf J Streif
>> CEO/CTO ibeeto
>> +1.855.442.3396 x700
>>
>>
>>
>>
-- 
-----
Rudolf J Streif
CEO/CTO ibeeto
+1.855.442.3396 x700


