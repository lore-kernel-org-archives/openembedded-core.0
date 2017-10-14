Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id DD4F1605BF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 18:46:19 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id i124so26996569wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d+js3qXYHhQkU21gM2SBVrJHQP+IIun5lYKIxg3ewnw=;
	b=wZPB/hXrxtyuva/D5kUi0SybdeOXs+MVRwsAGjjOkkOVP2wHB+CRTXWV7+iQplwHdw
	FzsvTCPuROWmoejAeL2ISB/8lFRMh7lLeN04goaJzgTD+MVbH70hwmZseRxwWyQ2U359
	9zIISTKwuB/2lghCjUldFZhKyIOwKt/12olyu0/KE3QvuN8bZR/plbqQ22mKCTWP5Lay
	MkzxTv2b6Z+XlGfplXdBXQDsZ56X21LgwLdwQ0bbWMJvpU0Awp3YUega819FQHtiClkR
	jkgrTD8DGFpUF7mcpNIk1r+kpgyiUjdOGFf7EkKXLWsalkGanjiW0S6d/ckyP+3W+zsr
	6Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d+js3qXYHhQkU21gM2SBVrJHQP+IIun5lYKIxg3ewnw=;
	b=F2oAEiyNWDX96dfoIsqw4zNzgg9Za+oWzDziWf7XRhcFW21tFfJSkm2YFfQdYtnBRW
	mmfNGz0HofFs7Kb/aSohBrrcTz+rJJYbt7+LBa11dMzzqMZui6TZqU1xbpH0wvf0XHCZ
	c5/uSr393bXWg9ou/ZtT+fVdWVOhZu1jMzX9GRuSxpgiL9JGfcUdHo6TmBNEbHLryMh6
	3R0aRWzDnHkE/AHW86BhxsLgS70zpix/Nl3cO5JQ0ZtCjGsuq4mEnvnrb4JTyxYulQkR
	GEJV2lidt2GgQY0o+Cmbg2IZCqpfvc/CedmAEty/KU9OVDTMfqBXNgRZ+ZzTxfJo6zR7
	HjNg==
X-Gm-Message-State: AMCzsaXp78I/3ENiqsZGw1i50qy6auKEdDDI76p5iCc7KLeLrCeqpRng
	5az7+m9vBlxG4VgB/LEzme1kV4knd35yjIR4Sck00Q==
X-Google-Smtp-Source: ABhQp+T7xKkYWemkf6rOlaHOxQbMzLBobarnvEp02bsLzOv895z7Z+X/MUBOLXpxOMhhvKI+n8tX3t19x08GfUv5c6M=
X-Received: by 10.28.146.18 with SMTP id u18mr3947626wmd.28.1508006780361;
	Sat, 14 Oct 2017 11:46:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.160.166 with HTTP; Sat, 14 Oct 2017 11:46:20 -0700 (PDT)
In-Reply-To: <CAMKF1sqZrYbJ6MgLdQ5gJ=ZZhx1Gn=uYUD-_3S__E8OiDrLXiw@mail.gmail.com>
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
	<1507922729-17240-2-git-send-email-pbarker@toganlabs.com>
	<CAMKF1sqZrYbJ6MgLdQ5gJ=ZZhx1Gn=uYUD-_3S__E8OiDrLXiw@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Sat, 14 Oct 2017 19:46:20 +0100
Message-ID: <CAPyrkgx9fCua34-6h=1zJ0FsP4Hjgy7-3n+xnkuREWw2+xQmhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] goarch.bbclass: Define HOST_GO386 and TARGET_GO386
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
X-List-Received-Date: Sat, 14 Oct 2017 18:46:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2017 at 2:22 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 13, 2017 at 12:25 PM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>> These variables are used to control the floating-point instructions emit=
ted by
>> the go compiler for x86 architectures.
>>
>> The default is '387' which disables the use of sse/sse2 instructions and=
 is safe
>> to use on all x86 processors from the i486 onwards.
>>
>> If TUNE_FEATURES contains a feature set which is known to support sse/ss=
e2
>> instructions then they are set to 'sse2' to enable the use of these
>> instructions. This is suitable for most processors from Pentium 4 onward=
s.
>>
>> Only the 'core2' and 'corei7' TUNE_FEATURES are defined in the oe-core l=
ayer and
>> are known to support ss2 instructions. Other layers may introduce additi=
onal
>> tunings which support sse2 instructions and for these layers, TARGET_GO3=
86
>> or go_map_386 should be overridden as needed.
>>
>> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
>> ---
>>  meta/classes/goarch.bbclass | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 659b26a..653f035 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -4,10 +4,12 @@ BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
>>  HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS'), d)}"
>>  HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
>>  HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEA=
TURES'), d)}"
>> +HOST_GO386 =3D "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEA=
TURES'), d)}"
>>  HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
>>  TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS'), d)}"
>>  TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
>>  TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE=
_FEATURES'), d)}"
>> +TARGET_GO386 =3D "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE=
_FEATURES'), d)}"
>>  TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
>>  GO_BUILD_BINDIR =3D "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_G=
OTUPLE') =3D=3D d.getVar('HOST_GOTUPLE')]}"
>>
>> @@ -66,6 +68,15 @@ def go_map_arm(a, f, d):
>>              return '5'
>>      return ''
>>
>> +def go_map_386(a, f, d):
>> +    import re
>> +    if re.match('i.86', a):
>> +        if ('core2' in f) or ('corei7' in f):
>> +            return 'sse2'
>> +        else:
>> +            return '387'
>> +    return ''
>> +
>
>
> This is too conservative IMO, e.g. anything above i586 is able to handle =
sse2
> with this patch i686 will use x87 for FPU,
>

The Go documentation says "Pentium 4/Opteron/Athlon 64 or later"
(https://golang.org/doc/install/source). GCC documentation also
suggests that i686 is too early to support SSE2:
https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html#x86-Options. So I
think i686 should be using the old-style FPU instructions.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

