Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8D6165CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:48:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s77DmJgh026706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Aug 2014 06:48:20 -0700 (PDT)
Received: from [128.224.56.57] (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 06:48:19 -0700
Message-ID: <53E383AA.9010202@windriver.com>
Date: Thu, 7 Aug 2014 09:48:26 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
	<167343D1-FE42-441A-B126-F189C129EF2B@dominion.thruhere.net>
In-Reply-To: <167343D1-FE42-441A-B126-F189C129EF2B@dominion.thruhere.net>
X-Originating-IP: [128.224.56.57]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: drop patch that unconditionally mangles manpages
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
X-List-Received-Date: Thu, 07 Aug 2014 13:48:22 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 14-08-07 01:33 AM, Koen Kooi wrote:
> 
> Op 6 aug. 2014, om 22:38 heeft Paul Gortmaker <paul.gortmaker@windriver.com> het volgende geschreven:
> 
>> commit 841ec528ec04e64bd09ff10f8d9ad2d6e3aac05d ("coreutils: update
>> to upstream version 9.21") added a patch which bypassed the check
>> for perl and hence defaults to using the dummy man page for all
>> of the coreutils manpages.  This results in all manpages looking like:
>>
>>  NAME
>>       chmod - a GNU coreutils 8.22 program
>>
>>  DESCRIPTION
>>       OOOPS!   Due to the lack of perl on the build system, we were unable to
>>       create a proper manual page for chmod.
>>
>> It is unclear why the test was disabled, but since it clearly
>> causes the manpages to be useless, we need to drop this patch.
> 
> That all might be true, but DEPENDS doesn't list 'perl' or 'perl-native', so this commit is wrong.

Wrong might be overstated.  The patch unconditionally disables a
_check_ for perl.  So if perl is there, it is used; if it is absent,
it is not.  Given that there really is no excuse for shipping
broken manpages, one could argue that a DEPENDS on perl-native
is sensible, and if that is what it takes to get the broken patch
dropped, I'll add one.

P.
--

> 

