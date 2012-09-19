Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEM7E-0007Ry-Kb
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:23:05 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 08:10:22 -0700
Received: by oagn9 with SMTP id n9so1158463oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 08:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=a38GeyRnacN5WwVVkZs0n0hQdIiKzl0R/49M2HddmOg=;
	b=IvdzZRbBD0iu8Xgt5yqLt/MxjN9FnWPC8KAHK/gwEtXI94kRZPE2C+RswixQ4tVrgy
	z6/Z4o7pZFCSe4h5DOKUvDmjTayccRthpgV5hycUVh9TVOZS98yc/xj9oVRrPwCpn2zL
	Ak0GyDvAhSri8YIsIKrSt80cOYQcseC2olRU51GM27JZ6Ub4yG0wSMOXK4mCC7rLvZnu
	t10kAEpZlND1pv6S7CcDeaE092Ekncj8K3sCcFf2WcGqF8t121fJ7Nj4qDD6xJDTa5Sp
	JVSzmctdpm5/tMP1MP22zi1KmI6Qa0oEtiTdMJLi9P3YOcxtF47hLHbpQgiyheJ4EBch
	MPoQ==
Received: by 10.182.154.70 with SMTP id vm6mr3281209obb.50.1348067421094; Wed,
	19 Sep 2012 08:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 08:10:00 -0700 (PDT)
In-Reply-To: <5059C2CE.4050109@intel.com>
References: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
	<CAMKF1spysZ_tcHRu1XoTTdvvMCbSxfjkJnk6xgg1KU_Hm__DBQ@mail.gmail.com>
	<5059C2CE.4050109@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 16:10:00 +0100
Message-ID: <CAJTo0LYbVbtUjZqWu3wmcHh0Td1nvP4Gbpn7LeK55dsU255amw@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQlqTyy5ZIO5GM4VAA5X0IZ+YP1xLkidYvfxh8bvYLh4u1VqF6G+HNkGB6y9qB6WNNwLI6mm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Wed, 19 Sep 2012 15:23:05 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 14:04, Constantin Musca
<constantinx.musca@intel.com> wrote:
> Ross suggested to use these RDEPENDS after having issues with some packages
> on a image due to intltool.

I knew I should have put the exact errors in the bug...

I'm not in the position to replicate this right now (at a conference)
but if someone boots a yocto sdk image and tries to compile something
that uses intltool, you'll discover the problems.  If no-one can do
this before Friday I can do that myself then.

Ross


