Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RR9l8-0007T7-Ii
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 22:44:38 +0100
Received: by wwf25 with SMTP id 25so10645300wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Ni7JfpH7PB5X6y3DhhFjraX3fO3sRcEKXCylQZptMZU=;
	b=aDbAT38US/T5Hs05dP1imsVJVaktnm9HMGpiz5Cmw36pCxMzxUnpNbV4ktWstzNeVs
	fUyByQMCsbpbWdC7B6qwluIwHPce/A7wEJ3lp31MdgHp0iDFreGVMT8uzzn4oIN/phg6
	fk5mIpZzwKIoQIV8OHdruwe2mrfKrLsmLgA3o=
Received: by 10.227.204.143 with SMTP id fm15mr224961wbb.26.1321565893157;
	Thu, 17 Nov 2011 13:38:13 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Thu, 17 Nov 2011 13:37:52 -0800 (PST)
In-Reply-To: <1321547193.12103.5.camel@mattotaupa>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
	<1321547193.12103.5.camel@mattotaupa>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2011 14:37:52 -0700
X-Google-Sender-Auth: WlT4FpOP_GvulpbqtgtlDhioGTQ
Message-ID: <CABcZANmNDjxSjjocJH80Jq8r_iSNy7L2ABASKOtKSWa1GEo6Qw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 21:44:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2011 at 9:26 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 17.11.2011, 10:48 +0100 schrieb Henning Heinold:
>
>> with the setup now in useradd.bbclass, at least dbus-native depends
>> on the base-passwd from target. I think this is not wanted.
>> My patch resets the DEPENDS line for native packages similar to
>> nativesdk.
>
> why do not you use that as the commit message? That would be very
> helpful for me at least. ;-)


The summary often describes the what, the detailed description the
how. The summary here is accurate, particularly regarding the
behavioral change, rather than the implementation details.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


