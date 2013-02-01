Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1Ka6-0000e1-CK
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 18:39:27 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 09:22:19 -0800
Received: by mail-vc0-f197.google.com with SMTP id gb30so5734144vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 09:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=GtzbpNDyWXHP6pXvm4Cck58YSelKmlM0BTreJNkkuj4=;
	b=nCvXM3OlCwEL4asj1fFbwayCANBijg0BUqCxNQjVGaNtMZjovAbRSsQAunQ8O4sc3y
	8lvrFhJk0sNXlEt255t3QXf7o74tXnq1owAA2EFrasW4q7Z/feiiidXNQxuiznERRkjH
	1FTfYmYkBMRU0DfzrX5IiDnU0AAJaHAgnknNPL9DQzrORLTmoPtrcvT/RfXCy8/51wqS
	kb3wqkkmNpix0ZECshkK0r1eXAtNf/YIyFIkM8p3oEJZ7b2qKLOvGj0BGXpKuYc7tr7u
	nZ7sBKHVw/luFKl3CRAAPFmtzLjAPSSilOcFgfTZeeIT7v0uoYSRZmeTRoy+EeMZCx89
	9nwQ==
X-Received: by 10.52.178.105 with SMTP id cx9mr10628196vdc.31.1359739399654;
	Fri, 01 Feb 2013 09:23:19 -0800 (PST)
X-Received: by 10.52.178.105 with SMTP id cx9mr10628192vdc.31.1359739399470;
	Fri, 01 Feb 2013 09:23:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 09:22:59 -0800 (PST)
In-Reply-To: <1359732091.14071.66.camel@ted>
References: <510BD7AD.5090506@topic.nl> <1359732091.14071.66.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 17:22:59 +0000
Message-ID: <CAJTo0LaM__O=HgwAAyATKcdxHFee5Aq-80XkU9aCKBkwG6=5ww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQma/t8ppY1teObfO5kojXKtNuhKCeoMmyLlSo1L/HukMefKM/VJ1iRw1gMDXLdc1BL6eWEATTcWBlUQLnnT1dDC1iMyTbNIKWCAVzKHnXEysI2fhtQx2zAhzHBU6Swr5aczTp0Zzed7oXMc+Zy/QGAEocHQdcpSfqKBGOffat/lomAgZmkfYPcRt73VRC00oPBB4Kkl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What's up with "fontconfig"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 17:39:28 -0000
X-List-Received-Date: Fri, 01 Feb 2013 17:39:28 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 15:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We likely need to replace this with something sane. The question is
> whether we need it at all and if so, what problem dies it solve?

It looks a bit like an attempt to build native tools when compiling,
as FC_LANG and FC_GLYPHNAME are also overridden earlier in the file.
These variables don't appear to be used either.

For what it's worth, removing everything that looks dubious in
EXTRA_OECONF and that do_configure_append results in a zero-difference
buildhistory, so it at least compiles.  I'll kick off an image build
now and see if fonts still work.

Ross


