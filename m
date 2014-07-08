Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15FCA65E38
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 08:07:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6887acl023957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 01:07:37 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 8 Jul 2014 01:07:36 -0700
Message-ID: <53BBA6C4.7060306@windriver.com>
Date: Tue, 8 Jul 2014 16:07:32 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1404540383-13425-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LbLcADdC0qC7cYNDWoZOjvj_BXg42-K4siPE518MykU2Q@mail.gmail.com>
	<53BA715D.6010901@windriver.com>
	<CAJTo0Lban=ZhrrPMXN6kLvkHyuhUbinOGWwyhQsNyKh7rsMLZg@mail.gmail.com>
In-Reply-To: <CAJTo0Lban=ZhrrPMXN6kLvkHyuhUbinOGWwyhQsNyKh7rsMLZg@mail.gmail.com>
X-Originating-IP: [128.224.163.186]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 08 Jul 2014 08:07:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2014 06:38 PM, Burton, Ross wrote:
> On 7 July 2014 11:07, Ming Liu <ming.liu@windriver.com> wrote:
>> I got your point, but my patch was not tring to address the conflict of
>> binaries or libraries, that kind of conflicts would not cause build error,
>> as you pointed out, only ever a single instance be installed at one time.
>> It's actually tring to fix a conflict of conf file, if the gconfd-2 is put
>> into libexec directory, we have to keep a path like
>> /usr/lib64/gconf/gconfd-2(or /usr/lib/gconf/gconfd-2 in lib32 case)
>> referring it in /usr/share/dbus-1/services/org.gnome.GConf.service which
>> will cause the conflict.
> So why did the commit message talk about
> /usr/share/dbus-1/services/GConf.service conflicting between
> installation, and how will your patch fix that error?  As far as I can
> tell ${datadir} isn't in the MULTILIBRE_ALLOW_REP so they'll still
> conflict, right?
>
> I still think that splitting up the gconf package into library and
> tooling is the logical solution.
I made this patch against to a old version of oe, I don't know much 
about the MULTILIBRE_ALLOW_REP thing, maybe you are right, I will try to 
figure out a new patch.

the best,
thank you
>
> Ross
>
>


