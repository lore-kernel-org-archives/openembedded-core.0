Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWSk-0002Oj-Ay
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 15:42:10 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:27:28 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so14533550oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=MMNxtFqIqDcNZdMlJb3NQhphsKf1T8GqjckX2S6ok2M=;
	b=kcG5FhCIHrRlIKGwG9+P/DZKbbcslbNTKdkbskSrtkoi3TL+bc4MqEcsZz8r61ZPou
	8rBpBd1oIw2ygjI/cEufbHOcBB9Gbq2C3cCXpNbKUO0U2fty9lTirp99Gt7bgnm3funp
	XlHjtVmcnIQqsPWyt8pPqUM7OExXQetEaiOfTyvEuKgBoAjf7r+JNGxNzDWKIe6aZLgb
	hJ9OvLZI5QmgRxZjNb67FTWQmik8Q2P5QfZiSkFD41IZTpOBtzoEKUl+PTCpDXn09YKg
	MpxayMcJE+OttYdIlYDaWviCrrPqZRqYfbXEUdzItZKmhBwQrYzDo+154KLljJ6MvQYh
	jg1Q==
Received: by 10.60.31.49 with SMTP id x17mr4839039oeh.33.1355495247322;
	Fri, 14 Dec 2012 06:27:27 -0800 (PST)
Received: by 10.60.31.49 with SMTP id x17mr4839028oeh.33.1355495247111; Fri,
	14 Dec 2012 06:27:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 14 Dec 2012 06:27:07 -0800 (PST)
In-Reply-To: <2617323.R94UMbB4eu@yiqingliang-pc>
References: <2617323.R94UMbB4eu@yiqingliang-pc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2012 14:27:07 +0000
Message-ID: <CAJTo0LbppwkY5qww=Utyxh=8=SfHWsfU3OFPLs017AjQ2Gtvdw@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
X-Gm-Message-State: ALoCoQkeQKjtozKugV6Wf9uoKiL98d+yBNAioZku5oCsMhJr0gXyclasRZazyl26QVaOZ9uF8lkiu7n345RcGL23wCGbM+Mkkzkp6eWE9FBtd2zd9Wkdr0AUUeYp468FvC2gUPjU+pJPI0Q4xQiJFW1yxntsg/9oMQAI6/jc4qsp59HsBxh+Q023rRxLgeBBCEABrCPczsne
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how about the 'systemd' status?
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
X-List-Received-Date: Fri, 14 Dec 2012 14:42:11 -0000
Content-Type: text/plain; charset=UTF-8

On 12 December 2012 16:13, Yi Qingliang <niqingliang2003@gmail.com> wrote:
> So I doubt the systemd status about yocto.
> (the "meta-systemd' is labed deprecated.)
>
> on the openembedded.org, the systemd is meta-openembedded, indeed, I'm
> confused by the `openembedded-core' and `meta-openembedded'.

For a description of oe-core vs meta-oe, I recommend the
documentation.  Also
http://www.openembedded.org/wiki/OpenEmbedded-Core is a good start.

The meta-systemd on yocto is - as far as I know - tied to meta-ivi.
If you want to use systemd then you need the meta-systemd layer that
is inside meta-openembedded.

True integration of systemd is a key feature for oe-core 1.4 so expect
to see it integrated fairly shortly.

Ross


