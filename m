Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 11765713FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:55:47 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so11637746qgf.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+A7y3v2zBe/dm9dvBvPTYZ8hMBKR5keug5CQ4HEYmFc=;
	b=I4umlbfxTwaISXnhDTznSMp7mRTN6FSVnKRy3h2S9+oPzAhRSXEXOtpOqy6zVtMsQf
	hQVeiC2ar479npWP8PNNQ9OIuHqtMlgq3rTkDLdvidmAvfF/f4kTkCp3k8+2Ch99kpgP
	y01y3IxxTlLeLWnPsS+9ZlCF2zyQ3RLlCZlWlv7NAnT4aZY5kGR0BLiqYHscX+V2lBtu
	gd2ezd4/wBOMUEw1V9AcAFkf7TPpX7lm5SKmLYo5H1w++EtXXQRSiWd5ydZ4/4j0T1Sl
	QA2WzdBe3DBNzn0cTbnD7dJFwKcPDIOfFgFciXPE6EAOumNa7wffT6fypdmwGzZtauyK
	AYbA==
MIME-Version: 1.0
X-Received: by 10.224.130.138 with SMTP id t10mr19751213qas.2.1409928946770;
	Fri, 05 Sep 2014 07:55:46 -0700 (PDT)
Received: by 10.96.147.37 with HTTP; Fri, 5 Sep 2014 07:55:46 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
	<CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
Date: Fri, 5 Sep 2014 08:55:46 -0600
Message-ID: <CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Sep 2014 14:55:57 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 03:14, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 September 2014 20:57, Dan McGregor <danismostlikely@gmail.com> wrote:
>>   sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
>> + sed -i -e 's:"/root":"${ROOT_HOME}":g' \
>> +        ${S}/src/core/unit-printf.c \
>> +        ${S}/src/nspawn/nspawn.c \
>> +        ${S}/src/shared/util.c
>
> Sedding service files is one thing, but entire C files is another.
> Can you please sent this change as a patch to the source?  FWIW for
> patches where the context isn't that relevant I've started using
> patches without the context lines so there's more chance of them
> applying in future releases.

I thought that myself, but ${ROOT_HOME} is a variable. I think to do
that a patch would
need to make the root home directory configurable, and not simply
hardcode it. That shouldn't
be too hard to do. I'll do that later tonight.

>
> Ross

