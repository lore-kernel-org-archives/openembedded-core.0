Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R65mp-0007yi-JL
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 21:15:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KJA1NU026809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 12:10:01 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 20 Sep 2011 12:10:00 -0700
Message-ID: <4E78E508.9080706@windriver.com>
Date: Tue, 20 Sep 2011 14:10:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALT56yOyp2VYEziGiZj4PLjYHFhTkxisKwWnP7_Uy69Cc1ufYw@mail.gmail.com>
In-Reply-To: <CALT56yOyp2VYEziGiZj4PLjYHFhTkxisKwWnP7_Uy69Cc1ufYw@mail.gmail.com>
Subject: Re: [RFC] policy proposal: INC_PR
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
X-List-Received-Date: Tue, 20 Sep 2011 19:15:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/20/11 2:04 PM, Dmitry Eremin-Solenikov wrote:
> Hello, colleagues,
> 
> While debugging some stuff in oe-core & company I've noticed that
> lot's of packages
> either don't use INC_PR, or misuse it (e.g. .inc has INC_PR, but then
> .bb just defines PR = "rX").

I've noticed similar things.  I'd agree, we should define and use INC_PR for
items that have .inc files.  There have been many times that I need to fix a bug
in the .inc file and end up manually updating the PR is 2 or 3 recipes that use
the .inc.

One question though, how do we handle packages with multilib .inc files?

INC_PR += ...  (or is it .=)

--Mark

> From my previous experience with oe-dev, I found INC_PR very usefull
> and error-prone feature.
> What about making usage of INC_PR a policy decision, demanding that
> all new packages should use INC_PR for their recipes, if .inc files
> are used. And then define a grace period
> during which all remaining packages should be converted to INC_PR (3
> months? Next release? I really don't know).
> 
> I'm sorry if this issue was already discussed somewhere and I'm
> duplicating the efforts
> or proposing already discarded idea.
> 



