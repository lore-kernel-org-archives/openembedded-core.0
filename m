Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6197FAA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 00:06:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9U06hd7014698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 17:06:44 -0700
Received: from [128.224.22.69] (128.224.22.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 29 Oct 2019 17:06:42 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20191029203921.17227-1-trevor.gamblin@windriver.com>
	<20191029211331.GB26658@localhost>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <1ecfe095-058b-b0ce-8a83-90a8285accc0@windriver.com>
Date: Tue, 29 Oct 2019 20:06:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029211331.GB26658@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: inotify-tools: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Wed, 30 Oct 2019 00:06:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/29/19 5:13 PM, Adrian Bunk wrote:
> On Tue, Oct 29, 2019 at 03:39:21PM -0500, Trevor Gamblin wrote:
>> An interface for inotify already exists through pyinotify,
>> but migrating inotify-tools to oe-core provides an option
>> that doesn't rely on python.
>> ...
> pyinotify is in meta-python.
>
> The only option currently in oe-core is to use C,
> which is the standard way to use inotify.
>
> inotify-tools can be useful, but I don't see the rationale
> why it should move from meta-oe to oe-core.
>
> cu
> Adrian
>
Right. Echoing the meta-oe patch response, hold off on this after all. I 
have a ptest coming that might use it,

but I'll need to review the gameplan here.


