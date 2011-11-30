Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVY1G-0007iE-Kf
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:27:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 16:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96745952"
Received: from unknown (HELO [10.255.15.149]) ([10.255.15.149])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 16:19:40 -0800
Message-ID: <4ED5769C.2070905@linux.intel.com>
Date: Tue, 29 Nov 2011 16:19:40 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1322607016.git.sgw@linux.intel.com>
	<63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
	<20111129230811.GN7441@jama.jama.net>
	<4ED573D3.4040408@linux.intel.com>
In-Reply-To: <4ED573D3.4040408@linux.intel.com>
Subject: Re: [PATCH 20/26] libiconv: Update to 1.14
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
X-List-Received-Date: Wed, 30 Nov 2011 00:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 29/11/11 16:07, Saul Wold wrote:
>>
>> where are checksums now?
>>
> Vanished!
> 
> I did a fetch for all of these and did not see errors, will go back and
> fix these and the Xorg-server.

It's a NOTE not an ERROR. Maybe we should change that? Further, IIRC, if
the files are already in DL_DIR (with the  we don't checksum them.

As the last person to touch that code I'm happy to be assignee of any
bug you may wish to file.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


