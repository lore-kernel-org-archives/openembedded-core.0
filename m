Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1RkiSn-0002V7-7v
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 21:38:33 +0100
Received: by qcqw6 with SMTP id w6so2750786qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 12:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:in-reply-to:date:message-id:mime-version
	:content-type; bh=1GuM6nM8WnjLp/Sg+ziWtJbwrEtypx1LRVDV/p/8/Tk=;
	b=fYyJ4dzCqaIkeL/Pkir0tMmPN1CycQ3sNjiG6IMamyOiGyJgEynyFI19hn+iSpMIoT
	BwjYB3PZJha0FUOtypwaPgkO7/KWTWbjtFzW0j4W4eeHqVYAgG+ab8IZV9wKUD1XJuqE
	wfGRjfwISQWEPbdY2siBKprv7llDoztu7Hw+4=
Received: by 10.229.75.135 with SMTP id y7mr8568007qcj.40.1326227463602;
	Tue, 10 Jan 2012 12:31:03 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id o8sm137100316qaj.0.2012.01.10.12.31.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 12:31:03 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 10 Jan 2012 15:31:13 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <1326227050.3234.5.camel@lenovo.internal.reciva.com> (message
	from Phil Blundell on Tue, 10 Jan 2012 20:24:10 +0000)
Date: Tue, 10 Jan 2012 15:31:13 -0500
Message-ID: <871ur7nvu6.fsf@sonatest.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Tue, 10 Jan 2012 20:38:33 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb@gnu.org> writes:

> On Tue, 2012-01-10 at 15:22 -0500, Marc Ferland wrote:
>> -PR = "r0"
>> +PR = "r1"
>> +RDEPENDS = "grep"
>
> Do you not get a QA warning for that?  Usually it would be RDEPENDS_${PN}.
>
Nope. Everything looks fine. Whant me to resubmit the patch with
RDEPENDS_${PN}?

BTW I'm using yocto, if that makes a difference.

Marc


