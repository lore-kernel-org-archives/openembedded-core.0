Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id D77E160111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 13:50:56 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id x64so6015910qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=dhe6RH4D+GLn41OKNhww1VAYbAH08lDqbGsfpdPmTdI=;
	b=peUCa3MGUB5z2tr69cpG5hzpldBXASOxHrfBq//Gn7UnHjoAzp2SYns6F0eNJyViBt
	pmOP5Wg2L2+uNe6htuPnP1GzhAL7MCNz/37FzinKRKAXhfcAJVmpG/+r9Pj3NXu3dFVR
	kbj9CmjKzdGwd6lp4wm44iNAVwTiCRrdlNa6/aIfNrD70v9L6qX7OPtKoBiGVJLaRhef
	Gn+pO3LYCe/OqiaKIvWuemUZeb3VoLmwvTN+eJcuw7LkN/ibiGmL0KTYHqjY556WScTv
	SYgcKjV5lTMIAuTK3jqLG2U/jvHr6MkTOjjK8clfCTL/PaAigJX81XQ2tcpLOmTwqA8B
	6LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dhe6RH4D+GLn41OKNhww1VAYbAH08lDqbGsfpdPmTdI=;
	b=iSLMWL/nWDJlkqd3/DPqLcHe0QAR9VVXekmEtyqAhBad+oWVKhEJ4l8WNSP78IRaer
	pfB/c8jfcLQfQ1OjAeTEpSZhAGf8YDQ6qunCEwhHCnX5wEqSIxVgEEbwp5ncFSiRODLc
	787czHkOn7K3Pg5lvlkYtNkYx0QWRVwaobTElNL378h1b9ZXkQZEFHCi790goMzj8Hy3
	ttu79EzJU2F7FkHkZu9ZUTpeBEq6sW29wuLYd0WPmxcIH4MR1rzae+632XivbrMcAa7p
	o3iCUrBFFGQ1e9GVs98sNMYrCAYmT8M5mb85NS4Oiu1efhUJB0OEjuRWOI6e3Y40OMYb
	0msg==
X-Gm-Message-State: AD7BkJIKjol0UIwN+63dyKfkvgNfjgVdKAvUxP611rtMOutTwrSzY/TtyHSeNJkHMgRxUQ==
X-Received: by 10.55.82.195 with SMTP id g186mr2773805qkb.47.1459259457149;
	Tue, 29 Mar 2016 06:50:57 -0700 (PDT)
Received: from [192.168.1.139] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	q198sm13824752qhb.16.2016.03.29.06.50.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2016 06:50:55 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <56F59D2B.2010108@gmail.com>
	<1458978069.3073.62.camel@linuxfoundation.org>
	<56F98CDF.7080205@gmail.com>
	<1459204121.21672.12.camel@linuxfoundation.org>
	<56FA743B.5030200@gmail.com>
	<1459254522.21672.24.camel@linuxfoundation.org>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <56FA883E.6010308@gmail.com>
Date: Tue, 29 Mar 2016 09:50:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459254522.21672.24.camel@linuxfoundation.org>
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Tue, 29 Mar 2016 13:51:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 03/29/2016 08:28 AM, Richard Purdie wrote:
> On Tue, 2016-03-29 at 08:25 -0400, Cliff Brake wrote:
>> On 03/28/2016 06:28 PM, Richard Purdie wrote:
>>>> I tried nobranch=1;rev=HEAD, but then that conflicts with
>>>> ${AUTOREV}.
>>> Did you just try nobranch=1 and leave rev to get set from SRCREV?
>> That will parse, but it puts the wrong git rev in the PV:
>>
>> The following package gets built:
>>
>> blkqcl-app-tune_1.4+gitr1+a97fcb58e6-r1.0_cortexa9hf-vfp-neon.ipk
>>
>> But, the actual version of the source that gets built is
>> 0edb656fc9a1a77d75eaa49a17586deb4c986bb1.
>>
>> a97... is the version of the branch (default is master) in the
>> workspace.
>>
>> So this would work if we did not care what gitv got put in the PV. 
>>  There is
>> also the issue of bitbake not rebuilding the source if you change the
>> git
>> version of the workspace, but the branch happens to not change.
> At least from my perspective, this is what *should* work and the fact
> it doesn't is a bug somewhere. Adding extra things to the fetcher would
> likely just workaround it. Filing a bug report for it would be the
> likely next step.

Thanks, bug submitted: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9351

Cliff

