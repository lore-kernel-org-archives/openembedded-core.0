Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7159B788D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:39:43 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id b20so11975222iof.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gIeEJ3xA7RRm4vrQz+npUIZFYETHt+7nCxdxFN+3k7E=;
	b=ZlOB62YtO7kNffnkXW8wS+pFAb7oOMi0pJHLNYIjWpqjP7yAHNZzirO0+p3NHEDvv6
	pcfLjiKGLZn4q0ch0euDltZSRYqD832YiIbB5mfuyEdvnzV0pfwSSdmUdQrN7rO74dST
	m/VKdcwWom+ZLRtzATYzbRryxmdMlqoUH5ZSSrN2UNN9Jh9EphPnO4HEXx9WudbD3m56
	Z1csA0dQKDP1CYSygq7+/ppuc6+BVMmZy50Rpd3K+hszViZBIBSvz696g15ZYT5XjjIp
	zKHxTE27Dr22tjVYDPAJETG4TGLJXPuYWuwdURSDu+X2z5RdliTQukAG5ewgJcZjANhs
	xThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gIeEJ3xA7RRm4vrQz+npUIZFYETHt+7nCxdxFN+3k7E=;
	b=Stb7RvNv+RXyOwJHu5f8r0ys0IuQMfVm2sMYOpq/OfrFR+ca2fWPaiQ8GkexRer0C4
	4rN/loeMsr6gpqo8O3mJSUEl3BuCW99wtZVR9/ZRd5eto2MNh9oRJeQMkNT5FprlorHD
	02sYMjNpsy4U2SpJUQROuEVI578GvT03vkW6e5N3uPKK4V+y5NfEN+NF1mUMVLUBxvJN
	tiPdA6GKBcobu2xatzW8zqKZuzFpuMqyWwpoFoC8+3gw/bPKCqmMnTBYWZR8G6jaNDv1
	l1y9sGrwqHvm3ZZtUb+vttVwY9bfjkyWvZpnQjHHxP6oiks08JCarfmQPGtDZHYb5HhP
	qQQg==
X-Gm-Message-State: AElRT7FWcEsnfEeyCA1a3naus61732AuBiUuczEbVH9u/M3lWAQTmS+Z
	fxWLKlukerPPLV6+VVyEEK6nRFNLnW1GLXh0d5XtTA==
X-Google-Smtp-Source: AG47ELvEvCFs84YNUxqR/mr7D70wi/lgoznqFPtysUbfj/CCpaQSN79evxTpkKdkRsx07Yy+rKIlOLsKPVTcNeAcRm0=
X-Received: by 10.107.161.200 with SMTP id k191mr25235825ioe.270.1521740385291;
	Thu, 22 Mar 2018 10:39:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 22 Mar 2018 10:39:24 -0700 (PDT)
In-Reply-To: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
References: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Mar 2018 17:39:24 +0000
Message-ID: <CAJTo0LZZwXSNJ2S7Z9zVFJoLkAUUVQ5AGadqR8-u1xcookQcXA@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-chicken]
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
X-List-Received-Date: Thu, 22 Mar 2018 17:39:44 -0000
Content-Type: text/plain; charset="UTF-8"

That's a failure in meta-chicken, which isn't part of oe-core.

If you need to use meta-chicken then please contact the maintainers of
meta-chicken directly.  I do have to wonder if you actually need
meta-chicken though.

Ross

On 22 March 2018 at 17:34, Rajath C S <rajathcs.1996@gmail.com> wrote:
> I was including a csv-editor and this error popped up, any solutions?
>
> WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:
> Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
> ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:
> do_install (log file is located at
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> ERROR: Logfile of failure stored in:
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
> Log data follows:
> | DEBUG: Executing shell function do_install
> |
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> 113:
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
> i586-poky-linux-chicken-install: not found
> | WARNING: exit code 127 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
> ERROR: Task
> (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)
> failed with exit code '1'
> WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
> /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
> not found?
>
>
>
> Thanks

