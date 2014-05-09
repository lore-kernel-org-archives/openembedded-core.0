Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 254A460559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 20:35:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s49KZQuw023329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 May 2014 13:35:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 13:35:25 -0700
Message-ID: <536D3C0F.1040605@windriver.com>
Date: Fri, 9 May 2014 15:35:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>	<536CF0E6.9060800@windriver.com>
	<1399664736.22845.0@mail.messagingengine.com>
In-Reply-To: <1399664736.22845.0@mail.messagingengine.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Fri, 09 May 2014 20:35:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/14, 2:41 PM, Colin Walters wrote:
> On Fri, May 9, 2014 at 11:14 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>>
>> /run is not always a tmpfs...  We've got configurations where it's
>> persistent.
>
> What?  Why?
>

Certain system configurations may require parts of the /run filesystem to not 
always be on tmpfs.  (Some situations where you have a lot of disk, but limited 
ram for instance..  using tmpfs will potentially put your system into a low 
memory state, or you might not have enough tmpfs to run the system properly.)

As part of the future work to allow for persistent storage on certain things 
that the volatiles are doing right now, /run is one of the directories that 
needs to be investigated.  Is there actually anything there that may be 
desirable to persist from one boot to the next?

--Mark

