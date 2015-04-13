Return-Path: <janne.karhunen@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD40573D36
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:44:20 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so106073770pab.0
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=vb5XUnEZig7yelXio53Wlr64E2JOn/82R67+OzpqKrc=;
	b=dFPSPmxtYgR28otfcoJtvFpDtmoTMRh02l/YVQn38WeivTn40NytUzlqA6RVJPR/1k
	V/PXHA1v6eYge2xO09kZgdnUf4vlm2TarFSvx92+UDrWrKzaswVLkuOOkHOdYRSBHX4b
	eB6gslyg3+Ob8OLudZqOqJATfgm5ealoTBihVDImL/i9HCewT2Z1qEhTvRPOC0NemUtX
	IOQxNpCyuFbj7lCC9T9Ouq4yMumeDLjF/O/Ync9nXnKPxhXbaAEn+hKOyBZnAGwMVG+H
	MpAQYbXCbuLIgKWaS6TLGfI6Evlc+mACsiAk7gDYQDjz2bMo1LX5ToJh0HMvIgEA+/Bp
	H73w==
MIME-Version: 1.0
X-Received: by 10.68.254.226 with SMTP id al2mr27932459pbd.44.1428939862298;
	Mon, 13 Apr 2015 08:44:22 -0700 (PDT)
Received: by 10.70.132.162 with HTTP; Mon, 13 Apr 2015 08:44:22 -0700 (PDT)
Date: Mon, 13 Apr 2015 08:44:22 -0700
Message-ID: <CAE=NcrY2Y3dmF5qmfS1=QXcE0k1OOX8GdWMo7PDZ+W348ZSxaA@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: compiling the host tools natively for the host Linux?
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
X-List-Received-Date: Mon, 13 Apr 2015 15:44:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Is there a way to compile the host tools (primarily interested in the
compiler) for the host Linux rather than for the own distro? I'm
comping the toolchains & sysroots as RPMs and the relocation of the
toolchain from $RPM_BUILD_ROOT is a bit painful due to the own distro
being used to run them. I'm doing that in RPM %post with patchelf &
chrpath, but it is getting hairy.


--
Janne

