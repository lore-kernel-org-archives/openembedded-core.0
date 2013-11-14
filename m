Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 329CC6D571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 15:49:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAEFnlIw000342
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 07:49:47 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 07:49:46 -0800
Message-ID: <5284F119.8010903@windriver.com>
Date: Thu, 14 Nov 2013 09:49:45 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384433183.git.Qi.Chen@windriver.com>	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>	<5284CFAD.2060903@mlbassoc.com>
	<1384436557.17320.62.camel@phil-desktop.brightsign>
In-Reply-To: <1384436557.17320.62.camel@phil-desktop.brightsign>
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 15:49:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/13, 7:42 AM, Phil Blundell wrote:
> On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
>> Also, is "-" actually valid?  I seem to recall having problems when my build
>> tree had the hyphen ("-") in the path.
>
> Paths with "-" in certainly work for me.  If there are any recipes which
> break in that situation then we should just fix them.

We found an issue with paths that -start- with a '-', there are apparently many 
places where paths are passed into various shell, and the initial '-' can be 
read as an argument identifier.

> OE already has quite a range of baroque restrictions on what sort of
> TMPDIR you are allowed to use (no nfs, no symlinks in the path, no
> spaces in the name) and every new prohibition represents a loss in
> usability.  This patch as proposed already forbids a whole range of
> characters, including things like "+", and I think that disallowing "-"
> as well would be a step too far.

I don't believe Qi Chen sent it to the list, but we built path names with all of 
the special characters and tried to run builds.  The specific list is based on 
the results of those tests.  The other items are already broken, and we're 
trying to be explicit with this for end users.  (Note, it's really the TMPDIR 
that matters.. the 'build' directory is a lot more flexible.)

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


