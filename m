Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TBWS4-0002pD-AW
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:48:52 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:36:20 -0700
Received: by pbcwy7 with SMTP id wy7so1170457pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Z9PDZ+lfx3kxU3FLjOkr76BcMHdy5ISldP8hV9o1Iek=;
	b=TkBFOfVTYn6TDcx2RPffCuGkStbM5/P3U7wXcaHIdWeAblQpiRNdXalDL1fhdJmDHB
	hh6fV+JAJVKO2l8XbOKw5vujqLhrPhJeD71I36a01RHIC2LGvM2e/biw+pAtTHcN+FlR
	kc9vaBuOMDt/9YpHtmSNnEUKeON88UuHROTOVyFVGoWuHTlCUE3nk26auWasF0KtIr9K
	Oe8cdD5ZW3AtKgvGUiB2/2mMd8+ywu3h25sCG5ttNTehoEL7tXGkZf7A8zJsuVSw7XqX
	71lOf8WvLq7+9/wmFcAymKHSjSoPmRvOmBqXSmMGGpZr1eizZNTZoNGpfIGNZREVyLkM
	2mLA==
Received: by 10.66.75.229 with SMTP id f5mr27875895paw.47.1347392180248;
	Tue, 11 Sep 2012 12:36:20 -0700 (PDT)
Received: from [10.32.68.88] (72-254-23-251.client.stsn.net. [72.254.23.251])
	by mx.google.com with ESMTPS id
	pj10sm10199639pbb.46.2012.09.11.12.36.19
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 12:36:19 -0700 (PDT)
Message-ID: <504F92B2.6000304@intel.com>
Date: Tue, 11 Sep 2012 12:36:18 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
	<504F8EB5.30503@intel.com>
	<CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
In-Reply-To: <CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
X-Gm-Message-State: ALoCoQkI94KwpLholzgzjNKE0MzrqpWmWeWhAGPp2daPJcw9HtGED9+VxLD5IxiWo2k79hosnb/y
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sato virtual keyboard - how to close it?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:48:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 12:23 PM, Burton, Ross wrote:
> On 11 September 2012 20:19, Scott Garman <scott.a.garman@intel.com> wrote:
>> Negatory on both counts. Sounds like a bug?
>
> Certainly does.  Not sure how that regressed or how QA didn't notice.
> So clicking on a button or check box doesn't make the keyboard hide?
> Eek.

Eek, indeed! I just tested with the last bernard point-release, and it 
too has the same issue. I understand Sato may be going by the wayside, 
but in case anyone wants to fix this, I've filed bug #3093 for it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3093

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


