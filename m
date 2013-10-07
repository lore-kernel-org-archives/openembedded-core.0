Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A242C60FD4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 09:32:32 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ld13so2882482vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 02:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W5V6QYcZTMr65VoVOLBXBfKsLDHZdp/PKQ/7KuiBZRg=;
	b=Vv+GmXoui0bOZYCVeDj7Ax8uutq7PqAIzsbF0GBbsi7UoBhjufWgBIf4LOkpiFNl6L
	UA2TQ93ZWMKNH91sLzloa/MsHKm+ilqv/753uRYBxza13ou384lV1r7ugeWmv/MPcCkX
	yCvsqUUt+srBs3QXJeK70GHY6inS+9jHrKOMAsg5xpelUbwBayiUo/Do0TCNJatOSAeb
	xmPtvXYXGO2QNN4RYQUzfePbf9dSYhxsVTXHhNxefmuqb0zHK/M9Se703wfjKRbmYyUM
	M4aH+hJkUiQyqC9lIFnRxfEbj2W/qNHqqOtUFNvRYEGIoZNis9SpcYR54ct+KxpQbm0T
	nNPg==
X-Gm-Message-State: ALoCoQk2oGNwArH2XMryqOUh+Ao3bYAHlKlB8Il/qlu/8UatWmUAi8OHy6FUMPy5qZcoMKsrcpTm
X-Received: by 10.220.91.16 with SMTP id k16mr694072vcm.21.1381138353889; Mon,
	07 Oct 2013 02:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 7 Oct 2013 02:32:13 -0700 (PDT)
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Oct 2013 10:32:13 +0100
Message-ID: <CAJTo0LZNNheEJUOU83wj-5LEB43YPSDZoW18fNGpjjSsdWetVQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 00/14] Deterministic dependencies II
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
X-List-Received-Date: Mon, 07 Oct 2013 09:32:34 -0000
Content-Type: text/plain; charset=UTF-8

On 5 October 2013 13:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> Martin Jansa (14):
>   gstreamer1.0-libav: Add PACKAGECONFIG for orc
>   libunique: Add PACKAGECONFIG for dbus
>   aspell: Add PACKAGECONFIG for curses
>   xf86-input-synaptics: Add dependency on libxtst
>   xdpyinfo: Add dependency on libxcomposite
>   matchbox-wm: Add dependency on libxfixes and libxcursor
>   telepathy-mission-control: Add PACKAGECONFIG for upower and
>     connectivity
>   tcl: Add dependency on zlib
>   wget: Add dependency on libpcre
>   x11vnc: Add PACKAGECONFIG for xinerama
>   glib-networking: Add PACKAGECONFIG for p11-kit
>   lame: Add dependency on ncurses
>   subversion: Add dependency on file for libmagic
>   systemd: Add PACKAGECONFIG for cryptsetup

All looks good to me.  Worth noting that the telepathy-mission-control
changes will need changing when 5.15.1 onwards is integrated, and it's
clear that matchbox-wm needs to share a .inc file.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

