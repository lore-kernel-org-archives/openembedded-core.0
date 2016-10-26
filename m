Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id F3E92606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 12:54:52 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161026125342822_0485;
	Wed, 26 Oct 2016 12:53:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=33081 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzNi4-0005RV-27; Wed, 26 Oct 2016 08:53:36 -0400
Date: Wed, 26 Oct 2016 08:52:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <alpine.LFD.2.20.1610260520300.17717@ca624034.mitel.com>
Message-ID: <alpine.LFD.2.20.1610260849140.1963@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
	<alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
	<CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
	<alpine.LFD.2.20.1610260520300.17717@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Wed, 26 Oct 2016 12:54:54 -0000
Content-Type: text/plain; charset=US-ASCII


  never mind, i think i finally twigged to what i need ... i can see
in the include file "perl-rdepends_5.22.1.inc" how to define a
required module, such as the following "Text::*" modules:

RDEPENDS_${PN}-module-text-abbrev += "${PN}-module-exporter"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-carp"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-exporter"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-overload"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-selfloader"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-strict"
RDEPENDS_${PN}-module-text-balanced += "${PN}-module-vars"
RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-carp"
RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-exporter"
RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-strict"
RDEPENDS_${PN}-module-text-tabs += "${PN}-module-exporter"
RDEPENDS_${PN}-module-text-tabs += "${PN}-module-strict"
RDEPENDS_${PN}-module-text-tabs += "${PN}-module-vars"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-exporter"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-re"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-strict"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-text-tabs"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-vars"
RDEPENDS_${PN}-module-text-wrap += "${PN}-module-warnings-register"

so, AFAICT, i need define only the equivalent information for
additional modules i want, and explicitly add those to the list of
modules i want built.

  seems pretty straightforward, am i overlooking anything?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


