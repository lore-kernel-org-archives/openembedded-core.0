Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id C723671B01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 15:18:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161020151859534_0484
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 15:18:59 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=17260 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxF7O-0002bH-1J for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2016 11:18:54 -0400
Date: Thu, 20 Oct 2016 11:17:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1610201109590.5212@ca624034.mitel.com>
Message-ID: <alpine.LFD.2.20.1610201117250.5351@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610201109590.5212@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: how do i get "nativesdk-rpm-build-5.4.16-r0.x86_64_nativesdk.rpm" into the SDK?
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
X-List-Received-Date: Thu, 20 Oct 2016 15:19:01 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Oct 2016, Robert P. J. Day wrote:

>
>   ok, this one should be simple ... i ran:
>
> $ bitbake -c populate_sdk core-image-minimal
>
> then popped into tmp/deploy/rpm/x86_64_nativesdk to see the rpms
> of interest to me:
>
> nativesdk-rpm-5.4.16-r0.x86_64_nativesdk.rpm
> nativesdk-rpm-build-5.4.16-r0.x86_64_nativesdk.rpm
> nativesdk-rpm-common-5.4.16-r0.x86_64_nativesdk.rpm
> nativesdk-rpm-libs-5.4.16-r0.x86_64_nativesdk.rpm
>
> so far, so good.
>
>   but if i pop into tmp/deploy/sdk and check the host.manifest file
> for the generated SDK, i see references to only:
>
> nativesdk-rpm x86_64-nativesdk 5.4.16
> nativesdk-rpm-libs x86_64-nativesdk 5.4.16
>
> is there a special setting to get the nativesdk-rpm-build into the SDK
> as well? or am i just misunderstanding what i'm reading? thanks.

  oh, wait, is this it?

http://stackoverflow.com/questions/35183532/how-to-add-packages-to-populate-sdk-as-a-host-tool

using TOOLCHAIN_HOST_TASK?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


