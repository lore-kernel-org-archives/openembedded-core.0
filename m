Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6670A60EB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:52:17 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so4956951obb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=yLPYn/pfQWRoCe419qNAIHGTwv96wS9lgHzbsjSwSOk=;
	b=f/wg7zOJxvkkjFT9d3TX6vpB5lxDWtmMH/YS5n3GILm/LS53n7AySsgdbLRba/6C1/
	qRcyrKAqaWku4+5ZRMlU9Kwic88vPF9I+MWwjN9CXOkgr4wZnwTjwxGV4oang1FmL+us
	ujqhYN+YDQUaMFQOTbJMlfnydmF/5iGsyPXOZXB1pg7MnGafQIFcImuSl3lIMqbxcAne
	ZY8oe5vIC9CJWDSMzTaa/m4qM3h19wFKgdqBPmFKW/hmiWiI4IIuJ4UtxwPJCbuiIOPf
	FOoFN8a88hkRM0ixV65JY9L0m8ILV+LxXrdUBYMk3vCOd/2Q5joaFexgHWoJ+H3GG85a
	9S9g==
X-Received: by 10.60.47.116 with SMTP id c20mr2930780oen.60.1389369138059;
	Fri, 10 Jan 2014 07:52:18 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Fri, 10 Jan 2014 07:51:37 -0800 (PST)
In-Reply-To: <52CD9133.6070903@communistcode.co.uk>
References: <52CD9133.6070903@communistcode.co.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 10 Jan 2014 15:51:37 +0000
X-Google-Sender-Auth: HFQm1gKkuHzGbpiqLSugB1cEpGw
Message-ID: <CANyK_8cebBPZM-z+yznXuSotRCPDo2VdOi6PNXi-RbQgBj6rZQ@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: db failure due to libstdc++.so host contamination
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
X-List-Received-Date: Fri, 10 Jan 2014 15:52:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 January 2014 17:56, Jack Mitchell <ml@communistcode.co.uk> wrote:
> do_compile.log: http://ix.io/9Ki
>
> Speaking on IRC it seems that host systems with /usr/lib/libstdc++.so
> present are failing to build db.
>
> /usr/lib/libstdc++.so is present on at least archlinux in the gcc-libs
> and gcc-multilibs package which is a fairly standard package to have
> installed. The problem has appeared since commit
> a484b35b818768487ff27cf06b8c5d4e128126af in oe-core.
>
> Will try and find some time to do more debugging but if anyone sees any
> tell tale signs then shout up.

I'm also on archlinux so that may narrow down the list of systems
affected by the bug.

I do see the "-rpath /usr/lib" option to libtool but I don't know
enough about libtool to determine whether that is safe or not.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

