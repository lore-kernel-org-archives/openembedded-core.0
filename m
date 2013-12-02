Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2ED6B1A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 19:29:06 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so13720164oag.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 11:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iWEvlS6UNTpokomXaIh9t5G6HWSCutfv9qbk/A7st3w=;
	b=yy1itOhAhgEc1qtnPk53G3I1M9nNOWLxuS5vNKijFxLYFSAgYeqhjuD/MTg8Eebtvv
	OLrMNy7kkSBeKYXaaE1NygNtYt8+i/2jIg/vyzbniLiv6rpJcasb6SpvvOhMANk/eswB
	DXWRWbqJHpbHZfyxPPLAhv+vAR5IQFkAZezwCdfv4FJYCFs34Y+W96vJfjTnBZpbH+OX
	40qdU4e5F/Cahzc5VAPpETUlCyjId4YnkkbyBZMXrvQyAx0S/nqqPth4mFfuCUnUe90K
	JSP/W61Jj56eFC7+sSOkiPvXh8cqmQq3gZV881cXiKhLCmhLHfH0w9g2YrPT/UXMGzA/
	BuDA==
MIME-Version: 1.0
X-Received: by 10.60.73.137 with SMTP id l9mr56465929oev.32.1386012544799;
	Mon, 02 Dec 2013 11:29:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 2 Dec 2013 11:29:04 -0800 (PST)
In-Reply-To: <CAJTo0LY3zfxRpoZ1pxXYj4NPu7m1Mdz1M1uZYVHPsjqYwWjyTQ@mail.gmail.com>
References: <1471026.rDxeBhQvgN@helios>
	<CAJTo0LY3zfxRpoZ1pxXYj4NPu7m1Mdz1M1uZYVHPsjqYwWjyTQ@mail.gmail.com>
Date: Mon, 2 Dec 2013 17:29:04 -0200
X-Google-Sender-Auth: 7whujfWtK3Ad3KnEKkQe3pDmLxQ
Message-ID: <CAP9ODKo3vBmM0rHsiEoYd+OJxO4R0g9fHrFCi=ry_56isfWhcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: external toolchain recipes in OE-Core
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
X-List-Received-Date: Mon, 02 Dec 2013 19:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 2, 2013 at 2:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 2 December 2013 16:18, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> B) Remove it and just point to meta-sourcery as a maintained and working
>> example of how to write an external toolchain recipe
>
> This seems like the easiest option that will continue to work in the
> long-term.  As toolchains are all different a less concrete example
> doesn't seem very useful as it will be too abstract to be tested.

Agreed; this allow us to reduce the amount of QA work for Yocto fellows as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

