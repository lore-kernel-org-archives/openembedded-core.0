Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 307597737D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:44:51 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170127124450682_0684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:44:50 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=34378 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cX5tS-0005fP-KN for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2017 07:44:42 -0500
Date: Fri, 27 Jan 2017 07:44:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what is the working directory for configure/compile/install tasks?
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
X-List-Received-Date: Fri, 27 Jan 2017 12:44:53 -0000
Content-Type: text/plain; charset=US-ASCII


  this is such a simple question, i'm kind of embarrassed to be asking
it.

  i've been handed a simple example of Makefile-based source to turn
into a recipe, and the configure/build process is absolutely
straightforward -- top-level "configure" and "Makefile" files to be
run -- to the point where i can simply define my own do_configure(),
do_compile(), etc. tasks.

  i'm aware that most tasks are defined in terms of commands that
explicitly use directory references with "S", "B", "D", WORKDIR, and
so on and so on. but if i want to define a do_configure() task that
does nothing more than invokes the top-level "configure" script, how
would i refer to it?

  i'm reading the YP dev manual, and it'a just a bit vague on this
topic, unless i managed to miss it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


