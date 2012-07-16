Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SqiiV-0000XV-IV
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:39:51 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Jul 2012 03:28:30 -0700
Received: by qcmv28 with SMTP id v28so2894318qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 03:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=m2aI5rl86g/zfOMetED8A20FbOnijgWlerv7LNxQ58Y=;
	b=NQg0MtkXvS0Cz7Jqa6q/JISwl6KVzKfKKSQaFNrSwESTgpTLZMWbYBqq2l/p1AXKhX
	ue4NeEgwK/01HBaO+/2Ml1QPhVIjBKLFPUxebxCWZhUejMFB9hk2WVU43NE2OLQfBJyt
	wIDbMh8toLIlL1/SvvNF2NVjVaAMHSX3GFKrz7oBWvpCDTFYankPE9IsSzgXZwpgg3zb
	gi7t7MzuxZJZjGy/7wswEqeOC37PtMvsLj86TEysVUibk6xJ3EI3LfJ7pcPblI5E/LGU
	QKmO+bkkHXReQI+yZWofg7Wd8RSaEdANkxownh3k4HhKLHqfSbwuPVqKE+wR6wx7bDME
	MnPw==
Received: by 10.229.135.10 with SMTP id l10mr5844605qct.103.1342434509732;
	Mon, 16 Jul 2012 03:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Mon, 16 Jul 2012 03:28:09 -0700 (PDT)
In-Reply-To: <500089F4.9010607@windriver.com>
References: <500089F4.9010607@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2012 11:28:09 +0100
Message-ID: <CAJTo0LbKiJzw5Ns3z7YNn0LxtDFAeKany_mPthRKf8UbrUZDOg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnM4CpX5kOZl+lxe9H9MfxyYH/cjanh7iTI6vPJ/jnhBpsHa9Jzwmbphbe2pnGy8c+tH+Lj
Subject: Re: [PATCH] dbus-glib: support unit tests compile and install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 10:39:51 -0000
Content-Type: text/plain; charset=UTF-8

On 13 July 2012 21:49, Yao Zhao <yao.zhao@windriver.com> wrote:
> +-noinst_PROGRAMS= $(TEST_BINARIES)
> ++testdir = /opt/@PACKAGE@-tests
> ++test_PROGRAMS= $(TEST_BINARIES)

/opt is not for package-managed files, please install into /usr/ somewhere.

> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[tests] = "--enable-tests,,,"

It took me a while to figure out that the -tests packages will be
dropped as they are empty by default, and I presume your intention is
that people who want the tests can set
PACKAGECONFIG_pn-dbus-glib="tests" in a configuration file somewhere.

A little documentation inline would be very useful.

Probably worth splitting the gquark compile fix out as a separate commit too.

Ross


