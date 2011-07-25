Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlNh4-0006W2-AG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:07:46 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QlNd1-0007Ru-L9 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:03:35 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Jul 2011 09:03:34 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jul 2011 09:03:33 -0700
Message-ID: <4E2D93D3.7030505@mentor.com>
Date: Mon, 25 Jul 2011 09:03:31 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311352057.git.tom_rini@mentor.com>	<516e42bf64159cbea7c5500eb2dbc6452ca3825a.1311352057.git.tom_rini@mentor.com>
	<1311609656.30326.246.camel@phil-desktop>
In-Reply-To: <1311609656.30326.246.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Jul 2011 16:03:34.0005 (UTC)
	FILETIME=[67B89250:01CC4AE4]
Subject: Re: [PATCH 6/8] siteinfo: Move certain db entries to common-linux
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
X-List-Received-Date: Mon, 25 Jul 2011 16:07:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 09:00 AM, Phil Blundell wrote:
> On Fri, 2011-07-22 at 09:28 -0700, Tom Rini wrote:
>> +db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
>> +db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
>> +db_cv_path_cp=${db_cv_path_cp=/bin/cp}
>> +db_cv_path_ln=${db_cv_path_ln=/bin/ln}
>> +db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
>> +db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
>> +db_cv_path_rm=${db_cv_path_rm=/bin/rm}
>> +db_cv_path_sh=${db_cv_path_sh=/bin/sh}
>> +db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
> 
> Those contain assumptions about ${bindir} and ${base_bindir} which are
> not necessarily valid.  I think db should probably be patched for those
> rather than putting them here,

It's possible they simply aren't used anymore, if micro in oe.dev is
building / working with db.

-- 
Tom Rini
Mentor Graphics Corporation


