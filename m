Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9114160290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:08:55 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id h134so13542917iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=u5sApiBu0fkwf/IlB527+yTRktp9IxNuvK1ov9c8O5M=;
	b=SqBJtT3VuVWBsKaJcOGlBP8q1gFJcdRGK9vmcLipxqYnBJPWRfraEJL7IJpxrsR60U
	G1gLzA9UMCq7Ir31HYtmjFmKR0UxcBBvEBLam0bROnJLPui/kx8HuV3pjNheDzCQhM1M
	baM/0buUwDrhpCi7oHfP4fgCn7BwU4Uu9Ujoy6ctdr92ilD9nYewkDauQ9DqEduGcCAw
	Oqafw18m9RTKn/Q81rK4kQ96nBV453BGrcTqZvnkODoJ5W5/X+/5R12XbHAo4l6tqCRk
	I1nDA1grx5ZGOm2PaV+JBZKRhM8r0PAfjRrjzwlMW1rf+4lwvb4KzUd/neG6UrBx/tAJ
	apqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=u5sApiBu0fkwf/IlB527+yTRktp9IxNuvK1ov9c8O5M=;
	b=BdGLeR24AQ7w8Fx7pI1ZMZ/AhzdM496xmluwtQ+tG/YUMdIdYDQEpWRTBgYY6FUFCE
	mOmxKVvxcvzhfCH6ZBDc2SJNN//nl6/XLK2WtZwzTdKPOToR+TC+ZdT03Fwp0Cr42hqV
	3bmz720TiGW5Y+OKECKRsD3zTAzHVHqw5RG2ZeH1h+Mt7Rv3wruddnYZhU0KwysumI5E
	MXmq0K2RHeteRW4sF2UtG07omc3FWDWZirjptQkzmMigi+MhnCpukNi3IQNz+MzTDNCL
	kCOIk4PayX/sAI6yvHmMTDHTxPP514tYmc8uTfLw39NZ5CCxGwbe55OJUqDDKUgZnCt8
	9ILA==
X-Gm-Message-State: AKS2vOzjhMffahARNPu6Z8rZldkj+YzlFkHxvDN59zGJX+dc+ZkhIMPc
	G+1GaIiaV6DcbMMJ
X-Received: by 10.107.12.28 with SMTP id w28mr5180706ioi.150.1498550936693;
	Tue, 27 Jun 2017 01:08:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id
	v13sm1052771ita.28.2017.06.27.01.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 01:08:55 -0700 (PDT)
Message-ID: <1498550932.7464.29.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Jun 2017 10:08:52 +0200
In-Reply-To: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 08:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-15 at 08:48 +0200, Martin Jansa wrote:
> This issue exists for very long time.
> 
> 
> I know that when the builder runs out of disk space there are multiple
> things which might go wrong (I've seen bad archives on premirrors, bad
> sstate archives caused by this), so this issue isn't the main problem,
> but still would be nice to fail faster.
> 
> 
> In last build which was running for some 9 hours, it was first
> building for maybe 2 hours before it run out of disk space and this
> morning there is 50MB log just from bitbake output stored on the
> jenkins master. Repeating following message very quickly
> 
> 
> # grep -c "Errno 28" consoleText.txt 
> 42986
> 
> 
> ERROR: Running command [['world'], 'build']
> Traceback (most recent call last):
>   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> 211, in fire(event=<bb.event.HeartbeatEvent object at 0x7fcfed3e96a0>,
> d=<bb.data_smart.DataSmart object at 0x7fd00330b198>):
>      
>     >    fire_class_handlers(event, d)
>          if worker_fire:
>   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> 134, in fire_class_handlers(event=<bb.event.HeartbeatEvent object at
> 0x7fcfed3e96a0>, d=<bb.data_smart.DataSmart object at
> 0x7fd00330b198>):
>                          continue
>     >            execute_handler(name, handler, event, d)
>      
>   File "/home/jenkins/oe/world/shr-core/bitbake/lib/bb/event.py", line
> 106, in execute_handler(name='runqueue_stats', handler=<function
> runqueue_stats at 0x7fd0020c6158>, event=<bb.event.HeartbeatEvent
> object at 0x7fcfed3e96a0>, d=<bb.data_smart.DataSmart object at
> 0x7fd00330b198>):
>          try:
>     >        ret = handler(event)
>          except (bb.parse.SkipRecipe, bb.BBHandledException):
>   File
> "/home/jenkins/oe/world/shr-core/openembedded-core/meta/classes/buildstats.bbclass", line 212, in runqueue_stats(e=<bb.event.HeartbeatEvent object at 0x7fcfed3e96a0>):
>              done = isinstance(e, bb.event.BuildCompleted)
>     >        system_stats.sample(e, force=done)
>              if done:
>   File
> "/home/jenkins/oe/world/shr-core/openembedded-core/meta/lib/buildstats.py", line 148, in SystemStats.sample(event=<bb.event.HeartbeatEvent object at 0x7fcfed3e96a0>, force=False):
>                                       data +
>     >                                 b'\n')
>                  self.last_proc = now
> OSError: [Errno 28] No space left on device
> 
> 
> ￼It would be better to exit completely when something as bad as Errno
> 28 happens.

Do you have BB_DISKMON_DIRS active? Probably yes.

The reason why it did not trigger here might be that the build ran out
of disk space so quickly that the disk monitoring had no chance to
detect the problem before system stat sampling itself started failing
with the error above.

System stat sampling and disk monitoring are hooking into the same
event, so my theory is that once the system stat sampling fails, disk
monitoring code no longer runs.

I'm not sure what exactly the right fix is: detect uncaught OSError like
28 in the bitbake event loop and abort the build, and/or catch the error
in buildstats.py and ignore it so that the normal disk monitoring can
happen?

I know how to do the latter, but not the former.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




