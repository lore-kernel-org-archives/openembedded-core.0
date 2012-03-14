Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7rqi-000122-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 18:18:56 +0100
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Mar 2012 10:10:09 -0700
Received: by ghbz12 with SMTP id z12so2832803ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 10:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=8vvX0ejffBaaLH2et9yRvubsMVFQqWiL0tmZszqc6kw=;
	b=lKv38gTdvCEDZjbxDD6KE3Cjhhzxate09XXChpOiEySOI5iK1k/2KcGQHXIPzRi0ih
	qQzvxIGZqGkhhUqXYLQsZ4Q1vZQPnQrT8yy88Zn5xJyiT72B8Rgshqa3xM/isuFWr30t
	l53K2wjPqnBvh6x0FHdwqvHmsfIovydU8IX49QnQ7oupcenoH+GK0hk5wTOVr827qyX9
	fs9PEn1D1A6kXu+ZItPTmaYHRJJZl5E/3gilzLxh0DIYpYCRy99UYvJ0HngeqDn2YH+I
	hckg/PQMj35u68/H8DkR9cp0m2Yn21/wzCEss7x+YYo+R/ixhOtAB7rXqFZ+4ZmZ0Ekt
	g8uA==
Received: by 10.182.12.37 with SMTP id v5mr4494610obb.16.1331744989094;
	Wed, 14 Mar 2012 10:09:49 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id c2sm4737103oeb.13.2012.03.14.10.09.47
	(version=SSLv3 cipher=OTHER); Wed, 14 Mar 2012 10:09:48 -0700 (PDT)
Message-ID: <4F60D0E5.20706@intel.com>
Date: Wed, 14 Mar 2012 10:09:57 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331742556.git.scott.a.garman@intel.com>
	<db023a254e70a7cb819a6cab3008a666305ceafd.1331742556.git.scott.a.garman@intel.com>
	<6E6948ED-51D0-4E19-8D09-E82DB6438AA4@dominion.thruhere.net>
In-Reply-To: <6E6948ED-51D0-4E19-8D09-E82DB6438AA4@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlg39UBQb7zZ34p0Q5LMyZy9wKBMbxjGjSOpg2F1/AEnrHVUdymXnoLRPjxqG26CVVJFiBI
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 17:18:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 09:53 AM, Koen Kooi wrote:
>
> Op 14 mrt. 2012, om 17:36 heeft Scott Garman het volgende geschreven:
>
>> The recent move of some of the ncurses libraries to base_libdir
>> does not work with our automatic library packaging, so this
>> explicity creates packages for libncurses, libncursesw, and
>> libtinfo.
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>
> This is still missing a PR bump for all the packages depending on ncurses. Those need to get rebuilt to unbreak the package feeds.

Ok, I will spin a v3 of the pull request to make use of do_package_split 
and include a commit for bumping the PR for all recipes which DEPEND on 
ncurses.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


