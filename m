Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1SUIDt-0008EG-Uh; Tue, 15 May 2012 15:55:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 May 2012 06:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153182159"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2012 06:45:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Tue, 15 May 2012 14:45:30 +0100
Message-ID: <7192456.4O7Cf6LSyd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAOHjBZv+ox9dJh+g1rjFqqnYvcQvLuRboV8ANZssKXTv0NSO7Q@mail.gmail.com>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<4FB25A88.3000100@mlbassoc.com>
	<CAOHjBZv+ox9dJh+g1rjFqqnYvcQvLuRboV8ANZssKXTv0NSO7Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Packages broken URL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 13:55:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 May 2012 15:36:37 Giuseppe Condorelli wrote:
>On Tuesday 15 May 2012 07:30:48 Gary Thomas wrote:
>> On 2012-05-15 07:19, Giuseppe Condorelli wrote:
>> > For example building git-1.7.7 fails fetching the source.
>>
>> Works fine for me:
>> ...
>
> That's right, but why the git.inc contains a undownloadable url?

This should probably be fixed by moving the SRC_URI from the .bb to the .inc, 
yes.

> This can create a mistake in my opinion.

Only if you create your own recipe that uses git.inc but doesn't set its own 
SRC_URI; the current 1.7.7 recipe does set one.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


