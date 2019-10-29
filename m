Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC837FB54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 06:27:42 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id y5so10360384ilb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HsQ0REiScxbT3lGoyv1SOH/gSyUzGO+XnLs1S0Qz6dM=;
	b=aNyVvDN6/nSM7xdpWyzaMQjb5hvG8rIcCOoXVo1P6eNka/isjwUgRYVQKqjTcA8dq+
	txiZGjO8Hq3oQnDAzeDQUwm+ycXzex3RvchNIL1PBQwGr4/u7U5f4UYvnVsewb2NonP9
	8bFOeTLYKgecEzv9sH/dWg6LKBR7JYqHyentNkhqt4ozNtsu/O4IdoduYT5bQvQRpQsq
	JUuIAgHxa9pH+i2DPeoY51vYjW/6czDLRb5L8uuTaC7m5G4JBj4HJ229sk057H4TrgJZ
	+2pVhKsNGh47dfSpWWF1IGxqrgTRtor2PnXMIYbQZJYiX76Z8l8swWJaIp7NWwwZHzh0
	422g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HsQ0REiScxbT3lGoyv1SOH/gSyUzGO+XnLs1S0Qz6dM=;
	b=NSGsOgLXyGcOgOcyk5pcLD3R5axMw3PzLYk6Ixux2WPmdKdqdGSpoIA1H2YCObWKjR
	KeuYJUP9EUi5eriE6Af3QW/WwfzSf1Vgfx0COnlZVrDipFVXiEdQSMymT92ciAKQNBKi
	HIbQeRYoofEqo5pr4h1mTY0oTSDpjVs2zwENP9Wklklv53UZBB9I7Rf1MY+6f3/rmwGd
	o57vER6ospgG70CFm6hTv/I1KgupAncL5Q3iNBz7KaWOKykQeLTbKGv2rSaHQuYl66m7
	dMTPJ8kuzyxCcjy0mHl3EOaEQwjRB+fhY+vKKL5GvHamuq+Ut40lOEEhUNQo/887J8Kv
	wfew==
X-Gm-Message-State: APjAAAXUIMcCr3U2dUjrs+RMEP7U1gA1BW7cOb4f5WbPzujhqKgDtlw5
	pJHN7NdCNZyidk9NanUdgGxXV7wjj6qq/0kSOEg=
X-Google-Smtp-Source: APXvYqwUNa8q5sdySNLrWedjHSVV1xQNKawTwFdeI1AqSHl4ZF12S+gBSOGbi3TGX6sNl14qL6dU/QeNe7IHVXWvpQ4=
X-Received: by 2002:a92:9e4c:: with SMTP id q73mr24780710ili.53.1572330463177; 
	Mon, 28 Oct 2019 23:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Mon, 28 Oct 2019 23:27:42
	-0700 (PDT)
In-Reply-To: <8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
	<47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
	<CAA=hcWQ8xjT03MC9MQPXgFVB04ZdbE5=Nd8LOE=6w308r44kGg@mail.gmail.com>
	<e91e63ef-9da5-3110-17d2-6f78bf09c904@gmail.com>
	<CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
	<8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 29 Oct 2019 17:27:42 +1100
Message-ID: <CAA=hcWQjwYv8ip6W3inohK6TXahpuuY1HhMB=BD5sVfy1igLXQ@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>
Cc: public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org,
	openembedded-core@lists.openembedded.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Tue, 29 Oct 2019 06:27:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ferry,

On 10/29/19, Ferry Toth <fntoth@gmail.com> wrote:
>> How did you build the cpio into the kernel?
>
> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/conf/machine/edison.conf

Thank you for sharing the config, I added the same thing to my image configure:

INITRAMFS_MAXSIZE ="80000"
INITRAMFS_FSTYPES = "cpio.gz"

But it doesn't seem any changes in zImage-initramfs format, still
stuck in Start Kernel. There is no cpio in zImage-initramfs format
either:

