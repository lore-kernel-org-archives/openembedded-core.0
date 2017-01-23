Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A2C1473D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NEfKaW023069 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:41:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MFPsgEFxEjlx
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:41:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NEfHlX023064
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 14:41:18 GMT
Message-ID: <1485182477.30673.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mario Domenech Goulart <mario@parenteses.org>
Date: Mon, 23 Jan 2017 14:41:17 +0000
In-Reply-To: <87mveh4zbi.fsf@parenteses.org>
References: <1485174363-32506-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1485174952.30673.15.camel@linuxfoundation.org>
	<87r33u3pfi.fsf@parenteses.org>
	<1485176748.30673.16.camel@linuxfoundation.org>
	<87mveh4zbi.fsf@parenteses.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Guard against interrupted compiles
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
X-List-Received-Date: Mon, 23 Jan 2017 14:41:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 15:37 +0100, Mario Domenech Goulart wrote:
> On Mon, 23 Jan 2017 13:05:48 +0000 Richard Purdie <richard.purdie@lin
> uxfoundation.org> wrote:
> > On Mon, 2017-01-23 at 13:56 +0100, Mario Domenech Goulart wrote:
> > > On Mon, 23 Jan 2017 12:35:52 +0000 Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > Wouldn't it be better to have something like
> > > 
> > >    cp .config.orig .config || true
> > > 
> > > instead, to prevent race conditions?
> > Prevent which race condition? I'd hope at this point we're the only
> > thing touching the .config file?
> Yeah, I hope so.
> 
> I mean, the "if exists(file){ do_something_with(file) }" idiom is
> intrinsically subject to race conditions (time of check to time of
> use).
> If we can [easily] avoid them, why not?

I think it makes the code harder to read/understand and we don't need
to do that...

Cheers,

Richard

