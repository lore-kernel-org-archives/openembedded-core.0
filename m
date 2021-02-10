Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.3857.1612954452263997356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 02:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UjOQewjf;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: robert.rosengren@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1612954452;
  x=1644490452;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=01QJIkx8Zo/PnuGEWQLFh0zwIzqeQss4vuW6EqVnIKg=;
  b=UjOQewjf4o1rkeAG+YI+RwRvzFdavwJYJOuvEAHx5jfAhgohYsD1EmOk
   WQQgLkvIbNqXUFMA0Yz+KvS7V3p7ecYRLYEVtj3IgBXWqWO1xokhD55W7
   wQDicIbTiLlEQWbkKdz/4UisgDkySPEV8R0mY7bFpK+Ed9RgeR7BRZdsI
   WcQ8yTyew8b6JBHdgxElWuP/XKlkiqzs/x1hveGLuuB/tvSf4DEQ01uWx
   ckf2c64KAC61wBRJKuUl7EG+AmHlrKLrRSLjUb8X6X1968GFUfChiVOAP
   F8GLNHaAO5/mXDLIlly/4TD20sfnp4rS1PFlvDc3hjaH8Xpbc1bBf/tXQ
   A==;
Subject: Re: [OE-core] [PATCH] mpg123: Add support for FPU-less targets
To: Khem Raj <raj.khem@gmail.com>, Robert Rosengren
	<Robert.Rosengren@axis.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20210209141616.24276-1-robert.rosengren@axis.com>
 <CAMKF1spisR5dPaN-1pPsk-kiBjW356znTP2JJt500zuU5CjN=w@mail.gmail.com>
From: robert.rosengren@axis.com
Message-ID: <483bd3e6-3366-d248-3c55-456aa8d966f1@axis.com>
Date: Wed, 10 Feb 2021 11:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spisR5dPaN-1pPsk-kiBjW356znTP2JJt500zuU5CjN=w@mail.gmail.com>
Return-Path: robertr@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX01.axis.com (10.0.5.15)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Actually, I used a MIPS-based device lacking FPU and ran simple gstreamer/gst-play to test a mp3. A very non-scientific measurement on that device using nmon moved from roughly 100% CPU load and stuttering audio to a doable ~15-20% CPU load with the fixed point configuration. (of course all such measurements depends heavily on audio latency, queues and so on of a device hardware.)

On 2/9/21 8:10 PM, Khem Raj wrote:
> is --with-cpu=generic_nofpu applicable for all soft fpu machines or
> just arm ? I wonder if it will improve or regress other nofpu
> machines. Do you have any data
> 
