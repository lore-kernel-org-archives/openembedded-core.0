Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U61fC-0004O4-88
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 17:28:27 +0100
Received: by mail-vc0-f172.google.com with SMTP id l6so1634354vcl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dAKggXlKrq8Jr7p95/m6PDCVKDjHib11ZTh2OALnE9Y=;
	b=CAXLyVUgVaP7S3IY87ongo7aKyhUDkPBuU+Hxue4c75oIPl/ZzJIvNuGNRdolLDzVd
	UwpLCjGmUoyeKTZT9hg/swJqXzvmFGUksYaRn5CWEZwVGsZ0JVdhd3gE0h42N+m9DA87
	uo++dulmCmPy8MpATzOlD4sNYj8Y89NqoDW+oMHm6QKIZy2fNeoiI1wdgo6bpLDBcEKt
	kc+TdlUMj7FN0IRjaJsvSs9RvsCWY9QUai3+nI9/UvxgKHObn3DaI1aVA++UicvR5jBG
	ZtdfISper6nVyZLgMezjP63kmUHtqT9Op10sj6h22MTTQYLOCKsj18PEl6yo9f/1CAAE
	1uUQ==
X-Received: by 10.52.32.230 with SMTP id m6mr30549122vdi.83.1360858315400;
	Thu, 14 Feb 2013 08:11:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 08:11:35 -0800 (PST)
In-Reply-To: <CAHUNapR_kFzEK04GVk5J3+BRZhyU3hMBxOUTiFrDHZ1iypshVQ@mail.gmail.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE046387@SOUTHSIDE.devonintlgroup.com>
	<CAJTo0LYfTJh0XrEi94s4AAyXVFa6X9SPdBiEh4H7VZHr1ZVVPg@mail.gmail.com>
	<CAHUNapR_kFzEK04GVk5J3+BRZhyU3hMBxOUTiFrDHZ1iypshVQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 16:11:35 +0000
Message-ID: <CAJTo0LYr5UcZ1YE93eN6vdjnoGeea1TYye9shReP+DuhRyzqTQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Gm-Message-State: ALoCoQn4niVsj+qsXgnfxmwTl3EBS7hAeQpc+MDQlX8zwIpnsxyXfvbXPOq6uNNWCB/iNLYn3Bbl
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: state of systemd in oe
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
X-List-Received-Date: Thu, 14 Feb 2013 16:28:29 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 16:03, Trevor Woerner <twoerner@gmail.com> wrote:
> Just out of curiosity:
> - will systemd be the default?
> - will it be possible to still use/choose sysvinit (i.e. is sysvinit
> going away)?

No and yes.

> How does systemd fit in with busybox? My understanding is that busybox
> has its own init system. If someone enables/chooses systemd, does it
> disable busybox's init from being built?

At the moment busybox's init isn't used - that's one of the many
options for an init system including sysvinit, which is the default.

Ross


