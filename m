Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1083171B2E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 12:52:35 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b189so1921845wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 05:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cNkv9ILvbPVgWIRqR/EAzfSCe9n6AccSKGerDeYaRH0=;
	b=iO5RtH4T1APHN3ySnGxdmZXKEgKRJvAHjfgySWW0SKlMs58qChBaN4HX4/Zyz6FNxZ
	M6LSsCSkNmywBKmsHwYidCOuzKuW/LMEcPyZvNz0WUSYsh3ajZvzfHDXLebRSREVXgOv
	IPDYc1B0w1xa3HwTeDjWvNkm5PnLwZS6mvwiD7rn2uSu7d51BUzJdG3OvJ0yg2alAFGn
	y9Fmlnoy4lEwo9OBzoL00fxILOSYUGH2be5BPcPsnCHon4U61okP0GUmv3RtQpY0NGd1
	Ohw3yUxPhfNQuMvxGYUh1DK21FrEi9otp41x/A5iR3VHJHB/RWxYBgQIlg09w8Q9JyVB
	wEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cNkv9ILvbPVgWIRqR/EAzfSCe9n6AccSKGerDeYaRH0=;
	b=bzd3LnYlfjWxx9msPWC9tbYNivr8dkOOQOBM4HQuVrt3qzruGsigCkmNGo6brc6o/G
	TfNyoArb130yLP+1+I01GVe1aFgycFJ1B4nhsWGHBsif5dziUvrdnlGkPyDwf3aV3REg
	rzXx2JORu5k0HgAXoDYJYQVUWSZ0YZ+bJ9Ra18ZMqekveInF3v9/aM5dHJcwH9zizgb5
	AtAHA4Dx1oDpqjUrTTfnsxUq0Bl+fDrIe7v1krqSiiYP219RRVFHZN9zAKtz86ZmAtnt
	6Zt1QJw1GRSvSZM25SWjcL0H0y+C7qHBA6EcuK42S78x34zA+ERFc4IZ05OW9Ulo9iG6
	pHOg==
X-Gm-Message-State: AMCzsaXMSCXqssV8SNAg25G3U3by1TFpRaCerLUOum9HiMKFB2xI8Y9g
	iWr4U6CoBE6P2iOZx2d9Weh7XiM4Q8Qpth3cEUak8Yjm
X-Google-Smtp-Source: AOwi7QBn8a/NWlImZJX763KLU927DEnPHiJq5KuCxLNHm1mO242qlGh4SQ/WdyvS9RTWhQqnGNvFiqhOLBdSqCK+coY=
X-Received: by 10.28.19.11 with SMTP id 11mr20331925wmt.122.1507207956469;
	Thu, 05 Oct 2017 05:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Thu, 5 Oct 2017 05:52:36 -0700 (PDT)
In-Reply-To: <CAGgRHJrwm9yWbSrK_3FpgTxKVuAjhpF31U9TAUeq9asLhY91Ag@mail.gmail.com>
References: <CAPyrkgyyXnZCkL=_GzW1pwfXzUmRrRQ8UiqNDcKdGiNqc5ruSQ@mail.gmail.com>
	<CAGgRHJrwm9yWbSrK_3FpgTxKVuAjhpF31U9TAUeq9asLhY91Ag@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 5 Oct 2017 13:52:36 +0100
Message-ID: <CAPyrkgztm6u2_qchXmG7eRPtMVBuMzLFR+=FVnFv4N1zmyy_aw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Go runtime host contamination
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
X-List-Received-Date: Thu, 05 Oct 2017 12:52:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 10:22 PM, Matt Madison <matt@madison.systems> wrote=
:
> On Thu, Sep 28, 2017 at 10:28 AM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>> Hey,
>>
>> I'm trying to upgrade runc-opencontainers in meta-virtualization to
>> v1.0.0-rc4 and hitting a host contamination issue.
>>
>> Both host and target are x86-64 but I'm using glibc on the host
>> (Ubuntu 16.04) and musl on the target. I'm getting link failures
>> referring to missing symbols "__vfprintf_chk" and "__fprintf_chk" in
>> libcontainer. I'm pretty sure these symbols exist in glibc but not in
>> musl.
>>
>> The failure is occurring when trying to link libcontainer which uses
>> the go extension cgo to incorporate some c code in with the go code.
>>
>> Using a pretty dumb grep, I can see the contamination in the go-runtime =
package:
>>
>>     $ grep -r __fprintf_chk
>> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/
>>     Binary file
>> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/h=
ost-tools/trace
>> matches
>>     Binary file
>> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/h=
ost-tools/pprof
>> matches
>>     Binary file
>> tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/pkg/l=
inux_amd64/runtime/cgo.a
>> matches
>
> Yep, I see what's going on here.  I have a patch in the works to take
> care of it.
>

Right, with a detour via the innards of the go linker I've finally
spotted the problem here.

The recipe in question is overriding GOROOT in the do_compile stage to
point at recipe-sysroot-native.

With that fixed, and Matt's latest patch on the oe-core mailing list
applied, runc-opencontainers now builds as expected for qemux86-64.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

