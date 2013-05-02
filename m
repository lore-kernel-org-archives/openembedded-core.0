Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXwO8-0004w3-B9
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 18:29:48 +0200
Received: by mail-ve0-f171.google.com with SMTP id oy12so662102veb.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 09:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=JpzV5BVph324Dq1g7/0Nm9qlHKG0LVSQ4eFtgi6ALao=;
	b=HHxFSJIH0DiZ0E4yOp3dST4jRWAg5rqJCFFBX6XwPRd9Mm5UVj4EZeFlWFV7BIJkCk
	Lpo3aMMI55gLTGQ4yvE1RGdriiJcBvrlJ89e3AkJ/MhUBjxxQG++EpdXBTbAQtPXSgn/
	KF6fHKOeu6bQFlNrt9sVuRlJ63aWs4wVh93OnPZ+NfxZvIbPVfPfUsgyBan36Kl1iZ1D
	nWiIuYOOf5olm8R7T9GxOM25+B095boQ8fNdtKU515gCU8T2xMI0qmbLBPe16mGREZHX
	v8q9F/toa0m5M3TRoUhETlI1VDo25j0mDBdjtVmoNBpe8GdpLFYBuAF3idaPgjZNxuby
	0fFA==
X-Received: by 10.58.214.231 with SMTP id od7mr2385933vec.44.1367511108897;
	Thu, 02 May 2013 09:11:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 09:11:28 -0700 (PDT)
In-Reply-To: <20130502153930.GD3206@jama>
References: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
	<20130502153930.GD3206@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 17:11:28 +0100
Message-ID: <CAJTo0LZrk_JYXV8EQbJ9T__L6qBGHQfO5mNvZmUJtYTEas9x7g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkeTGUTp6CzDNHTjnq9/ppiUBLlq4kOIroE0Qf8NjPbF3AQHu/Ceynhf8tC1NF+Lki035m/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] neard: Use SRCREV instead of SRCPV
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
X-List-Received-Date: Thu, 02 May 2013 16:29:58 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 16:39, Martin Jansa <martin.jansa@gmail.com> wrote:
>> -PV = "0.10+git${SRCPV}"
>> +PV = "0.10+git${SRCREV}"

As the git revision is the 0.10 tag, wouldn't it be clearer to not set
PV as the git revision is a detail of the fetcher - this *is* 0.10.

Ross


