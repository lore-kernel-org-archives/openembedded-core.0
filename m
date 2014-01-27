Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 927CE6E831
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 16:45:00 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wo20so6694423obc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3KZ/E6kTw9L8Jk1i8gC2YdkcdvYOhrUukXeYs8f10Vk=;
	b=QPFj7FtLiqb82GbRFzCUqslG16Uk+fRHKjmbRzluf7AhLFb8r1ImeTZybBWUJkVZ6w
	R2HweFj+MukZuLlse5p8OMdDbn46+s1eMzITq6o671wMMn4V+bt8Hcpw2OP5cGQ+lIIR
	dGIpvAdEnLfXoLe0/8SIBJjYyHIAHmD7+XYNXct4nXtzUC39k/TQOQm3Ma9HUOm5S2nd
	1XYI3JSX43CfUKBjmyMKvYcawQ/JW4CHwKezzyQVs68e7SUgxvU3j95i2ZT9xB6GnKFb
	SbACM6s/i+7247ZkfKMIFtabuTmHkOJG4qd6WcX3/Tmo/qU5bcfAZX8LLG6+DU1I/MV9
	aIdQ==
MIME-Version: 1.0
X-Received: by 10.60.76.227 with SMTP id n3mr1102868oew.52.1390841101495; Mon,
	27 Jan 2014 08:45:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 27 Jan 2014 08:45:01 -0800 (PST)
In-Reply-To: <1390833588.17424.254.camel@ted>
References: <1390833588.17424.254.camel@ted>
Date: Mon, 27 Jan 2014 14:45:01 -0200
X-Google-Sender-Auth: i7OIETYgvAbiY5lBsaSm2qltQ2w
Message-ID: <CAP9ODKpr8ydsGUYdniyFwO1pgp9pOW4+RcU78SxhOhRRn4XEVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 27 Jan 2014 16:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 27, 2014 at 12:39 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Its rather sad that people don't appear to read local.conf and then complain
> about slow builds when they're just using a single thread. Most systems have
> more than one core now so we might as well use a more automatic default
> for these values. This may lead to better experiences for new users.
>
> [YOCTO #2528]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

