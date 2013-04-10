Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPsDY-0003Qa-De
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 12:25:38 +0200
Received: by mail-ve0-f174.google.com with SMTP id jz10so233729veb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 03:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Y4ltE7LSqSMIEpN4cw1HGVZNL5LgRMC9/PkMOMWinn8=;
	b=Q9dp7R5x8+SgAHSYkId9gFM+X02cYxaB5JGnb4lQp9Rv5wYhcTO5+f5Mb9bwPS4zTz
	sXzE8Ri4C1UV0yb1R73mThbD3lJMrUn3WIHhGtPx92ndA0S735jq+vV6xtyIeMqxgo1P
	NucKOsMZC+HomAE2Lfs8Hp4faALqxf8zNKh/cXZxeIX8FjPHxDFAVA1WeG5hP7K6PdFJ
	g0IH7Z3sQ6gcZrTOABNLftIsq2j8mhhkXfKF2ve0IMHs9Xq9KQXVncMgeNBkualZiUOQ
	ANyEO7i40ftmK8u/NOGfw3K3W+TdNFyvUWQKptjBIZjoN7uW3lgMunGNp997S1B8r1aO
	jORw==
X-Received: by 10.58.15.193 with SMTP id z1mr891827vec.40.1365588486503; Wed,
	10 Apr 2013 03:08:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 03:07:46 -0700 (PDT)
In-Reply-To: <51487A22.5080900@topic.nl>
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
	<5136F97E.1030906@topic.nl> <51487A22.5080900@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 11:07:46 +0100
Message-ID: <CAJTo0Lb8vkk1yJ1Ax747BGu8rf9BVYUSOToEPxiB+WiS3iXtbg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQkiqFtCULGlJT6K/t9aXWLTrzuI0W3mPYvjjD2RzuP9ab7x7hL35bJ25bjxY6ERRLUb08M9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Busybox mdev INITSCRIPT_PARAMS gets lost
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
X-List-Received-Date: Wed, 10 Apr 2013 10:25:39 -0000
Content-Type: text/plain; charset=UTF-8

On 19 March 2013 14:45, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> In busybox.inc, the recipe says:
>
> INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
>
> Actually "06" is alreay wrong, it should be "03" just like udev uses. The
> modules load at runlevel 04, so they'll fail to load correctly if they
> require firmware, soI amended this in a .bbappend to read
>
> INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
>
>
> But what ends up in the postinstall script is this (and that breaks the
> system):
>
> update-rc.d $OPT mdev defaults
>
> This used to work just fine about a month ago, but it's suddenly broken. Has
> something changed in update-rc handling?

Did you resolve this?  We just noticed the same thing is happening to
udev too.  I'm digging into it now but any leads (or a fix!) would be
appreciated.

Ross


