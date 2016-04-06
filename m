Return-Path: <laurent.bonnans@hikob.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id D6328731E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:00:45 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id e190so26091607lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hikob-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2jg1B4mgAPrUJPmjMKlma+DV34thgEO7iGudg5A6gi8=;
	b=AE77MMLAwXAUnNTWwQtLIkQfUp5VIHBGcSQOZ6F9zNOosbIGotiCfGjBlheP2NSlFj
	SWRhZd5J6QEuYprTT8qAMgsGx7r1FypzOfnFb90oSwupxNT8TmU2afAtNH/OE7XI9RmS
	O6NmA8MdknfdUESgAH+dJXNnoHZ8aAsOoqOl3/+X/RQSeTKL08D1ck80jSwrDekqejPs
	ocQBevkoO0WBdK1BtgWZFkx3SFHjxWWhV98YbXKkVwYDpa4SUIVjV3Le9Mah4eA3Omz4
	/FCUDK+xyI2TPJGcRjxdf9NGmiMA1OyvbFmfs05hMnAK9ubZaK/O9JEPCRh125usf78T
	pD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2jg1B4mgAPrUJPmjMKlma+DV34thgEO7iGudg5A6gi8=;
	b=RZu9BZ8UQWfYg2u8PAwYBkPMSQq2k6kCXqWnX9K0rpMpE53rG2mMXVEjT2T7T9QHFz
	wnFPmPs0eL70hvgbqFbUpCZHW3tkvWNbqfFxO64QMVXjibADgueh9qxVI3/JC82cOzFl
	HXYm8UiJJqhL3wJN1rqyxuRGBeE/59V4eOUit5VCNgzBr87QXUMngSbmrRKChk3uZ/f0
	7aYX/axlIsgENwakrG5n4lG31MhDa6Z/VoydrO3B4UJDst1r2KFbKXltb04g3oxPz4UN
	EyGa5TLiiD4hVewdWYu3KaTCHwyiM62MLd+lbfDCuJrFSwVzYswl0u/Lw9hWZz9WIikQ
	9Wrg==
X-Gm-Message-State: AD7BkJJR+2hYsJ/ZU7xAJB7WUs9ej5bqyAT0puJJb3BW5yAo5Y62voPMr9KVVV13dOkMjGKS9ey40Lcse5988Rrt
MIME-Version: 1.0
X-Received: by 10.25.21.166 with SMTP id 38mr10670460lfv.160.1459929644878;
	Wed, 06 Apr 2016 01:00:44 -0700 (PDT)
Received: by 10.25.211.21 with HTTP; Wed, 6 Apr 2016 01:00:44 -0700 (PDT)
In-Reply-To: <CAJTo0LYnkMORa=qY7wVruxYEmzD6mQZYeJENJz-vm3XRNnEYcw@mail.gmail.com>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
	<CAJTo0LYnkMORa=qY7wVruxYEmzD6mQZYeJENJz-vm3XRNnEYcw@mail.gmail.com>
Date: Wed, 6 Apr 2016 10:00:44 +0200
Message-ID: <CABBNMXVNRa8ANtg9dFgfT1nF8br-hB4_w1Q07FMjq=2Sq+L_RQ@mail.gmail.com>
From: Laurent Bonnans <laurent.bonnans@hikob.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Wed, 06 Apr 2016 08:00:46 -0000
Content-Type: text/plain; charset=UTF-8

2016-04-05 16:56 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
>
> On 31 March 2016 at 17:15, Laurent Bonnans <laurent.bonnans@hikob.com>
> wrote:
>>
>> If present in manifests, they are shipped in 'python-modules'. This
>> commit keeps them avalaible in the 'python-misc' package.
>
>
> python-modules depends on python-misc, so this won't really achieve
> anything.

You're right, I missed the change which adds this dependency in master.

What would then be the best way to avoid shipping tests when using
python-modules?
Add another package(s) in the main recipe files before python-misc?

