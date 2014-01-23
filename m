Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0256B05F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:35:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NFZEQH004517
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jan 2014 07:35:15 -0800 (PST)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 07:35:14 -0800
Message-ID: <52E136B1.5020805@windriver.com>
Date: Thu, 23 Jan 2014 09:35:13 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>	
	<1390487566-13569-3-git-send-email-jason.wessel@windriver.com>
	<1390489330.24755.17.camel@e130.pbcl.net>
In-Reply-To: <1390489330.24755.17.camel@e130.pbcl.net>
X-Enigmail-Version: 1.6
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/6] unfs3, unfs-server: Replace all instances of unfs-server with unfs3
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
X-List-Received-Date: Thu, 23 Jan 2014 15:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 01/23/2014 09:02 AM, Phil Blundell wrote:
> On Thu, 2014-01-23 at 08:32 -0600, Jason Wessel wrote:
>>  # Not automake, no out of tree build support
>> -#B_pn-unfs-server-native = "${SEPB}"
>> +#B_pn-unfs3-native = "${SEPB}"
> Is that still true?  The unfs3 recipe makes it look like it does use
> autotools.


With v1 no, with v2 yes.  I had done a global search and replace.  I would say we can dump these commented out lines.

Thanks,
Jason.

