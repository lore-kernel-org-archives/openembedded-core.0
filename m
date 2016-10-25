Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCFAE71C2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:29:46 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 14so786562vke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KcxdUVwkSmWhx1hUyD3q/PgF63RqhHP03KXg1B28h54=;
	b=ReAvhPfPKD5zE70BLT315tRFECFuzAbvdJucErNHA1vG+BvhXBkP5uq2yytFazUjts
	HYHuuYhkeHtqDzTQQh4viQon8lhtjtL+i/un0ECOmrwOPLLdX6RLS4iC6n7iZVp+Io4w
	G2N8Zrdj86GO+7kpF418MECGOhY2AFj8bjimP8mxNjuK6lOK+vf6gM4Kkn6qnvbJBKnz
	f+tXtsB2vShl6OBPhYD5bGo5FyjGW9qiPkiBCnEZJTVhkXhuEUaNtl2yFY38fMXnTG3a
	zAzZ+zBjx9Lzh2ZVAYTO6Cz4Gbzs2kSMnWwCJpn1Ud6jvMddGv230qpO4Gveivmu8sRJ
	tLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KcxdUVwkSmWhx1hUyD3q/PgF63RqhHP03KXg1B28h54=;
	b=A910eJJ6iQcV16b3U8qIi2qYG3F2izdfxvJEKGju+OnNU3IXGJ9DeZ5ur36t93M+sL
	zz3hdJYBVRyyBOiLKvxuapPX05Hr+3kzPHs6Iqj1QR0MWgJPzZfr/dY/9+nAW/84P7Hw
	PS2qELvp4q8JSFBCU7KOCdW3p9H5f7W+OsQL7ngbVoy8bU3k0KunK38OF8hnQiVhU1FA
	UYVxmIE72nQnY+JTbTdeaAEUGqLpYOA68ikzdO3AJQSm/rRj+EYCFofCUifcXK9/cR8n
	Os7AKCLo/rY35bUqVXd2HqIIBeoUiAi/ddEb2sy0SG/I3aFi6pmLY0W3akErXuldmfgP
	AUlg==
X-Gm-Message-State: ABUngvd5B4wXvoDUFcJJ9ILX7GiIqM4CknVjW9gAO5wbCm2c6ZCfDughqZpqy5omNWZEaO+5FYUH+9b5NnlFZA==
X-Received: by 10.31.52.66 with SMTP id b63mr14775009vka.9.1477394987707; Tue,
	25 Oct 2016 04:29:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.153.194 with HTTP; Tue, 25 Oct 2016 04:29:47 -0700 (PDT)
In-Reply-To: <CAFkk2KRg0eC98kRU=vAbdCG8zLAaB6B9_H2tBiY-bweoNfLSsA@mail.gmail.com>
References: <1477390980-16319-1-git-send-email-michael.blaettler@siemens.com>
	<CAFkk2KRg0eC98kRU=vAbdCG8zLAaB6B9_H2tBiY-bweoNfLSsA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 25 Oct 2016 13:29:47 +0200
Message-ID: <CAFkk2KTg=et1wgtoHMhPdidNQ0iiGeJ95_2APkkQdj1=2yRd3Q@mail.gmail.com>
To: =?UTF-8?Q?Michael_Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package.py: New EXTRA_STRIPFLAGS variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Oct 2016 11:29:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 1:18 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Tue, Oct 25, 2016 at 12:23 PM, Michael Bl=C3=A4ttler
> <michael.blaettler@siemens.com> wrote:
>> The EXTRA_STRIPFLAGS variable can be used to pass additional parameters =
to the strip command.
>> This can be used to remove additional sections or to keep symbols.
>> The removal of additional sections can be useful to enable reproducible =
builds.
>> Sections which contain paths or md5sums of the debug binaries (like gnu_=
debuglink)
>> can be eliminated with this flag.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> Signed-off-by: Michael Bl=C3=A4ttler <michael.blaettler@siemens.com>
>> ---
>>  meta/classes/package.bbclass |  5 +++--
>>  meta/lib/oe/package.py       | 13 ++++++-------
>>  2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index a6f0a7a..05b92a8 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1055,14 +1055,15 @@ python split_and_strip_files () {
>>      # Now lets go back over things and strip them
>>      #
>>      if (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
>> +        extraflags =3D d.getVar('EXTRA_STRIPFLAGS', False)
>
> Why False? That means you can't do e.g.
>
>   EXTRA_STRIPFLAGS =3D "${EXTRA_STRIPSFLAGS_HELPER}"
>
> or
>
>   EXTRA_STRIPFLAGS =3D "${@calculate_extra_stripflags()}"
>
>>          strip =3D d.getVar("STRIP", True)
>>          sfiles =3D []
>>          for file in elffiles:
>>              elf_file =3D int(elffiles[file])
>>              #bb.note("Strip %s" % file)
>> -            sfiles.append((file, elf_file, strip))
>> +            sfiles.append((file, elf_file, strip, extraflags))
>>          for f in kernmods:
>> -            sfiles.append((f, 16, strip))
>> +            sfiles.append((f, 16, strip, extraflags))
>>
>>          oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>>
>> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
>> index 02642f2..757044a 100644
>> --- a/meta/lib/oe/package.py
>> +++ b/meta/lib/oe/package.py
>> @@ -10,7 +10,7 @@ def runstrip(arg):
>>
>>      import stat, subprocess
>>
>> -    (file, elftype, strip) =3D arg
>> +    (file, elftype, strip, extraflags) =3D arg
>>
>>      newmode =3D None
>>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
>> @@ -18,17 +18,16 @@ def runstrip(arg):
>>          newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
>>          os.chmod(file, newmode)
>>
>> -    extraflags =3D ""
>> -
>> -    # kernel module
>> +    extraflags +=3D ' '
>
> I'd remove this line and add an extra space to the beginning of the +=3D
> values below, but no biggie.
>
>> +    # kernel module
>>      if elftype & 16:
>> -        extraflags =3D "--strip-debug --remove-section=3D.comment --rem=
ove-section=3D.note --preserve-dates"
>> +        extraflags +=3D "--strip-debug --remove-section=3D.comment --re=
move-section=3D.note --preserve-dates"
>>      # .so and shared library
>>      elif ".so" in file and elftype & 8:
>> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D=
.note --strip-unneeded"
>> +        extraflags +=3D "--remove-section=3D.comment --remove-section=
=3D.note --strip-unneeded"
>>      # shared or executable:
>>      elif elftype & 8 or elftype & 4:
>> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D=
.note"
>> +        extraflags +=3D "--remove-section=3D.comment --remove-section=
=3D.note"
>>
>>      stripcmd =3D "'%s' %s '%s'" % (strip, extraflags, file)
>>      bb.debug(1, "runstrip: %s" % stripcmd)
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> Cheers,
> Ulf

This might still have issues if EXTRA_STRIPFLAGS is unset by the way.
Maybe you want the following, to avoid extraflags becoming None:

  extraflags =3D d.getVar('EXTRA_STRIPFLAGS', True) or ""

Cheers,
Ulf

