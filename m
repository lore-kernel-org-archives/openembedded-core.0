Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id E397273953
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:12:39 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so28300547wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=kvc/tdQ5FTVBH/tz/cPXysf//kHQQMsbhketGmsFfBw=;
	b=Pa0OIL0LlGh16tR2bxHdbp3V5SFbCIlgY5kqdUVGXRinqM1FITqt4Y/RSZdc2aBZ2M
	vKVSL5pqvb8Stf2qSMfc+DmsUd0OaFlUPJvF2t/wGAtlEotqYIx1WCIjelmn81J/aShO
	2SOwjoSqeohkv01wLLAFU5X7DvXVF50nutJcP1vUW7X36NEDxzXswq4frLx4r9RN28NB
	9X8VMVjD4PcSYqn3sveA+m8Dqlt/tmgwGS1rjw8BhsLxk6M4OhmsEuR63DliDzehdjyM
	mFUWoKm8O+9YcRz5giSrCP+Y1NV6kpFoUrI67GweUCZ9RvRyVhxZaHLhrWrPt1M+ghrp
	RH5A==
X-Received: by 10.180.94.199 with SMTP id de7mr49409850wib.53.1425978759951;
	Tue, 10 Mar 2015 02:12:39 -0700 (PDT)
Received: from [192.168.100.51] (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249])
	by mx.google.com with ESMTPSA id w8sm32074876wja.4.2015.03.10.02.12.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 02:12:39 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFoFrHbNUfefWimW+jO9ts+rpKJ5ax0eD4FJEfsF3tUpAGjnyQ@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcSv-o_=GD9LJkZJyX38TbAmyXkmtJY+NBZ0-xqSDNeUBA@mail.gmail.com>
	<CAFoFrHZnnK+SuTcVVn7JSZE_A0DKBy2+9R9wtubWBf5zupPhnw@mail.gmail.com>
	<081F4A97-C2A2-4221-9A7F-CFC1022D71A1@gmail.com>
	<CAFoFrHYSHJfyWWfgaVGk6cukkVECzTv7TA+4Ur4BnfE2aC=mrA@mail.gmail.com>
	<CAC1BbcRkNO_U+XFmzoLwDUV+7Gn8NC5-JUXOqfVTwHOt_osrag@mail.gmail.com>
	<CAFoFrHbNUfefWimW+jO9ts+rpKJ5ax0eD4FJEfsF3tUpAGjnyQ@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Mar 2015 10:12:35 +0100
To: Naresh Bhat <naresh.bhat@linaro.org>
Message-ID: <A5F8DCD5-DA8E-4995-8D54-33F6801CD020@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Tue, 10 Mar 2015 09:12:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 9, 2015 9:11:29 AM GMT+01:00, Naresh Bhat <naresh.bhat@linaro.org> wrote:

>today/tomorrow.  Can we please continue the discussion on my next
>series.  Probably you can give me few more points on my next patch
>series.

Please CC me so i do not overlook the new series, TIA.


