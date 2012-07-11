Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SoovG-0000Q6-9V
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 06:53:10 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 10 Jul 2012 21:41:57 -0700
Received: by pbbro8 with SMTP id ro8so1386616pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 21:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=yNBs1AjYwnYvBqIB98PrWOxvSUYdHdVHUsxOuSvB3OI=;
	b=mgs/MX6yBQoPDOsyPx61gjGkFn7zOkpCxfsT2H1XY/1kGO//ahy6BID0EIKA6RCDWQ
	23DMPqa3NpiruMxcuZFwb5xHOp+5VQKMP7QMccgcOINtW7djgVlkIGbi/D1Qv+38Rdu8
	G3jmQSzxTAmgZcAnjTpoo6nbvTqEzquWp6lZogM/FlpTqeyZiUvh0bocIyCevcROfg8Q
	gfiQ5xmRt3ZMYTbxhBDMN3yJ4vmhRuFQ7Oj2EvAb7pS5F+/npxanZf4iHOloqDnac0Kk
	/H86zqLwDidAQV+7txTCjB+/p3/weXWx9ktcMOVeLUye92a8AOEG7tSDk3QfuslULTTL
	QD0A==
Received: by 10.68.221.38 with SMTP id qb6mr74555500pbc.144.1341981717281;
	Tue, 10 Jul 2012 21:41:57 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id mt9sm909936pbb.14.2012.07.10.21.41.55
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2012 21:41:55 -0700 (PDT)
Message-ID: <4FFD0425.7040004@intel.com>
Date: Tue, 10 Jul 2012 21:42:13 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnSSjT1AihHdBNVkCOyYr+Z3Z8i/Da9u230xlFqja18yxpfOMblwf1kQ/NzDOCCY+J9D+gB
Cc: yocto@yoctoproject.org, poky@yoctoproject.org
Subject: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 04:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

After a review of the QA full pass test report for Yocto 1.2.1, the 
release team has agreed to submit this release candidate as our final 
release for 1.2.1. Song Liu will organize the release readiness 
decision, and I expect Beth Flanagan will be able to perform the 
official release by the end of this week.

Unfortunately the timing of this is such that I will be out of the 
office for the rest of this week. Saul Wold can handle any 
questions/concerns in my absence.

Thanks so much to everyone who contributed work that went into 1.2.1! We 
now have 35 bugfixes and a few further enhancements to denzil since 1.2 
to share with our users.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



