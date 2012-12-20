Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tli8o-0006yu-Se
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:34:47 +0100
Received: from mail-vc0-f199.google.com ([209.85.220.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 07:19:26 -0800
Received: by mail-vc0-f199.google.com with SMTP id p16so5045540vcq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 07:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qH9PjIIinVXNYwjVmKQR4tceOGNCQtfvATZNbF9BpfE=;
	b=mBrezLmCNnaCgCB0maco3GN552+wJ2ZlV2yN7Myc1K7o4LhfhwDZ9DPfH3i0WyUS+7
	xsiNfQOttyRsamMyFhVFMJTW/TD0I6KKZpr37brKs9fHx6bk4i0ybTBm3yXLU62QOClu
	7YMYvzboM+fTDMBA4/8owtrlrm54525XdW5VjWHdE8knxBao4aS+Txq/vSoXUHdZrxM+
	Nc5rVUvBp4+BEescvspXnNDcWQ3TI86xqgP+z00rTocIS11A6NLOdQX+Vxtt6ofTwk1/
	NeqBl4+H/k0qLBWN0iUXcP4tKJLc2jVwDG7vdRWguIaFekPrEkTzGLJNMFhwXnpsUud3
	xDdA==
X-Received: by 10.58.214.231 with SMTP id od7mr15355268vec.44.1356016765410;
	Thu, 20 Dec 2012 07:19:25 -0800 (PST)
Received: by 10.58.214.231 with SMTP id od7mr15355262vec.44.1356016765322;
	Thu, 20 Dec 2012 07:19:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 07:19:05 -0800 (PST)
In-Reply-To: <50D327C8.4040703@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<1356009340-15874-2-git-send-email-laurentiu.palcu@intel.com>
	<CAJTo0LbMxNc4JJMw+F+sUnsQAWiBorty_Tfbyw+ZWuU0UPVg0Q@mail.gmail.com>
	<50D327C8.4040703@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 15:19:05 +0000
Message-ID: <CAJTo0LaD4ALtLT-r7_HnfVr4p32S974O9wQbG638KXug2MtTGw@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQl39D2ksDemYiiNMa50Jf9k3KzDCeVtYsRkmKA8B22sDi2x7Ih4ajij78tANjY/H5zXIRs5WkrfNh76Lu1dGd4UEqWeWHmZJ1SLPgxEmzjRBqxC41eZozDIubdFEllbdSxysRikmAMKD26lB+e+/lcuMgNdiSJ+gzrrDEWpqs38JZCeyXZo4BuBebe2X/7Y6HCu2bSA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] qemu.bbclass: add qemu_run_binary() function
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
X-List-Received-Date: Thu, 20 Dec 2012 15:34:47 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 14:59, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Ok, I agree. But how do you call python routines from the postinstall
> scriptlets which run in do_rootfs context? readelf needs to run at
> postinstall time because the binary we run through qemu does not
> necessarily belong to the same package. Let's take, for example, the
> current patchset. You can have a recipe that provides an input method
> module and call gtk-query-modules-2.0 binary to create the cache.

Right, of course.  awk might be clearer than grep/sed but only marginally...

Ross


