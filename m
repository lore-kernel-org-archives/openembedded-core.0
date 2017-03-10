Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id DF006776E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:51:38 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id a12so10107976ota.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=OzY3xdKqUkhhQHT7KGKQDjnPs38YrKznWhPqRKXG6EI=;
	b=AqG0Qc49/zpnLeo3JJwq+Fq8DXRnhd17Sk8ekJ44kJ/2mBudfNwJAhm2Vsoze2c2TZ
	xl7UD+GBoI9KM/dN9u+19BzzzPefdDfeJiob6s2d4UsW1sRlKlkuZrMWMnGGN7wqxTC1
	PvhGYJClW8zG+ef+EJ6rfZOc9Eys3V/GytrxFsZo0YKJeUeubO2YTWRBEdMmJpZB3p4M
	b+Si2rh37P7WxBEhUN909nZTJ/tDbngjVF9rnrcNqTL0ZQTkJ0pLR9J4rAmIOurEFKJx
	YEdb3kZGLsUyWCdNUZTtpLkRYaO03bzT9c3Kerw25dOn/eDLY53AE8puJG5ehjJtLgRy
	Zzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=OzY3xdKqUkhhQHT7KGKQDjnPs38YrKznWhPqRKXG6EI=;
	b=m3OU5RozuBfPLponirs1kNX3j3MdyqdVbXiHN8Ae5N39KtA45H26HmbjTe2KK8bVWW
	090M6HAQz47R5CMqPSnq8MLow6jsQ4vZ9xfzCnqeN0Jip6ydUg438wJ0uISo7E9ROzP0
	/20faycHYGeSvAwKq5w10evlCsu6phdWyRKyu+upElFRzikYL3C5DEqD2l2gk2fnBgcN
	s68SPakrDmD+iKQlx1WQ9Ueequbq9t6lWeSSdpYofu2I7VBXBy5R7PICK/x/ajnN5rWr
	NViXy9GNM/K0gBx59E2M+Y27H9eueAqAMlJfPN8ab6sNZW9w5LjwagTiuyD3FhWN9dn3
	YPjA==
X-Gm-Message-State: AMke39mtPotfWISMl+QE/8yz3GWF6wwLBCui7QB1MkBO0I+2sDgthu9fJOJQKZraW+J5XQ==
X-Received: by 10.157.27.154 with SMTP id z26mr10820527otd.181.1489153899479; 
	Fri, 10 Mar 2017 05:51:39 -0800 (PST)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com.
	[74.125.82.181]) by smtp.gmail.com with ESMTPSA id
	d131sm4237857oia.27.2017.03.10.05.51.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 05:51:38 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f181.google.com with SMTP id i1so76779703ota.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:51:38 -0800 (PST)
X-Received: by 10.157.10.169 with SMTP id 38mr11124841otq.11.1489153897950;
	Fri, 10 Mar 2017 05:51:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Fri, 10 Mar 2017 05:51:37 -0800 (PST)
In-Reply-To: <1489153432.7785.448.camel@intel.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
	<20170306190728.GA19275@linux.intel.com>
	<CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
	<1489131232.7785.390.camel@intel.com>
	<CAP9ODKoVRj+Fqx1W4U=Nr1RgFvQgbvwrzatBpv==PpTJX1P3NA@mail.gmail.com>
	<1489153432.7785.448.camel@intel.com>
Date: Fri, 10 Mar 2017 10:51:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq5Kdnr8zA9s4OFb+yV=pLyHWn16gNb0G-p+1cxkFSorA@mail.gmail.com>
Message-ID: <CAP9ODKq5Kdnr8zA9s4OFb+yV=pLyHWn16gNb0G-p+1cxkFSorA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Fri, 10 Mar 2017 13:51:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 10, 2017 at 10:43 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Fri, 2017-03-10 at 10:32 -0300, Otavio Salvador wrote:
>> On Fri, Mar 10, 2017 at 4:33 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > Suppose IMAGE_FSTYPES = "ext4 wic", and the WKS_FILE has multiple
>> > partitions and thus needs more entries in /etc/fstab than the
>> > single-partition "ext4" - the result of do_rootfs simply cannot work for
>> > both.
>>
>> That is the point. If the machine requires to use multiple partitions
>> the ext4 should have the /etc/fstab ready for use when deployed.
>
> My thinking was a bit different. I had in mind a setup where the "ext4"
> format as used by qemu has all files of the rootfs in a single
> partition, whereas the wic image splits out the data into multiple
> partitions (it recently gained such a feature).
>
> This could be made to work if wic knew how to change fstab without
> rewriting the root filesystem. But as that can't be done, such a
> combination of different image formats is only possible for a rootfs
> which always works with just a single partition.

So it seems like we need a command line option for wic which says for
it to generate/do not generate the /etc/fstab.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

