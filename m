Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 664A7601AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:20:49 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id lx4so4238943iec.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 15:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=m8h746pIsEUGQGvjpfd4sskfU9pdaO9IWPqfXGwSdNk=;
	b=XwjVoduHC1Tb6R/ehDDHyNX0ZWkKisDDvNKb8KznoT2FwOOtBwSzUgmp2Y+tojl39s
	p6Gzhhz7DZHay5jvrSay5h3edeaQXKbuExK8ScIJ7yAK4JRl4YvIWEApyftmPIhgfwEE
	kyPvvuwvTAoqVRHgKhpttSlC92njiEUWE7PKlFuBrbRnfapn/geXhHacQW/emth9ogpH
	YSiIzWRM63JHgcBtgrcKO63QNuqIapJh4rTReihe4mRR3f6EDJS6CvMyF3tHe+bi3F2a
	2ulwKBCUA6lVJ8iB5Bbm/hwop1xtlfMS6YxIslSKBcwbPt1e0/VI3sbw76jAtDRsF8xK
	+XPw==
X-Gm-Message-State: ALoCoQmx3v6rOvl7+zjvEy7WTao/yDBv9gGKFKK9YRBwLc0Wk2oMrnWH+M10Qi38U7VuTMsGAShg
X-Received: by 10.50.4.9 with SMTP id g9mr6384675igg.22.1389309650129;
	Thu, 09 Jan 2014 15:20:50 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id w4sm16815343igb.5.2014.01.09.15.20.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 15:20:49 -0800 (PST)
Message-ID: <52CF2ED0.8090605@linaro.org>
Date: Thu, 09 Jan 2014 18:20:48 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52CEEE43.1090209@linaro.org>	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
	<52CF2625.5030407@windriver.com>
In-Reply-To: <52CF2625.5030407@windriver.com>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Thu, 09 Jan 2014 23:20:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/09/14 17:43, Mark Hatle wrote:
> On 1/9/14, 3:45 PM, Bruce Ashfield wrote:
>> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
>> <trevor.woerner@linaro.org> wrote:
>>> Hi everyone,
>>>
>>> At the last TSC meeting the topic of unmaintained layers came up. Here
>>> is the sorted list of master layers from the layer index [1], would it
>>> be possible for those in the know to indicate which layers are, or are
>>> suspected of being, unmaintained?
>>
>> Wouldn't it be easier to do an initial sort based on commit activity
>> ? Versus an
>> opt-in query ?
>
> I agree..  see below for mine..

To be honest, I had asked people to indicate which layers they thought
were *un*maintained (since I assumed that list would be small), but this
way works too.

Interestingly enough, had I sorted the list on commit activity,
according to http://git.yoctoproject.org/cgit/cgit.cgi/?s=idle
meta-realtime hasn't been touched in 10 months which would make me
suspect it was abandoned.

