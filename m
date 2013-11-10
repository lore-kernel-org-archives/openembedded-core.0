Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 819996D3CC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2013 18:02:42 +0000 (UTC)
Received: from [173.34.6.101] (port=36555 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VfZLO-0005q6-Nt for openembedded-core@lists.openembedded.org;
	Sun, 10 Nov 2013 13:02:42 -0500
Date: Sun, 10 Nov 2013 13:02:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1311101257290.3090@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: question about FILE_DIRNAME versus THISDIR when setting FILESPATH
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
X-List-Received-Date: Sun, 10 Nov 2013 18:02:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  probably a simple answer to this, but in examining the way FILESPATH
is created, i notice that, in .bb recipe files, the general form of
setting FILESPATH always seems to involve the use of the FILE_DIRNAME
variable, such as in the default value from base.bbclass:

FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
"${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

  however, when one is extending FILESPATH in .bbappend files, the
variable used to refer to the current directory is always THISDIR. but
it's not clear what the distinction is.

  i'm using "bb show" and, when i'm referring to the value of
FILESPATH for an overlayed recipe, both FILE_DIRNAME and THISDIR seem
to properly refer to the directory for the bbappend file.

  can someone clarify the proper usage of these variables? in
particular, why it's important for .bb files to use FILE_DIRNAME but
.bbappend files to use THISDIR? thanks.

rday

p.s.  i'll have a more involved FILESPATH question shortly.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

