Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6qAf-0003a9-KB
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 23:51:33 +0200
Received: by eaad12 with SMTP id d12so284258eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 14:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d12wI24QCIWFrfxyeDIRG25A8+ss6hqgCulwlROEgXI=;
	b=yN9Pe6k1O+kQ+3RTzkdfiDofrCaHoJbbXWb6a0FYDokQrAxIhXRGxmWw+ykTeKLIKf
	dl5Usd7BbbcQWAWuOlJZVEqxHaAJH0QdPNnBKyma/syGdCfKRj6QlPmeTHp8K9cV94NB
	6P0jwVkfcLAW6UQdIQhCEeD4ePDk5sOY+zffkkmGN7E06uci8qXevqfzcs8P2n1aDiBb
	mrISQe1UBDnlrD41b/yiXviomVEUSBqW3vGe/0h21L4JPUwifsMfhyNoXUKW8iySQZcf
	p8QHOoUr4H6ENLvj+Q5gW2n/G+ntpsuJRSqdK3Z9w7cukgH3rXBT1M4aCPA4t3bXekJK
	1+bQ==
Received: by 10.14.5.67 with SMTP id 43mr3846648eek.15.1346276359170; Wed, 29
	Aug 2012 14:39:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 29 Aug 2012 14:38:48 -0700 (PDT)
In-Reply-To: <CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2012 14:38:48 -0700
Message-ID: <CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>, Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 21:51:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 29, 2012 at 12:20 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> Sounds like they'll need to write a tool to run after every package
> operation and hunt out symlinks in /etc (and other top-levels) to
> files in /usr and turn those into copies.  Anything attempted on a
> per-package level will fail.

why cant you have symlinks across /usr and / all you have to do is
ignore the warning
about cross reference. We dont want to be in a situation where
everything is ending up
in /lib and /bin and so on. I am afraid thats where we are headed as
more and more patches are coming where we are moving libraries from
/usr/lib into /lib against the wishes of package owners who want them
to be in /usr. rest of linux
world is moving in opposite direction where /usr is just fine and
considered existing along with rest of basefile structure.

see

http://lwn.net/Articles/483921/

http://lwn.net/Articles/431185/


 More and more packages are now assuming /usr
and we would have to keep fixing them to support our view of world if
we go strict
about enforcing / and /usr separation there is unionfs and initramfs
and so many other techniques to solve this problem now a days we dont
have to differentiate between / and /usr


