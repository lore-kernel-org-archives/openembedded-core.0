Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 098E76A8F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 20:03:59 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so6784553iec.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Apr 2014 13:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dbff8bz/23p9aW9W75UAl+xRoQPLdCytI7daOE1d4KA=;
	b=lQlBmSna62D+nYaGNzP6Dfea9t1SZIQOFhwDcHVJY1tDsmFHHqUgnbfUpinUOIhTf0
	P+R6sR6DoDXrHMPEpwbh0draJ3HVY3oI6DD3L3dqBmpJ/lbGTba5yz5GJ5s2q5fjfRBy
	TT0zZzI6cVuqPEv+YlfCtLd3UGeZIRDftjtmDh1vk0y1HFUp/bN8iHCxx025ZmKXcHGL
	WTL5GzA5Lt8YUhX76lswf2/6/cSoCL/JcL5TXwCv/wlg8wwsYlc7QviftrRXh4hhwf2G
	7YFjHEPySj4oHxgaAIp4YzYXHHpMCiFm8KDCDR67Dv1gT43eJa2I036l+lKFntD44ddT
	lOaw==
X-Gm-Message-State: ALoCoQlVb2a/haRP92yNghn+WdcwgDvSaNkfCp9vyNBdXMDs9ECkwqlxnAnV1og2UnyAUBvdmVDn
X-Received: by 10.50.176.199 with SMTP id ck7mr300379igc.44.1396901040354;
	Mon, 07 Apr 2014 13:04:00 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id kb5sm432303igb.1.2014.04.07.13.03.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 13:03:59 -0700 (PDT)
Message-ID: <534304AE.9000108@linaro.org>
Date: Mon, 07 Apr 2014 16:03:58 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140403130609.GF2132@jama>
In-Reply-To: <20140403130609.GF2132@jama>
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Mon, 07 Apr 2014 20:04:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is anyone seeing any build failures with proj-4.8.0? Or does anyone have
any local fixes? This one has been failing for me for a while, and yet
doesn't show up on the SOBBW lists.

