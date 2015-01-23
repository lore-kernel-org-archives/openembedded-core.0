Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 428BE72D17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 12:47:11 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 10so374380ykt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 04:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=T31iq/d8oPyB9RV5gjXbdWCXnGvvS6meVcENNd4iO2s=;
	b=YcO7O/1HAdS4B0r7BXrNyYakTHGSoCP0txk0efNoVGuJL402LvZZ7aXGMq/cKkM2i8
	xPoPwwDC9GbC6ttjjQGcgTI539NzntE7R46gn5Msy1GrW4yCbqqOUQBAv8+gyiFTMuzO
	ULPaPmfzVM/lRJ5lcBzZxjE2ZXBepazU/9u/h6qmZyPWMHbG8+BzsRfeU/1Uu3caWQRM
	DuqJNgmii+bMhIIaChkW0HOXfxsiMc3OB9ua7Dt7Gt9VstHaJP+idEf8NXofEV5yTnar
	mHKmrBmJtAQhDqSd+33ChKAjd/MiI2JgdANsDexwohjdxU2O1gxl9LdwJcHaPKYgezgM
	vhPA==
MIME-Version: 1.0
X-Received: by 10.236.110.36 with SMTP id t24mr2975511yhg.102.1422017232375;
	Fri, 23 Jan 2015 04:47:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 23 Jan 2015 04:47:12 -0800 (PST)
In-Reply-To: <54C1AE00.6010402@windriver.com>
References: <54C1AE00.6010402@windriver.com>
Date: Fri, 23 Jan 2015 10:47:12 -0200
X-Google-Sender-Auth: NH6zkZooFcnRnOLNPqmYIzUqFU8
Message-ID: <CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 12:47:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
> have GPLv3's m4-native_1.4.17.bb, I think that we can remove
> m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
>
> I'd like to remove it because we don't build the lower native version by
> default, and we don't know whether it works or when it would fail.

I second this; not tested recipes are always good to remove.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

