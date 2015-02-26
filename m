Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id C1AA165C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:00:36 +0000 (UTC)
Received: by ykq19 with SMTP id 19so5460363ykq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5huwpKBrvZIB1wS4plwroukCJS49BUabJ0i9bCzWaBc=;
	b=jKnSW4iUfaeUjtBJEsNHfvkeka4Jh/cFW4zYI+1tc6jeuMMwBfhbqbCVNn20Cv1acX
	rIPwSM+sSJaPDlnag5I6Uy4ZmUGxSA+UC5PdqBP/HK9QGAPpKq43+fjfzfaEboWS4gzZ
	aYta/j0XEMfi9wd+wvf49Acg95nJphoJVxeZt77gucqDly3JJ+8taghAPuIN9nqVBIXZ
	dhkt0+/VRXcCAmOtVHZRafAa/vEmoXE3pTeLHwOtV3YTOqgyU/viJaL/97LFZvwnVuoz
	xBbCuRi6ykR9RhRCGPMFoTqjxDxQTYquUxqtjL0DF+mkq03/G09w6BWId3muj+OlL4QA
	fWMQ==
MIME-Version: 1.0
X-Received: by 10.236.190.5 with SMTP id d5mr10146559yhn.67.1424988037328;
	Thu, 26 Feb 2015 14:00:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Thu, 26 Feb 2015 14:00:37 -0800 (PST)
In-Reply-To: <1424987235.26813.42.camel@linuxfoundation.org>
References: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
	<1424987235.26813.42.camel@linuxfoundation.org>
Date: Thu, 26 Feb 2015 19:00:37 -0300
X-Google-Sender-Auth: jvprOkDMx_szTV4luSRSx4StnpY
Message-ID: <CAP9ODKoZO1m-2BomHz6h_YtmwKsoEURsCxAMXPmYN3X6E1xqfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Thu, 26 Feb 2015 22:00:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 6:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-02-27 at 04:31 +1100, Peter Urbanec wrote:
>> On WIN32 the file argument to gst_debug_log_valist is shortened to just
>> the filename. This is useful not only for MSVC, but also with gcc/Linux
>> when doing cross-compilation builds and out-of-tree builds.
>
> Ultimately I think we need to address this issue in gcc itself, probably
> setting some kind of base path in the environment which it removes from
> __FILE__ (set to ${S}). There were more complex discussions about using
> the same mapping code as can be used with the debug symbols code too.

Agreed; this should indeed be a global fix as this affects virtually
all packages.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

