Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65898600FB;
	Tue, 18 Jun 2013 21:00:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5IL0aVk018819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 14:00:36 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 14:00:36 -0700
Message-ID: <51C0CA73.7090606@windriver.com>
Date: Tue, 18 Jun 2013 16:00:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>, Yocto Project
	<yocto@yoctoproject.org>
Subject: [RFC] eglibc / glibc and option-groups being deprecated?
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
X-List-Received-Date: Tue, 18 Jun 2013 21:00:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Recently on the eglibc mailing list there has been a discussion about removing 
the option groups.  See: http://www.eglibc.org/archives/patches/msg01268.html

For folks who don't know what option-groups are, it's a patch that went into 
eglibc a number of years ago that allows you to disable various components 
(effectively altering the API) in order to shrink the size of glibc.

It was created as an attempt to get into glibc the same type of configuration 
ability that uclibc has.

In OpenEmbedded Core, it is currently being used to enable the ability to shrink 
the LibC footprint to a smaller size.  The Yocto Project's Poky-tiny 
distribution uses it as part of the mechanism to create a smaller filesystem.

I encourage you to read the original thread, and if it affects you, please speak 
up.  The following is my attempt at summarizing the thread.

Currently the maintainer(s) of eglibc are working on syncing up glibc and eglibc 
to the point that there will no longer be a need for eglibc.  (See 
http://www.eglibc.org/archives/patches/msg01261.html)

EGlibc was originally developed to house various architecture ports and other 
embedded friendly features were not allowed into glibc.  The majority of the 
differences between eglibc and glibc have disappeared, with only a few major 
exceptions.  One of which is the option-groups support.  This item is taking a 
significant amount of resources to keep up to date, and it's unclear as to the 
number of users for this functionality.

The belief of the maintainers is that the days of truly small footprint systems, 
where even 1 MB of storage was a large number are coming to an end.  As such, 
the time and effort to maintain the option groups is likely not worth the effort.

I expect that between OpenEmbedded and the Yocto Project, a large percentage of 
the users would be represented in some way.  But beyond that, I don't have any 
idea as to how many people actually benefit from this technology.

During the discussion the results were that either assistance with maintaining 
the option-groups is needed, or the feature will be deprecated and eventually 
removed.  The last part of the thread it was suggested that in eglibc 2.19 it 
would be deprecated, and then removed in 2.20.

--Mark

