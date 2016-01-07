Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B66206E688
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:07:53 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id z14so37117095igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=RlHfIQjRfEP379dTbvF981zZfxr81l4t7lgCscfwOkw=;
	b=aBLztOm5DjLy2bpAZ/6DLvfQupy8vYWXbXxoJi4ujglm5Whbyu+t6CkTssPHC0RdGZ
	Hwk1rFgglu+Wvxj4+azz5Pl2cKkYEnEV0aJUDdZKrlOkpLapbCYEoaXmlJ8EGuFk1R/B
	TtfmF6EC4qGFUpQM+GVxBoraVNXT1ipT/V6et44RzSKYlX0mIkHYfHMmGBAlg+2R8QiH
	rFnE0rpdJ6YyBqDW5IrQ4FU1XI4XLe9jCzUscMl0pkWtybjh9Vm8zp32dMO3TyujdIw2
	XkAuqVeR6RU4xC0QM5IBpx8O7luvRIpVKo8Dh3uzHzLFlajjP8msUhZWXgkj/BAH/kdV
	Invg==
X-Received: by 10.50.164.170 with SMTP id yr10mr16953246igb.91.1452182874046; 
	Thu, 07 Jan 2016 08:07:54 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	qb7sm5100672igb.8.2016.01.07.08.07.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 08:07:53 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1452096306.git.ross.burton@intel.com>
	<568E8B9F.1040700@gmail.com> <20160107160614.GF2512@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568E8D56.7070609@gmail.com>
Date: Thu, 7 Jan 2016 11:07:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160107160614.GF2512@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/63] Consolidated pull
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
X-List-Received-Date: Thu, 07 Jan 2016 16:07:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/07/16 11:06, Martin Jansa wrote:
> On Thu, Jan 07, 2016 at 11:00:31AM -0500, Trevor Woerner wrote:
>> With this applied bitbake can't parse meta-openembedded because
>>
>> meta-openembedded/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:25:
>> Could not inherit file classes/qmake2.bbclass
>>
>> unless the user adds git://git.yoctoproject.org/meta-qt4 to their layers.
>>
>> Should this recipe be also moved to meta-qt4?
> See openembedded-devel changes I've just sent or master-next.
>

Ok, thanks. I was in the process of making a list :-)

