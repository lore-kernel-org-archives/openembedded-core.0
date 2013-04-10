Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPsUB-0004xs-2e
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 12:43:03 +0200
Received: by mail-vb0-f49.google.com with SMTP id 11so219104vbf.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 03:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=yo+J9N6RzOtwcy9QjJz7nVvnqTWH/l0K/ZhH76qYIJQ=;
	b=M2ZgPCHhAW+ejPHjxHzz715Q4OUGIKy3TyUy4E4/KzZO77ja2gR5SssbXtTqz40Hfj
	ymg8cSk+dDjBX3iDdTgOLu6JgoHlSgo9AufOpohk+VB2krYTwhnYHBsFRHiXktYUEeVJ
	taLXMatDGlLUzvJbbtaymztWUuMBZUrCNNFO669cDgihRfLe8l+Urt8uUH6Mdi30rB0o
	A1vxUnu+Qrno+6ahlnCok0yUjbSNiegSnGi2JrQXSg7kT1DuB6g63Oq0c5TiC2PLkqyy
	UEhQCF0Qp2ePYFusUeZAlMG7czR9WDNKNICr+gHX2T+sRuQI8XEV+Ysa9aHpQy9HCzjh
	vi5g==
X-Received: by 10.52.73.234 with SMTP id o10mr841818vdv.29.1365589517420; Wed,
	10 Apr 2013 03:25:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 03:24:57 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8vkk1yJ1Ax747BGu8rf9BVYUSOToEPxiB+WiS3iXtbg@mail.gmail.com>
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
	<5136F97E.1030906@topic.nl> <51487A22.5080900@topic.nl>
	<CAJTo0Lb8vkk1yJ1Ax747BGu8rf9BVYUSOToEPxiB+WiS3iXtbg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 11:24:57 +0100
Message-ID: <CAJTo0LZuX0-EeAXzBa=_LzOPw3=0h=Am0tU50-7wkmxYnJHsog@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQn93yp7qst0kputuP4/hLZ9cNRLxe6VetvWhFS41TAlHc3zP/b6tEj8JDe/DSCdRTH2cMIS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Busybox mdev INITSCRIPT_PARAMS gets lost
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
X-List-Received-Date: Wed, 10 Apr 2013 10:43:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi Mike,

On 10 April 2013 11:07, Burton, Ross <ross.burton@intel.com> wrote:
>> This used to work just fine about a month ago, but it's suddenly broken. Has
>> something changed in update-rc handling?
>
> Did you resolve this?  We just noticed the same thing is happening to
> udev too.  I'm digging into it now but any leads (or a fix!) would be
> appreciated.

My patch "update-rc.d: correctly look up the initscript params with
overrides" fixes this for udev, and presumably mdev too.

Ross


