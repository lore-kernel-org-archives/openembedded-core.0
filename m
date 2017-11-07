Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 242FF78462
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 15:50:41 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id o9so5604030ota.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=10hYciD9SRQtsP9qo7YGbMlVuCgwB8XZuOnxhnLJGKQ=;
	b=cZbuw790VZ/I6TfuCuX1pdm5pwpkt8J/iNHY0DcOPUbO9hO0Z8SNVsQiE417q9TZZL
	ohGj+g/9oVrFw8+L5yZgZtaT0AxFKfDyykrUn4syjv2VkwuTsuICrC3TU4XFJFtL0NWr
	gabCQDOWyti9DJAxUpmc+klHOWaiP8vchy/98O2tDGSj1Zkr8vStz1MmRbuNYJTHz4nB
	I/y1DvazGPojBmm8TstaVX+8u0QgvYKb4Epq+Le9LsC0S5IjhxXWuQuPyroV/AkwgD3l
	y56cW24kjPu7JB/FhUxyjWASgRgC4gSEsntPgig6jpVEO3hnfbiNk4nLANke5E/rb5z9
	3cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=10hYciD9SRQtsP9qo7YGbMlVuCgwB8XZuOnxhnLJGKQ=;
	b=q96Q+Fdyqpg6p3kviq/0ALUiCm75KoPermqsu8qdtMAv0YVDdNiOIGVN+Cjh24y8xL
	MSl2jCnZRkMT7kXvpMsIJt6R1oDZT26ilCF6aHnyad+I12FZyisOhXhUnmqwWy6NNpIn
	/19QS+XyTg1zcU14l93FCorzizqW6aIx0H0zfuWFQRAYAirFN4cAiqIsgJHbjXOR4+g5
	vI6zMNeL1rXF0DrQWF4po1EszXI5vCJw0NEAyyHbtJofI1JXeV0UsPphwRbQBNSW1NpX
	7fZE5XAtpNXgI0Ffyctx9uO55Sv3NReUbUA6LY9pyWQmryWNjq+f7TzTT3p9+wFhSgId
	4Wqg==
X-Gm-Message-State: AJaThX4KB5uwq0y2c54ktHKOx09lIrS9hjOle5my8z5FGf7OETjW9WDK
	0HcKtPsF5zI02RGIt+gOlZikX7pM
X-Google-Smtp-Source: ABhQp+TsdRB9t6Ey+EyUfzSlDF0hubcA5asuauCxegqLog33wA6LX6il/e5MPKZgol12ykHWcDwIGw==
X-Received: by 10.157.81.198 with SMTP id d6mr1085995oth.10.1510069842550;
	Tue, 07 Nov 2017 07:50:42 -0800 (PST)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43])
	by smtp.gmail.com with ESMTPSA id l32sm677934otb.17.2017.11.07.07.50.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 07:50:41 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id n82so10446437oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 07:50:41 -0800 (PST)
X-Received: by 10.202.4.69 with SMTP id 66mr10663765oie.409.1510069841018;
	Tue, 07 Nov 2017 07:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 7 Nov 2017 07:50:40 -0800 (PST)
In-Reply-To: <bfd7b5d5-328b-c0d9-0b61-75e60237b149@linux.intel.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<f7c3b1e5-b5d1-37e3-0a19-24dfd2cab276@windriver.com>
	<bfd7b5d5-328b-c0d9-0b61-75e60237b149@linux.intel.com>
Date: Tue, 7 Nov 2017 13:50:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpUZWQ0wo3eKYtTkBLk5Der+8bE8PW4E2t5+j-gPStexQ@mail.gmail.com>
Message-ID: <CAP9ODKpUZWQ0wo3eKYtTkBLk5Der+8bE8PW4E2t5+j-gPStexQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Tue, 07 Nov 2017 15:50:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 7, 2017 at 12:53 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/06/2017 06:54 PM, Mark Hatle wrote:
>>
>> You would need to interpret the dwarf symbols and find all of the
>> referenced
>> files.  I can certainly be done with the libelf (libdwarf?), but I don't
>> know if
>> it can be done with binutils or elfutils directly.  They may not have the
>> necessary translation to be able to assembly the pieces.
>>
>> (A lot of the filenames are listed related to a directory.. and the
>> entries are
>> stored in different places and have to be assembled to get a similar
>> output to
>> what debugedit gave us.)
>>
>> Writing a small standalone tool to give us this information may be very
>> useful
>> to us though -- and would let us break the 'rpm' dependency for deb/ipkg
>> builds.. (probably)
>
>
> 'readelf -wL <binary>' looks promising. I think we can simply process its
> output from package.class (yes, a bit brittle, but easier than writing a
> separate tool).

Only if it is going to be a generic solution (used for all package formats).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

