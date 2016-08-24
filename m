Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 324C47017B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:42:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7OEgblJ031330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 24 Aug 2016 07:42:38 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Aug 2016 07:42:36 -0700
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
	<ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
	<17a87fc8-1cae-2393-ca91-67aa82b2e200@smile.fr>
	<0d5d7656-0bdb-faac-17ca-f156f3654e81@windriver.com>
	<a5c693a1-42a3-2234-291c-eef54f9a4358@smile.fr>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <1e3cae90-026d-d2b8-bf7e-a7d2be57804b@windriver.com>
Date: Wed, 24 Aug 2016 09:42:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <a5c693a1-42a3-2234-291c-eef54f9a4358@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] [rpm] force a configure before make distclean
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
X-List-Received-Date: Wed, 24 Aug 2016 14:42:40 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/24/16 9:17 AM, Jérémy Rosen wrote:
> 
> 
> On 24/08/2016 16:13, Mark Hatle wrote:
>>
>> Make often has a rule looking at the time stamp of specific files and re-running
>> specific autotools if they are 'out of date'.  That COULD be the cause of the
>> errant call to gcc?
> that would make sense...
>>
>> I have not observed the above occurring -- but the key thing is that syck needs
>> to be cleaned of the generated files.  We don't want to run any host commands
>> other then clean it.
>>
>> If you have to replace it with something else, you will need to identify all of
>> the files that need to be cleaned and manually remove them avoiding the
>> distclean call.
>>
>> Easiest way to do that.... extract the source for syck, back it up, run the make
>> distclean.. compare the difference and use that list as a replacement 'cleanup'
>> command.
> 
> That wouldn't be very robust to future change in syck, i'm afraid... but 
> i'll have a look.

There is nothing robust about this change for future work.  Future versions will
have to do the work in a different way -- and hopefully won't have pre-built
crap slipped into the download that we have to cleanup.

So I have no concern about future proofing this, as I know the next integration
-will- be different in this case.

--Mark

>>
>> --Mark
>>
>>
> 


