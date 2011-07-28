Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QmL6y-0008QC-7e
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 09:34:28 +0200
Received: by wyg30 with SMTP id 30so1719033wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=n5C7Cq9dPr62UQ7rEWGga9XJyoQkOxfIw5OuW0RztYQ=;
	b=yBmHoLytAMOSVbIlOEthOPVyEQgGrvFbxCdoHrL7o3u+XwKoaaZg9mg+vtNxs9WqJy
	8WjVBN9SWPGQQL+99fck76Ki9667bJsEXK9/l6BZHn0wNPdUAQED0Hg11w6zgiNIA+2P
	Makp5Vo1fuAMxy37+layyFk2CX8g3CzU0ESrI=
MIME-Version: 1.0
Received: by 10.227.129.18 with SMTP id m18mr7574082wbs.91.1311838212972; Thu,
	28 Jul 2011 00:30:12 -0700 (PDT)
Received: by 10.227.23.209 with HTTP; Thu, 28 Jul 2011 00:30:12 -0700 (PDT)
Date: Thu, 28 Jul 2011 09:30:12 +0200
Message-ID: <CAGiJk9fwxUGUbb1Fwf731X+Ujz4RN_3OkXpGHcJq+ER_sYMRQQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Sanity check failed after glibc deletion (was: Re: [PATCH] glibc: deleted)
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
X-List-Received-Date: Thu, 28 Jul 2011 07:34:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

My current configuration was set up with the help of the Angstrom
instructions [1], and I applied patches via the "oebb.sh update"
command.
Running Bitbake would show the following sanity error on any image / machine:

samuel@S-Linux:/var/oe-core/setup-scripts$ bitbake console-image
ERROR:  Poky's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    You have a 32-bit libc, but no 32-bit headers.  You must install
the 32-bit libc headers.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed


For me it looks like an error with my configuration, but on the other
side, before the update building images with bitbake worked.
Well I don't know exactly if this is caused by the glibc deletion, but
IMHO it seems very likely.
Anyone else faced the same problem?

Help would be very appreciated.

Regards
--Samuel

[1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/README


