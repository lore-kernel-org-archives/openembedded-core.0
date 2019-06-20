Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77C697E653
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:58:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5K9vo1B030165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2019 02:58:06 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 02:57:50 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
	<20190620091913.GD27107@localhost>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <fd9aef39-bbbc-f6ed-e9b2-37009952e3ab@windriver.com>
Date: Thu, 20 Jun 2019 17:58:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620091913.GD27107@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 09:58:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/20/19 5:19 PM, Adrian Bunk wrote:
> On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
>> ...
>> Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think that we
>> need something like virtual/gtk to fix these problems totally?
> 
> GTK+2 is mostly obsolete.
> 
> I just checked the GTK4 sources, and there it is renamed to
> gtk4-update-icon-cache. Based on that I would say that your
> patch is actually fine at least for now.

Thanks, I updated the commit message in the PULL:

     The gtk-update-icon-cache is provided by gtk+3, gdk-pixbuf-query-loaders is
     provided by gdk-pixbuf, and gtk+3 depends on gdk-pixbuf, so depends on gtk+3
     can fix the problems.


// Robert

> 
>> // Robert
> 
> cu
> Adrian
> 

