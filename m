Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEA360043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:28:43 +0000 (UTC)
Received: by iofe124 with SMTP id e124so19947053iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 01:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=KfYdBEI3q2deOfdjBpTkg5Z5k4JoVikqRmkABb8W84c=;
	b=iajm1sKczsO1o6r1lIJeWnvJbUADZn2biPXLGIaIbjEvVeaXimpStaIZStKTAtdGaE
	nhJdi4kNEXKIpiN5ctQT5uCtN3hrYpYZFNYIzlhQt68suTGwWlIZTxqTDqhkUV+VME2F
	IGVyQaSoUDOwEeSJ5VrbxaiHhrRqLbHYLQlwG2jQWCm0su8vr7e4YdQeTf17z6N5gRha
	DqT6lCPdYvFn/hIluaRV7o8tsbS76bz/JprfqIdAbEqKEedMKhsMoB70ZaVOVbrXTk0X
	x8MwwqBO6iAKQg8OkwgPL09rWqjoJYhV03uWXqKUaiBXHLX8zwHY392v9IIiCUhT5Vl/
	qXiQ==
X-Gm-Message-State: ALoCoQlDLDxj/51f5bWOkqDT4zGeMavibJuyNwXYDnzFQY/MNDXXv4CtR4bVqTmGKjj9vg0rwOS9
X-Received: by 10.107.136.69 with SMTP id k66mr13319569iod.111.1440750523445; 
	Fri, 28 Aug 2015 01:28:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F655.dip0.t-ipconnect.de. [93.232.246.85])
	by smtp.gmail.com with ESMTPSA id b78sm3502547ioe.2.2015.08.28.01.28.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 01:28:42 -0700 (PDT)
Message-ID: <1440750520.3006.81.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 28 Aug 2015 10:28:40 +0200
In-Reply-To: <cover.1440678731.git.paul.eggleton@linux.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/1] Add recipe whitelisting class
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
X-List-Received-Date: Fri, 28 Aug 2015 08:28:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-27 at 13:36 +0100, Paul Eggleton wrote:
> Changes since the RFC version:
> * Check BPN in addition to PN for matching, to make it easier in the
>   multilib case
> * Use PNWHITELIST_LAYERS to specify which layers to apply whitelisting to,
>   and consider an empty whitelist value to be no recipes whitelisted (so
>   you can set up empty whitelists for layers not yet in your
>   configuration if you wish to do so). This also makes setting
>   PNWHITELIST without an override practical.
> * Touch up the comments

I've tried various configuration variations and it works fine now, so +1
from me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




