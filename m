Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5CC6B5D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 12:16:06 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so62428wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 04:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=KCqzBBxF+TA0QdOWby3SrIaZLrucvCPEWoh4BoGjF8E=;
	b=A8ge2Po+sHO7aXYsTJ+chXf0B2fIXuKhsdUUIKI+9z6GEpbo+KkWbsIM0CFHV2I1Tk
	ni/sKuNHtrRkROQTHyQfSOt1T3g1hr35Moxq1EGr1SZNAZuAtGQP+xq6sV+FYM4pCmo3
	Cy9oSUJoHvRM4HgOgQyXT3Qq7C4GNwmAt7cdfR/QjwDV0frwLm2cOeWL5YEIPta+Y5gL
	IgfUPi/2l2/OzikJ8fEotGz/ciNAhSKuK/Y6Z1JENLsSNEtcH5Sce+oQeUnfER3a7das
	AnSktOU031h7stysPgmveT1A883Nf1oHZJMB/4LS2LrSfvBkLfqzYWoZDZ6SqQbwcN7M
	HF5Q==
X-Gm-Message-State: ALoCoQnpcF27V22ajAKp/oi5dAyNWRVNK5Y5bBGvC8Q7oGwK3HUnpNVTikivM9U3zmGh32qTz6WY
X-Received: by 10.194.86.200 with SMTP id r8mr7109468wjz.49.1389096966179;
	Tue, 07 Jan 2014 04:16:06 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id cx3sm3425944wib.0.2014.01.07.04.16.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jan 2014 04:16:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52CB29BA.5050404@linux.intel.com>
Date: Tue, 7 Jan 2014 13:16:06 +0100
Message-Id: <EB17154F-A59B-4283-8F03-FC8DEFDC8285@dominion.thruhere.net>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
	<52CB29BA.5050404@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
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
X-List-Received-Date: Tue, 07 Jan 2014 12:16:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jan. 2014, om 23:10 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 12/31/2013 06:18 AM, Laszlo Papp wrote:
>> Ping?
>>=20
>> Alternatively, the system could also have an option for further
>> fine-tuning what to do with git patches
>>=20
>> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>> It is better to use "git am" when possible to preserve the commit =
messages and
>>> the mail format in general for patches when those are present. A =
typical use
>>> case is when developers would like to keep the changes on top of the =
latest
>>> upstream, and they may occasionally need to rebase. This is not =
possible with
>>> "git diff" and "diff" generated patches.
>>>=20
>>> Since this is not always the case, the fallback would be the "git =
apply"
>>> operation which is currently available.
>>>=20
> Looking at this, is it possible to detect a git patch and only then =
use git am?  Since most of the patches carried in oe-core and other =
layers the 'git am' will typically fail

All the patches I add are git am'able since I use a patch similar to =
this :) A big timesaver is to check for  a .git/ in $WORKDIR otherwise =
git am will try to use a top level git tree (e.g. combo repo) and that's =
not what we want.

regards,

Koen=

