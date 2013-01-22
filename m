Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1Txk7W-00072T-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 21:06:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jan 2013 11:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,516,1355126400"; d="scan'208";a="247149941"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 22 Jan 2013 11:51:22 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id D5D092C8001; Tue, 22 Jan 2013 11:51:18 -0800 (PST)
Received: from 10.252.141.203 (SquirrelMail authenticated user kevin.strasser)
	by linux.intel.com with HTTP; Tue, 22 Jan 2013 11:51:18 -0800 (PST)
Message-ID: <58203.10.252.141.203.1358884278.squirrel@linux.intel.com>
In-Reply-To: <50FECBAC.90307@linux.intel.com>
References: <cover.1358463028.git.kevin.strasser@linux.intel.com>
	<5a984e485eb1b568d4fdaa82675dbc5d5e77d8a9.1358463028.git.kevin.strasser@linux.intel.com>
	<50FECBAC.90307@linux.intel.com>
Date: Tue, 22 Jan 2013 11:51:18 -0800 (PST)
From: kevin.strasser@linux.intel.com
To: "Saul Wold" <sgw@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver: remove create_diff_gz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 20:06:59 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On 01/17/2013 02:55 PM, Kevin Strasser wrote:
>> create_diff_gz creates a diff file of the entire 'S' directory.
>> This file isn't needed and is bloating the archiver output directory.
>
> Why is the diff file not needed?  This was requested by the community at
> some point, is the diff including object and binaries?  Can we exclude
> those instead?
>
> Have you been talking with muhammad_shakeel@mentor.com, who is also
> doing work in the archiver?
>
> Sau!
>

Yes, the diff includes whatever might be present in ${S} after
do_package_write_rpm. The binary and object files could be filtered out,
but I'm still unsure if there is anything of value contained in the diff
that isn't already being archived.

It sounds like muhammad_shakeel@mentor.com is busy getting the archiver
working with SSTATE. I'll be sure to sync with him shortly.

-Kevin


