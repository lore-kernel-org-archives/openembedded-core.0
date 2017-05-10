Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DBD2971A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:31:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="1167104742"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 02:31:02 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
	<cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
	<9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <37bc3fea-105c-a22f-9386-0b0f440bd118@linux.intel.com>
Date: Wed, 10 May 2017 12:31:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Wed, 10 May 2017 09:31:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 12:03 AM, Paul Eggleton wrote:
> Your opinion is noted. My opinion is that we ought to be providing a good
> reference that can be used as a basis for real products (regardless of whether
> whatever direction we choose to go is Qt-based or not) - the rest of our stack
> *is* used that way, after all. We regularly get comments about how Sato isn't
> suitable as such a basis, so the expectation is there. I don't think adding
> Wayland support alone will answer that.

Paul, I do believe specifics matter, and I'm not seeing much of that in 
this discussion :-(

No one has yet provided any idea what this reference UI would try to 
achieve other than it 'being a basis for real products'. This is far too 
vague. Is it a tablet style UI with app launcher, and status bar, 
similar to Sato? Or is it a collection of mutually exclusive fullscreen 
apps that somehow showcase common embedded use cases? Please help me 
understand this.

Then there's the question of who's going to do the heavy lifting.
Are we writing, testing and maintaining our own, and if so, who has time 
for it? Or is there some off-the-shelf thing that would fit, and that 
has miraculously escaped our attention until now?


Alex

