Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1526E717
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 13:04:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1PD4bCU028894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Feb 2014 05:04:38 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 05:04:37 -0800
Message-ID: <530C94E4.1060303@windriver.com>
Date: Tue, 25 Feb 2014 21:04:36 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
	<1026f63b88e1781645e49bec5a1c53a4cd686adb.1393256563.git.liezhi.yang@windriver.com>
	<CAJTo0LaOaN-wMhKPn2AgHyXvrUe5GJNTremFR2pQCGDOxp3Epg@mail.gmail.com>
In-Reply-To: <CAJTo0LaOaN-wMhKPn2AgHyXvrUe5GJNTremFR2pQCGDOxp3Epg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] archiver.bbclass: refactor it
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
X-List-Received-Date: Tue, 25 Feb 2014 13:04:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/25/2014 08:38 PM, Burton, Ross wrote:
> On 24 February 2014 15:56, Robert Yang <liezhi.yang@windriver.com> wrote:
>> 1) unpacked source: ARCHIVER_MODE[src] = "unpacked"
>
> Why does this re-archive the unpacked sources?  When the source is a
> tarball, there's already a tarball in DL_DIR.  Only if the source
> isn't a tarball does it need to be packed up.
>

Good idea, I will update it.

// Robert

> Ross
>
>

