Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UbrIb-0002Xy-JF
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 13:52:20 +0200
Received: by mail-pb0-f54.google.com with SMTP id ro8so1872672pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kNoP20TgppfQVdQsRSSsBkYIhloSt7m4LEfxYEnm94k=;
	b=QvkWaIyVEATziFClqwm2qunRorgWEiSiYWeWTAMEV6g2ZJSvQ2lej9cCD9jJ8Z+48z
	WciT5qd3ifwYEVd1SGj4WJduNV04F3PagcTjuLal6/D7ElU43Kkz/1qplSmYkUqQuwBX
	yf6+2MeX3VAzfdoR3GNMWTE1DDcZ1oa4ZVTVxSHkmsM/0reVzLzMp/UDpWUb0rJVNnsd
	OK9OdqzCYbeNqVQy4pfmO820VAIekhorDfnUtbzOZnAjSKKExOOO7I1UQsIGr7QEHFR8
	WbS2rJTTjioByrPrwwJJ5W/xBr5Tktq7DVjqYfv3cCOqhUNlfniORKMa5o0mBQSz+cFT
	4LVw==
X-Received: by 10.66.251.101 with SMTP id zj5mr29158074pac.122.1368444843266; 
	Mon, 13 May 2013 04:34:03 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id to7sm14695877pab.0.2013.05.13.04.34.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 04:34:02 -0700 (PDT)
Message-ID: <5190CE8C.703@gmail.com>
Date: Mon, 13 May 2013 21:29:16 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1368413938-7757-1-git-send-email-net147@gmail.com>
	<CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
	<-7685674658700664845@unknownmsgid>
	<CAJTo0LaVF+sV6JxpaxfL2_daoP+y1CQe=-VqWbTFW+ZVNA8i5Q@mail.gmail.com>
In-Reply-To: <CAJTo0LaVF+sV6JxpaxfL2_daoP+y1CQe=-VqWbTFW+ZVNA8i5Q@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: add iptables to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 11:52:33 -0000
X-List-Received-Date: Mon, 13 May 2013 11:52:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2013 8:03 PM, Burton, Ross wrote:
> On 13 May 2013 10:23, Jonathan Liu <net147@gmail.com> wrote:
>> I did a git pull which updated connman to 1.13 and rebuilt image from
>> scratch clearing all temp files and work. The iptables dependency was
>> missing when I checked with opkg-cl on the target.
> I really can't replicate this - my connman packages just built with
> latest git have a versioned iptables dependency from the link.  Check
> your do_package logs, you should find lines like this:
>
> DEBUG: connman: Dependency libxtables.so.9 requires package iptables
>
> Ross
The connmand daemon was complaining about libxtables.so.9 missing, but 
it's libxtables.so.10 now.
Maybe I just had to force a more complete rebuild.

Regards,
Jonathan


