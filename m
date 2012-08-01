Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwiKC-0007VO-KZ
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 01:27:32 +0200
Received: by ghbz2 with SMTP id z2so7162187ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 16:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=tyiIQ0ie/qsD5CM1GsvV9VkDFsgYqb+8PiCWUoC5oKE=;
	b=YLsi0z9LsP710KkeiXEWoWSRnOYpATSxU/jVZoHbz5YZw1n4NEo6XPfS6DOjhmeO0C
	Ad6J8J7YQ8NIL5cEDBGI96TWO/md23a2AMJJwHS/XipDwEilEezNpMZLqU/47ZaKkOTb
	57OoTR+a0R7AErcd4Bfzv8Oizmin9UEH9pzeX9+XZDfG61jVcOkOVAjzt/FjQt/HLEF6
	2k/hvBD/BUSXX7sNTcXSCMvGTZbhLKb02hJxLvU5QneKHBUH5SPQjSMRXM1Jk/QUxnpb
	Fr9x7CzHDmptne9URHLk+vm4XP4TojeGIrJz35pLQftZkpN9FBX29eaw95TFNsBCcjA7
	uzOg==
Received: by 10.50.160.202 with SMTP id xm10mr5699576igb.10.1343862953227;
	Wed, 01 Aug 2012 16:15:53 -0700 (PDT)
Received: from [10.11.81.126] (corp.force10networks.com. [64.186.164.204])
	by mx.google.com with ESMTPS id rd8sm8316156igb.3.2012.08.01.16.15.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 16:15:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <50131892.6020708@linux.intel.com>
Date: Wed, 1 Aug 2012 16:15:49 -0700
Message-Id: <648B08DC-9D46-4EEF-AAAA-C1DA84D9AB42@gmail.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
	<15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
	<50131892.6020708@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
Subject: Re: [PATCH 1/1] kernel.bbclass: remove default module_autoload and module_conf values
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
X-List-Received-Date: Wed, 01 Aug 2012 23:27:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jul 27, 2012, at 3:39 PM, Darren Hart <dvhart@linux.intel.com> wrote:

>> kernel.bbclass is a common class for many different kernel versions,
>> and as such the default module_autoload and module_conf values that
>> it contains are not relevant, or out of date for most builds.
>> 
>> Individual kernel recipes or distros can better specify these
>> values to meet their needs.
>> 
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> This makes sense to me. None of the below are likely to prevent boot and
> seem to be more along the lines of MACHINE policy.
> 

This needs some soak time. For folks who are unknowingly depending on this.


