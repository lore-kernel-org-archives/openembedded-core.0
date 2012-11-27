Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdMAR-0001gm-4y
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 15:29:43 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3320788pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=V28fEe5eVSbMG5FPjM8g2nslqXFwFBXo5p8E6+SjpCA=;
	b=alUp8VXXh4YWkZEKzZR17+8p9oQZ5P0Sy2fb9DuUEUYsP2IHWhYGGFnPGNzvnEXZU6
	3JS8r8LjnJLRoxW9AtXaNJHjw2Y3DEbEepwfA2mxJRLVzkhTH4sF5Q9hyIoYG94hhis0
	O1ae2E8ms5YWtSklhMvhh07+LW0L+G1ER9umtESp/6m9gAcEAoPq8gBn9mc0I+K6moal
	l00/OzuZEc7MO5uGhhGdIR/O6W8YDSE9ZaU8C7joVzm2OyTUnlrKCPS4goFKaPyw7l+g
	h2vH8U0kazrvvH+olCWYr0diEn6ruAwxrcxpSBLd7s+D4ozyfJriuBCswOCCOXPGd1ae
	razg==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr49226369pbb.49.1354025729244;
	Tue, 27 Nov 2012 06:15:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 27 Nov 2012 06:15:29 -0800 (PST)
In-Reply-To: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
Date: Tue, 27 Nov 2012 12:15:29 -0200
X-Google-Sender-Auth: o7LhoPWouOQZSJn0ESPx-m66OnQ
Message-ID: <CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
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
X-List-Received-Date: Tue, 27 Nov 2012 14:29:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad
<muhammad_shakeel@mentor.com> wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> From udev 174 changelog:
> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems
> and non-dracut initramfs image generators need to change the init
> scripts. Alternatively the udev build needs to move udevd back to
> /sbin or create a symlink in /sbin, which is not done by default."
>
> Also for 64 bit architectures there exists /lib64/udev instead of
> /lib/udev and current init script fails to start udev.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>

As far as I know, all code in master now handles it properly (the
missing bits I sent a patch today) so why to include this symlink?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


