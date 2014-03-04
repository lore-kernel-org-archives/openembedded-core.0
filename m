Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4354460DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 08:45:15 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Mar 2014
	09:45:12 +0100
Message-ID: <53159295.9060600@enea.com>
Date: Tue, 4 Mar 2014 09:45:09 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>	<4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>	<53105913.6020407@enea.com>
	<CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
In-Reply-To: <CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
X-Originating-IP: [172.16.141.133]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Tue, 04 Mar 2014 08:45:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-03-03 21:41, Trevor Woerner wrote:
> Does this resolve issue 5407?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5407
>

This patch satisfies a small part of 5407, when this patch has been 
reworked into a recipe and merged, there is still the issue to 
synchonize the formatting for repositories in f.ex. IPK_FEED_URIS, and a 
general cleanup of code made obsolete(poky-feed-config-ipk, distro-feeds 
et.c.)

Br,
David


