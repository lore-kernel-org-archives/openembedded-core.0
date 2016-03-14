Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id E86996FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 18:40:35 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id x3so48050278pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=BymEngPFoAf5pPAyR9Tvu19UzZQDDb1gc75YEpaZ4Eo=;
	b=hB776+lThXQ8kgLBV/nkCClv9mOLK3zG15Gf1T2zt2fjJxD5lcm8/9Xla5BbJEWOQd
	snrzaTBSwN9xXrFeVvYD43dRLgu60hZwl7Iq0dlZYDYO5AkyucuYPNZxFgKifheaXskT
	AhElbsKewfknDkWiQccjv63cSLdOd92HOqrmydhGd6JGCYtFWcxYhjjWhLFPg5Omj5Dr
	nWBs3ikksh+Y0aVSOOmnU04M24p64dfkb/STfM0MWZrt//NWi9H0No0y1bwOcKXbbw+o
	sWQ9yT2AxicS5qESV9p6xmaeBry+KcNxXXmvjgg6fqf+Ws/hUIIwokxXFUSqOqDzYgiz
	R1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=BymEngPFoAf5pPAyR9Tvu19UzZQDDb1gc75YEpaZ4Eo=;
	b=JKFW5mfNsRap5w0cuZ2yDlDz+E5okg2huhEove1lffR0niONGEy2CmRoOzZWw9O2JN
	xTZSVpI/b09BkE+NgLV1UllUvIcFb7yfsXnc5XkWSGPZhlxfl6ZjDmRUWY6MLs0xFMTO
	6VnT2CzVVRiNqovhFLqmlHPDvFBvSMj9RYo659gB78eQKGcZ5fTxiGceuhiguIGxyeb5
	wfLpud3v73ZFXurdrDiHlIBK+vdn/4Z7SmfAHxGOZBdtLaNnsL5T/rRZaykn8Ac0el98
	bgMQ+QYw9TMCl7mKOrzY+xrorYfNCwGEr3lCM+0dFbhYILhB6xMhfnbxB2pwbF4zOYf+
	KcFw==
X-Gm-Message-State: AD7BkJLgtEyeONPcyrLjgQ/FiUV8PhwupzS+XBGIB5lyTE2EWFwSBqMZ+XAwvLYil6Qbnw==
X-Received: by 10.98.16.15 with SMTP id y15mr31956254pfi.114.1457980836011;
	Mon, 14 Mar 2016 11:40:36 -0700 (PDT)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	f66sm33877822pff.8.2016.03.14.11.40.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 11:40:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id fl4so162069901pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:40:34 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.176.10 with SMTP id ce10mr39450610pac.68.1457980833877;
	Mon, 14 Mar 2016 11:40:33 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 11:40:33 -0700 (PDT)
In-Reply-To: <56E385E8.8060105@gmail.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
	<CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
	<56E33A51.2020807@gmail.com>
	<1457738209.2804.259.camel@linuxfoundation.org>
	<56E385E8.8060105@gmail.com>
Date: Mon, 14 Mar 2016 15:40:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr7qDA42hdJA2J3ib3xKDxRCwT2oV-t8nhsn9YNoQG6-Q@mail.gmail.com>
Message-ID: <CAP9ODKr7qDA42hdJA2J3ib3xKDxRCwT2oV-t8nhsn9YNoQG6-Q@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 14 Mar 2016 18:40:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

On Fri, Mar 11, 2016 at 11:58 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On 03/11/16 18:16, Richard Purdie wrote:
>> On Fri, 2016-03-11 at 16:36 -0500, Trevor Woerner wrote:
>>> On 03/11/16 15:49, Burton, Ross wrote:
>>>> Can you verify that
>>>> cherry-picking 55ca1fb8f0e81ff739b3c46897e43356d1f760c3 solves
>>>> this?
>>>
>>> Yes, verified. Cherry-picking 55ca1fb8 solves the problem.
>>>
>>> Thanks! :-)
>>
>> I just merged the fix to the branch, thanks for testing.
>>
>
> Thank _you_ people for being so fast to respond to the issues your users
> find!

This did not fix the issue when the distro does not have X11. For
framebuffer based distros it is failing badly.

See:

http://ci.ossystems.com.br/view/FSL%20Community%20BSP%20-%20jethro/job/fsl-community-bsp-jethro_framebuffer-imx28evk/77/console

The native flavour ought to enable X11 ONLY if it is in DISTRO_FEATURES.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