0             0x0             Linux kernel ARM boot executable zImage
(little-endian)
6904          0x1AF8          LZO compressed data
7316          0x1C94          LZO compressed data
7918          0x1EEE          device tree image (dtb)
57505         0xE0A1          device tree image (dtb)
312302        0x4C3EE         LZ4 compressed data, legacy
2049266       0x1F44F2        SHA256 hash constants, little endian
2372864       0x243500        mcrypt 2.5 encrypted data, algorithm:
"]", keysize: 23701 bytes, mode: "(",
6093526       0x5CFAD6        device tree image (dtb)
8127489       0x7C0401        LZ4 compressed data, legacy
8167809       0x7CA181        device tree image (dtb)
8211971       0x7D4E03        device tree image (dtb)
8466697       0x813109        LZ4 compressed data, legacy
10203615      0x9BB1DF        SHA256 hash constants, little endian
10527221      0xA0A1F5        mcrypt 2.5 encrypted data, algorithm:
"]", keysize: 23701 bytes, mode: "(",
14247896      0xD967D8        device tree image (dtb)
16108284      0xF5CAFC        LZ4 compressed data, legacy
16581064      0xFD01C8        mcrypt 2.5 encrypted data, algorithm:
")}", keysize: 11556 bytes, mode: "|",
18187148      0x115838C       PARity archive data - file number 12288
18412397      0x118F36D       mcrypt 2.5 encrypted data, algorithm:
"*l", keysize: 20516 bytes, mode: "~",
18642426      0x11C75FA       mcrypt 2.5 encrypted data, algorithm:
"9n", keysize: 2452 bytes, mode: "4",
19350585      0x1274439       ELF, 32-bit LSB ("")
19742605      0x12D3F8D       ELF, 32-bit LSB ("")
22468397      0x156D72D       ELF, 32-bit LSB processor-specific, ("")
22528640      0x157C280       ELF, 32-bit LSB processor-specific, ("")
22974723      0x15E9103       mcrypt 2.5 encrypted data, algorithm:
">", keysize: 2093 bytes, mode: "-",
23196848      0x161F4B0       ZBOOT firmware header, header size: 32
bytes, load address: 0x0564F721, start address: 0x2E4CEE95, checksum:
0x22771426, version: 0x1D216514, image size: 185068065 bytes
24899585      0x17BF001       LZMA compressed data, properties: 0x63,
dictionary size: 2097152 bytes, uncompressed size: 139006573920 bytes
24899761      0x17BF0B1       LZMA compressed data, properties: 0x6C,
dictionary size: 2097152 bytes, uncompressed size: 541203680 bytes
24899796      0x17BF0D4       LZMA compressed data, properties: 0x63,
dictionary size: 2097152 bytes, uncompressed size: 139810176352 bytes
24940767      0x17C90DF       LZMA compressed data, properties: 0x5E,
dictionary size: 522190848 bytes, uncompressed size: 2157628 bytes
24946105      0x17CA5B9       LZMA compressed data, properties: 0xBE,
dictionary size: -1108672512 bytes, uncompressed size: 138831226112
bytes
24949352      0x17CB268       LZMA compressed data, properties: 0xC0,
dictionary size: -551550976 bytes, uncompressed size: 2117660 bytes
25029743      0x17DEC6F       Copyright string: "Copyright 2017, NXP"
25827134      0x18A173E       Unix path: /var/lib/systemd/
27216461      0x19F4A4D       eCos RTOS string reference: "ECOS field"
27744796      0x1A75A1C       SHA256 hash constants, little endian
27784033      0x1A7F361       mcrypt 2.5 encrypted data, algorithm:
"ute0^", keysize: 25971 bytes, mode: """,
28059592      0x1AC27C8       Base64 standard index table
28258932      0x1AF3274       SHA256 hash constants, little endian
29009250      0x1BAA562       Unix path: /lib/opkg/alternatives/cut
29091303      0x1BBE5E7       LZMA compressed data, properties: 0xB7,
dictionary size: 1572864 bytes, uncompressed size: 106573083904 bytes
31513153      0x1E0DA41       SHA256 hash constants, little endian
31800561      0x1E53CF1       PARity archive data - file number 1944
31937419      0x1E7538B       gzip compressed data, from FAT
filesystem (MS-DOS, OS/2, NT), last modified: 1970-01-01 00:01:36
(bogus date)
32101039      0x1E9D2AF       gzip compressed data, from FAT
filesystem (MS-DOS, OS/2, NT), last modified: 1970-01-01 00:01:36
(bogus date)
32127133      0x1EA389D       gzip compressed data, from FAT
filesystem (MS-DOS, OS/2, NT), last modified: 1970-01-01 00:01:36
(bogus date)
32480356      0x1EF9C64       rzip compressed data - version 16.42
(881272744 bytes)
32537394      0x1F07B32       lrzip compressed data
32537406      0x1F07B3E       LZ4 compressed data
32537413      0x1F07B45       LZ4 compressed data, legacy
32539866      0x1F084DA       Gameboy ROM,
32540730      0x1F0883A       EBML file
32660115      0x1F25A93       LHa 2.x? archive data [lh ] [NSRL|LHA2]
32660163      0x1F25AC3       lrzip compressed data
32660167      0x1F25AC7       LZ4 compressed data
32660171      0x1F25ACB       LZ4 compressed data, legacy
32660179      0x1F25AD3       LZO compressed data
32660287      0x1F25B3F       XAR archive, version: 31320, header
size: 64823, TOC compressed: 6506577760731572164, TOC uncompressed:
18243852667069869871
32660404      0x1F25BB4       Executable script, shebang: "/bin/python3"
32662024      0x1F26208       EBML file
33346732      0x1FCD4AC       Copyright string: "Copyright (C) 2010
Nikolai Kondrashov"
33684559      0x201FC4F       mcrypt 2.5 encrypted data, algorithm:
"_fd", keysize: 8881 bytes, mode: "h",
34425873      0x20D4C11       Copyright string: "copyrighted by many
authors between 1998-2015."
34451850      0x20DB18A       SHA256 hash constants, little endian

What is the Executable script, shebang: "/bin/python3" ? My image does
not have python installed.

Also the eCos RTOS string reference: "ECOS field"? My image does not have ecos??

> And there is the max size!

OK good to know.

>>> And that cpio is ~64MB, so it must be possible.
>>
>> Is the 64MB for compressed cpio.gz? If so, that should be fine. Did
>> you allude that 64MB is also a limitation for cpio?
>
> No I don't think so.

That is good.

Thanks Ferry.

Kind regards,

- jh

