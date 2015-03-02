Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E5C2672D75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 17:29:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Mar 2015 09:29:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="461411058"
Received: from unknown (HELO [10.219.4.153]) ([10.219.4.153])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2015 09:23:06 -0800
Message-ID: <54F49DEE.5040103@linux.intel.com>
Date: Mon, 02 Mar 2015 11:29:18 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALXw4G4Sw72OzA10BKVrOA7cz2=WM8M2gnAdT_RdoZ+M8P5xMg@mail.gmail.com>
In-Reply-To: <CALXw4G4Sw72OzA10BKVrOA7cz2=WM8M2gnAdT_RdoZ+M8P5xMg@mail.gmail.com>
Subject: Re: NFS server
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
X-List-Received-Date: Mon, 02 Mar 2015 17:29:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 28/02/15 14:39, Michael Gloff wrote:
> All,
> I have run into the issue of nfs server seg faulting when trying to 
> start. After some searching I found that it is related to GCC 4.9.x 
> and nfs-utils-1.3.X
>
> http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-July/027853.html
>
> There is a patch that I have tested locally that works.

Hmm, that seems weird, I seem to remember this specific patch being 
already fixed upstream, I will check this later today.

