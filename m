Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S5iWn-0004bw-0s
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 19:57:29 +0100
Received: from mail-tul01m020-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Mar 2012 10:48:47 -0800
Received: by obbwd18 with SMTP id wd18so954235obb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2012 10:48:47 -0800 (PST)
Received: by 10.182.12.6 with SMTP id u6mr2919472obb.12.1331232526945;
	Thu, 08 Mar 2012 10:48:46 -0800 (PST)
Received: from [172.10.11.19] (ppp187-60.broadband.gorge.net. [209.216.187.60])
	by mx.google.com with ESMTPS id x6sm1328575oex.12.2012.03.08.10.48.44
	(version=SSLv3 cipher=OTHER); Thu, 08 Mar 2012 10:48:45 -0800 (PST)
Message-ID: <4F58FF0A.6000400@intel.com>
Date: Thu, 08 Mar 2012 10:48:42 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
	<4F566375.30705@intel.com>
	<CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
In-Reply-To: <CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
X-Gm-Message-State: ALoCoQlnKNDF1/sQ3WhJNgihH9fzJ7N2CraEH5cyqPjDoW2I+z4v+ZZrOGvxjgEvRm6v2f+QH1gQ
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
X-List-Received-Date: Thu, 08 Mar 2012 18:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 02:33 PM, Sergey Lapin wrote:
>>>> breaks python ncurses support.
>>>>
>>>> Any ideas on proper fixing? For myself I revert this locally and
>>>> everything works perfectly.
>>>> (I think .so files and .a archives should be in usr/lib while .so
>>>> can go to /lib which is not the case with current ncurses.)
>>>> so mv in do_install should be sufficient, not --libdir=${base_libdir}.
>>
>>
>> Could you be more specific about how python ncurses support is broken? I
>> assume you're getting errors of unresolved symbols. If that's the case, you
>> may need to rebuild the application so it links to ncurses from base_libdir.
> No, python fails to find the library.
> And it is bad practice to put develeopment files in /lib anyway.
> I think, putting .so.x.x intu lib was sufficient instead of setting
> whole libdir to /lib.
> Or development files might be moved to /usr/lib back (and .so symlink re-created
> to address this).

Thanks, I understand what you're saying now. I hope to look into this 
tomorrow and develop a fix; I've been away at a conference all week so far.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


