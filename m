Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 775E471CAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:21:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3BELbHv022527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:21:38 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 07:21:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CAEg-Je8BnTDr6BxLOUBO3Y5a+yKjggk=cLSY7n-Aeq61GMVmTQ@mail.gmail.com>
	<1301981f-af40-612f-a383-5feb2886e33e@windriver.com>
	<CAHUNapShkap-XagZvEu8=r_21QRX9TiEtV9XwL6gox4SrNohXQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5731b9a7-3b04-651c-3f9c-74d0ca5d637d@windriver.com>
Date: Tue, 11 Apr 2017 09:21:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapShkap-XagZvEu8=r_21QRX9TiEtV9XwL6gox4SrNohXQ@mail.gmail.com>
Subject: Re: About misappropriation of one of my patches in OpenEmbedded
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
X-List-Received-Date: Tue, 11 Apr 2017 14:21:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/10/17 8:19 PM, Trevor Woerner wrote:
> First and foremost, yes a patch from Neal was mishandled. However, I
> think the dial went up to 11 on this one a bit too quickly.
> 
> As far as I can tell Neal's attribution still appears in the
> 0001-Add-fallback-fopencookie-implementation.patch file. All that
> happened was that an extraneous "com>" was removed from the email
> address so it is now valid. The line was modified, not removed.
> 

The issue wasn't that, it was that the 'Signed-off-by: ...' line was added to
the original patch without asking Neal.  It's not permitted to add someone elses
Signed-off-by line without their permission.

Also the attribution at the top of the file (originally there in the first
version) was removed in a later version.

These items combined are what triggered the issue.  It was unclear Neal authored
the original version of the patch.  It was unclear that it was modified.  It
looked like Neal consented to the sign-off-by line.

--Mark

