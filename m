Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6E43660097
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 12:00:49 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so21882981ied.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qRUCh4cJ4KnJLARmossot8DRuVZlgAyCcUv+FQaG0nY=;
	b=Ni/UCfjNwXTHgWyA9uovaMdOLQk8Ao4qZwEj3oTpGqJ1VTJxKqebGmLBlk/RrMM3AY
	mTeyISTEAUNi2WfXF2Fq4Vd7sdg9nB72JY4IKs71f2JFPl781sIN+n3v3KK+hR8eu1fw
	tJ1EhXmPHsBcwRVv2b0QrDKgoln0Ksri60gB1D9Q9D0G6niuZxDRWs4XV+tA5Q+r8wPX
	9F+UGyruEVOZ1FaPoIQi6AtmugXcdip00BxUaz61pjwPKYKNocX0dqLD+w/qvmN1qZ3q
	iDKxSYugtqIFq0BlU9v88Xc1Ruw9usVsIuHRq00QtvN0Zm2JldMIih7RIGEgbI3Nj/3g
	2M3w==
MIME-Version: 1.0
X-Received: by 10.50.43.130 with SMTP id w2mr22634138igl.30.1428321650635;
	Mon, 06 Apr 2015 05:00:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 6 Apr 2015 05:00:50 -0700 (PDT)
In-Reply-To: <552189F9.6040405@balister.org>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<552189F9.6040405@balister.org>
Date: Mon, 6 Apr 2015 09:00:50 -0300
X-Google-Sender-Auth: JXaKQ5NXpEFLktugh67j-3ih_TE
Message-ID: <CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philip Balister <philip@balister.org>
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
X-List-Received-Date: Mon, 06 Apr 2015 12:00:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 5, 2015 at 4:16 PM, Philip Balister <philip@balister.org> wrote:
> On 04/04/2015 10:20 AM, Ed Bartosh wrote:
>> wic requires tools that are not always possible to find in $PATH.
>> This causes wic to fail with confusing errors like this:
>>  External command 'parted' not found, exiting.
>>    (Please install 'parted' on your host system)
>>
>> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
>> /sbin and /bin to the list of paths makes find_binary_path to
>> produce more reliable results.
>
> I'm with Otavio. Given wic is intimately dependent on internal build
> artifacts, it should use utilities from the sysroot and not depend on
> tools from the path. Let's make wic 100% before creating a tool to build
> images from packages.

If we want to have it as a 'standalone' tool we will need to somehow
package the tool set for it to use, otherwise we have a maintenance
nightmare (does patch X has been applied to Parted?).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

