Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B49BA60132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:47:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u29LlQ8o005274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 13:47:26 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 13:47:25 -0800
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
	<56E09460.9070105@windriver.com> <56E09545.6020602@windriver.com>
	<CAPybu_1s+9P0cL=Tic9QE4z8zioVbgdqmgkgYfohKsjHSO1CFQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56E099ED.4050705@windriver.com>
Date: Wed, 9 Mar 2016 15:47:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_1s+9P0cL=Tic9QE4z8zioVbgdqmgkgYfohKsjHSO1CFQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 21:47:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/9/16 3:30 PM, Ricardo Ribalda Delgado wrote:
> Hi Mark
> 
> On Wed, Mar 9, 2016 at 10:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> Just wanted to clarify the above.  RPM -does- support self-referencing
>> dependencies.  Circular dependencies are different, in that A -> B -> C -> A..
>> those are detected and there is some basic logic to break those.
> 
> So if I got it right you are in favour of breaking A->A dependency in
> package_deb.class like is done in this patch?

Yes, but I don't think a warning is necessary.

--Mark

> Thanks and best regards!
> 


