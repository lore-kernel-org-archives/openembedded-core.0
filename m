Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF29771A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 17:09:09 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id g6so69226070igt.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=i0RfrbgTDiP3omb6QpwB4gMnK8GwjF8YGAlobc5A5N4=;
	b=t+PQ2rWGp/W+93FQVOj+R2SxCdcsEou0bgOH/BtSJUi7xceDKJMkUHZHuWUQA0WykL
	fkirkoHw1JisU4//FFbrthLO+vcuMj6AEVLpdRuVJqSp7lGmHZPQZQtL0epTEiWBrjw+
	eueh9ouI+ZvNy3t3kBMPq1xxA8S7DdKcJnQ4i4NHOhSP+egdoJ/HnjrU0LzQcTXBaL5N
	6FoAPMaRI0OSXXDJ9neCyPmGTeNyzT5LjmCJVHwZbszIsofPB5sw3smySz029n9GmHng
	FilwX33BI/9O0p4Puyz6V08m3T/qOTKtIecepmUSP+luMzcPwGOwItZt/7xzx3I8S+OK
	BmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=i0RfrbgTDiP3omb6QpwB4gMnK8GwjF8YGAlobc5A5N4=;
	b=ljnswpgA6g2FS7orgmOXwDq4uroQ55Cv7fFBtyGlcDFh2QraU9ir6eb46OyQxO/TeA
	rxMxSrmAJ03k2/PidO1FGDWakfpblNm18yvPzp79H8Cw9mo1KBYJbFWucN2S5Nzge8TH
	+hHtvztVCopKQQKTvUP6Uk/9Glvtswy4dzXNN9q1RKWD6YhWAYeP86OuWOw3gi2aYvGd
	0CppGvH/oydsmLXLI8AyCnoGdwbSYFehr+SmZnXacaYz+E9jf0llRAm+sPIQ2N2T+MZ6
	JR+BeHvSFcPkexppoMccfLw01lS5EizdD3sJg3hkFnili5wEEcq784ctdTaZQyf1u96v
	xhKw==
X-Gm-Message-State: AD7BkJJ8qgq1y2sGHHy75fXy8vBILLIkxDAhVYjIxPe1Pu+b0LklhLUO8OLyJJKCmnkyzA==
X-Received: by 10.50.126.8 with SMTP id mu8mr6098855igb.52.1456679350688;
	Sun, 28 Feb 2016 09:09:10 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	h131sm9398794ioe.7.2016.02.28.09.09.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 09:09:09 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	brendan.le.foll@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
	<56D24503.9010803@gmail.com>
	<1456648351.11498.130.camel@linuxfoundation.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56D329B5.5090101@gmail.com>
Date: Sun, 28 Feb 2016 12:09:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456648351.11498.130.camel@linuxfoundation.org>
Subject: Re: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Sun, 28 Feb 2016 17:09:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/16 03:32, Richard Purdie wrote:
> On Sat, 2016-02-27 at 19:53 -0500, Trevor Woerner wrote:
>> On 02/25/16 10:06, brendan.le.foll@intel.com wrote:
>>> npm class supports the npm fetcher, helping doing the basic
>>> compile/install
>>> stages of an npm package
>> Any chance you might have an npm recipe example? Maybe something like
>> express?
> Not express but there are some in:
>
> https://github.com/arfoll/meta-brendan-nodepkgs/tree/master/recipes-node

Thanks!

I guess I don't have enough "plumbing" quite yet. I have all the master 
branches of everything I need and I cherry picked Brendan's npm.bbclass 
but I still get:

$ bitbake forever

ERROR: ExpansionError during parsing 
/z/layerindex-master/layers/meta-brendan-nodepkgs/recipes-node/once/once_1.3.3.bb: 
Failure expanding variable do_fetch[file-checksums], expression was 
${@bb.fetch.get_checksum_file_list(d)} ${@get_lic_checksum_file_list(d)} 
which triggered exception NoMethodError: Could not find a fetcher which 
supports the URL: 'npm://registry.npmjs.org;name=once;version=1.3.3'

I'm not sure if this error is complaining about a fetcher issue (which I 
can't figure out because bitbake does have the commits with support for 
npm://) or a license/checksum error.

