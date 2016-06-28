Return-Path: <roy_garrard@selinc.com>
X-Greylist: delayed 5405 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Jun 2016 22:41:23 UTC
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id 452ED7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 22:41:23 +0000 (UTC)
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by volare.selinc.com (8.16.0.11/8.16.0.11) with ESMTP id u5SLBI13009901
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 14:11:18 -0700
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 62825DA9:8A958726-88257FE0:00736231;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP3 SHF227 March 23, 2015
Message-ID: <OF62825DA9.8A958726-ON88257FE0.00736231-87257FE0.00746332@selinc.com>
From: roy_garrard@selinc.com
Date: Tue, 28 Jun 2016 15:11:17 -0600
X-MIMETrack: Serialize by Router on Edison/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 06/28/2016 02:11:18 PM,
	Serialize complete at 06/28/2016 02:11:18 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8210
	signatures=670740
Subject: Mercurial Fetcher and Autorev
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
X-List-Received-Date: Tue, 28 Jun 2016 22:41:24 -0000
Content-Type: multipart/alternative;
	boundary="=_alternative 0074633087257FE0_="

--=_alternative 0074633087257FE0_=
Content-Type: text/plain; charset="US-ASCII"

Hey y'all,

I'm having a bit of trouble using the AUTOREV variable with the hg 
fetcher. I brought up the issue on StackOverflow and was pointed this way.

The Yocto mega manual states that only Subversion, Git, and Bazaar support 
AUTOREV (5.21). But the code itself has a function called 
supports_srcrev() that returns True. Also, I've seen references to others 
that seemed to have success in using it (like this guy).

Does the hg_fetcher support AUTOREV? And if so, how can I get it to work?

- Roy, Software Engineer Intern at SEL

--=_alternative 0074633087257FE0_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">Hey y'all,</font>
<br>
<br><font size=2 face="sans-serif">I'm having a bit of trouble using the
AUTOREV variable with the hg fetcher. I brought up the issue on </font><a href="http://stackoverflow.com/questions/37973689/mercurial-fetcher-and-autorev?noredirect=1#comment63578429_37973689"><font size=2 color=blue face="sans-serif">StackOverflow
</font></a><font size=2 face="sans-serif">and was pointed this way.</font>
<br>
<br><font size=2 face="sans-serif">The Yocto mega manual states that only
Subversion, Git, and Bazaar support AUTOREV (5.21). But the code itself
has a function called supports_srcrev() that returns True. Also, I've seen
references to others that seemed to have success in using it (like</font><a href="http://gumstix.8.x6.nabble.com/How-to-Use-Hg-Mercurial-URI-in-SRC-URI-Variable-to-Fetch-Code-td4866429.html"><font size=2 color=blue face="sans-serif">
this guy</font></a><font size=2 face="sans-serif">).</font>
<br>
<br><font size=2 face="sans-serif">Does the hg_fetcher support AUTOREV?
And if so, how can I get it to work?</font>
<br>
<br><font size=2 face="sans-serif">- Roy, Software Engineer Intern at SEL</font>

--=_alternative 0074633087257FE0_=--
