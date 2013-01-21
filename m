Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGPX-0005Km-EO
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:23:50 +0100
Received: from mail-yh0-f69.google.com ([209.85.213.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:06:46 -0800
Received: by mail-yh0-f69.google.com with SMTP id w68so675234yhw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=mrQdh1EcxxJtqSDavDfdsIeSruLzgZySUHRBNSArw5Y=;
	b=jsW87rz4dbYYJB3M/Yd+eo9tu7Y3yXTA6jsEic2g8pa99U68dNyAWvmXKos2DVR+TR
	cWZ3r1ElJZFsScHEczTAxqCkzwTyYvc+UDASwS574u3K4/HoFZ5esOQmcXJiWPmB0nXG
	CqSBOKPpL4MK1X5mVdttLc/Ek7SFtu5XZhZOQ5MVtHgpR5QbnZBS4CEHeKgGMl7E1uq0
	juKmhUZReZeyxkhotaqA9mOOc9WH9MxeY+VlOKK8K6Xy63Izjo/2fhCgypn/xWreRhq7
	zQJMM0CXZLkbk7j7JvRt41cEfQ39F+Y2xtPRbmxumIeZqZzZ/M0odpqcbk1jTMRrWDtj
	ATHw==
X-Received: by 10.52.28.44 with SMTP id y12mr13491978vdg.19.1358770073112;
	Mon, 21 Jan 2013 04:07:53 -0800 (PST)
X-Received: by 10.52.28.44 with SMTP id y12mr13491974vdg.19.1358770073048;
	Mon, 21 Jan 2013 04:07:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 04:07:31 -0800 (PST)
In-Reply-To: <20130120231106.GI29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<99d5574cd12a8ed68886120775aec583b2941684.1358635193.git.ross.burton@intel.com>
	<20130120231106.GI29386@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 12:07:31 +0000
Message-ID: <CAJTo0LZymaq0U0ct0TN-E_=Wg8tPW4ahv9PXGzi6b094SQWoqg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlVknTxPdzScyQ59SUYeBU5nq8rFkDC9tJ8CcZ6xZrMuleaeDPK6t69okBpsHMBSRtMs2AUD/HyouJsmnQxD5+b2DotUQ+sSzU3rqkXT8K96lrA1gWOFz+mi5Rp8teXNX3eWgJBX9W4kCgKqPyfoxyXhQ1w+ebxLdk0Te7xLJnSj6UkPSwq9SlRA66m05oVxuMeTsZA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] systemd: add systemd recipes
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
X-List-Received-Date: Mon, 21 Jan 2013 12:23:51 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2013 23:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> Looking at diff between oe-core systemd recipe and meta-systemd, can you
> explain why python support got disabled.

I'll delegate that to Radu who did the bulk of the systemd recipe
integration...  if it's actually useful we can bring it back.

> And why are there diffs like:
> -               /libstemd-udevd \
> +               /lib/udev/udevd \
> +               /lib/systemd/systemd-udevd \
> (the later is meta-systemd).

Clearly a typo from backspacing a little too much...  Patch sent to
fix this.  Note that I removed the compat symlink as the initramfs
handles the systemd udev now.

> Is there some plan to send patches for meta-systemd to remove bits merged
> to oe-core? Right now a lot of stuff is not parsing due to removed
> dbus-systemd package.

I see you've already sent a patch for this - anything else massively breaking?

Ross


