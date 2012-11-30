Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TeH2O-0005pg-Bz
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 04:13:16 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 18:57:50 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so20927pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 18:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=mLBPXmELl50kZKIDOyqRM8uz1IEy2PMhNrI7DBXK6SA=;
	b=W5YSIbevh/xMYfIuPlfSTVvdkUrd7TvNKnlLKrhp3SakjSK5yiTgAn4yMFDmhWkNJ+
	I9VM0LiWgolSgrcuTNAlyMh/PPT9HqFu0xNTnz4mU2xMt2AwJTgR86p9YiDqsxtwVEMl
	vnCGPgB5NcqijpzcVcIsP+DiFUad+NcaNeS043FFlU1WXDTkLeEaVN+LSsr8ma84gAo9
	sSA1oHcY3HYSKIN9/Y9aIYC3s/HJdtjcmEDGVMGjdMi3R/1G+1JiVCt3AZaHAzQbCkSg
	GCZI46JHsYj7EeiUlGO+EATHuXiVyGwr/ZfdzlWHdwL8SbyoIhanVgHkabZQctjolZCf
	Yeaw==
Received: by 10.66.88.196 with SMTP id bi4mr67347402pab.16.1354244270017;
	Thu, 29 Nov 2012 18:57:50 -0800 (PST)
Received: by 10.66.88.196 with SMTP id bi4mr67347396pab.16.1354244269951;
	Thu, 29 Nov 2012 18:57:49 -0800 (PST)
Received: from [192.168.1.104] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id x6sm2054754pav.29.2012.11.29.18.57.48
	(version=SSLv3 cipher=OTHER); Thu, 29 Nov 2012 18:57:49 -0800 (PST)
Message-ID: <50B820AB.5060905@intel.com>
Date: Thu, 29 Nov 2012 18:57:47 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1352807729.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1352807729.git.liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQnxe+86Ayjikv8ItuB5XknBOcVS+gCqp4xoEwnLBMoSyRESrrGUTLwntmfJqMDHck0ktrD18GXEGrl1CIk5g/+eIh3YMZ5QStFhLfMAEkb7dsUkxmbF/QEKbO3blxkUL3KznZV+Qiv7IOi5bf+mufl5KVb4U4CeG47X64L0hhGCyBQZ/q8N+BbVaNYO1HMyG6kLS931
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil] [PATCH 0/2] Fix incremental rpm image generation
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
X-List-Received-Date: Fri, 30 Nov 2012 03:13:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2012 04:56 AM, Robert Yang wrote:
> Port the patches from the master branch to denzil, and have tested on
> our local autobuilder. They are already on danny.
>
> // Robert
>
> The following changes since commit 846b7c388738f382e83576e77b705aa547c1dd9b:
>
>    bitbake: lib/bb/siggen.py: log when tainting the signature of a task (2012-10-12 08:58:48 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/denzil_rpm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/denzil_rpm
>
> Robert Yang (2):
>    package_rpm.bbclass: Fix incremental rpm image generation
>    rootfs_rpm.bbclass: save rpmlib rather than remove it
>
>   meta/classes/image.bbclass       |    6 ++++++
>   meta/classes/package_rpm.bbclass |   20 ++++++++------------
>   meta/classes/rootfs_rpm.bbclass  |    6 +++++-
>   3 files changed, 19 insertions(+), 13 deletions(-)

Pulled into sgarman/denzil-next.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


