Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816DFC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 10:52:45 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com
 (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web08.5945.1654080747950831795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=Za1gNWJZ;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=dpvYsIfS66ZiF6T03BCFwsmH5ByTDPJDNBX4bTJ5xUU=;
	b=Za1gNWJZ9qOxNwtGsOxO/j3nXTJwgEhrAqo6qT+wK63bGvKZteseylyknYHTJD00SEeRiLIAgL9wx
	 d0hZ+25E9eeyRt40H5oc3UBT10q6wP99YzBLjDr1cLjy1LGpmC685w+PF8wfvRTqWbXx0LMH2ZrU0I
	 Eg/0rGmjfqDJ21Xx53dkro+Iop79ZBTXYbgpXzvsRGo3t9VB8WE4zDA+428vSc6ngaq7DMupUHzRwF
	 Gue5a1W1OxVTnKzUqIHMpmuannYPv7KXXleA/Te1C8qU6h2ccNOuHxRec+SGK8+tX2WcdJJEIw1X/F
	 jo7mFDhRV2T9vk6ymTBxq/n3LsmgFHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=dpvYsIfS66ZiF6T03BCFwsmH5ByTDPJDNBX4bTJ5xUU=;
	b=iCepYDDpd86mPhYOJsLDkSCOPvsi11pB72GqDaMPTkfPazFnTrjNCuimZ0Ap0M/ia8/omHjootSSa
	 kHuEBZ8DQ==
X-HalOne-Cookie: 32653925617cf3c32225e0d435d3244b73456dd4
X-HalOne-ID: ebe7ff27-e198-11ec-8231-d0431ea8bb10
Received: from [192.168.100.131] (ua-213-113-157-96.bbcust.telenor.se
 [213.113.157.96])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id ebe7ff27-e198-11ec-8231-d0431ea8bb10;
	Wed, 01 Jun 2022 10:52:25 +0000 (UTC)
Message-ID: <0e25e13f-2370-993b-a7dd-3780f056cd58@berginkonsult.se>
Date: Wed, 1 Jun 2022 12:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Marcel Ziswiler <marcel@ziswiler.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
 <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
 <b448e78d04ef6dda6cfb2b974b5b5b7f8b7c3981.camel@ziswiler.com>
 <CANNYZj_+wqbxXbyQ17a=eZJKhq9hjzpXMCO019iAwNXgvs5RBw@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: 
 <CANNYZj_+wqbxXbyQ17a=eZJKhq9hjzpXMCO019iAwNXgvs5RBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 10:52:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166371

On 2022-06-01 11:43, Alexander Kanavin wrote:
> I'm not sure what the dilemma is, inspecting the repo shows that
> there's a standard 0.2.0 tag pointing to a commit in the master
> branch. You can look at pretty much any other recipe fetching from
> git.
> https://github.com/Avnu/libavtp/tags
>
Agree.

My suggestion for solution is 'SRC_URI=-...;branch=master...' + 
'SRCREV=<sha-sum of tag 0.2.0>' and rename recipe to libavtp_0.2.0.bb. I 
don't know if that is against any style guide or rules?

And also fine with a move to meta-openembedded.

/Peter



