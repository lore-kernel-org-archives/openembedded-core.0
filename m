Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B69576FFCC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 15:26:56 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id ig19so33440586igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZxOEt0QYdkhU3BPj5mazKYXNnTbYTiLmzUdYEbt8TWM=;
	b=pMdRG1fVYtoAW273Qm1eAqPR1L5GSBSqEu1OxKeTijq8AiRVmSdNJSNzt9JYNbANPl
	FdX29G77tY5uAIzfpB/ybgwlahoM3NQPaxHmEBvO2+WlfRQocltTyOHoiUDcWfjCWhaC
	xyup383nwXX3osrj3FgC6qxu7JLuY5lUr9zFjA6rr4JkFouhngITq2nMzG9S674G1P4U
	sJ3Ng2rQO4D+Wvl28f9IMrCnhYNsF/4XX1/JoZ3spzlKzUawPIKKBULCTJBww6IfHr44
	18B4k3bKOYJDV46WOyMEZUjnDknmqXPtyJIZ6Cs/Qn/PoG2ssLX1dCasTa/k8kcXPcgn
	tuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZxOEt0QYdkhU3BPj5mazKYXNnTbYTiLmzUdYEbt8TWM=;
	b=Y8J857b2NhpNMmn3RGxP8hZiUYduNP6TWlX9nj3rWql7wOmyG4GrzpLkp8UpFF1leN
	bsr02i+FPWuZZ9lZ2+w2I0GC0h0/1L0iqT4htScbQFelIL5gIXyJtFvRM65Cf/GNIWzb
	OTWNmu9tgP+Di3ke60K8IbBHoca8cBB04bROrOD8pDvcbz+2YynLDhFegPf6RS8mveej
	iWYm2C/pkO79Wi9o8CFrxe4wKKCQdKBDvk3Sw7ye8FnJuEV2GJPHuC+inuFRKgrh4+RH
	wXq1Quj9W1Z1V5xmg05eqdKYVESuNjiAsP/nekWw7N+LpuFRwCL8Q8IZ4nSX6Gqv14JY
	4YaQ==
X-Gm-Message-State: AD7BkJIP/hC0UKwLE66ay7zMzUTtjB4ekJ3qrDeHpsQxT8HSDd92gxjqwxc0YLWdYrOpJg==
X-Received: by 10.50.150.105 with SMTP id uh9mr9821209igb.8.1457796417278;
	Sat, 12 Mar 2016 07:26:57 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	vf11sm2896333igb.20.2016.03.12.07.26.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2016 07:26:56 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
	<56E39AD3.4000503@gmail.com> <56E3AA3D.4000105@gmail.com>
	<CAMKF1spxHV_pMSVUqxDh4Z9iELQx1=pEmdTqs0GfCJWmmBfUFA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E4353E.90002@gmail.com>
