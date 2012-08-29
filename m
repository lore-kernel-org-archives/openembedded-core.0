Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6kJP-0000e1-7i
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 17:36:11 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 08:23:55 -0700
Received: by obblz20 with SMTP id lz20so1218743obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 08:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oWYeTYoG+ExOse2f5o73XlDbFqnHSQnzNXfkxpawNcw=;
	b=SJlx8WotluWVrG0uRp3XwcifQzV3jWcwcKOtxASduuWA7bHlDdGXvCkgmsMobYRkRY
	TF8b8OCcG9+1ypQuVzNKPGV+3Goy8pybe3M8ATVRLrKtpWlU38m0fVYhhm2t5v8RzKRa
	EwjWD2zthCuyBHHa0BibZ1kFDlCSjfgjJH1l6SUehk7mpSDMGxddZEBkPsN67YcOgwb3
	jhkmUdGdGRWIh2dd5jJqiQkkEsaBlNgZMkpijXxABapw/uNSeFmiz9Q7tfUqQUuZunrY
	WrRPiw9rSYhM8U24NQLl/pmvXwTLBLShxPSKlmHU3XTaTwe4L8uqoVWdSxgnkxPF1KWv
	DKTA==
Received: by 10.182.193.105 with SMTP id hn9mr1582547obc.11.1346253835065;
	Wed, 29 Aug 2012 08:23:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 08:23:33 -0700 (PDT)
In-Reply-To: <1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
	<1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 16:23:33 +0100
Message-ID: <CAJTo0LatnKpmV5P53dsdO-J4_kMT_mqJu8SW5vX_b8KhbOJDXA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnsFDX90QMZIMUAFySdF5wUWal+7iIl9JnfpHGNRT4nUBA4mBZfoDsxpMxMfGhf91Nr5X71
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 15:36:11 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 15:47, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Awesome! I've been campaigning for the symlink solution for a while now. Good thing that split-/usr nonsense is over now.

Pointing out that the ln should be a cp for crazy split /usr systems
would have been sufficient, Koen.

Ross


