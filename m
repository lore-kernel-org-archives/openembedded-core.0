Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 45FD460144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:33:33 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so2203694yhn.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=k55MDc+wF20BEf1DTrxvvrT+zMjxjwePtzMTIXeZ9y4=;
	b=MSuUMABJyuLUNjw6AVJg416ju/xM1nUxCcLv4Tf2Xh8viw5J/f+bTf/3G2iQuPjS7r
	5S79w08ZFkFklCmcGKTVlLcqJuWA7CFG+HY8+2sl+4vS9ETTh7wGncwuReT6j798rxf9
	hDHmX65joBhAuqISpnM2vVR+ynZXU/I8ulf6JV5NcGCi9EQvR5+SDimj4O0MgxV5nYcm
	pNoNyuCdRVNqV6ZoJknxnbV0nhHfYtr3tAAz2nTtSjJsbaPKxCIsPpbZTKbziqtVzuI0
	XD9f6HkGiWDmbRI/Byr7re96iKm+eDDRXN7tWjmR/HX+/UTcmeavhjHcbsP/9+eUv8TQ
	rKcw==
MIME-Version: 1.0
X-Received: by 10.236.70.229 with SMTP id p65mr34729172yhd.50.1410791614915;
	Mon, 15 Sep 2014 07:33:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 15 Sep 2014 07:33:34 -0700 (PDT)
In-Reply-To: <CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
	<CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
	<CAJTo0LZur5=dt6pfPawcEAM50M9W7zd-0_uoDvj5s74RCgNubA@mail.gmail.com>
Date: Mon, 15 Sep 2014 11:33:34 -0300
X-Google-Sender-Auth: -75AhO6q9ipsPxcNGsl4668P3uI
Message-ID: <CAP9ODKpSNOeXfgLbviu4G_Bw2Tc9y86cTNmoWDFeSsOFZC4M3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 14:33:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 11:21 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2014 14:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I am using 2014.07 in meta-fsl-arm for a while and I support the merge
>> of this for 1.8.
>
> But as we're post-freeze, endorsement doesn't qualify as a reason to
> break the freeze...
>
> (queued in my ross/unfreeze branch for when we've thawed)

I think it is a way better base for work but I really don't care as I
use my own recipe in fsl-arm and so does TI.

Either way Denys please rework the patch so it is easier to review. We
decide for merging or not later when it is good.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

