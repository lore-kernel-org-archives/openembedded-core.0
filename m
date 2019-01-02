Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94E476B463
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 14:32:14 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b20so21059347lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 06:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pfJOGx2oWJYnC6x6BMKdIK2SxuXrtzMPv9I6uR9vg1U=;
	b=Izg866HG3VRDWeWzwA6u+hADcxjbgyt6HtqsAh0eRoOX7MnWsL3lqD97HZs+RxYeud
	CeOCAY62LayAyETvBuHrL1LayqpPSDZUAQdowjH+7vW/VM2y+Q6u4EgNIQsgAoyJObLa
	jALMQfcowBZuOi2MWsb7APN55iIvB1BShifcdZUSHym6gXcqRR5BEVufm6K++Sru1xdP
	LgHA2nVbKWA3iW7O8UxpfLG6rejP27MjkVAnj1XiTQzHic5H7bNtVRW2D+l9jhoN5VW9
	BsuhvOqFexnRXJ0PTlwQIEl0xvKS7wXWKWX00yF/mtlKDLwkYg2bDHG4v9DqZovcQNVO
	fTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pfJOGx2oWJYnC6x6BMKdIK2SxuXrtzMPv9I6uR9vg1U=;
	b=OJOyDt24DOG58iHY7Rt6vBDcrcw2jGPZEtoUXlYjVRMQB/3ubRGqqwqHJJ+ij2c/vl
	07anqGUHAC4aBOiFkGGZ+ESrCrkcsPJYK1roDspt9OCTecHA3z4kmFBg3zyK4ymrc803
	J0dg+DuE7ISLEpX61QetQnishD1jJNeNb66oen3k4vIvjFdQBfyPaw0BUQBwO40SI/G6
	jBQ0prRlIFgWba026pLnottrjjAEgy0JnDHoVH4ySPB6Sd/40jjuTvfAVqg96vZq79Zd
	37mwA56pBbPtPC6M05b6ULIcpoScuqf9BE3uUNioEtMwdi1cH/OC6VcjkEcb6XlU/gT0
	QgtQ==
X-Gm-Message-State: AA+aEWbqyuMBUe2k3LXac76AX+GGuYk7qW+VJLd0m77I5f4vniGrEWtC
	d5R1K4IG0DsP3A3o0DdfvoApHeWyy18=
X-Google-Smtp-Source: AFSGD/X+vbLkHKQcy2X+CethXJbj4A+iLBoZB/niG8iAaj51/NQz17a3LrjMmI8aThPXs2aLhvS/zA==
X-Received: by 2002:a19:280f:: with SMTP id o15mr20955545lfo.0.1546439534391; 
	Wed, 02 Jan 2019 06:32:14 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o26sm10781794lfl.18.2019.01.02.06.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 06:32:13 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<20181231120559.25470-8-jonas@norrbonn.se>
	<CANNYZj8+prvjmkR2-tkh9CK8zuZ+BQWftgSpkGUgw8rRChkUZw@mail.gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <eb8aff51-7ebc-11a2-6def-8dba37720342@norrbonn.se>
Date: Wed, 2 Jan 2019 15:32:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8+prvjmkR2-tkh9CK8zuZ+BQWftgSpkGUgw8rRChkUZw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] systemd: do not pre-enable services, rely on presets
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
X-List-Received-Date: Wed, 02 Jan 2019 14:32:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 02/01/2019 13:06, Alexander Kanavin wrote:
> On Mon, 31 Dec 2018 at 13:07, Jonas Bonn <jonas@norrbonn.se> wrote:
>> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
>> index 70e687c92e..7b4c5c56aa 100644
>> --- a/meta/recipes-core/systemd/systemd_239.bb
>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>> @@ -298,6 +298,8 @@ do_install() {
>>          # duplicate udevadm for postinst script
>>          install -d ${D}${libexecdir}
>>          ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
>> +
>> +       rm -rf ${D}${sysconfdir}/systemd/system
>>   }
> 
> Apologies, but this is a hack. You need to tell systemd to not install
> the files in the first place, if they are unneeded, instead of
> removing them after the fact, which is a maintainability issue
> (specifically, anyone looking at the recipe would be totally puzzled
> by this removal).
> 
> If systemd always installs the files, you should add a configure
> option, and send the patch upstream *first*.

Leaving these installed is not a big deal, either.  It's just inelegant 
to leave them there if one is over-mounting /etc with a tmpfs at runtime.

I think this patch is wrong for other reasons, however.  Since there are 
no SYSTEMD_SERVICE_ entries for these .service files in the recipe, they 
probably won't be handled correctly if the systemd package is 
upgraded... the implications are a bit fuzzy, whether or not it matters.

Thanks for looking at this.

/Jonas


> 
> Alex
> 

