Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7Nbq-0004iK-IC
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 10:01:34 +0100
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Mar 2012 01:52:49 -0700
Received: by yhpp61 with SMTP id p61so325481yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 01:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=om7YyVXZ2pomMvO4B8yJO7GwCRILQvMeijeZ0gUM3Uw=;
	b=OUUIUHBYScwBM+BzSVgFq5VHa4l/We6LQ84ie6DY2i0XKAbP2a8YvC92Jdxj1JpLJf
	Xgc/RTXrdKwHYPCfJ7k+WmoxLUJ6ObhMIg+P3dgdFzdn/cH7piFW0G64czSLDT8j1DmM
	kfYqKLudsE4AVi90TJnF0iqsbLIAzAg62zyqnmgkf7Wa5+KcesTu2/rXxgMzn0nfUey9
	+inFYDKTFTkZiEi+WVVJZKwReFVMIxOYMYDzUKrrtxS0iKl7wd7BDTav+dHIoTwuD9d1
	7RLwiojC7VwKj9/vZFwvgtqZjtwlr1w8wWB0QQLPdZsAzAvfQvAPWhiSQsad8rBY1pbf
	3uuA==
Received: by 10.182.15.70 with SMTP id v6mr10907872obc.13.1331628767942;
	Tue, 13 Mar 2012 01:52:47 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id b2sm25152631obo.22.2012.03.13.01.52.46
	(version=SSLv3 cipher=OTHER); Tue, 13 Mar 2012 01:52:47 -0700 (PDT)
Message-ID: <4F5F0AE5.8000700@intel.com>
Date: Tue, 13 Mar 2012 01:52:53 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331604310.git.scott.a.garman@intel.com>
	<12986775-86F6-43E8-B0B5-20915F618CAD@dominion.thruhere.net>
In-Reply-To: <12986775-86F6-43E8-B0B5-20915F618CAD@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnLdLADyLOW9HqJCnjGa2r8foF2Zty5Qz9hP25a0+ghkqc4NXgGHeNDXzDVDPbGzAxP/t5+
Subject: Re: [PATCH 0/3] ncurses library location fix
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
X-List-Received-Date: Tue, 13 Mar 2012 09:01:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 01:09 AM, Koen Kooi wrote:
>
> Op 13 mrt. 2012, om 03:08 heeft Scott Garman het volgende geschreven:
>
>> Hello,
>>
>> This pull request improves the way ncurses libraries are installed,
>> moving only libncurses, libncursesw, and libtinfo soname libs into
>> base_libdir, and leaving everything else in libdir. This is how
>> ncurses is packaged on my Ubuntu host, and doing things this way
>> fixes bug #2070 so ncurses will work within python again.
>
> Shouldn't there a PR bump for python as well in this series?

Just pushed a commit to my branch to do this.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


