Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A908608CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 16:59:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4UGxdNL023337
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 09:59:39 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 09:59:39 -0700
Message-ID: <51A78579.3050704@windriver.com>
Date: Thu, 30 May 2013 11:59:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
	<51A71980.30802@communistcode.co.uk>
	<51A74370.3030700@windriver.com> <51A74CFA.5090609@balister.org>
	<51A7751E.9060102@windriver.com>
	<BD275838-4C3A-49B8-8CEF-27A3A7BBC81E@gmail.com>
In-Reply-To: <BD275838-4C3A-49B8-8CEF-27A3A7BBC81E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
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
X-List-Received-Date: Thu, 30 May 2013 16:59:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/13 11:56 AM, Khem Raj wrote:
>
> On May 30, 2013, at 8:49 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
>> The issue isn't that it's a few bad recipes, the issue is that meta-oe is a collection of software that doesn't fit anywhere else.  (I'm speaking specifically of meta-oe, -not- meta-openembedded which has multiple layers in it.)
>
> OK I see that you are not supporting meta-oe in your commercial product but are in need of bits and pieces from it I would suggest to poach the recipes and keep them in your own supported layer if you do not wish to support meta-oe and It would be nice if you fed back any bug fixes or changes.
>

Just to be clear, this is exactly what we are doing, and intend to do.  Pick 
pieces as needed from meta-oe, submit fixes/uprevs back to meta-oe for those pieces.

If we see a more general need we will submit them to oe-core as well, if they're 
not accepted, then they go back to meta-oe.

--Mark

