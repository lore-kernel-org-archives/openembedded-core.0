Received: from mail-gh0-f175.google.com ([209.85.160.175]
	helo=mail-gy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SQOf7-0006ko-MB
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 21:59:33 +0200
Received: by ghbz2 with SMTP id z2so3250375ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=RsL3lqoxIboBaaCJv0HKA6SBeWEOmC2hIrJsJpG0oew=;
	b=LujQNt4ccilUPxuuIme7zfeg1VyAUxRXsqSXTJ7bjXOokSS0QKNLXunSMAh2GCrVXz
	bf7XkuijPosY7dHUhJaUzBTaWvXFrM7DRo6n1jYFJ94XHwIbQdgmFwolWj+qicpHqwt6
	N984ee50vg2Vt0kveoQUci1jzrxd+6s/PQ/IMg9BqLsn04Kcp37zB6dxkzV+LLfs4HSr
	MBIQCcSSVjToKJCn1SWZmkEnsC4VhajCNeArzNYhoSuh0+f52WKGXX3zedMa6a92RlS2
	LQRRF/ug4rwr2Ne8bds7SQYbmGi+AnyCljCeaRJBoIYEWcDXBOAUbImRXiWsNRTKyYwx
	USPw==
MIME-Version: 1.0
Received: by 10.50.185.195 with SMTP id fe3mr3787834igc.21.1336160985995; Fri,
	04 May 2012 12:49:45 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Fri, 4 May 2012 12:49:45 -0700 (PDT)
Date: Fri, 4 May 2012 22:49:45 +0300
Message-ID: <CAF6bG8djbQrRN5RoSPTdTha50qqEOp=CTxFk-AzWcprTvzO9+A@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting nonexistent files from debian.org not erroring but saving html-page as destination file, Was: [Patch] Update dpkg to one available
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
X-List-Received-Date: Fri, 04 May 2012 19:59:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 May 2012 19:06, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/04/2012 04:29 AM, Marko Lindqvist wrote:
>>
>> =C2=A0I'm trying to make my first openembedded-core build. That failed d=
ue
>> to dpkg-1.15.8.5 being not available for download any more.
>>
> This should be still available on our MIRROR.

 I now got similar looking problem with apt. At least this time (and
probably with dpkg earlier) it has downloaded something from the
debian server and happily saved that as correct file, and never
fallback to OE MIRROR. That apt_0.7.14.tar.gz file is actually
html-page, not 404 but something that debian server seems to return
when one tries to download already removed file.

>> =C2=A0Attached patch allowed me to get past that point (updating dpkg
>> recipe to use latest (1.16.3) dpkg), but as I'm just learning my way
>> around, this has not been subject to any real testing.
>>
>> =C2=A0- Changes equivalent to dpkg-deb-avoid-fflush.patch seem now to be=
 in
>> upstream (probably this exact patch applied)
>> =C2=A0- I just adjusted perllibdir.patch, but I'm not sure if it's neede=
d
>> at all any more. It was used to remove unconditional PERL_LIBDIR
>> assignment, but now the assignment is conditional in upstream anyway
>>
>
> Thanks for creating this update, we would like to take this, but if you
> could you please re-format this and send a proper patch to the list, best=
 to
> use either the "git format-patch" with "git send-email or the scripts
> create-pull-request/send-pull-request, also review the commit message
> guidelines at
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

 Thanks for instructions. I'll check those guidelines when as soon as
I have time and create patch according your policies.


 - ML


