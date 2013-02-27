Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAidu-00059Y-OG
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:10:20 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so644825veb.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Izq2RfXP6+hUCBAqITcnRSPVKV+2hp2hGx/YfK4Jjk0=;
	b=WazjpnxTcSfLf0gx7nKD18qe01NbO3hHXCBoIGSyOsURmynOXWBkdr6zGfIpI+OWX2
	7av+9WCGr2SYi8/cVyH88zvCwbZjLGCgnTTa0BOJ0BUuEZ+SOB7K7glLS6q8VlGjHolw
	22lowNWlp3uaSs+Zsps6SJhI8YJ/TpudBxW6+1vkhLJTtshUaeztQLt4NrctAjK6gndo
	3iTHL8C+oHu97qd+8z2qVkDxkRE5DGX5Z0VwufmDwllO7t5aw2KGDTc+bQF2JDRAUWDL
	7WsILUt0fcZci9JhkmjdttWyvlcBLvrXFJs8mcup5LXIGpRAnfnCb3rHvsBOhjAuKu7g
	W/yw==
X-Received: by 10.52.74.102 with SMTP id s6mr862279vdv.28.1361976821748; Wed,
	27 Feb 2013 06:53:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 06:53:21 -0800 (PST)
In-Reply-To: <1361976034.1809.4.camel@rrMBP>
References: <cover.1361974597.git.ross.burton@intel.com>
	<a4ec8dc8fcdaa379c4abe77debb003ad49f1115d.1361974597.git.ross.burton@intel.com>
	<1361976034.1809.4.camel@rrMBP>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:53:21 +0000
Message-ID: <CAJTo0Lav+DWFa_XRCJKmZ6=GhTq4gn7Zge2bCAy8_FKviPajjQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlyy76oM7uUkimUCRB7gpJK1qGvW6OixZqk8ZzM3pwTQkuGBJ6OLUTY+pmUPe/5Yx5S5JBV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] systemd: don't recommend IPv6 kernel module
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
X-List-Received-Date: Wed, 27 Feb 2013 15:10:23 -0000
Content-Type: text/plain; charset=UTF-8

On 27 February 2013 14:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> On Wed, 2013-02-27 at 14:17 +0000, Ross Burton wrote:
>> systemd doesn't need ipv6 support directly, so don't pull it.
>
> It will trigger an error on startup, which seems to scare most of my
> users :(

Well that's silly of systemd isn't it.  Just noticed it didn't cause a
problem here because the BSP I'm testing on appears to put ipv6 into
the kernel

Can you point to where the log is coming from - silencing that warning
seems like a sensible thing to do, as no ipv6 is a legitimate choice
(albeit rapidly not a sane choice...).

Ross


