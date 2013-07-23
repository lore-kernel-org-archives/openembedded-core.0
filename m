Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A69BC6A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:15:52 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id hz10so1986594vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=BmAO1obWYGo5TFuxLFDQh5++TP8syRJcNsnHQ6ZLfeM=;
	b=a8T3KxzBcQqOq+YE/aXbjPVh7+Bz7owXB+dxK71UfO7YosR1ayQwnBPcfD/JABk4hK
	XdRXsdgdUCyLoat5A3uJn6ucX72zBfkMTIbXKdqbFvV5kAk6LLptavP7UQzw0ZrVu0VT
	K8vnFNrYZqlxebkdYD3HCumgZ6HMsyfmHwUQIRL2hupdHGsEjrWszY3+2s6gkpFa+WGz
	aKyVExQdSWgCJbAt8LBwNptZz+S016RoSC5oxAO3Y/O7wHZU6fM15yUxcrYjCavglMlq
	ypaxbTXYBbb8sy39nyB7SXqPQpS0TRmadrK37zQhx5dKvDvhsRNBDYX5auo13Vx/QL5g
	Ytew==
X-Received: by 10.220.65.134 with SMTP id j6mr1539204vci.78.1374585353360;
	Tue, 23 Jul 2013 06:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 06:15:33 -0700 (PDT)
In-Reply-To: <CAJ2CSBtUPvJcHUnd=o2Cq_NrByaDv=0HW=Zbh=MX3W6oXEuTOQ@mail.gmail.com>
References: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
	<20130723124418.GL9527@jama>
	<CAJ2CSBtUPvJcHUnd=o2Cq_NrByaDv=0HW=Zbh=MX3W6oXEuTOQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 14:15:33 +0100
Message-ID: <CAJTo0LZ=xwHwwzddmPM-BXG5VvXpDVYGDS=GdGy55DVjovc8BQ@mail.gmail.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQmFXScvJqRK2YzIIc4Mm4q4WemD96VAsbwdxl3sPBmjlQuRYKETmMzesRrGyc++OxsFfFyZ
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add harfbuzz dependency
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
X-List-Received-Date: Tue, 23 Jul 2013 13:15:52 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2013 14:06, Damian, Alexandru <alexandru.damian@intel.com> wrote:
> And I found it while trying to compile. It's needed.

Sure, but it's not a direct link in weston:

$ git describe  HEAD
1.1.0
$ git grep -i harfbuzz
$

However, pangocairo *is* checked for and linked against, and that
isn't in DEPENDS, so the correct fix is to add "pango" to DEPENDS.

Ross

