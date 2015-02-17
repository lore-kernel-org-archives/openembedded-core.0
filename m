Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51317606E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 17:09:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1HH986N004004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Feb 2015 09:09:08 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Feb 2015 09:09:07 -0800
Message-ID: <54E375B2.9080002@windriver.com>
Date: Tue, 17 Feb 2015 11:09:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<54E3723B.9050606@windriver.com>
	<CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>
In-Reply-To: <CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Tue, 17 Feb 2015 17:09:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/17/15 10:57 AM, Christopher Larson wrote:
> 
> On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 2/17/15 7:42 AM, Patrick Ohly wrote:
>     > os.walk() returns symlinks to directories in the "dirs" lists,
>     > but then never enters them by default. As a result, the old
>     > code applied neither the directory handling (because that
>     > is active once a directory gets entered) nor the file handling,
>     > and thus never packaged such symlinks.
>     >
>     > The fix is simple: find such special directory entries and move
>     > them to the "files" list.
> 
>     I'm curious, what is the problem that is being fixed with this.
> 
>     Normally you don't want to walk into symlinks to directories, as either you want
>     to capture the symlink itself -- or the symlink is pointing to something you
>     don't have access to when packaging (i.e. /proc).
> 
> 
> This patch doesn't make it walk into the directory symlinks, it moves them into
> the files list rather than the dirs list so they'll be captured themselves, as
> far as I can tell from reading it.

Ok.. I missed that bit.. I'm still curious what this fixes.

--Mark


