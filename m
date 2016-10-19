Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 5A78271BFB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:28:06 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161019152807270_0486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:28:07 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=39209 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bwsmf-0006bX-3m for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2016 11:28:01 -0400
Date: Wed, 19 Oct 2016 11:27:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
Message-ID: <alpine.LFD.2.20.1610191126290.16108@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 15:28:10 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Oct 2016, Robert P. J. Day wrote:

>
>   not sure how dumb a question this is, but as i was doing a basic OE
> build, i saw the growing number of "nativesdk" rpms piling up under
> tmp/deploy/rpm/x86_64_linux, and wanted to examine a couple of them
> later, but after the sysroot was (i assume) populated with all of
> these rpms, that entire directory was deleted.
>
>   is there a switch to preserve that directory? thanks.

  oh, wait, i think i found it:

SDKIMAGE_FEATURES += "package-management"

does that look right?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


