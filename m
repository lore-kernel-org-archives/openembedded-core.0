Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQBqY-0001Bz-St
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 08:18:30 +0200
Received: by laai10 with SMTP id i10so1092939laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6CrXl8SpaFR7yF6BpV9T1eRSBHZ0lgq579ZaK/Pp7l0=;
	b=AZ8IaIIkgq6NJAiTkd2iWYrc6vBk4WtSMqOGRMVCqQKxx0ag2FoKp8ajz2cRiXW+T0
	4mxgG8fFnd6dFyhKn5uBGxj6ZT+SWU8PGrTcuuMo1HZ/oi8tDYV4rTUZNUfLAa/wGwMW
	dSML3Gaf+5nXy1LMK/B2VQu5rhNS460RCgpU7f0P29Rtywezs2rDGCxVRlM3NjxTkp8Y
	IXj7BVxyZsFQitPLhnFeWFZBVKOKcTh1hliLnJDuclT7JAxjAFI3FqtBiNq9cG6lE/1h
	NwPReT9TYM0T0lDR40QcJdz5dYtLQEypJaMvEEy6Yi+fk18Sn4dTJYL5C2/+6vI53P7W
	x9Fg==
Received: by 10.112.32.72 with SMTP id g8mr2281360lbi.43.1336111724506; Thu,
	03 May 2012 23:08:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 23:08:13 -0700 (PDT)
In-Reply-To: <CAMKF1so6z8fLDsaLT7f+oBLB90zWvJm0Reaf97wf7ECGSdzw5Q@mail.gmail.com>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
	<4FA327A2.5040705@linux.intel.com>
	<20120504053258.GA3163@jama.jama.net>
	<CAMKF1so6z8fLDsaLT7f+oBLB90zWvJm0Reaf97wf7ECGSdzw5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 23:08:13 -0700
Message-ID: <CAMKF1spZF-A0h2P5Ke0H6Jg1nv2Kk1YKgusemfpLo+wjTVM8UQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Fri, 04 May 2012 06:18:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 10:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 3, 2012 at 10:32 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Not sure why khem haven't used this commit/patch.
>
> because my build machine has xsltproc installed. I will cherry pick this patch

Saul

I have update the tree with the patch from Martin imported from meta-oe
should fix your issue


