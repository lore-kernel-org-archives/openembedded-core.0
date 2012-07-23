Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StKqR-0006QJ-99
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 17:46:51 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 08:34:55 -0700
Received: by obbuo19 with SMTP id uo19so8392112obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=sfb9+uG+3h94cDeTCUalV8dZ8FRPe+LQpEnkTAen4+M=;
	b=ES12zCcXq8mvRoD0IgJK4EWHQQYfP9/rpdWSwIdLpAtR6tBd8kDBWJV0/nvyHcIxE2
	Xdxj8u7SW+P172cHiSlkAs0LO5+sk49CMq5SqnPWk1/kkuC6EJUUQLdCgnccx00p7pwL
	jyM4i2+cUvJ9RRkodV9QOi9IbQU7aqQZ7laCexMldQ4+xu8U0RkF9ss3cnM2EndCUWbP
	V3Y0DM74Pvl20N/m46uqAb7yjy6AZ4HXK0wgTI7/9kh/FIrMlP27p3/txvlz+6LCrvM1
	+3cB+7A2Wk8F96r+F/jGU8oi/0Gc5479SMMyHPyTz0b7XZ3mUaH93N2KV1zbT6p1lQvj
	UDyg==
Received: by 10.182.226.104 with SMTP id rr8mr21544099obc.41.1343057695043;
	Mon, 23 Jul 2012 08:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Mon, 23 Jul 2012 08:34:34 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 16:34:34 +0100
Message-ID: <CAJTo0LZhotuPgOUmi-6Xkgmh6Nh3V+jFbgj7AP2pfeJj8EGXMw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkz63kN9hwKNdtVf5oBu0aVhnlOoxP7cHR7zWZJiaM1RA4DN5ro/4juEYTYhOSuSNfUQq/1
Subject: Tagging autobuilder bugs
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
X-List-Received-Date: Mon, 23 Jul 2012 15:46:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I just did my first week on the SWAT team, monitoring the autobuilder.
 Thanks to Richard and Paul for putting up with all my questions!

I did find that one of the hardest things was transferring the latest
knowledge of what is broken, what isn't really broken, and what should
work from the previous member.  To make this easier, I've got a
proposal:

  All problems with the build should be filed as bugs in the relevant
component, and then tagged with "(autobuilder)" in the status
whiteboard.  When the problem has been resolved, the bug can be
closed.

This ensures that all issues are logged and the relevant people
notified in a persistent manner (IRC pings may be missed) , and that
when the next SWAT member takes over a bugzilla search will list any
known problems.

Thoughts/comments?

Ross


