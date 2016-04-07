Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8290B75C51
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 10:05:21 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l6so18254502wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=CAJ6lwBu6Imt7zcbjwLo9jJ0ow36TXQ/j1UxKBLZn0M=;
	b=LeAUGZMy+WC/+FSruKzetFqoE0YQusR9hCpAwZsAft3/uKpx4T92JJUWClwl8cMrTo
	JmWOLlxw4j1Ku2l30v/lfzfqOFSGq2dA5fOW46c55ARV3y2ZMpM/NNuq5xZhIVcJYyHe
	InBUlk2TteHvbNIjgERnbs0/lYyDW/ZcxQH7BFjJN8aTfSGMV6fugIwBx13dT+ImiWSU
	lSHe96p2U8xRnCjtKKF+DHwAMmrotl8DlCwkjCdk1iB+oQlTOyOA6bBWHubTh0br8eus
	LHjSArCvEU/S6NjRWayiJq6a4WykqaQmQN7qoyYpVI07q0b45C6EEP1sQuiD64R140vh
	uUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=CAJ6lwBu6Imt7zcbjwLo9jJ0ow36TXQ/j1UxKBLZn0M=;
	b=YN2JUPGgP5I3xurnh+/ouYAgOaJLsJZlUq2qL+s6E5mP7kyZvgcOaEQMdWR73X3yg2
	wZljx5v4ht9TCFajAEsYhT/gjlbFPDg/F8ECkviQrlkLcMA+CODBb6PPU5DKrIOGLIZk
	2NE8OVakT3lcZdZSy3zAhjrbFb353kqe0KwFQQtQklUzLJM1ZyyWRSgAl01bwkEshgt9
	pHHuLsPdb0syyAqonoMjj6xBC6Cuet1qyOuiFtJM96VUDjDXqgXKPzwAbZ/uwd8z4czA
	ZNn9D0PjpgWK0KLxYdgIsdRmN/mqvDvqdrr9rf8W5Sk04ZwpRmwwWxkihsh616KcJ24r
	nq8A==
X-Gm-Message-State: AD7BkJJ3r4XGqteiLLDHSK7Zgp1dI83z3bbCR+ch5b6+eMkI795B9QV7m8gTJjU/DC43qAKw
X-Received: by 10.28.170.137 with SMTP id t131mr3124422wme.32.1460023522377;
	Thu, 07 Apr 2016 03:05:22 -0700 (PDT)
Received: from [192.168.2.24] ([83.217.123.106])
	by smtp.googlemail.com with ESMTPSA id
	ll9sm7690853wjc.29.2016.04.07.03.05.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2016 03:05:21 -0700 (PDT)
To: Randy Witt <randy.e.witt@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1459962043-30259-1-git-send-email-michael.g.wood@intel.com>
	<1459962043-30259-2-git-send-email-michael.g.wood@intel.com>
	<570572EC.2000008@linux.intel.com>
From: Michael Wood <michael.g.wood@intel.com>
Message-ID: <570630E0.7080007@intel.com>
Date: Thu, 7 Apr 2016 11:05:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <570572EC.2000008@linux.intel.com>
Subject: Re: [PATCH] toaster: add DL_DIR and SSTATE_DIR to oe toasterconf
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
X-List-Received-Date: Thu, 07 Apr 2016 10:05:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/16 21:34, Randy Witt wrote:
> On 04/06/2016 10:00 AM, Michael Wood wrote:
>> From: Ed Bartosh <ed.bartosh@linux.intel.com>
>
> Shouldn't the message from the cover letter actually be the commit 
> message here, rather than an empty message?

Sure, I can easily amend Ed's commit message to include this if you'd 
like, the reason I sent a cover letter was just to let people know who 
aren't following the development of Toaster what this was about.

>
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> Signed-off-by: Michael Wood <michael.g.wood@intel.com>
>> ---
>>   meta/conf/toasterconf.json | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
>> index 1987793..bbd40e9 100644
>> --- a/meta/conf/toasterconf.json
>> +++ b/meta/conf/toasterconf.json
>> @@ -2,9 +2,11 @@
>>       "config": {
>>           "MACHINE"      : "qemux86",
>>           "DISTRO"       : "poky",
>> +        "DL_DIR"       : "${TOPDIR}/../downloads",
>>           "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
>>           "IMAGE_INSTALL_append": "",
>> -        "PACKAGE_CLASSES": "package_rpm"
>> +        "PACKAGE_CLASSES": "package_rpm",
>> +        "SSTATE_DIR"   : "${TOPDIR}/../sstate-cache"
>>       },
>>       "layersources": [
>>           {
>>
>


