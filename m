Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 693FB615E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:12:08 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id oy12so612946veb.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 08:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yz77m/zFeWTquKikdeNwOLynh5S1O4cJqE9vrzIUi+I=;
	b=QNDK4TCq0CBE3ZFjcip+KZNhYtAJEZuUj8Fw38q/8Qu6FSxXFRpKCkAv0lnAiRSxXb
	8WK+FQSaYe0Wqhz/Vh6d/yBBSYK5BEgLBgoZAFkgZf7bAfbOugOk2gKWZwq8a8uebhC5
	YlAUW2EgTM8nb7RuT8KpThSeXYqSs4JabBqGqlzQVzCeiiPGPKwtMe/ph18ZwdT2oKgk
	EOj/Yo7EmWorOM9M6NL9918QGeOJPE2JFHZS3U7195wu8OCVnFLlanl6ImIBodEt2Jm6
	gebYogmd18YWgEXbmpn8EtM6kWw5x/JZ2p189DoJcU9swIUuUlaqoK2lnu1C37npgLo8
	PQIg==
X-Gm-Message-State: ALoCoQnb876fxIg5UhWkbXyk5CbNOqH3f7vTGSjcRtieIA+nPqXnbQNfG8IXCpMbXZuXIkhPu60A
X-Received: by 10.52.165.131 with SMTP id yy3mr2940280vdb.25.1378393929903;
	Thu, 05 Sep 2013 08:12:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 08:11:49 -0700 (PDT)
In-Reply-To: <1378392729.14029.73.camel@dvhart-mobl4.amr.corp.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
	<1378392729.14029.73.camel@dvhart-mobl4.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 16:11:49 +0100
Message-ID: <CAJTo0LZ6FHdDe0NgE0sQvqg+pF4hf_MjvRDe1L=HV-7021EAOg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: yunguo.wei@windriver.com, Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 15:12:08 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 15:52, Darren Hart <dvhart@linux.intel.com> wrote:
>> Assuming success in an distro where opengl isn't enabled will result
>> in the driver believing that DRI is enabled when it isn't, so expect
>> to see build failures from this.
>
> Should we be adding a distro depends on opengl for this driver as is
> being done for others currently?

No, because DRI is optional in this driver.  Follow opengl and flip
--enable/disable-dri.

(assuming I don't change the server to always build DRI)

Ross

