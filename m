Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA61A7821C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:17:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8BEHA12025395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Sep 2017 07:17:11 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 07:17:09 -0700
To: Trevor Woerner <twoerner@gmail.com>
References: <1504726014-12929-1-git-send-email-mark.hatle@windriver.com>
	<1504726014-12929-2-git-send-email-mark.hatle@windriver.com>
	<CAHUNapR=0VExCg6U=LBmtgVL3biW+HrspDpVNM73A_==naDy3Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0ef91d0c-73db-d0a6-48c9-680f56c8b4ba@windriver.com>
Date: Mon, 11 Sep 2017 09:17:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapR=0VExCg6U=LBmtgVL3biW+HrspDpVNM73A_==naDy3Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: Default to tipc enabled, and include libmnl dependency
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
X-List-Received-Date: Mon, 11 Sep 2017 14:17:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/7/17 4:36 AM, Trevor Woerner wrote:
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg101002.html

Yes, but I feel this needs to be re-considered.  At present we can't pass the
Yocto Project compliant test (with meta-openembedded included) without enabling
tipc for iproute2.  This justification is hopefully enough to conclude moving
libmnl into oe-core is 'acceptable risk' at this point in the system.

--Mark


