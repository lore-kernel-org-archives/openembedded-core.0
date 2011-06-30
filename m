Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcQqi-0004p3-BR
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:40:44 +0200
Received: by pzk36 with SMTP id 36so175444pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=lj8Nd0DHPLbWp5pzI/RTtu8p18tFokUQfQvWMNAZCuM=;
	b=hisjjTu5C3qACE9/91vFtmihJDC6ftF30EsLAufJ5cpkRA4lgHcID6h0EGOunjdKLv
	Ahf1Sy4ldgGUbbFjjX8G5wwvXaAw8+4IycZFXt+0xx2FQlV/upQ/cMIHhTipmWRaAQi9
	JEzhStq1tYtrZ0Lp8CArIR0xFMV/d8UPvriIg=
Received: by 10.68.40.129 with SMTP id x1mr3200306pbk.29.1309477019074; Thu,
	30 Jun 2011 16:36:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Thu, 30 Jun 2011 16:36:29 -0700 (PDT)
In-Reply-To: <1309473020.20015.478.camel@rex>
References: <cover.1309420894.git.raj.khem@gmail.com>
	<1309473020.20015.478.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jun 2011 16:36:29 -0700
Message-ID: <BANLkTim6Qvrc1K8788QMHCZArRvZ=MZ0WA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] uclibc config cleanup
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
X-List-Received-Date: Thu, 30 Jun 2011 23:40:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2011 at 3:30 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-06-30 at 01:06 -0700, Khem Raj wrote:
>> We do not need machine configs or even arch configs since we construct t=
he bits
>> in .inc files. Once anamoly is mips where we do not use default ARCH for=
 o32
>> which is mips1 but we use mips32 so thats the reason we have a separate =
config
>> for mips.
>>
>> Additionally fix boot issue found on mips which were exposed by udev 171
>>
>> These patches have been tested with builds from scratch for all supporte=
d qemu machines
>> and incrmental too (for qemumips)
>> and angstrom/console-image is booted on all supported qemu machines
>>
>> The following changes since commit ae4c2b8834dc4d88be7207ea5c45c596bb46f=
ded:
>>
>> =C2=A0 uclibc: Fix bug exposed by udev 168+ for mips architecture (2011-=
06-30 00:52:32 -0700)
>>
>> are available in the git repository at:
>> =C2=A0 git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-=
cleanup
>> =C2=A0 http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/l=
og/?h=3Dkraj/uclibc-cleanup
>>
>> Khem Raj (6):
>> =C2=A0 uclibc: Remove redundant machine/arch configs
>> =C2=A0 uclibc-config.inc: Fix regexp to determine big-endian arm
>> =C2=A0 uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
>> =C2=A0 uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
>> =C2=A0 uclibc: Add UCLIBC_HAS_FLOATS=3Dy to uClibc.distro
>> =C2=A0 uclibc: Fix bug exposed by udev 168+ for mips architecture
>
> Merged to master, thanks.

Hi Richard

Somehow first patch that got merged was older version I guess from the
one I posted to ml
before the pull request got in. So I have sent a follow up patch which
adds the missing
parts. The patch is here

http://patches.openembedded.org/patch/6769/

Please install

Thanks
-Khem


