Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id AA80277A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 09:30:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id EC91B265675
To: openembedded-core@lists.openembedded.org
References: <20170324084604.10391-1-romain.perier@collabora.com>
	<04e6341e-ae56-b867-5a6a-7b89cda539d6@collabora.com>
	<5f4c4daa-3745-d5e7-9581-e8b7179b6dfd@linux.intel.com>
From: Romain Perier <romain.perier@collabora.com>
Message-ID: <acf909bb-42c8-337d-1f41-463680ce2626@collabora.com>
Date: Wed, 5 Apr 2017 11:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5f4c4daa-3745-d5e7-9581-e8b7179b6dfd@linux.intel.com>
Subject: Re: [PATCH v2] logrotate: Add systemd support
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
X-List-Received-Date: Wed, 05 Apr 2017 09:30:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello,


Le 05/04/2017 à 10:25, Alexander Kanavin a écrit :
> On 04/05/2017 10:58 AM, Romain Perier wrote:
>> ping
>>
>
> Is this available in newer upstream versions of logrotate? Should you
> send it there first?
>
> Alex
>
No, not yet.
Mhhh, we have variables specific to the recipe in the .service and
.timer, but I think that I can still send a generic version of these
files on upstream and use sed anyway from the recipe...

Romain

