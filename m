Return-Path: <belen.barros.pena@intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B230D605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 11:15:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2014 04:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="541366193"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2014 04:14:49 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.28]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.173]) with mapi id
	14.03.0123.003; Mon, 19 May 2014 12:13:34 +0100
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC] Development workflow
Thread-Index: AQHPc1Nf1FTpbG839E6OxwY2+rJksg==
Date: Mon, 19 May 2014 11:13:33 +0000
Message-ID: <CF9FA5EC.44916%belen.barros.pena@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [10.237.224.30]
MIME-Version: 1.0
Subject: [RFC] Development workflow
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
X-List-Received-Date: Mon, 19 May 2014 11:15:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4653764CC0F35F4E80E47F163DCBDBDB@intel.com>
Content-Transfer-Encoding: quoted-printable

One of the things that came out of the discussion "Why is embedded still
hard" at the OEDAM was the need to document development workflow best
practices, particularly when it comes to application development.

It was agreed that the first step should be collecting existing practices
to understand what people are currently doing and what works well in which
circumstances. If you are working (or have worked) with embedded
application developers, you can help with this. You have a couple of
sharing options:

1) You can talk to me (a 45-minute conversation should do). I can then
document our conversation, and once you are happy with the outcome, I can
share it with the list. If you prefer this way, send me an email off list
or ping me in IRC (belen)

2) You can write it down in an email to the mailing list. You can use the
examples Richard Purdie shared as a starting point

http://lists.openembedded.org/pipermail/openembedded-core/2014-May/092079.h
tml

Or you can answer some / all of the following questions:

* Can you tell me a little bit about the context in which you are using
the Yocto Project? Is it for specific products? Is it across the whole
company?

* How many people are using Yocto Project? How are they organised? How are
they split in terms of their skill set? What are their responsibilities?

* How do the different skill sets interact? Are there specific
deliverables they must hand over to each other, things like development
images, or application recipes?

* Can you describe the development process for custom applications? What
are they main steps in the process?

* Do you use the Yocto Project for the full development process, or only
for certain steps in it?

* Are there any steps in the process that are particularly problematic?
Can you describe why?

* What do you miss to assist you in those steps? Tools? Documentation?
Best practices? Something else?

* Have you looked at the Yocto Project ADT/SDK? Do you find it useful and
if not, what would you consider its limitations?

* Have you looked at the Yocto Project Eclipse plugin? Do you find it
useful and if not, what would you consider its limitations?

* If you could ask 3 wishes from the Yocto Project, what would they be?

The document attached to this Bugzilla feature


https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6225

might also help somehow.

Looking forward to all the answers.

Cheers,

Bel=E9n



