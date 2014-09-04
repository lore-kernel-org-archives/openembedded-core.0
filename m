Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 725F8712AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 16:29:25 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so10534009qcw.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 09:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ilZMCFObTJHM9nvSlPn+t+A1EaXW4aXz8yK8yKjOb7g=;
	b=Al4ylt6l2AHHFX8CLLaKN4unnl36BJ3WoFkPHPPlN0BZkItyvduTY8l+kK6xlVfyyH
	cenCgNwXXv655F6nowO7BAA5wTvJOtxbv1Pp8oiI7Rh+J4h+g9xGd0OYgmSDwV9ueT90
	h9caHuo7+04Jtcu4F8qjbCw5sQfJi5AvHoTFFeTJ2HpfcXEPx3rP798GZuc1jh43Tqj4
	/CZQNyFeWjAOulEZGymWw2KmOIq+bc1EoFml9IUwCeFAnU765o9s4+e44LREg7XK0PZF
	Vz7+YhVsFIEX/Uj9Xq/6uzLqltMMty4/kYdquMB7h9bntb91+g3x3W9V+EzovWvmhq/T
	IxhA==
X-Gm-Message-State: ALoCoQloI18qBW6TOu62THXQ3vJoJ9y3VzcgwApaq5wf69jWzyBlmFwyNVYq5hDtkQ9CZLyoh07v
X-Received: by 10.229.137.131 with SMTP id w3mr8852442qct.23.1409848164718;
	Thu, 04 Sep 2014 09:29:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 09:29:04 -0700 (PDT)
In-Reply-To: <lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 17:29:04 +0100
Message-ID: <CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 16:29:28 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 17:07, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> .inc files make sense with current packaging because they are revision
> control friendly.  E.g. you can put the logic into .inc and follow its
> history with 'git log' which is not possible when there are only the
> versioned .bb files.

You can follow changes to the .inc but not anything that went in and
out of the .bb, but I do concede that git not tracking the renames
directly does mean some histories are harder to track (although simple
to follow as the commit where the history stops will tell you where to
pick it up again).

Ross

