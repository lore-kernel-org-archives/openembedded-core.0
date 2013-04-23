Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUebw-0005iS-MJ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 16:54:33 +0200
Received: by mail-vb0-f42.google.com with SMTP id p12so650060vbe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 07:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=plY2jHPfT0oAsUlpYdrCv034dA3mn4+tDBw4r97K/jc=;
	b=DEjK9DHSoNUA7Pi7CHhpulwvUIrDzrtmVKOP0HRw4tmM91vpuN+1rmw3IrcOCMKTdF
	lL+bDMsXsUq4UMay2G5lfxmpVI4oZpIcF+bfnmVi2PZ2robyhBUPuAD71/+AmuUGd0LK
	anzyr0IM23wcH2+NJguZ/D5Kpn0Tcq+VrPbjfD0oYU+1IiZY+twSTz0RvnotfNl3QzDp
	Y5lNaIFngwRnnNO13orD/PvX9OKI3WIwNUYR41qb1XjOc9V0OBFuCrdE4PhN0zYhqZ16
	APJWKWY8pXIq5VIAIQeh2iw9oHQux4nQedOxofYa75LLAB6hFCMVz0ZxHn7y25UqiZI9
	BjQw==
X-Received: by 10.58.143.100 with SMTP id sd4mr22698527veb.39.1366727803839;
	Tue, 23 Apr 2013 07:36:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 07:36:23 -0700 (PDT)
In-Reply-To: <CADV-EXH6gLETd1-1uMX5e2KSdyw_ph_OGG9cveFy4ysf8Fq_NA@mail.gmail.com>
References: <1366708403-45429-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LZsrvMLioXtKtZHmnRExnLVOqy9QmHOXUKJLEKNP4fXzw@mail.gmail.com>
	<1366725166.23738.63.camel@ted>
	<CADV-EXH6gLETd1-1uMX5e2KSdyw_ph_OGG9cveFy4ysf8Fq_NA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 15:36:23 +0100
Message-ID: <CAJTo0LYPFJooqAA92hcyD5uX1URKW1wvNu-hv0pA1mMOkmXJzA@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQkepbcafWvJrqkkIcxvLgn8gAbqClJ4uYQv/iEEjk1fsSi1h3K/mQ4Lzs8fLkDSFdvJEpfz
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 14:54:35 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 15:26, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> It isn't a pure python package but a combination of C library and
> python therefore -dev and -dbg are needed.

FILES_python-${PN}-dev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"

Nobody will be linking to that library as it's a shared module and
Python won't read .la files when looking for modules, so you don't
need this.  Just delete it instead of packaging a useless file in a
useless package.

Ross


