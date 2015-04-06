Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id CA0E172A49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 14:28:23 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so22071571ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AMEArUdyCv0HLA3eFLJgswKGs+4xjpOZKmwN+jQ+dyw=;
	b=hGWkTfAKrc0jXE9xKvaR+Q+k+nPbD124piqQnro0TzGTovGO1/tNTe9PIET/sU2gv4
	QfxoS6ZxXMrWjVvIw6punNh1s6sxksA9i4pzPrYxJguvkZSpmDOiuUGQYQHSo7YqLmRT
	deAqTBddcTpF5oYJ/V9mZYNQ1RFnjF8p73taZRpYcsKNoLTiQDjroktV0hiyRNgf2X/2
	SNFAOs/d+FqnfXpFW2FuCrqp5CCMVHiOLg+UBejJsDUicit4RpkviTD6fEqDbhqo8FEa
	KzIwzlC8UCmXIxvLHIMRpsDDJ8L5Esy74iwsz97x08MWaNdQAhXHJ8r0fMghQ/8XzcHE
	9eMg==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr22268074ioi.27.1428330504486; 
	Mon, 06 Apr 2015 07:28:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 6 Apr 2015 07:28:24 -0700 (PDT)
In-Reply-To: <20150406141539.GA14205@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<552189F9.6040405@balister.org>
	<CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
	<20150406141539.GA14205@linux.intel.com>
Date: Mon, 6 Apr 2015 11:28:24 -0300
X-Google-Sender-Auth: WAUEo6OVC0bTs9YHmfoaNbzB0os
Message-ID: <CAP9ODKqL_fwFw_zD4jBBNqjYg=kgeQC5scV+0paMhkO9XOmf0A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Mon, 06 Apr 2015 14:28:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 6, 2015 at 11:15 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Mon, Apr 06, 2015 at 09:00:50AM -0300, Otavio Salvador wrote:
>> On Sun, Apr 5, 2015 at 4:16 PM, Philip Balister <philip@balister.org> wrote:
>> > On 04/04/2015 10:20 AM, Ed Bartosh wrote:
>> >> wic requires tools that are not always possible to find in $PATH.
>> >> This causes wic to fail with confusing errors like this:
>> >>  External command 'parted' not found, exiting.
>> >>    (Please install 'parted' on your host system)
>> >>
>> >> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
>> >> /sbin and /bin to the list of paths makes find_binary_path to
>> >> produce more reliable results.
>> >
>> > I'm with Otavio. Given wic is intimately dependent on internal build
>> > artifacts, it should use utilities from the sysroot and not depend on
>> > tools from the path. Let's make wic 100% before creating a tool to build
>> > images from packages.
>>
>> If we want to have it as a 'standalone' tool we will need to somehow
>> package the tool set for it to use, otherwise we have a maintenance
>> nightmare (does patch X has been applied to Parted?).
>>
> Can you elaborate a bit on how tool set can be packaged?

We could do a tarball like the buildtools toolchain.

> Back to the original topic. wic never used native parted as it's not useable(there is no executable in systoor).
> Anybody knows the reason?

bitbake parted-native

> Documentation also suggests to install parted on the host: http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#wic-requirements

So it also needs fixing.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

