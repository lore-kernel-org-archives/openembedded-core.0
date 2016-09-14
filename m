Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id E62616E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:19:52 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id oz2so1148627pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=wICOzrg6rkx6nBSP60bkGc3uXpvyewe8V7syXy3oo4s=;
	b=jvLFchmqTLzAOHLAcRKY5dLckf8aAB4G7jc0qQ7dWEcCnF4ezej7Y5YZkteGmqu5Bg
	9flCnUopUJAHTD6rDjcJTFMjLkAnZmuO5L78yc53CRqLIJBZ9vXYmz9jNCmetMjnmUHV
	BBeD8GXeXK2jc/B3cAd5xgKISK0bux/Uuj32MczVR+R2Gu8XSYNnnLH/oOdIqo9ppv5l
	6pm3YtjKxa2bcZP16D8BR36dWu0ypm2PoL5YCy1gIQU4RMV+YCb56F2cnPwmFlZiOLZ+
	4KbrqRItbDH3/yTNGp/tYsVDsvJ+FNrcIMM+DQ63FRg4kZrDBFSCtI9YE32cZCREyvA2
	n1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wICOzrg6rkx6nBSP60bkGc3uXpvyewe8V7syXy3oo4s=;
	b=jWrHaEFalZEAXk6IgckULSBNpAMrp4cS6wcTrlm5kumun/Ci72Sys5xoTA5MQNU2ql
	l9QaKqAklSXVsSij2oIUdGbOtBa2T97PGCJgDZCQix6YuSeMbTc8SJ7xfMTVILhLeGuf
	fk3oUki4hx7iLEvyX0m2yQzcgDvszH54zrLRoOiHxZ1bObbL98kwlFRQ/JPILJAHN5z8
	QXpscxM7PvUa5r/GdOOm2Z9keGbC3OyUH66ENexh32WnkN3te28OnaRF9BRc928xS7MA
	ghqzZc65TYaOllpOeXd3YeiSiHDWHuIaVd929F/gU3GJF8sEi9ipfCOft7QTrwlp61Jr
	/arw==
X-Gm-Message-State: AE9vXwP7OlVxz2GHwOS/rXFRGO382Qn3TKUO35KG0fc95zHimJSr/z0Im4t1XjEG6//wzw==
X-Received: by 10.66.135.52 with SMTP id pp20mr7800647pab.121.1473884393120;
	Wed, 14 Sep 2016 13:19:53 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:350c:a305:4ade:8f1c])
	by smtp.googlemail.com with ESMTPSA id
	i8sm7393518paw.25.2016.09.14.13.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 13:19:52 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
	<37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
	<1473846188.7207.57.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9cb43927-fab3-a1a6-7607-b5bf71176bb1@gmail.com>
Date: Wed, 14 Sep 2016 13:19:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473846188.7207.57.camel@linuxfoundation.org>
Subject: Re: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 20:19:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 9/14/16 2:43 AM, Richard Purdie wrote:
> On Wed, 2016-09-14 at 12:06 +0300, Alexander Kanavin wrote:
>> On 09/14/2016 11:49 AM, Sona Sarmadi wrote:
>>> https://matt.ucc.asn.au/dropbear/CHANGES
>>> .....
>>> 2016.72 - 9 March 2016    <<<<<<< dropbear version this CVE has
>>> been fixed
>>> - Validate X11 forwarding input. Could allow bypass of
>>> authorized_keys command= restrictions,
>>>   found by github.com/tintinweb. Thanks for Damien Miller for a
>>> patch. CVE-2016-3116
>>>
>>> 2015.71 - 3 December 2015  <<<< dropbear version in krogoth
>> It's *probably* this one. The commit messages in dropbear repository
>> are 
>> *amazingly* vague and unprofessional.
>>
>> https://secure.ucc.asn.au/hg/dropbear/rev/a3e8389e01ff
>>
>> That said, I vote for updating to the version that comes with the
>> fix. 
>> Backporting fixes should not be the default in the stable yocto 
>> releases; we should trust the upstream more.
> Taking that argument to the extreme, we should update all versions in
> the "stable" release to the latest to ensure we get all the fixes. At
> that point, it becomes no different to master and its not the
> definition of "stable" which most people want to use.
>
> So whilst I do take the point and in some cases it does make sense, it
> doesn't really make sense to have that as the default policy.

I agree. Updating packages in a stable release should not be the default
but the exception. It should be a case-by-case determination.
> In this case, its a question of what else changed in dropbear between
> these versions. Were there a ton of new features or was it just
> bugfixes? How much risk of other problems is there?
If I am not mistaken, this is similar wording as in the "Stable branch
Maintaining" on wiki.

- Armin
>
> Cheers,
>
> Richard



