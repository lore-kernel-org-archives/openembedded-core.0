Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9689A6F778
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 15:03:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2EF3Hmw024494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Mar 2014 08:03:17 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 14 Mar 2014 08:03:16 -0700
Message-ID: <53231A33.8000800@windriver.com>
Date: Fri, 14 Mar 2014 23:03:15 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LZPGDftsVZD0NQKSWYD9BnKkMOrdTGUOKnQ2bVY+b-jwg@mail.gmail.com>
In-Reply-To: <CAJTo0LZPGDftsVZD0NQKSWYD9BnKkMOrdTGUOKnQ2bVY+b-jwg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6 V3] refactor the archiver*.bbclass
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
X-List-Received-Date: Fri, 14 Mar 2014 15:03:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2014 01:45 AM, Burton, Ross wrote:
> On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Robert Yang (6):
>>    classes/archive*.bbclass: remove archive-*-source.bbclass
>>    archiver.bbclass: refactor it
>>    package_rpm.bbclass: archive the source to srpm package
>>    archiver.bbclass: move a few code to copyleft_compliance.bbclass
>>    local.conf.sample.extended: update for the archiver
>>    patch.bbclass: do_patch: unset TMPDIR from environment
>
> This series appears to work for me and doesn't cause rebuilds (after
> removing the patch change, as that obviously does).  Can anyone else
> who actively uses the archiver verify that it still works for them?
>

Thank you very much for the testing and suggestions, I've updated it
a little:

* Remove the [PATCH 6/6] which is used for unset the TMPDIR, we can fix
   it in another thread as bug 5968 describes since it doesn't affect the
   archiver.

* Modified the do_ar_configured a little and tested the "bitbake
   core-image-sato world meta-toolchain", it worked well.

Here is the repo: (the same repo as before)

   git://git.openembedded.org/openembedded-core-contrib rbt/archiver_v3
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver_v3

Robert Yang (5):
   classes/archive*.bbclass: remove archive-*-source.bbclass
   archiver.bbclass: refactor it
   package_rpm.bbclass: archive the source to srpm package
   archiver.bbclass: move a few code to copyleft_compliance.bbclass
   local.conf.sample.extended: update for the archiver

// Robert

> Cheers,
> Ross
>
>

