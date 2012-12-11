Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXDx-0008Ef-UQ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:18:46 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:04:05 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so21564943oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=xL+Ij/tb3KdPCJ9mKip8HVTl5uJGY0nbpsIScJ1LsSI=;
	b=PTZGgx2j56HiSaUr7TUTWIDYiquCMSlvbYRVZNMoAv5wuBF7Vme9bS+fX/CGBMkp58
	qwnsBSjDcfl1OENhAsZFdf7DG2ADbm/15On49llxZ0nHbE45ZUwdG4WLdH1JJaX7HLXX
	niU6giFEy8g5yxeC8NfUgd7NcXa/BR8C08r8bo2zMeGuFMrbU2GUgKDSwLgzvHwgKhCa
	GaboV2fNQMSmw+SyOfv5rrLzIjoNTGgdSWHAKNmIOZFcmcDv+LSEgZsb9MexTQg5G8SF
	KYLzjTHBrZQlzXKONFbsA7j2VKAHMDRK8I06GQGyAKUhEBy5e4dc1NZBSKiIiuVQAX4U
	jEvg==
Received: by 10.182.89.103 with SMTP id bn7mr10402232obb.35.1355259844557;
	Tue, 11 Dec 2012 13:04:04 -0800 (PST)
Received: by 10.182.89.103 with SMTP id bn7mr10402227obb.35.1355259844476;
	Tue, 11 Dec 2012 13:04:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:03:44 -0800 (PST)
In-Reply-To: <a6833e686fb416a1bfa86c1f07c1460b679519e5.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<a6833e686fb416a1bfa86c1f07c1460b679519e5.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:03:44 +0000
Message-ID: <CAJTo0LY6NW-Y373sTJHGunFDNfXX9TQtdvntELXq_+Pfo-wFWQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkBPhIekKd0xYe6FwFFzoHhEzu29z3AlZiE/dJawZdVtCOtzamBO4Ro+wTdbiBu5BvlrOfqFJt5RXwlLuNT8B4NP2i6UJTSJSdTb74Q60uVK3jKpVPb4XoMWthWqaLy0RvT8/r9xnvzxypI9nGjDVnxjALqY6soSZQvn6No3KxrsAR+xkcZkWHAvqOT6VwDjx3F4sYw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] Add Wayland image type
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
X-List-Received-Date: Tue, 11 Dec 2012 21:18:46 -0000
Content-Type: text/plain; charset=UTF-8

The commit summary is wrong, this is a package group not image type.

On 11 December 2012 11:36, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +RPROVIDES_${PN} = "task-wayland"
> +RREPLACES_${PN} = "task-wayland"
> +RCONFLICTS_${PN} = "task-wayland"

These are only needed if there was a task-wayland to provide a
migration path, as there wasn't these can be removed.

Ross


