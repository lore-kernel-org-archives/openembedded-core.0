Received: from mail-lb0-f178.google.com ([209.85.217.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1U5fvi-0005Eo-1q
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 18:15:35 +0100
Received: by mail-lb0-f178.google.com with SMTP id n1so1082892lba.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=t5cas+s7q/SQnZ+yTEDwIZWvCdqYIPHEAyCXF0HmHPA=;
	b=KGvL5F5VO2iD241lqEnykT/zUTtWsB7gKagggnf9FGa/9ccruvWL9JGLRbCyY48FmC
	ydFow0cxgWQ4bHQnF6yMLlRpZlTGSpXkI9rPGQg6sXqPjaJitHjOiv+EHs/AV736nZFe
	e0ifQs6a1mTfehlXSY0ZAQiaQZACXVp+e5pzgrdXZznO4UTbdUrE+QS/+MP7lETKenbt
	NxbhM3xWPzguZYpvDeHMDhO+NsquqB7Ex5YVpDNSgaBrYPwqpS2Qk+swVP8nKf9WFzwa
	bVD1Dd4/U9YWl7x3ET2YlUexmRJnozahiTbU93dPyGgoIPRm2pzkuolUptKrI5xCwW85
	K8jA==
MIME-Version: 1.0
X-Received: by 10.112.101.34 with SMTP id fd2mr8200555lbb.100.1360774772535;
	Wed, 13 Feb 2013 08:59:32 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Wed, 13 Feb 2013 08:59:32 -0800 (PST)
In-Reply-To: <1360774391.11225.52.camel@ted>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
	<CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
	<1360675313.30425.14.camel@ted>
	<CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
	<1360683160.30425.29.camel@ted>
	<CADkTA4PWV5zc7LtXZiMORT=XcMB-ydkxc2qZbsfrE0S_7oVXzA@mail.gmail.com>
	<1360774391.11225.52.camel@ted>
Date: Wed, 13 Feb 2013 11:59:32 -0500
Message-ID: <CADkTA4PjSjRJbqcrvqgxamSogPkC8JGjTmax4p2Taj_3QkC80A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
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
X-List-Received-Date: Wed, 13 Feb 2013 17:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 13, 2013 at 11:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-12 at 11:50 -0500, Bruce Ashfield wrote:
>> Attached is the fixed up patch with DEPENDS, the existing one had a typo
>> in:
>>
>>   do_config[depends] = "kern-tools-native:do_populate_sysroot"
>>
>> I've gone ahead and replaced it with a DEPENDS and tested the failure case
>> here.
>>
>> This is a complete patch replacement, let me know if you'd prefer something
>> incremental.
>
> DEPENDS should be towards the start of the file and/or use =+ in case
> something in one of the classes also sets DEPENDS. I tweaked and merged
> it since I don't really want to review it again ;-).

Sounds good, thanks for the += addition, as for the location, I just
put it right
over the spot of the old dependency, since it wasn't going out of my way to
clean parts not related to the immediate fix :)

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


