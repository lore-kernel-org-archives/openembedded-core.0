Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SEo4O-0002Bq-6T
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 22:41:44 +0200
Received: by qcso7 with SMTP id o7so1831278qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 13:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=t7T6eYoTgOyZK31OdhqxV06UyxRNO3Kldmb6bowmqEg=;
	b=di7S6R1tEZuxLZs2sekraaS7jkHnZRM+tkrj5OhBa00/AmxEs/oNoHIKVX2O8D75Id
	j/9FtI4s7yRFysMeFjzIUL8YTpBvVii/h+CqJGoIeLqzSQ4zJpHdi9mB5Q1fGygPW9yR
	I9yanE30oecA8CAC+DosD4hcu+vcaNknuZqfawC5PK2VW23KQTP32N9wsZyOGlne5OMg
	+lCxdWunI4q0bfMHaZBJmdBSCna5VAdFKM4sxnzPcmmla86kIrjsVLtYFcYVaPQg7mn9
	YnVxbpZ4M4DKduqlNZN6P9TLzJep8xzPR/FHe/oOt0feHrI4D/8wghCZoq0UDLjjQ3iC
	vaaA==
Received: by 10.224.180.200 with SMTP id bv8mr13462864qab.29.1333398755326;
	Mon, 02 Apr 2012 13:32:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.24.196 with HTTP; Mon, 2 Apr 2012 13:32:15 -0700 (PDT)
In-Reply-To: <2119548.Y71LEXUF5X@helios>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
	<20120402200015.GA26494@sakrah.homelinux.org>
	<2119548.Y71LEXUF5X@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 2 Apr 2012 13:32:15 -0700
X-Google-Sender-Auth: UoObidKT49gJfT9-0j3AHDly-N0
Message-ID: <CABcZANmXVJe1Jw005U5u3USmZeMC9vjwOFCBQABA3moKcN5A9g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Mon, 02 Apr 2012 20:41:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 2, 2012 at 1:12 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 02 April 2012 13:00:15 Khem Raj wrote:
>> On (14/03/12 00:36), Paul Eggleton wrote:
>> > If the user is in any directory other than $BUILDDIR when the bitbake
>> > wrapper script is run, then show an error an exit.
>> >
>> > Fixes [YOCTO #2071].
>>
>> angstrom e.g. does not have this restriction but uses script/bitbake
>> so this fix seems to be wrong here since its specific to OE-Core's
>> default build env.
>
> This has been implemented differently now:
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=769384decb095fb3c49eb13b8f7f69c978d0bcba

This'll break the ability to run bitbake from subdirs underneath
BUILDDIR, which is perfectly valid, and supported by bitbake's code
which traverses up the current working path to find
conf/bblayers.conf.
-- 
Christopher Larson


