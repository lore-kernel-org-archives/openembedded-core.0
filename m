Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RoSQz-0004yu-SA
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 05:20:10 +0100
Received: by pbaa11 with SMTP id a11so590525pba.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 20:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=f7T0ZHDUW+zzYIUQJadU8LEb67uePid/iUJgYJiv4Tk=;
	b=RWFCH81+l7tcelysJGO9iZ1+ARRs+ZVjj/szLudflpXz4ofdgLiIA73miwjwDSg5pt
	Hun7c6Kf2LH7wJlFrwJpVTzrf1jkxs8HEZWISzfWlC4v8VhWbkVggIy1NJf4pelCzzDv
	XcpXB/7gjGW6wQl1kSH2dbK75E5Q0cDZ2jyaY=
MIME-Version: 1.0
Received: by 10.68.120.72 with SMTP id la8mr2217686pbb.56.1327119147672; Fri,
	20 Jan 2012 20:12:27 -0800 (PST)
Received: by 10.143.10.7 with HTTP; Fri, 20 Jan 2012 20:12:27 -0800 (PST)
In-Reply-To: <4F1A3608.70002@linux.intel.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<4F1A3608.70002@linux.intel.com>
Date: Fri, 20 Jan 2012 23:12:27 -0500
Message-ID: <CADkTA4MWvSsScXymA1-3vStE4qrY6yR5p3-8QG8FkN+-rqaYvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Sat, 21 Jan 2012 04:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2012 at 10:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/05/2012 12:37 AM, Liming Wang wrote:
>>
>> Hi Richard,
>>
>> These patches are aimed to replace emulation of qemuppc from prep to
>> mac99.
>> With this new emulation, qemuppc now supports framebuffer and the networ=
k
>> works well.
>>
> Is there anything that needs to be setup differently for the runqemu
> scripts? =A0Our sanity tests have failed after changing to the new ppc co=
de
> and I wonder if there is something for the command line or ???

What type of failure ? boot ? I'm building and booting it all the time, so =
I can
help there. Or are you talking about something in particular like the netwo=
rk ?
disk ?

Bruce

>
> THanks
> =A0 =A0 =A0 =A0Sau!
>
>
>> The kernel config also needs modification and I will let Bruce to review
>> the
>> patches.
>>
>> The following changes since commit
>> 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:
>>
>> =A0 distro: Add poky-tiny distro definition
>>
>> are available in the git repository at:
>>
>> =A0 git://128.224.162.211/poky.git qemuppc-new
>>
>> Liming Wang (4):
>> =A0 =A0 =A0 qemuppc: replace emulation of qemuppc from prep to mac99
>> =A0 =A0 =A0 qemuppc: add pointercal file
>> =A0 =A0 =A0 qemuppc: add machconfig
>> =A0 =A0 =A0 tslib: enable big endian support for qemuppc
>>
>> =A0meta/conf/machine/qemuppc.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
>> =A0.../formfactor/files/qemuppc/machconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
10 ++++++++++
>> =A0.../pointercal/files/qemuppc/pointercal =A0 =A0 =A0 =A0 =A0 =A0| =A0B=
in 0 -> =A036 bytes
>> =A0meta/recipes-graphics/tslib/tslib_1.0.bb =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>> =A0scripts/runqemu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A07 +------
>> =A0scripts/runqemu-internal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 16
>> ++++++++--------
>> =A06 files changed, 21 insertions(+), 15 deletions(-)
>> =A0create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconf=
ig
>> =A0create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointerc=
al
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


