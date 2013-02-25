Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UA0cp-0007QQ-B9
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 17:10:06 +0100
Received: by mail-vb0-f49.google.com with SMTP id s24so1747441vbi.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 07:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pfBwAwgAbalt3JWzYjTFKBeUpQHO7HfWM3R88oWnn6o=;
	b=VnaAjl3cRGKtbVqVpQgIFDDoZa0jzEe/jbaFeMWvPPMClJR1vgFm7x7BlWG4isJbKV
	gAuyH0gMHoUUbkAzkQ1HU1a5zfpomWmtLtvEJ/kKfUY2pDwEee4fR/fIY+cm8eoR0HHG
	WorBANICWAlit2DWYibpPwi2xBkf08EUWjr/TYnF9iFUjhERZHctfi/WVGzciJHsnME+
	fHInt6/yC+sv5Lre0h+XDuz9TeObcaEizDLxAG/4Rh/n2D3nQDyOUj9P/vjHNvu0H2DB
	f8tlijdney77k/if6Go9i/YFIeNSvTFmuFQj7ejucSUXYAOi7JkYJmuXJDbSPXS6UAHA
	oYPA==
X-Received: by 10.52.16.40 with SMTP id c8mr8634838vdd.99.1361807620980; Mon,
	25 Feb 2013 07:53:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Mon, 25 Feb 2013 07:53:19 -0800 (PST)
In-Reply-To: <1361793612-26991-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1361793612-26991-1-git-send-email-andrei.adrianx.dinu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2013 15:53:19 +0000
Message-ID: <CAJTo0Laq2ok=eNcM-ay4MZL4sqvNsBRtKNPAnwQ8h4ybNe96Vw@mail.gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
X-Gm-Message-State: ALoCoQlWGgm5juGtg26BkHtdfIza1EtiwhhqR6zNpAvh9ET6Jsb0ci2tUdhsLYZK9zTBh6XnOTm2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus-glib : update to 0.100.1 Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
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
X-List-Received-Date: Mon, 25 Feb 2013 16:10:07 -0000
Content-Type: text/plain; charset=UTF-8

dbus-glib 0.100.2 was just spun:

"""
The "I would prefer lengthier studies, and fewer explosions" release.

http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.100.2.tar.gz
http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.100.2.tar.gz.asc

This release is a respin of the 0.100.1 tarball to drop some old,
broken versions of generated documentation files (fd.o #55830). There
are no source changes.
"""

It's nothing critical but we might as well use .2 instead of .1.

Ross


