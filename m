Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8739565CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:50:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J9ofxV029702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Mar 2015 02:50:41 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 02:50:40 -0700
Message-ID: <550A9BEF.7070802@windriver.com>
Date: Thu, 19 Mar 2015 17:50:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1426756518.git.liezhi.yang@windriver.com>
	<2d7e85e6c09f99cac9e6f7c7bd9e33411dc7ac63.1426756518.git.liezhi.yang@windriver.com>
	<1854796.UtEVgRut4l@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1854796.UtEVgRut4l@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: add missing QA to WARN_QA
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
X-List-Received-Date: Thu, 19 Mar 2015 09:50:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Paul,

Thanks for the reply, I just wanted to add them to ALL_QA, but you
are right, I need do more checking and fix, please ignore this patch atm.

// Robert

On 03/19/2015 05:37 PM, Paul Eggleton wrote:
> Hi Robert,
>
> On Thursday 19 March 2015 02:17:43 Robert Yang wrote:
>> The following QA were not in WARN_QA or ERROR_QA, so they are not in
>> ALL_QA:
>>
>> buildpaths
>
> Last I checked enabling this throws up quite a few issues, some of which
> aren't a problem. Has that been fixed? If not, we can't enable it.
>
>> desktop
>
> I'm pretty sure we kept this one off deliberately as well, there are too many
> bad desktop files out there and for most people it doesn't matter.
>
>> libexec
>
> Does this test work?
>
>> pkgname
>
> Only certain package managers care about the rules this test enforces.
>
>> symlink-to-sysroot
>
> I agree this one should probably be enabled.
>
>> unsafe-references-in-binaries
>> unsafe-references-in-scripts
>
> We haven't enabled these because there isn't general agreement that this is a
> problem for everyone.
>
> Cheers,
> Paul
>

