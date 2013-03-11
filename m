Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFAfm-000106-6q
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 22:54:24 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so1891419vbi.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=FrlJdwj6aXX9t3np3ML4qh0mD6HVzHvU7bZhd1f6VJk=;
	b=EhEGQsk8WcByvpsmLzP5eRVw60KOFfjbzZCb9W9Z3BFaTeZ7WzKIt5gnNALhgkosFt
	5uLVSuZjqnH+xuSY2tHjvOVf6UF74Ss2Cnm6Y1SZHN4yhwYSec3uKZhHysb5+Bn0kJYW
	cOHDcrmnnvoOwn7YqQWCCH9s3Yhe3MP8azowgvOb4Q9nd8LIbFOn8V0X+r9PSSWueomw
	DrSQmzd28yOHux6HyNxIvGxwt3u2AajtujhaCFlj3JOumYjEwm8afirlef60V6p+H9G+
	IVQ5unlp5Ue9li9adj+GNblEdFazzgIaIUyQxXwuS1lkScPLmlOAt8uSPe9iYy1QcT9S
	CBwQ==
X-Received: by 10.220.141.132 with SMTP id m4mr5310050vcu.17.1363037863470;
	Mon, 11 Mar 2013 14:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 14:37:22 -0700 (PDT)
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 14:37:22 -0700
Message-ID: <CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlSIruy8LpcP7kkDqcWZsorWzv/8GpUtSSCWSFbUOWFwgAiaBqSjiwKtXAHggzXq59ly5si
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Mon, 11 Mar 2013 21:54:30 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
> This series allows you to have both sysvinit and systemd in DISTRO_FEATURES.
> Packages will be built with both init scripts, and some daemons will be linking
> to libsystemd-daemon so that will be pulled in to sysvinit images.

Regarding the upgrade path, Richard/Paul/myself discussed this over
lunch and proposed that oe-core could gain an include file for distro
configuration that basically injects the backward compatibility
dependencies.  So for meta-systemd, it would inject
replaces/provides/conflicts for each of the packages in meta-systemd.
This would isolate the dependencies into a single location, and be
opt-in for distros that previously shipped meta-systemd.  Hopefully
the implementation of this is obvious, and patches to implement this
are welcome.

Ross


