Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6059460167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 11:11:55 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id dc16so5458531qab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Oct 2014 04:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a3qn2HkARF3oX7/B6S+UNnou3czEhUYkDwyoi3lG4CU=;
	b=KrRGSDzqJwv7qi2IXW/XTSfU3EAzqRMlasGj25Usaujwshn+ahmUJeD5SF+2muRizH
	qxNoL5IRFKvPLq/ub90tYXgTfcWIWZIcWEkB0d4IqfWBdzqAbsn5Ll9Rb3se3ndBCygw
	wZ5HXshPRlNB6xaOroTd/3pzEXMGdz6Q9kNIn48YJYTUaz4ZhR2C/t/V+9POqcxkMadk
	ZRBKxv5yFjKpvXbr8uI6EY0Q5ezA3eTPzfPIeU1WKN3mJoVwnT7ahETLjxdmhrxomgPt
	XiO/8sI1zLOWuHTzcOcL53k4k4buCNOaOUqVinx7grn90N86zrQmLDNkiKaM+ip6rtsX
	bM8g==
X-Gm-Message-State: ALoCoQkKcPIG5L3yYn4girubLdHP0T4KApOSHuzyevZrZhzZgZ69MOW9nFcGIM0CpEj1cPaTdBAq
X-Received: by 10.140.105.195 with SMTP id c61mr43541926qgf.15.1412766716546; 
	Wed, 08 Oct 2014 04:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Wed, 8 Oct 2014 04:11:35 -0700 (PDT)
In-Reply-To: <5434A663.4000109@windriver.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
	<5434A663.4000109@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Oct 2014 12:11:35 +0100
Message-ID: <CAJTo0LYP5uP7Ro0cMg27JeRWh67V6mAHT=vaP11kR+GHX=sunQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Update three packages
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
X-List-Received-Date: Wed, 08 Oct 2014 11:12:02 -0000
Content-Type: text/plain; charset=UTF-8

On 8 October 2014 03:50, Chong Lu <Chong.Lu@windriver.com> wrote:
> ping
>
> On 09/30/2014 05:33 PM, Chong Lu wrote:
>>
>> The following changes since commit
>> 39ca8b429b6244e9649e7303cbb240adf007bf22:
>>
>>    bitbake: toastergui fix size rendering in dirinfo page (2014-09-29
>> 14:11:59 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib chonglu/updatepkg
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/updatepkg
>>
>> Chong Lu (3):
>>    tcl: Upgrade to 8.6.2
>>    strace: Upgrade to 4.9
>>    byacc: Upgrade to 20140715

As you should be aware, we're in feature freeze for 1.7.  As such
these are waiting for the freeze to be released and 1.7 branching off
from master before they are merged.

Ross

