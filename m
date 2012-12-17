Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkeTN-0008Vh-I8
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:27:26 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 09:11:52 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so8132012vbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=GgVyc7qAVfnvVT1MZc5vSJ8YwYX9hDZfNV4xS7OPRbQ=;
	b=kI1EHy6nvdm6Btv+6bEQJs6PCYdlc83OUVChDxiz3/XRn2KjaKeuuVEXgOOpWI7NjZ
	QKxijwhWAb07uJ7EdPM8BOJNxjgGaU6S5Q3NTWCWVSmBi5dwxXAsakX4Ue2Pk+qbRAMq
	SEz0wOkdhT8RBtYtXFk9YylMYYbvszW4xUBPX+n1tVqWwFoWbNuY3NJV7yEJ8TqGbB0b
	l1p0+/DiWJ6DRe3PSYLK0o+RPALzZ2oQfkEhDo/fdU/L4U2t/daFU8iVqagrlsEQaSu0
	WlZeFNrWHSEVDAON0bq44vh8pOk6CZYxJU/8s/MR2dcLmD952YX4lq3OF2v4Njs3IDXv
	KCVw==
Received: by 10.58.107.235 with SMTP id hf11mr25362166veb.16.1355764359119;
	Mon, 17 Dec 2012 09:12:39 -0800 (PST)
Received: by 10.58.107.235 with SMTP id hf11mr25362153veb.16.1355764359039;
	Mon, 17 Dec 2012 09:12:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 09:12:18 -0800 (PST)
In-Reply-To: <CAP9ODKrDoJ8fSYtV0__F2m=n5tP+44RphzFCYEUM9jjXuPk6tQ@mail.gmail.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
	<50CF510B.7040705@linux.intel.com>
	<CAP9ODKrDoJ8fSYtV0__F2m=n5tP+44RphzFCYEUM9jjXuPk6tQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 17:12:18 +0000
Message-ID: <CAJTo0LY-4rWHbRRkq8K2YkWOuxFsi9+8XfDyjwUCfDqTyjrUAg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQk/e3iUWEUvt9lCsrn9fIKdr54JNPoxBa4D9A3LlUXZjLpqhEmiG1hvQKg4BIrVCFSiYiV7A9yGJWgK9zUuAtjH6NsUlTFz8q5jiGuDfQOPlH5M+2P8YnboqO/gIz91l/dfcBFVY0DB7mYtsDge9n+uxl6u+gc13JdPYRswcgEsuZHtVYK05/HUwCO78ghKaNAwEF+e
Cc: Darren Hart <dvhart@linux.intel.com>,
	Alex DAMIAN <alexandru.damian@intel.com>, damien.lespiau@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 17:27:26 -0000
Content-Type: text/plain; charset=UTF-8

On 17 December 2012 17:09, Otavio Salvador <otavio@ossystems.com.br> wrote:
> One possible improvement (not for this patch but long term) is to use
> initramfs-framework for this. It provides a modular system and has
> some nice featues for debug and shell handling so you can say:
>
> debug=before:udev shell=after:e2fs
>
> Just an example. Another good thing about it is it allow for less code
> duplication.

Good point - I only noticed last week that we've duplicated udev logic
in the live scripts and the initramfs-framework (that isn't used by
oe-core).  Clearly this is Wrong and if we're shipping a framework for
a initramfs, we should be using it in our initramfs...

Ross


