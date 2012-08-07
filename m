Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <derek.buitenhuis@gmail.com>) id 1SyqF1-00006G-TV
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:19:00 +0200
Received: by yhjj56 with SMTP id j56so15516yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=eS8m1tsds7jH40VoRA9R64qeapFK+ooceFKZo6EYZOY=;
	b=Nzbn/SFG2M1099s4rVJ97j+2Od+zt4BN4pmMw6ZA50+qPotJ1ZNXqj/um4t4AF+67R
	V3WT6SdNAWv/AQc25zE8wjRJxs5tPGFYS+Ejp11zY9UsNauC4Zt8pWNzLYOyyx2FT7i4
	VQ0gIBje6waK/UBsPL+z3snejNdX5XyXloBN/xU+0YFQAiVwPKHMdPk76itSIEhWg4hn
	A5Ekxgr5hy3fB2BVVP96p4TZOG5fgEGLagEt1sN0nujqOe5lrZjBjcYsdYvl/j2fXbUB
	Njbv+8zLnmH8sYMBmoADDzU5yigCSp4+kklqkL64NiSMJk3W9OPY/wD3cB02wtwrfIWm
	nV1Q==
Received: by 10.50.94.231 with SMTP id df7mr9851839igb.74.1344370032882;
	Tue, 07 Aug 2012 13:07:12 -0700 (PDT)
Received: from [192.168.1.111] (S0106586d8f4832af.tb.shawcable.net.
	[24.109.142.27])
	by mx.google.com with ESMTPS id aj1sm541079igc.1.2012.08.07.13.07.11
	(version=SSLv3 cipher=OTHER); Tue, 07 Aug 2012 13:07:12 -0700 (PDT)
Message-ID: <5021755C.1020707@gmail.com>
Date: Tue, 07 Aug 2012 16:06:52 -0400
From: Derek Buitenhuis <derek.buitenhuis@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343942157-15997-1-git-send-email-yao.zhao@windriver.com>
	<501D7090.2040500@gmail.com> <50213316.8080503@windriver.com>
	<5021499A.60008@gmail.com>
In-Reply-To: <5021499A.60008@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] gstreamer: gst-ffmpeg: fix build issues for libav
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
X-List-Received-Date: Tue, 07 Aug 2012 20:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2012 1:00 PM, Derek Buitenhuis wrote:
>> I am fixing for e500mc which is not a case here and I am not sure what 
>> > exactly the cpuflags should be.
>> > Any idea?
> http://lists.libav.org/pipermail/libav-devel/2012-August/032990.html
> 
> Working on it.

And done:

http://git.libav.org/?p=libav.git;a=commit;h=4ab26cb4cc9af2ab2199105aa273aa23e1f27911

- Derek



