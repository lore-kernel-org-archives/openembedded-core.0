Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5C9265C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:11:38 +0000 (UTC)
Received: by ykq142 with SMTP id 142so5488738ykq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DJAItUyTjgdL8O5hD0EZ1Fmp/2gOEq/JKjzEGTZ+YU0=;
	b=mysfbEyy8h52R9RSYoJWmRw5w211Pi1lp6Wj7vW75FdnP6hwVNkrMEWj2N+jpve3rU
	Cf/W60G0D/Wk87jIq3euaXjd+0ZQpltOnqcc0ZEWzYKPIBsMtdw3HAvs4Hv1BkGU6Iqs
	nBcxQNu2VDUYzeh/+UFuicUtZN5m26SjHp6cBeypLjcAaqhtUHrmg941cDXK6P4dR/Al
	jiqzlpEZ1BPhEt8WRM6N8jhrS5Z3Ey/H7g9SQ7YueNihvR//9/Oj7F+6CZVwEyAWEmNI
	ryfMHEmoDUsbbuLp+mcuexq2dxBX4clZrHtARGSUuCKmHLIHhtkQ9tToXC2Y/Lq1atkG
	PLbQ==
MIME-Version: 1.0
X-Received: by 10.236.22.71 with SMTP id s47mr10506024yhs.37.1424988700188;
	Thu, 26 Feb 2015 14:11:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 26 Feb 2015 14:11:40 -0800 (PST)
In-Reply-To: <54EF969E.7080000@opendreambox.org>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
	<1424987235.26813.42.camel@linuxfoundation.org>
	<54EF969E.7080000@opendreambox.org>
Date: Thu, 26 Feb 2015 19:11:40 -0300
X-Google-Sender-Auth: TZf83rbTT4UOfKhWkAHZ2UhQFpY
Message-ID: <CAP9ODKpyYwZ1bAzfo9U0gcagLHyYdfbDEYOcLcD52UKH2WKbZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andreas Oberritter <obi@opendreambox.org>
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
X-List-Received-Date: Thu, 26 Feb 2015 22:11:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 6:56 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 26.02.2015 22:47, Richard Purdie wrote:
>> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>>> when doing cross-compilation builds and out-of-tree builds.
>>
>> Ultimately I think we need to address this issue in gcc itself, probably
>> setting some kind of base path in the environment which it removes from
>> __FILE__ (set to ${S}). There were more complex discussions about using
>> the same mapping code as can be used with the debug symbols code too.
>
> FWIW, here's a patch I'm using with gcc 4.8, which just cuts off the
> whole directory part.
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/master&id=a1e8d6cfb71367d745f2478c13a7250e41ca4f1b

Ideally it could drop the S from the string. So the internal path
would be respected.

What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

