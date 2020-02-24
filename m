Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 99D8160111
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 07:25:03 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id x14so8829592ljd.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 23:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=Kz82AGeJ7H/46K/fGcppK+p5ScJSDEEE82NCTjrfDEI=;
	b=NczkkFUMOGjMxX0RDWQ9pcpoJL9xmD7kfCFm9cazYQmY6Pr6vE6yvTQMzOo0smiteX
	Jmvs6/lmec0kPjWE1keiz5nQiJH+5p6ebr8KiMylel+Mf/aF5IQ7rM1ahFr1V+xxnsba
	mUS03q6ea+30Mdz27ewsNQck1yn57dez8w06gAtzhPmLCNEfZyj8Mh7BsmzQGNKXUMxa
	lJ5Rumpbfht68kjH8M8fXlfwVpb8QCw3puW6NC8hQxXUnz9EAOOLgAcPyq58RunGxniw
	qt2Q8XMklbTlQ5KfzNDfDPyaWuHLYGxWEAuEbwyhCK8seZvmZD4k2fZLUl/WMiLG8p01
	Buqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=Kz82AGeJ7H/46K/fGcppK+p5ScJSDEEE82NCTjrfDEI=;
	b=s57F12h/cJjpNoNZQ/Eb7TOuJhjmpm6AyagPX9AfwOEdughIEx6VyY3ZI281mJcjB5
	THCll+kQF4Y4+yhmM6CInLNImpuywndRiw45csbiQ0sDvxqRabQyf+f2sL+TaPPcwJkb
	vo0w+6/iBh6QN5zcxj2SU0QuoVTPB661UOGaUWC95PEX1zjrHlvNWo8LN4cRdwpFCW2l
	BOZjUeVFOgd4onjyzTKFNTEUi8GbrXXN6+M251mo8kdGSWAm/SenHFunoN42iJl7qlU6
	sGVmaV4t5oPalCkJNTj9R3A0dqAIq7sme+ewefqWEmn/qKEr9d4fjiyxKfXhsaXi0Li8
	URGQ==
X-Gm-Message-State: APjAAAWh8jV6I1kzgfHFPtsm3OPZuxcVAoVITdorw79M2M7A4kk92PEh
	77zXx5RoDYzOPa8PIQOo7frMZCRo
X-Google-Smtp-Source: APXvYqyaZ7CUfP0ZCH1KBRrE0mwofezMl4gbT7c3EBmpkoAyhPoOgC7sSyCTjds5H8GhW1546FxMyA==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr7962764ljg.213.1582529103736; 
	Sun, 23 Feb 2020 23:25:03 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	a25sm2956397lfi.53.2020.02.23.23.25.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 23:25:02 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: douglas.royds@taitradio.com
Message-ID: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
Date: Mon, 24 Feb 2020 08:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Overriding SDE_FILE
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
X-List-Received-Date: Mon, 24 Feb 2020 07:25:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Douglas,

You updated a comment in reproducible_build.bbclass, commit 
e7b891b76954c784f5a93bd0a1c91315673ce40d:

> -# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's ${SDE_FILE}.
> +# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
> +# If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
> +# with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
> +#

But I can't really get this to work. What did work for me was to replace 
"do_create_source_date_epoch_stamp()" in my recipe:

do_create_source_date_epoch_stamp() {
     mkdir -p ${SDE_DIR}
     date -d "1981-03-03" "+%s" > ${SDE_FILE}
}

What is the intended way to achieve the thing I'm trying to do here ?

Cheers,
Jacob

