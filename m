Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TtTWf-0001AZ-Ap
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 02:35:28 +0100
Received: by mail-pa0-f43.google.com with SMTP id fb10so691751pad.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 17:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=EOqUBh+ab9cq7pOTtxEr0P1FgWQeIctWM3zcOfkuRi0=;
	b=04iC1i8F3yORkRIr5HhGP/9F9uc4UQeK7x/w8zCWqoljTJGXxJV3nGhSWB+gM2FM7A
	e/MXzE3NZ4RWcHnWcqch4ftYiQZcYD5Eixxi2EUMfjbBn1hrvpdX3ISvZhrPHiL7401O
	yrzp/0+VTi07L68SWMveKAM8HWwhxm5G1RDErKk22g6YbgO3BhISfsIdAWGeiSFP4nMX
	OCf1lEIsp+6ukk5AJaHKx6vLnJX9KFwhN4/DsLZ4MR+9nbmnSuDT7e0ImAKz6A990hJY
	sKXtaC6spkob+XtgLgQ+DKbv71d57kG+GUAs7K+E2+TxaGw4MMKrb07OWyGM5qK1dUHa
	Wf7Q==
X-Received: by 10.66.52.79 with SMTP id r15mr203251654pao.46.1357867202471;
	Thu, 10 Jan 2013 17:20:02 -0800 (PST)
Received: from yiqingliang-pc.localnet ([58.212.76.3])
	by mx.google.com with ESMTPS id qh6sm1724553pbb.25.2013.01.10.17.19.52
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 17:20:01 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Jan 2013 09:18:06 +0000
Message-ID: <2093032.6T1PG2Tjzt@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
In-Reply-To: <20130110104253.GU3722@jama.palm1.palmone.com>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
	<20130110104253.GU3722@jama.palm1.palmone.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: glib2.0 and dbus dependency
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
X-List-Received-Date: Fri, 11 Jan 2013 01:35:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, January 10, 2013 11:42:53 AM Martin Jansa wrote:
> On Thu, Jan 10, 2013 at 06:31:22PM +0000, Yi Qingliang wrote:
> > when compiling using 4 threads, I got following error.
> > the glib2.0-native want find dbus header file.
> > If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
> > 
> > when grep glib2.0 bb files, I can't find dbus in dependency, why?
> 
> It was causing cyclic dependency at least when dbus tests were enabled,
> I'm not sure if this was resolved already.
cyclic dependency???? OMG, do they really need 'cyclic dependency'?
splitting them cannot solve 'cyclic dependency'? am i right?
> 
> > ERROR: Function failed: do_compile (see /mnt/src/arm9plf-
> > build/tmp/work/x86_64-linux/glib-2.0-native/1_2.34.3-
> > r0/temp/log.do_compile.28193 for further information)
> > ERROR: Task 1851 (virtual:native:/mnt/src/optimus/poky/meta/recipes-
> > core/glib-2.0/glib-2.0_2.34.3.bb, do_compile) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 929 tasks of which 925 didn't need to be
> > rerun and 1 failed.
> > Waiting for 0 running tasks to finish:
> > 
> > Summary: 1 task failed:
> >   virtual:native:/mnt/src/optimus/poky/meta/recipes-
> > 
> > core/glib-2.0/glib-2.0_2.34.3.bb, do_compile
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


