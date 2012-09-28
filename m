Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THXMV-0004YX-HX
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 11:59:59 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 02:47:05 -0700
Received: by oagh1 with SMTP id h1so2349851oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 02:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dKc4BIc9mDiACyk3FGwgu3568uRID1LTa6qSXLrGKDc=;
	b=ZxmgGHeJUawlTFATrAv2zzPAsV1VHhsFWVVY9G62DXcdX4nTc9KJximWX06h8SVoi9
	HVffyi4EHv+lYuTrYu+tXAGGFKvLWaOtPyIptaKax5bkntLQehEYvDNHZSs8qmp7eYud
	YGG/dtzlTTbGalb6lsR42GTsuguJhd2qQ/HPnrXf+i/60wuxzTmDMcTmF6vmot5FlDhE
	VDQ0G/UgeNRuZP0nImHooMk5pyxr6UxbJ+tYZNHD5H2JP6h9xbt0CHOoKHV85QmFyEBf
	+fLqRRxPTNENS7l/LXcjYohC0TwDIUe4VFI3vCyOYVBG02AwZPHK8rRUmOR2iPamICXX
	7SAg==
Received: by 10.60.30.168 with SMTP id t8mr5508657oeh.89.1348825624676; Fri,
	28 Sep 2012 02:47:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 28 Sep 2012 02:46:44 -0700 (PDT)
In-Reply-To: <50656473.2040409@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
	<50656473.2040409@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Sep 2012 10:46:44 +0100
Message-ID: <CAJTo0Lb7bqrjKDr-cQLSuKB2bsKoNo=zbzd3WC9cq16bKmu7LQ@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQnsDYOqxP84ekgqpbY4+u/1i3qko5KMUqhcK9RjijxTHKg85bKt3bz0rY6Q/M0jQIs4xn8j
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 09:59:59 -0000
Content-Type: text/plain; charset=UTF-8

On 28 September 2012 09:48, Constantin Musca
<constantinx.musca@intel.com> wrote:
>> Have you tested this works?  Last time I saw this worked on
>> (Christian, iirc) the "solution" wasn't actually working.
>
> I tested it pinging a host.local and it works. What else should I test ?

Check that there is a speed improvement - before it would attempt a
DNS lookup so I'd have a couple of seconds waiting before the quick
mDNS lookup.  With the fix all .local domains should be very quick on
the first resolution.

Ross


