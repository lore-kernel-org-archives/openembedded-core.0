Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S21eV-0002pz-3l
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 15:34:11 +0100
Received: by yhoo22 with SMTP id o22so186655yho.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 06:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.7.102 as permitted sender) client-ip=10.60.7.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.7.102 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.7.102])
	by 10.60.7.102 with SMTP id i6mr5078454oea.9.1330352741194 (num_hops =
	1); Mon, 27 Feb 2012 06:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=P3t4bihrAQVHERTy/gWwza6U/aqhWCPFF3yhyBm4RWc=;
	b=Lo2Aqtxid9X2VkKkT4VarQ0RhVAchc0c1RzYtttkgr9IXQR5K2iaxgaEgNpJ5mBt25
	XyDJcdWyN7ytk/ERvYD5QnvYt0X4GGFjjn8SWtyJVOjYZw3zcSI3YhAuOEJjVQXFk8mI
	9JahFoPcT9PeXGwte4FpguGtYRLYKacD7J9GA=
MIME-Version: 1.0
Received: by 10.60.7.102 with SMTP id i6mr4550976oea.9.1330352741129; Mon, 27
	Feb 2012 06:25:41 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Mon, 27 Feb 2012 06:25:41 -0800 (PST)
In-Reply-To: <20120227063832.GC3859@jama.jama.net>
References: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
	<1330298698.31855.27.camel@ted>
	<CAGDS+nn_wO7eZD1pHL1bY=NR5KaZsopTKRH5XDvDVwXycirTug@mail.gmail.com>
	<CAGDS+n==y3SuLQ8cEBxerAjVyo4d9kf6qgBcQpfAd0n3iL82ew@mail.gmail.com>
	<20120227063832.GC3859@jama.jama.net>
Date: Mon, 27 Feb 2012 06:25:41 -0800
Message-ID: <CAGDS+nmpxAfoSxOW8tFniT9=XknCRodRvzqW9LwtXihaMmRdoQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: elfutils - missing dependency on bzip2?
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
X-List-Received-Date: Mon, 27 Feb 2012 14:34:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 26, 2012 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> gcc:
>>
>> ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>> Rerun configure task after fixing this. The path was
>> '/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+svnr181430-r27/gcc-4_6-branch/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/gcc'
>> ERROR: Function failed: do_qa_configure
>> ERROR: Logfile of failure stored in:
>> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+svnr181430-r27/temp/log.do_configure.27718
>> NOTE: package gcc-4.6.2+svnr181430-r27: task do_configure: Failed
>
> Can you check config.log if it also has warning:
> "library search path "/usr/lib/cmplrs/cc2.11" is unsafe for cross-compilation"
>
> like in mine:
> http://paste.pocoo.org/show/541085/

Unfortunately I already did a -c cleansstate so the log from the
failing build is gone :-(

> I see this only when doing multimachine builds and removing sstate
> helps.

I had only done single MACHINE builds since doing a clean build last
week.  But removing sstate did fix the issue for me.

Sorry I didn't investigate further, but I had a deadline to meet and
didn't have time.  I just wanted to document the errors so that if
others encountered the same thing we would know it wasn't an isolated
occurrence.

Steve


