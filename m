Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6955571637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:40:54 +0000 (UTC)
Received: by yhai57 with SMTP id i57so6201677yha.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1rNpbcV94ZEPybvD67FH1dHBw2hcqstODEDsrrp6AAw=;
	b=o2FurEqPQBRzaS46dFhlgqg9GTfFKXHNs4MDAJ4HiHltHTdgK2IkH+UHsa0pM4/VyF
	Dy7KDGV6JLVXnce9KfgSNQJundJvRKxs1NH9DrU2OX6tXnZwd2Cb/e0kQGqIZRI2bC+7
	b+MpzMNaFFu56VzGsxJSwaoi+YtC2WbjdzkFHhIq317U1irA9aoJUMZT06v0yFrJx/ca
	IvTWBTOfGowm9L1BTrm4oVL7uqOsvyuTEgtULOfXLnvkjWNS5hdivQqVZfXZPUUPRbe3
	115YnhMR/ZAq0ggcHaoeqBT++z3wLZ/A683d2ZQg+7ipFaC1aNtWLzmcy5HsebkOGxbE
	0HMA==
MIME-Version: 1.0
X-Received: by 10.170.195.144 with SMTP id m138mr10399255yke.50.1424990455708; 
	Thu, 26 Feb 2015 14:40:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 26 Feb 2015 14:40:55 -0800 (PST)
In-Reply-To: <54EFA03E.9030904@linux.intel.com>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
	<1424987235.26813.42.camel@linuxfoundation.org>
	<CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
	<54EFA03E.9030904@linux.intel.com>
Date: Thu, 26 Feb 2015 19:40:55 -0300
X-Google-Sender-Auth: YAwLqKKKSIomUIUsKmJQuZV31fs
Message-ID: <CAP9ODKqcbOTD=qLEmLa94TZbLA6_p3njAS0R263bJ3JVv7jrcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Thu, 26 Feb 2015 22:40:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 7:37 PM, Randy Witt
<randy.e.witt@linux.intel.com> wrote:
> On 02/26/2015 02:00 PM, Otavio Salvador wrote:
>>
>> On Thu, Feb 26, 2015 at 6:47 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>>>>
>>>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>>>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>>>> when doing cross-compilation builds and out-of-tree builds.
>>>
>>>
>>> Ultimately I think we need to address this issue in gcc itself, probably
>>> setting some kind of base path in the environment which it removes from
>>> __FILE__ (set to ${S}). There were more complex discussions about using
>>> the same mapping code as can be used with the debug symbols code too.
>
>
> The bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47047 looks to still be
> open. Should we open a Yocto bug to update that patch to apply to a more
> recent gcc?

Even nicer :D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

