Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz1a4-0001F0-JJ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 10:25:28 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 01:13:40 -0700
Received: by obbuo19 with SMTP id uo19so685938obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 01:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=65nJJu04rPPAkxmrBvqIUjy6i1FJYigbK7wM6kdvWaA=;
	b=jdRjJ1+7ehkBKiV5GETcsryZPCvmQ+7Cs/oL9lsVnMZ3xHQm79cpeZZksIUmQUg/S4
	vhz9LdPyb7v6RAr86niQaZm8SNUscclq3BBb6Er70LvusTb0H9+tMBLVh0GYGV4dKkCQ
	ISNLsUOqVSsGXg/3EhPbHL4TgIaRrvU2hLKCN1wdDudxz2mlJPsAxVoRVuYcggneO5TA
	eb0z9PhfMBPXO4LwSr8NIJLLNHDGZ2dKopcMrb22ndoxfaX6hcB5tD+wQ0WzFt6sZl21
	NgO+219LQTTJ89KTKg2w62/GMmmonxTOHbw1x8XSMazSD9dnWp1Lh5bu7W/wdlB3lnJm
	UWCA==
Received: by 10.182.226.104 with SMTP id rr8mr6277401obc.41.1344413619289;
	Wed, 08 Aug 2012 01:13:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 01:13:19 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 09:13:19 +0100
Message-ID: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkeVbp6cPvVprjAsRIrKYsBY/w4xLS8rgkoz9o+W1/sMOEDxV5W07rDqj0T2kc9LwWJNXaf
Subject: Configurable host name
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
X-List-Received-Date: Wed, 08 Aug 2012 08:25:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I think that the current hostname setting of $MACHINE (unless you
override base-files and change $hostname there) is too restrictive.
Distributions should be able to override it easily (i.e. adding a
distro-specific prefix) and individuals should also be able to change
it in local.conf (i.e. assigning a real-world name, i.e. beagle or
zbox).

My proposal would be to add something like HOSTNAME ?= "$MACHINE" to
default-distrovars.inc, and changing base-files to write the hostname
file in a new task using something like addtask hostname after
do_rootfs.

This is entirely untested but opinions (especially "you're wrong" or
"there's a better way") welcome.

Ross


