Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 201BC7F8E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 11:00:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2019 03:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="228574493"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2019 03:00:08 -0800
To: openembedded-core@lists.openembedded.org
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-7-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3cd13d50-b437-2438-582a-4c149711a966@intel.com>
Date: Fri, 20 Dec 2019 11:00:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218143758.129308-7-alex.kanavin@gmail.com>
Subject: Re: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Fri, 20 Dec 2019 11:00:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Breaks on Centos 7:

nsinstall.c: In function ‘main’:
nsinstall.c:201:5: warning: implicit declaration of function ‘getopt’ 
[-Wimplicit-function-declaration]
      while ((opt = getopt(argc, argv, "C:DdlL:Rm:o:g:t")) != EOF) {
      ^
nsinstall.c:203:20: error: ‘optarg’ undeclared (first use in this function)
     case 'C': cwd = optarg; break;
                     ^
nsinstall.c:203:20: note: each undeclared identifier is reported only 
once for each function it appears in
nsinstall.c:225:13: error: ‘optind’ undeclared (first use in this function)
      argc -= optind;
              ^

Ross

