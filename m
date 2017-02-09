Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id AEBCC6AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 12:06:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170209120637281_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 04:06:37 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=59998 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cbnUd-0002MS-F5 for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2017 07:06:31 -0500
Date: Thu, 9 Feb 2017 07:06:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what is the significance of the numeric version part of 'PV = "1.0.1+git${SRCPV}"'?
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
X-List-Received-Date: Thu, 09 Feb 2017 12:06:40 -0000
Content-Type: text/plain; charset=US-ASCII


  i *thought* i understood this, but a colleague insists i don't so
... dumb question time.

  recently, i asked about the netdata recipe file "netdata_git.bb",
which contains the snippet:

  SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
  SRCREV = "36c1304e37094174ea51001903058e65053107ca"
  PV = "1.0.1+git${SRCPV}"

perhaps i've been wrong all this time, but i understood the above to
mean that the source checked out would be based on commit
36c1304e37094174ea51001903058e65053107ca, and that the "1.0.1+" part
of the PV variable was simply for aesthetics.

  i realize that the full value of PV would be used to generate the
final rpm files, and here's what i get:

  netdata-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
  netdata-dbg-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
  netdata-dev-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm

but is there some other significance or functionality associated with
that "1.0.1+" prefix for PV?

  the only thing i can think of is OE's algorithm for selecting the
most recent recipe. AIUI, if i have multiple versions for the same
recipe. all things being equal, OE would choose the "git" recipe file
over a numerically-versioned recipe file, correct?

  so, say i have two recipe files:

  netdata_1.0.2.bb
  netdata_git.bb

i assume that OE would choose the second one by default, even if,
internally, that "git" form of the recipe selected a SRCREV that might
represent an earlier commit than the 1.0.2 version.

  do i have that right? i'm quite prepared to be told i'm totally
off-base here. if this is explained in one of the YP docs, i'm happy
with a pointer to it, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



