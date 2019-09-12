Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 61AEC7E5FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Th2g0gc5z56;
	Thu, 12 Sep 2019 16:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568298507;
	bh=xyFx4U9s3GJbI/BwBykAv5EuH+7a7AeqK8mlwzl/Vok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMJ5zSi1b32NVoepUAhGey0/jDZ3jP698GVhKI2JIJ4+Cqj8ylaaLaZZJUrMhzy6y
	v6a9QSNgRow+loK79JA7keVJ9nyTQSOGxBJlqb8H079BBMNHGgJKtlisiKCE2z0cEO
	J4g2h+GOKa+Z9Q233dL0tonm/28cAX4MJ193riwjfALZn458CxaIdMoRO5aPMWZTk0
	Bvhq9f2J+PHP6li/Dn/Xf/3HYPuhH9TId8SBxX5RpttBLzAYePTAbE1wY29vS45W6M
	+s8GozxX/rpUresGq9NoTM2cOEFJDCSGNJmqnjnT1K2qFcPHZbFUsfp4uHYSKttQRu
	fLtIzSTxClf0LTk0VMs9lY4/ApfGzHQw6AYxfhT5X0HJt4C2D4cx0XWGM4vTeC8TTW
	QJWR735iQhImAE3Ir7MC6yVzep3yOwMvL3biYzICD2qgFWgviCA308v9AWxRN84sqY
	tFXM6Qp7cnBm1Hgfj4c3MWuhmS5p3+mocEEVCyQ4DNtEfwq9a2TqxadAdEcQmHxsg/
	r/EsOa8UEYb0PvRxXjn0aTZ3dUjvC/sY8S9VageqsqVQptMEGX2EU0jX/q14pByxmn
	P14LABqTigbiUpVjy6ecJCzQWm4KVc9gVk7J/8J7QeimN8dA5hDLgi39W2a84mJ9GV
	xnxU1ECMbEUn/fwybu+lDlEs=
Date: Thu, 12 Sep 2019 17:28:24 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190912142824.GB5021@localhost>
References: <20190912065221.733-1-zangrc.fnst@cn.fujitsu.com>
	<e91aab69-d7ab-dd80-1671-72e21e85711b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e91aab69-d7ab-dd80-1671-72e21e85711b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Thu, 12 Sep 2019 14:28:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 12, 2019 at 07:10:08AM -0700, akuster808 wrote:
> 
> 
> On 9/11/19 11:52 PM, Zang Ruochen wrote:
> > -tzdata : upgrade from 2019b to 2019c.
> >
> > -tzcode-native : upgrade from 2019b to 2019c.
> >
> > -tzdata.bb and tzcode-native.bb require timezone.inc.
> 
> Not exactly what I had in mind.  When there is a TZ update they send out
> what changed any why.  It looks like this"
>...

IMHO that would be far too long for a commit message,
and changelogs of this size would make the git history
unreadable if everyone would start pasting huge upstream
changelogs in their commits.

cu
Adrian

BTW: How is the legal handling of the metadata, when such lengthy
     3rd party texts copyrighted by various people under various 
     licences are distributed as part of the git metadata?

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


