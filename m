Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TtUHJ-0002Nr-KC
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 03:23:30 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so712558pad.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 18:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=saDc5DWd/HWO1cmIFggmMDJZ04sAX4xwP3p0zXrZ2nA=;
	b=MqHZOTs+mvwziZkXSWYdLj9jTe2KWUQJZzAWvA2lmGjmbR0N7sHbHHU3wpQFNVQLGr
	i46Al3EZ+B/ag9PRRhSLzioXZ2thFtUjWq2noGzkhP9TZpkb3ZpbFTacpBTM8OrBjVHK
	ul2XZ5KTrq1xUEsMV/9Anic2vfuKj6Wg+AcGDOc3Szhe55gWvLvY5I81XS9wZqF411Ok
	pOcz15rAt2f+1wLk08TimlaGDuQJvPbz80S8HWCTxbwFt0gpUFxVyZPVB77Q7Bb/Bp3U
	aallEF5MyqdO6lorCG4cOs06THVAzoLR2aWpff/Y4Mw8GqF3R2BrcWu7SdKK8qB5spQ5
	jWjg==
X-Received: by 10.68.237.135 with SMTP id vc7mr224298382pbc.2.1357870093956;
	Thu, 10 Jan 2013 18:08:13 -0800 (PST)
Received: from yiqingliang-pc.localnet ([58.212.76.3])
	by mx.google.com with ESMTPS id rs7sm1803278pbc.2.2013.01.10.18.08.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 18:08:13 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Jan 2013 10:06:29 +0000
Message-ID: <3052200.6SOdFal3Kf@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
In-Reply-To: <20130111015212.GK3722@jama.palm1.palmone.com>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
	<2093032.6T1PG2Tjzt@yiqingliang-pc>
	<20130111015212.GK3722@jama.palm1.palmone.com>
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
X-List-Received-Date: Fri, 11 Jan 2013 02:23:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, January 11, 2013 02:52:12 AM Martin Jansa wrote:
> On Fri, Jan 11, 2013 at 09:18:06AM +0000, Yi Qingliang wrote:
> > On Thursday, January 10, 2013 11:42:53 AM Martin Jansa wrote:
> > > On Thu, Jan 10, 2013 at 06:31:22PM +0000, Yi Qingliang wrote:
> > > > when compiling using 4 threads, I got following error.
> > > > the glib2.0-native want find dbus header file.
> > > > If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
> > > > 
> > > > when grep glib2.0 bb files, I can't find dbus in dependency, why?
> > > 
> > > It was causing cyclic dependency at least when dbus tests were enabled,
> > > I'm not sure if this was resolved already.
> > 
> > cyclic dependency???? OMG, do they really need 'cyclic dependency'?
> > splitting them cannot solve 'cyclic dependency'? am i right?
> 
> Please check first if this is still valid:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027987
> .html
> 
> I think it was resolved somewhere, but I'm not sure or you can just add
> it and see if it fails :).
indeed, I can't got 'just add "what"',
maybe you mean just add 'dbus' in glib2.0's DEPENDS?

 I checked the glib2.0, found:
RDEPENDS_${PN}-ptest += "\
		......
            python-dbus \
           "
and the 'python-dbus' depends on 'dbus'.
but for glib2.0, it's compiling need dbus, not only running.
> Cheers,


