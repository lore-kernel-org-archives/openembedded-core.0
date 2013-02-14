Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U60W3-0001sg-P7
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 16:14:27 +0100
Received: by mail-vc0-f174.google.com with SMTP id n11so1565292vch.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 06:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FV3SZYEnDeFTS63PHA36o6bKa6qjKrpeGWyRrWPHbKk=;
	b=Y4z3qni53wex0uZdNQA221Nn1Bxho27El5SR+ERgxRyZeacOZmTx0oXSc7s2uqBrVc
	217q1TFQiCTua/LyIpa7XpZeBuXsEjjyXMjmBpfvzAWKAmg/JSr2PoGxHwBqNBh4b9Si
	l3ct5uMp8XtBJxUARDyYIBvM1sLc+BvBCVYG1Jp9xK8UkAkjKC5RxhqX3qfZLTMrkMIA
	r+/93BywMQy2MY2zDfb0mn2wGXUqS3qcRdM/VbzfppFv4L1/crsMBhLkLrmAZcnQiv8+
	6rdDGoGBmo+fCy3XuZe6o0CslrAyCCKBZpNSlC9XmQa9fXaGosAMXKMSIimXD1szgrXX
	Mvkg==
X-Received: by 10.220.154.199 with SMTP id p7mr35501727vcw.48.1360853900258;
	Thu, 14 Feb 2013 06:58:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 06:58:00 -0800 (PST)
In-Reply-To: <1360770738-26127-1-git-send-email-florin.sarbu@windriver.com>
References: <1360770738-26127-1-git-send-email-florin.sarbu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 14:58:00 +0000
Message-ID: <CAJTo0LatXrOX0cwS+BQYDZ4qU213wSVX_7tVZEJO0Hneadf6yg@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
X-Gm-Message-State: ALoCoQmeNnP7PvBMjFmlZDrg5Vj1cImRajGHRvp1KN3LgHfBCOdokE7e4h2R2ADAhU6n+2iPMDah
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Have connman package systemd service.
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
X-List-Received-Date: Thu, 14 Feb 2013 15:14:28 -0000
Content-Type: text/plain; charset=UTF-8

On 13 February 2013 15:52, Florin Sarbu <florin.sarbu@windriver.com> wrote:
> connman.inc was missing the SYSTEMD_PACKAGES variable. Declared
> ${PN}-systemd as the package containing the systemd service
> file and also added this package to PACKAGES variable.

NACK.

SYSTEMD_PACKAGES defaults to $PN so the systemd service files are in
the connman package:

$ bb contents connman
connman
/etc/dbus-1/system.d/connman.conf
/lib/systemd/system/connman.service
/usr/sbin/connmand

The systemd support in oe-core wasn't literally copied from
meta-systemd, so please stop trying to add back the $PN-systemd
packages.

Ross


