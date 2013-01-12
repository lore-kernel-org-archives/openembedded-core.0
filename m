Received: from mail-ye0-f181.google.com ([209.85.213.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Ttq3A-0002T6-Es
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 02:38:49 +0100
Received: by mail-ye0-f181.google.com with SMTP id m11so445190yen.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 17:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=yo1V5BikDSQJ1amqummediVy3JcKGHzn5huknZpb5IA=;
	b=v1DHUEEzRvpsTY87VfxfbKhd29HRQCow9qMefYnlQsVRrKyNQV6QYrm9Jb2yU0azl2
	i1YI1LjjMUeMjNYuchg1kKrqFQLz/jqJLutICp6Jg8HoxGkqIfbwA0GHy9/OgO3xabIh
	T3Mu0KHyh328ZhgAt3IQuHXDYc74XrnZls36Uev2QlQ1EDNyozFSkl4v6bc2JahrJ84W
	OyliqGfaAzOF84Fqre/nnFYA7R3vuOXvhlnQis2oJO8kbf794vOXdC5lQ8S+ZqnYTeGU
	MgYwIlk8MdwJ0hFHTZQ2jwOHo9ncM84oQ95vUisSvNE3XAlXCgQEJQZ70ziHiBgxPDek
	bWPA==
X-Received: by 10.236.126.102 with SMTP id a66mr86657099yhi.82.1357953784650; 
	Fri, 11 Jan 2013 17:23:04 -0800 (PST)
Received: from yiqingliang-pc.localnet ([58.212.76.3])
	by mx.google.com with ESMTPS id j8sm5337318ank.21.2013.01.11.17.23.02
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 17:23:04 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2013 09:21:19 +0000
Message-ID: <15791092.kWdxvsskOJ@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
In-Reply-To: <50EFDBCF.6030003@windriver.com>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
	<50EFDBCF.6030003@windriver.com>
MIME-Version: 1.0
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
X-List-Received-Date: Sat, 12 Jan 2013 01:38:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, January 11, 2013 05:30:55 PM ChenQi wrote:
> On 01/11/2013 02:31 AM, Yi Qingliang wrote:
> > when compiling using 4 threads, I got following error.
> > the glib2.0-native want find dbus header file.
> > If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
> > 
> > when grep glib2.0 bb files, I can't find dbus in dependency, why?
> 
> Hi,
> 
> What's the error message?
I can't remember it, somes like can't find dub/dbus.h.

> 
> Cheers,
> Chen Qi
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
> >    virtual:native:/mnt/src/optimus/poky/meta/recipes-
> > 
> > core/glib-2.0/glib-2.0_2.34.3.bb, do_compile
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


