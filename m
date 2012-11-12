Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TXwyw-0008Pn-AV
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 17:35:30 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Nov 2012 08:21:36 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so18180692iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 08:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=JKdU9nrla9SnW4cw/zBRZM4t6vm57d4gwZ6j0C9Sx6U=;
	b=AYADCY885ESFk+tlsz49TyOMaJdH5qyD0rXyqQap91Vpc0Yww3LGwkfd5/ntZRrePh
	f3hi57/7KFO5reveBNQQhU8pSgs7rjoIaPqHNtzWZo4w7+2OEJGuvc+gFTXV0gEuxQnq
	mp4MWC3ZkYTcXY9qkel52Wt5TDao7rh8g59W9o+bzLmeWi+WYu1VFoaN/fjBpIawpiWd
	7+5tHhsk+TAqQ+nf2rwobvNgAOVhVVDvMAPuo3uaMgXgueO/XHhzJpAndOEo6DqFBDGG
	GOK62y2/mof7Jngfa4e/r18DZfISMfTYIICSINV+UJg4vwwthJi0tS/rGXWeLpM8OMxf
	cAcQ==
Received: by 10.182.157.44 with SMTP id wj12mr15493217obb.41.1352737292701;
	Mon, 12 Nov 2012 08:21:32 -0800 (PST)
Received: by 10.182.157.44 with SMTP id wj12mr15493213obb.41.1352737292634;
	Mon, 12 Nov 2012 08:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Mon, 12 Nov 2012 08:21:12 -0800 (PST)
In-Reply-To: <CAJTo0LZrxU2mparU6upANr_O9SkFJoE+YVNtOy8i7EuLnaCv2A@mail.gmail.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
	<1351798319.6502.19.camel@ted>
	<CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
	<CAJ2CSBvFvXXk93A8or4M6vmGo==h0F+VOR8-FVAFP9jYs8FS1w@mail.gmail.com>
	<CAJ2CSBuAx4AuUFCKVHsCjDvFuhGkQyOi-jAkuhCD9e4mgMm47w@mail.gmail.com>
	<CAP9ODKrtmGBg2gHx2=SqjRBVH3AwQtBkGFe-jsuTLQb+RmT=4g@mail.gmail.com>
	<CAJTo0LZrxU2mparU6upANr_O9SkFJoE+YVNtOy8i7EuLnaCv2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2012 16:21:12 +0000
Message-ID: <CAJTo0LbT3qKZP+VWoHySwY=RvVRraHbr1QbtEiOSK+QQzfi5Pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkhjpn4BEzqPeZJMeEf4R5Ui46xlOGofIOei8aWR6bXEinT4OPFw7NXteJaYY1RO1bFP+HrhhuVVLZr/RCBKiE9m3vwn7nIwHZ39Merew9v4MPoysmcdmC0mA+G2+r/f8GfWuaY8Ff/BoQj9kZgXrJTuvCb+oiLMjoRYFs++biAlJcl8ZJpfI8IPUS6wOO+PDrcGA+/
Subject: Re: [PATCH] initrdscripts: fix udevd path
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
X-List-Received-Date: Mon, 12 Nov 2012 16:35:30 -0000
Content-Type: text/plain; charset=UTF-8

On 12 November 2012 16:13, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 November 2012 00:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Please split the patch in two: one fixing udevd and another with new
>> features; please tag it properly  as v3 so it is easy to spoit it.

I JFDI'd because we've got broken images, and submitted a patch (V3)
that just consists of the critical fixes.  Alex, please rebase the
features and submit those separately.

Ross


