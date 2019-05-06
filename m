Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id E59546B436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 11:11:40 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id j11so8842423lfm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=0rP2Oxd+82SLmLQWg+zNL4yloCyzSN5zuHe3/Yfcnak=;
	b=iBjBY4Xzlw4zpHuXynY3/Y9Xfy54yYr5qmSS+9J8TgSpDnjHnevPDrUba6psB/dMCi
	TbOwhxNGC7N+mmZCziffrSvcKgwXhRpnYD8RXkoMCfU/0KRQuUEAiqNEn/D/xxK+QmMS
	BL4obXyzf7hXry0qcckZTiqPhSmQAh+6FrdD5poQ9sip+QM0XO8GWfUXdnofHT5Eq6F9
	jBodCNNyVm9uhuQsji2pwgFM8rt9MgcmmkAcMWT4dabkgNx91vDDmdWflfM59/J1WZhM
	f72B9yXELOrZoctgchNChy6a40bVPWoBz2pmTUr24yZZEi3NsF1+cAYi1EmMxiWqk2rW
	kEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0rP2Oxd+82SLmLQWg+zNL4yloCyzSN5zuHe3/Yfcnak=;
	b=hrmuuNcgqR/25EBkqLhNaX8dBjUrnRjQBtl4YYDyv0FYygEDHrS5rdhyXF0AGOgStA
	RcFLwWvmag9V5+lsjLTDsZrjPaxv3Dw7vAwVofcZ4hRua89RF2ynVZtE/IW+h8bR4rls
	QsJX33hkgILPzdb4GcbGgYP+nHAfbccrJraN6iXFm/T67l2tLao8R2OkabWHQZxQKuTG
	o7hWQ32DtJf0SKoSlEeMpHwS8d1FKW4MINCQg2HTbv1ogXDpkni5yOVVoUfhPVZDR8FZ
	oPYfiO091lSJ11MtZ+20Vi8s7McUkjQeT4oJAAgBlKteBveoJH6TX7cumMm24fcNVUoo
	PEGA==
X-Gm-Message-State: APjAAAWY10chpLof1CmDM7fMWMozpUyP8ejm75pU3olUQfnnBfeVHkCj
	v5Kav2sh8X9c8wtiZfvr/0m7bWeOI0k=
X-Google-Smtp-Source: APXvYqyPTjcgX7sRLGH75c+yAl4N6a58YvRZbtbrmJV8GqlkhY+BMlQWAsxiOOOnWjH3F+yE4kt94Q==
X-Received: by 2002:ac2:547a:: with SMTP id e26mr12468957lfn.148.1557141100782;
	Mon, 06 May 2019 04:11:40 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	m19sm2250817ljg.35.2019.05.06.04.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 04:11:40 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
	<a07a16cb88284954a5d1b3774a6b2fcd@XBOX04.axis.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <241480a0-e4f7-fc5b-7aad-1d19b21972fa@norrbonn.se>
Date: Mon, 6 May 2019 13:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a07a16cb88284954a5d1b3774a6b2fcd@XBOX04.axis.com>
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Mon, 06 May 2019 11:11:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter,

On 06/05/2019 12:28, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
>> Sent: den 6 maj 2019 06:54
>> To: Alex Kiernan <alex.kiernan@gmail.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [OE-Core][PATCH] systemd: Default to non-
>> stateless images
>>
>> Hi Alex,
>>
>> The below is fine and looks good.  The one thing that bothers me about
>> this is that "stateless" isn't really a property of the "distro",
>> rather
>> it's a property of the image/machine.  I suspect, in the same sense
>> that
>> we have readonly-rootfs, that we should probably have image features
>> "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
>>
>> Furthermore, if you want to boot with 'ro' on the command-line, I
>> really
>> think you need to build your image with the "readonly-rootfs" feature
>> set.  The default should be writable+persistent /etc as that's the
>> configuration used 99% of the time (currently).  "readonly-rootfs" does
>> a bit more than just creating machine-id but it's all relevant to the
>> 'ro' case where /etc isn't writable.
>>
>> Just for clarification:
>>
>> i)  volatile-rootfs:  means there's no point in prepopulating /var
>> because it's on a tmpfs and needs to be populated at boot time
> 
> This doesn't really say anything about the state of the rootfs outside
> of /var, i.e., is it writable or read-only?
> 
>> ii)  stateless-rootfs:  means there's no point in prepopulating neither
>> /etc nor /var because they are on a tmpfs and need to be populated at
>> boot time
> 
> Same here.
> 
>> iii)  readonly-rootfs:  means that /etc is really not writable so it's
>> important that: the systemd first-boot stuff needs to be done at build
>> time:  machine-id, unit files set up, all tmpfiles.d snippets that
>> touch /etc and /var need to be done in advance.
>>
>> /Jonas
> 
> Maybe we need some more generic way of describing the intended
> structure of the image? E.g., what are the expected behavior of
> /etc, /var and the rest of the rootfs? For each they can typically
> be "read-only", "persistent" (writable and survives reboots) or
> "volatile" (writable, but doesn't survive a reboot).

Alex already put this link into an earlier response but I'll repeat it 
here and defer to it for the terminology and justification.

http://0pointer.net/blog/projects/stateless.html

That said, the paradigm here is that:

i)  /etc MUST be writable
ii)  /var MUST be writable
iii)  For everything, it doesn't matter... writable or not.  Most 
importantly, though, read-only is OK and no program should assume that 
they can write outside of /etc and /var (and /tmp and /run).

/Jonas

> 
> //Peter
> 

