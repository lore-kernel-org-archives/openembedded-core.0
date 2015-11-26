Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 95A8D6012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 15:38:08 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so101282797lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oMwzRc0Bc/SZ55YRZonBniU5HkwL/AaR5a1EGwjOZ1c=;
	b=EEiVRfB1h6ijsMQ6sg9K3goNr+2y/QiIX7fXMW9gjbq1bkuL5xOX4iYeBFxPJrwb4N
	D7ijfdUVXEEAXQIbBjd7Ix4hxU3ZjSno6AM3bNVQ0eGAfeGJWM1Q/gUfSCYG6004qhAW
	AOuvufi7AMCIZ9F9dOLExzqhRAoD+W9V+ZJuX07pZFnmebniqnuXv3FW3gV/9Sg6vMiR
	nuisKXwBvFUJ2Dwi5dQed603k3X10gOPtd64O93oB45E00aMdx+Cw+mq9Em9UmRqlGfr
	4w43r6VxgES97eInB5l8jYmIGGdWm5W70R53yQ1WKSfxEigtdvKUqAzoOiRhYvTUyE+h
	j1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oMwzRc0Bc/SZ55YRZonBniU5HkwL/AaR5a1EGwjOZ1c=;
	b=d03A8SG8KT3S/gukFBSIOpa5RJtHjeye7SCiNWh/w1wZFo9sdnqpYGeFbOKlZcrYOT
	snoMUP+s0RQr7TQ8AgcNfQlU9J3auQHHPEVPvCDLI0O/0iFWUio7mZkjzYFyWr7SAiwk
	ARWj+herEFOioVU0y7EFbr29oD3A5MiiJYBK/qCyI2MNJZPf3snlrDhtJ3j8RGjOUIdu
	3OgPqdKeVuDJz90v/7Jsvo/Y9D1qRY2bJWTcxN7GzoC56vk5Q/GjTxphH1Kgxd/8LCAi
	rWiwA8q7DQSZRtn0I4N5ZJ690GjVAP49KplQ7IRvpp7b0F0fJDz6DHLdnaQv86c6pcLr
	TJZw==
X-Gm-Message-State: ALoCoQmaDtY9rRvsg+6eQNIGsiQjGIHMZLZ+t33BdolJdnMts4Tb7zrFlnlJ7WuW8iWZjsxlz8R7
MIME-Version: 1.0
X-Received: by 10.112.148.198 with SMTP id tu6mr15148683lbb.39.1448552288281; 
	Thu, 26 Nov 2015 07:38:08 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Thu, 26 Nov 2015 07:38:08 -0800 (PST)
In-Reply-To: <CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
Date: Thu, 26 Nov 2015 21:08:08 +0530
Message-ID: <CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 15:38:09 -0000
Content-Type: text/plain; charset=UTF-8

>> We get below host contamination warnings of license files for
>> each recipe, when we try to create a separate ${PN}-lic package (which
>> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
>> in local.conf.
>>
>
> WARNING: Could not copy license file
> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
> to
> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
> [Errno 1] Operation not permitted:
> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'
>

My earlier testing was done till do_package_qa  task, so could not
capture this warning. Will check and get back.

Thanks,
Jagadeesh

> Ross
>

