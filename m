Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A33D67F334
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 14:45:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so77456603wrr.5
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NdgowtVEyPPpeP6PIW70qr3RkzAJB3S4K3l0VcGqy/Q=;
	b=A2B/V8gr3+X/+6mlM+7UbUKDIcNy2vOLr9NYmyQAoby5hd+4kXZ9Qw9Xdx5NR5ql8R
	x/lCvqxhv5FKVZC0eToWFJi+s83cmGFKGoohrarBW74FlRk/UJ+By6zrYK4EdJrRh64I
	OlJMekE4XAn3KAjF/nvOqWaJfWMKjD43xkoAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NdgowtVEyPPpeP6PIW70qr3RkzAJB3S4K3l0VcGqy/Q=;
	b=ZL3R17RhEny7TwBurSG/ajByKp40TJcyBV08jouezBx6YoE3cuti6Je8Y79HhlVgmZ
	txkYAVtcWKaNoWsDcUc7SnD7A0/2xvpf7QYp5fbtRTOpTZEBmu3Pg6n4JNVxpe5Bmolo
	ZeaJ8zb6JVYP3U0l0S8xvWKDHB0uOZduvVEA8WqaLX5niNBvlcT1vzpB0U1351/wec1l
	jtw6O5ipgir2dyLj8qTxuk0zaK1KhfPZX7n9dPVqm5pH+KTUCMEVuLboGn/R6pYST3Pd
	NhkUJUi5MFPaYfWq9bpgTOT/MB/AU8beidRKl+igE838/bnSbnTsF6AkYrYNWUQjd/H5
	1auw==
X-Gm-Message-State: APjAAAVhLkq4AoimNJxWRJMSprOBSrV7C/dMSmcIeZVrFY3Lb1nAZUyQ
	QHKwtlFau5SF9Va90HPV4kd9ag==
X-Google-Smtp-Source: APXvYqz+jvNmT6WXloQxaNRIvFgZpFVEb3GnW8FfaTnYu/zG8ob8pBfMEqlvqyXrUpABHwXGyw8UHg==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr56740029wrm.12.1564757136195; 
	Fri, 02 Aug 2019 07:45:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm6476960wrd.46.2019.08.02.07.45.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 07:45:35 -0700 (PDT)
Message-ID: <7c7ee5f23029cdc0d421e6e50db145276d92ff80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de, chris.laplante@agilent.com
Date: Fri, 02 Aug 2019 15:45:34 +0100
In-Reply-To: <20190802073741.GI3459@hiutale>
References: <CY4PR12MB1653C06268B3B4B862119BE18BDE0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<20190802073741.GI3459@hiutale>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: bitbake-devel@lists.openembedded.org,
	Openembedded-core@lists.openembedded.org
Subject: Re: RFC: exposing information about the SRC_URI(s)/branch via buildhistory (or similar mechanism)
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
X-List-Received-Date: Fri, 02 Aug 2019 14:45:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-02 at 07:37 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Thu, Aug 01, 2019 at 04:51:38PM +0000, chris.laplante--- via
> Openembedded-core wrote:
> <snip>
> > I'm interesting in adding SRC_URI support to buildhistory (or a
> > similar mechanism), and would like to get some input.
> 
> Yes to this.
> 
> Also would be nice if there was an easy way to add bitbake variables
> to buildhistory.
> 
> I've patched our tree so that SRC_URI, LICENSE and CVE_PRODUCT are
> archived in buildhistory. SRC_URI has many uses and changes and
> patches can be easily identified. Same with LICENSE, any changes
> trigger a review. CVE_PRODUCT is exported so that we can do QA check
> to make sure mapping from CVE_PRODUCT for non CLOSED licenses exists
> to NVD database product names (maintaining a white list of recipes
> which don't have any CVEs yet).

I think this supports my point about being more interested in patches
allowing people to extend/customise buildhistory than just adding X.

Whilst we want to have good defaults, there are always going to be
niche cases for people wanting to extend it...

Cheers,

Richard


