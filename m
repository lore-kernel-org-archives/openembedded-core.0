Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S6UxG-0001RE-81
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 23:40:02 +0100
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Mar 2012 14:31:19 -0800
Received: by dadp12 with SMTP id p12so13300372dad.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 14:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FG9P8HpvgPgugBhxGwNBUJXU4F5pwLKMzT3KAKAj19E=;
	b=is1nr6wClb4lfxL4v0FbHVT3tmA3h9U7p4N7t0B+3WTmdFyZ7/NhBD0O9lPvUEMsWw
	pOHBIb0KZ3+rv+niXxgKMNw2Ri2wBpg4ByVlYdBlycfVpMNeOvKdI7u47SYecJI4BqNb
	bciQpO75eqk+SLM/h2OEs4+XDjid3fV3ZtzohGMK+6yykZX+qW1TMAEPRzr8DUSa2HNi
	Zk5UDuNFBTIMvu8Y3aKUFBZrv9oO36m+/rnDqcEzduhsOHALBLk5VVm9zQduduByjAoh
	lbOgMbu3nPpr7TE9ptXyB8JCUL42emg10xYqtyCXqs53bZDTi4B4dCGdm+HrGMIrFkZo
	GS5A==
Received: by 10.68.230.230 with SMTP id tb6mr11872384pbc.40.1331418678917;
	Sat, 10 Mar 2012 14:31:18 -0800 (PST)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id h10sm6968889pbe.12.2012.03.10.14.31.16
	(version=SSLv3 cipher=OTHER); Sat, 10 Mar 2012 14:31:17 -0800 (PST)
Message-ID: <4F5BD636.2050609@intel.com>
Date: Sat, 10 Mar 2012 14:31:18 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
	<4F566375.30705@intel.com>
	<CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
	<4F58FF0A.6000400@intel.com> <4F5ADF1D.4050202@intel.com>
	<4F5B35CF.4090001@opendreambox.org>
In-Reply-To: <4F5B35CF.4090001@opendreambox.org>
X-Gm-Message-State: ALoCoQm16NX/6Vmy6r/VCwSCdAow3sjkYrmwOh8QIJYUtjVe6U7HMgFLUnD5u4ajMirosGljUaGu
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
X-List-Received-Date: Sat, 10 Mar 2012 22:40:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2012 03:06 AM, Andreas Oberritter wrote:
> Hello Scott,
>
> On 10.03.2012 05:57, Scott Garman wrote:
>> I filed bug #2070 to track this and have created the following fix for it:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=sgarman/python-ncurses-fix&id=23c73da5f13b6c586353edb8143fa21058bf3a55
>
> this will break if libdir equals base_libdir. A conditional is required
> around mkdir and mv.

Hi Andreas,

Good catch - my build testing uncovered this and I've made that and some 
other changes as well.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


