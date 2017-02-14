Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id E4BBC71A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 15:35:12 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id d9so18408179itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cW73Yro1FnMi+OazwcRnUCFGPdTbI17FqNmFubsEoHk=;
	b=03DiqPt194YXELV/dd//Ji02MwDuol70TuTmsgO6jXQDPhYNS3Ui0yChaH6vAkVX5P
	Qh7+OT3GxG/7EQo8Nw1mEZn73NBnoB/xWmeNoWrghri/VgS1L+6MTEfIa9TGOPJY4B5N
	nbEp3uTvFb8sfAx0JmPouD2VU5O5gESAekF/U2unR6puW7p9lsM6s0fOnGyxPxByQ3DC
	yqqh4pYDyG/G82bqyDz2yyCLQop3AOK2Dj5ihWgw6EZcjwmlVJdvMHK31n0T35Q9c/sy
	T5dWaMNwNhwcui0nHthQiWX6xHpYnTWGVmPbI635p1UBrrdrUh4Q/FRVNaV6dcGWORbl
	82UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cW73Yro1FnMi+OazwcRnUCFGPdTbI17FqNmFubsEoHk=;
	b=LXsAtPsWTLAc+drkHRaJ+yev8YI5Y2qI2N3epkDZGKeIXbrZqartI6myctNOjz/AY5
	Ze2aGfUBtDOExGhTTncXgXqiM7PxFXA27JA/AY/pl9TYLThtpaAMYYNNh6aqGbbGVtiz
	A0gdV4hafvjeqeUgRm/BaKN8jrkcqNBJj+rjQ1uiQHI0FfxwloAMeub8qegn5w8QPFOY
	yZ2ZZEUQIKeRchm24yfpQSGvwYWcqc+o5WW+b1HbGGqUiOYTDZ49tqaXdShzowJ0EK4r
	1JvVhccjifhOptnRAQ30g9suXMX+S747ZIbm+i2euTkhrwcJ4bG2wpXKdfCM9AHKQaXC
	oR/g==
X-Gm-Message-State: AMke39lwdYx13hatvlNs0u5hbskTC/NWeF1FHx8B3MRnMsdFQNv2/s7SHYFKXSkwldt4HAVr
X-Received: by 10.36.33.135 with SMTP id e129mr3889396ita.9.1487086512959;
	Tue, 14 Feb 2017 07:35:12 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id m6sm459783ioa.57.2017.02.14.07.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 07:35:11 -0800 (PST)
Message-ID: <1487086509.13854.347.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 16:35:09 +0100
In-Reply-To: <20170210082811.GA3021@jama>
References: <20170210082811.GA3021@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: multipath-tools on arm (was: Re: State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 15:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-10 at 09:28 +0100, Martin Jansa wrote:
>     *
> meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:do_compile

This is http://errors.yoctoproject.org/Errors/Details/130529/ and now
blacklisted with the comment "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130529/"

However, the error isn't about RSS. It looks like an inline-assembler or
compiler bug:

{standard input}: Assembler messages:
{standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
{standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
...
../Makefile.inc:66: recipe for target 'debug.o' failed
make[1]: *** [debug.o] Error 1

Does anyone know what this could be? I'll also fire up a build in the
meantime.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




