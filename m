Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkZoo-0007mu-R4
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:29:20 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 04:14:33 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so7801248qcs.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=56LEpPakUdfypjIIfiDZL1xwmh8W3nKfsx4IlNcN23g=;
	b=MwwSOUDzK0I3Iag0i+0AYRyOvmv4AGIQiPYGpQq40v4ruw34IK0dhoB+z63q1AuKzj
	XwkE19dPQacM4iG1mEFEc8iL+9IlKJhxlY5zA5lfeUTGQ2LvLa2RipUhQ9rUKKTvvKWd
	Vry29OpyrP9QpPFjGiymv8HrHbFRI4M7cFvt+21n4f/r8xukqpQBtNOcu4Zff5d1bgRz
	3IlvIq0iBP2CThttk1eC2GosDUjj88iTZgXO96zkuJyUSHSrUmIrQRliEUy4Te8PZeQp
	4vEUmJpJiotJ+dOINvoFY0A9IackvORap4w8RJbDgPvUxRsU8ssyHtrMLn6je5v0kKOr
	vykg==
Received: by 10.220.153.212 with SMTP id l20mr22591910vcw.1.1355746472048;
	Mon, 17 Dec 2012 04:14:32 -0800 (PST)
Received: by 10.220.153.212 with SMTP id l20mr22591896vcw.1.1355746471885;
	Mon, 17 Dec 2012 04:14:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 04:14:11 -0800 (PST)
In-Reply-To: <CAP9ODKpP9z+SfHdLP3StfgNEwrn_uNJw54YZxpNEj06GUphbKQ@mail.gmail.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<CAP9ODKpP9z+SfHdLP3StfgNEwrn_uNJw54YZxpNEj06GUphbKQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 12:14:11 +0000
Message-ID: <CAJTo0LYbYZPygn=sRADc3=4qNMXstckuvOpWgbcEQjTn1S2Aqg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnn+6Os3dH3bj8qdBAZ1LYZl0HRUFETEvGTGzZF2oQMaAKpKDgvZfRJTwMj/8nJF3Sh9++8UnsKuy4sASKdao+ZO61vQEso0U/ghPzpxstyR2ENrxLfG06QGC68emSKrfyHm3w3FOkm2yr+ONJY6301lBluhZPWrkD2AkvQDpcCVLHV/MaGdLK7SmxtB3fr5bZBGdL1
Cc: damien.lespiau@intel.com, Alex DAMIAN <alexandru.damian@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 12:29:21 -0000
Content-Type: text/plain; charset=UTF-8

On 17 December 2012 12:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I don't like to get a shell at users as he might be an end user and
> don't know what to do so I'd prefer to have a proper error message and
> support the shell as fallback depending on a boot param or so (so it
> can be used during development).
>
> Another issue is the amount of time waiting ... I have hardware that
> takes up to 8s to be ready so 3s is too short and the amount of time.
> The time to wait should be configurable by bootparam too (and
> documented in commitlog).

At the end of the day this is a developer's rescue mode, so activating
this based on the debug-tweaks distro feature makes sense.

Ross


