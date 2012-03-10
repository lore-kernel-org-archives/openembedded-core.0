Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S6EVJ-0001wo-On
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 06:06:05 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Mar 2012 20:57:22 -0800
Received: by iage36 with SMTP id e36so3215351iag.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 20:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=h9oB2gh59JKsnVmfBnFx6kgY5zJHfEeqXl5nZt7IR60=;
	b=g96zuwVDewYE24KxGvbUwUGAeSZYfuAXUBuWBnKVTQK78UvYWB/yeq0JQOdlexcnmI
	7a9vOkU+BgwSNFUgw67O3YMZnmcTPP0BDVBjFypGShhuexISe5mSGFrvPM7PitPZXMDG
	H+hY6OA23sLIW/O7gM3OwZt593KpFvn0cdE5BnI9OV5eLVM2A3gFAwzytQF+lUfMwdIb
	XELlDfVKBxvV0EJfeC4agtULfL+4irzby4pCetgX4DGTwL+SsRuy01r20jUcqfoUuTB/
	6nT4F9zEpZ4xCSJ4hgK3o4sMl5twgIqk1JqnktFWHntYVCzMQb7biP6MCIHWo8vij6ih
	Gx7g==
Received: by 10.182.119.101 with SMTP id kt5mr1758621obb.70.1331355422106;
	Fri, 09 Mar 2012 20:57:02 -0800 (PST)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id g6sm4128101oeb.10.2012.03.09.20.57.00
	(version=SSLv3 cipher=OTHER); Fri, 09 Mar 2012 20:57:00 -0800 (PST)
Message-ID: <4F5ADF1D.4050202@intel.com>
Date: Fri, 09 Mar 2012 20:57:01 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
	<4F566375.30705@intel.com>
	<CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
	<4F58FF0A.6000400@intel.com>
In-Reply-To: <4F58FF0A.6000400@intel.com>
X-Gm-Message-State: ALoCoQkc4BMqq9H6dGOrjNx6DeDmlyH9kHEL7pFE+WD9M+3g6t+D0vziYdOKaKAooV5mYbw6peQE
Subject: Re: broken ncurses support for python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2012 05:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2012 10:48 AM, Scott Garman wrote:
> On 03/06/2012 02:33 PM, Sergey Lapin wrote:
>>>>> breaks python ncurses support.
>>>>>
>>>>> Any ideas on proper fixing? For myself I revert this locally and
>>>>> everything works perfectly.
>>>>> (I think .so files and .a archives should be in usr/lib while .so
>>>>> can go to /lib which is not the case with current ncurses.)
>>>>> so mv in do_install should be sufficient, not --libdir=${base_libdir}.
>>>
>>>
>>> Could you be more specific about how python ncurses support is broken? I
>>> assume you're getting errors of unresolved symbols. If that's the
>>> case, you
>>> may need to rebuild the application so it links to ncurses from
>>> base_libdir.
>> No, python fails to find the library.
>> And it is bad practice to put develeopment files in /lib anyway.
>> I think, putting .so.x.x intu lib was sufficient instead of setting
>> whole libdir to /lib.
>> Or development files might be moved to /usr/lib back (and .so symlink
>> re-created
>> to address this).
>
> Thanks, I understand what you're saying now. I hope to look into this
> tomorrow and develop a fix; I've been away at a conference all week so far.

Thanks again Sergey for troubleshooting this and suggesting a solution. 
I filed bug #2070 to track this and have created the following fix for it:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=sgarman/python-ncurses-fix&id=23c73da5f13b6c586353edb8143fa21058bf3a55

I'm going to queue up some build tests to run over the weekend and plan 
to submit this first thing on Monday should that go well.

Regards,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


