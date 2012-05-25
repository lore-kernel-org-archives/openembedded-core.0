Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1SY1BN-0008F3-26
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 22:32:21 +0200
Received: by yenl13 with SMTP id l13so696446yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 13:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=q3qTPlg26GPC+7lfPXO+awUs7qzQpkwH4CAu6ffWetk=;
	b=mooq75bf+FUW+Mh34o96Yg+FwOjrFzKCKtKZzvqYRNxLlLY6AC2XMUgyufWUXhOkvW
	WeP461d+sZ8WUGkllavPg4iOlWaFir+HNSKtAxhaLYZjjUVW+lUz/Dz+UkVjXZK16klq
	GfUc49EabefktmSv/2vBcBmD2dw6kFvIQiPubTF2YV04WQm/SFguSiEoDsrHcGnyCe/K
	JBYSyQEchI8YLbBhrxQWOaXC7AMmI9RU3pvYTi0ghtftVLVEnJ8oo2bXBmaWpFkKThsN
	2FdPoLMYBBofm8wnVse6iCZtE8Hag4k+NFbAgzyXxI7euPtfjwbVoa+jaaPTgyAzKHhj
	fk1A==
MIME-Version: 1.0
Received: by 10.50.47.135 with SMTP id d7mr164060ign.66.1337977327842; Fri, 25
	May 2012 13:22:07 -0700 (PDT)
Received: by 10.231.158.7 with HTTP; Fri, 25 May 2012 13:22:07 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
Date: Fri, 25 May 2012 16:22:07 -0400
Message-ID: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnjE8NQJrkdi6DMKuyuik0dr+UpfCzSHhLg7j8WVonXqg11wgINZgVzg/Ls6dwjPu2Le5hL
Subject: /sbin/init not found in oe-core
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
X-List-Received-Date: Fri, 25 May 2012 20:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm trying to switch from OE classic to the new openembedded-core.
Using the latest commit on the denzil branch, I've successfully made a
meta layer and built a filesystem that looks reasonably similar to the
old one. But, it seems like something has changed in the boot process.

As the last step in initramfs/init.sh, after mounting the filesystem,
the kernel would attempt to execute /sbin/init like this:

    exec switch_root -c /dev/console /mnt/root /sbin/init

With the same old kernel and my new filesystem, this occurs:

    switch_root: can't execute '/sbin/init': No such file or directory

When I look at the filesystem, /sbin/init is, of course, nowhere to be found.

Has the boot process changed? What should I be doing instead of
calling /sbin/init?

Cheers,
Brandon
--
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA


