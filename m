Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 19FF76AF00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 16:21:45 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id pb11so1160346veb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 09:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6LAJA2iC+kVMqse3oOsFmVDkLZdtk8tb7nxIZvvPZzE=;
	b=nLKOV6vgLWkr1taCitmeoydWGzNkOi1T87rPS9lasN/UrnP2iWaeTdccO5CkIbd6lO
	pe/j7b6QnFP8HDWHAW7kP8k4BE3tpkUxEvnZQ0Iv4LpRihj9gNSVPA9R22GqXWJuU9rG
	JHI2gsOGFVNGew46kBkGMsxSWa+tLoM4+Q51ZfO0LP3ZWzim8I6XdLxCjJpAA0aut/3P
	WCtY29nn4JAZWX7ylN5dNCAZd5r5IWfShCQi1CvceX3pJdMOJnLfAc+E04AkOYZpTPQ0
	tX5Nc1SGNrejSVYwKbDw9mP6JgrgLIPQooKF/9+sdMkUclDVGRZOWD9Z4x5YjuCGekZ0
	1dBA==
X-Received: by 10.58.118.70 with SMTP id kk6mr3641632veb.1.1372954906018; Thu,
	04 Jul 2013 09:21:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 09:21:25 -0700 (PDT)
In-Reply-To: <3934280.MhQAtor7HF@yiqingliang-pc>
References: <3934280.MhQAtor7HF@yiqingliang-pc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 17:21:25 +0100
Message-ID: <CAJTo0LZnO28pTm_Y=Nzse9c-vu6PNPT3TKd1CtCWYC__+gOLgQ@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
X-Gm-Message-State: ALoCoQlug9Zok/Q3qSeELfHca9oYsuaEjQc1P9Ay1a4zh0oMtqPEMzs3cl05HQNrnEAxscajips8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: nativesdk-dbus do_package error
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
X-List-Received-Date: Thu, 04 Jul 2013 16:21:45 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 07:53, Yi Qingliang <niqingliang2003@gmail.com> wrote:
> ERROR: QA Issue: nativesdk-dbus: Files/directories were installed but not
> shipped
>   /run
>   /run/dbus

I thought we'd deleted that, I'll check later.

> ERROR: QA Issue: Found library in wrong location:
> /lib/systemd/system/dbus.socket
> Found library in wrong location:
> /lib/systemd/system/dbus.target.wants/dbus.socket
> Found library in wrong location:
> /lib/systemd/system/sockets.target.wants/dbus.socket

There's a patch on the list for this from Paul, should be merged soon.

Ross

