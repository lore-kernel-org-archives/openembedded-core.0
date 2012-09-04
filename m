Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8pja-0002e0-Ew
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:47:50 +0200
Received: by iaky10 with SMTP id y10so8999922iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yc+PqNTQ+BmDosZ+icfj6J/oQZdH/7yQkB/YyjvICiE=;
	b=d9PzS0A5huYC+FR8xqqbAZXP3mr8jYPEl4Wjr+E8m5uhz2frzkh4hfb4cxy+vv259R
	Y/rfkMt+KTj368kNNuB3U7wIyuzZdAVbdT0Zk41AgfV9RgNOBkQqVCySNbbmhh4ZPhIX
	XXWz89LAYlvOLSbzZOgZ+Y9cmRgwOMMhwP3x6+fk2Ms3tf+rGf8tCrZkFLWG4pmU7fJH
	V/3S/8fS7gPARaoQ8PcM+5kr2IGlUPFjBGey7aSONvNXX2fL2QiCsOZzJG2tKdj6zn4z
	itX/dXDqz2GIM72RDZlZr4OIBdOL2FqEMRchFvaTYdUQci64wgUXyPNyXeyEdOcRGyzg
	MJ4w==
MIME-Version: 1.0
Received: by 10.50.33.138 with SMTP id r10mr13393779igi.31.1346751328150; Tue,
	04 Sep 2012 02:35:28 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Tue, 4 Sep 2012 02:35:28 -0700 (PDT)
Date: Tue, 4 Sep 2012 11:35:28 +0200
Message-ID: <CALbNGRTHoEqc5FBuNDCiOogU+xker62u3ue4paTTvwr3EFfgvA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: checksums linux-libc-headers
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
X-List-Received-Date: Tue, 04 Sep 2012 09:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

checksums changed upstream?

| File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
has md5 checksum 635c7c2376b9eda4c0ccc67d34205e73 when
3aefa02db55715d627ed23a01667057d was expected
| File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
has sha256 checksum
2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0 when
17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc was
expected
| Your checksums:
| SRC_URI[md5sum] = "635c7c2376b9eda4c0ccc67d34205e73"
| SRC_URI[sha256sum] =
"2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0"

Andreas