Date: Sat, 12 Mar 2016 10:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spxHV_pMSVUqxDh4Z9iELQx1=pEmdTqs0GfCJWmmBfUFA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 15:26:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/16 06:55, Khem Raj wrote:
> On Sat, Mar 12, 2016 at 1:33 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> To me, the purpose of buildhistory's metadata-revs is to enable someone else
>> (or myself in the future) to recreate a specific build, that's why I always
>> save this file with any build artifacts. Simply saying "meta" isn't good
>> enough because it doesn't specify which repository's "meta". So the purpose
>> of this patch is to try to clarify which repositories we're talking about.
>>
>>> Before:
>>>      meta              = master:00d3fd571a8d261d065b43f5cf3076a381843984
>>>      meta-oe           = master:a1e135a499998add7575682bf53db5e02e753580
>>>      meta-gnome        = master:a1e135a499998add7575682bf53db5e02e753580
>>>      meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>>>      meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>>>      meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>>>      meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>>>      meta-linaro-toolchain =
>>> master:367f784b831938dc508b7d472342d2d0d6ed9769
>>>      meta              = master:37b61b059031e3c272a929b834e12fd83f46598c
>>>      meta-poky         = master:37b61b059031e3c272a929b834e12fd83f46598c
>>>
>>> After:
>>>      openembedded-core/meta =
>>> master:00d3fd571a8d261d065b43f5cf3076a381843984
>>>      meta-openembedded/meta-oe =
>>> master:a1e135a499998add7575682bf53db5e02e753580
>>>      meta-openembedded/meta-gnome =
>>> master:a1e135a499998add7575682bf53db5e02e753580
>>>      meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>>>      meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>>>      meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>>>      meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>>>      meta-linaro/meta-linaro-toolchain =
>>> master:367f784b831938dc508b7d472342d2d0d6ed9769
>>>      meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>>>      meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c
>>
>> I have a second patch, now, that will generate the following output, which I
>> think is even better:
>>
>>      git://git.openembedded.org/openembedded-core.git
>>      openembedded-core/meta = master:00d3fd571a8d261d065b43f5cf3076a381843984
>>
>>      git://git.openembedded.org/meta-openembedded
>>      meta-openembedded/meta-oe =
>> master:a1e135a499998add7575682bf53db5e02e753580
>>
>>      git://git.openembedded.org/meta-openembedded
>>      meta-openembedded/meta-gnome =
>> master:a1e135a499998add7575682bf53db5e02e753580
>>
>>      git://github.com/96boards/meta-rpb.git
>>      meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>>
>>      https://github.com/96boards/meta-96boards.git
>>      meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>>
>>      https://github.com/ndechesne/meta-qcom.git
>>      meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>>
>>      git://github.com/OSSystems/meta-browser.git
>>      meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>>
>>      git://git.linaro.org/openembedded/meta-linaro.git
>>      meta-linaro/meta-linaro-toolchain =
>> master:367f784b831938dc508b7d472342d2d0d6ed9769
>>
>>      git://git.yoctoproject.org/poky
>>      meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>>
>>      git://git.yoctoproject.org/poky
>>      meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c
>>
>> Frankly, there are too many forks and clones. There are too many
>> meta-beaglebone or meta-odroid or meta-raspberrypi repositories. If six
>> months from now I want to recreate a build I've done today, I'll need to
>> know the repository, where it's from, and which commit was checked out. My
>> latest patch provides that information.
>>
>> Is this better?
> what happens if one has a local checkout forked from upstream branch ?
> it reports that one, so buildhistory is expecting you to control the repos
> e.g. when using tools like repo, it gets utterly confused since its meant
> to track local checkout SHAs not remote ones, may be your change
> can establish a better origin tracking. it would be interesting to see
> how it works with repo and when I have more than 1 remotes in a single
> repo

Here's how it handled a build that I have where the repositories are 
handled by the repo tool:

https://github.com/openembedded/openembedded-core
meta              = 
contrib/twoerner/buildhistory-patches:953046fa31617a0c53f66faacf3fa9ef88375dee

https://github.com/openembedded/meta-openembedded
../meta-openembedded/meta-oe = HEAD:dc5634968b270dde250690609f0015f881db81f2

https://github.com/openembedded/meta-openembedded
../meta-openembedded/meta-gnome = 
HEAD:dc5634968b270dde250690609f0015f881db81f2

https://github.com/96boards/meta-rpb
../meta-rpb       = HEAD:203903ca6f4e8df09bef6ea3c6e899d07eca8df9

https://github.com/96boards/meta-96boards
../meta-96boards  = HEAD:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649

http://git.linaro.org/openembedded/meta-linaro
../meta-linaro/meta-linaro-toolchain = 
HEAD:395ca11e22c26bd0c26ea1078722628ba6aa2332

https://github.com/ndechesne/meta-qcom
../meta-qcom      = HEAD:32fcda819acb8ec485d9ab05108d554f807bf75d

https://github.com/linaro-home/meta-browser
../meta-browser   = HEAD:5c00d0114c5963a178cb33f6d06181c588c03ae0


My patch simply uses "git remote -v" and takes the first line. I'll look 
into reporting multiple remotes.

Local forks of upstream repositories would simply be reported as local 
repositories. I'm not even sure what I would do on the cmdline to figure 
out that sort of repository's origin, other than to manually work 
backwards until I found something that looked sensible.

In any case, the above is an improvement?

