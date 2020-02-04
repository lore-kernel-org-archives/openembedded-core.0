Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 777D561203
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 08:28:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z7so21700571wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 00:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8ZcHbxBNB8VLwBfIR4bmqQJf+90bRYmldbR5n1JtZdQ=;
	b=WMyfxUAZHv4EzrGBQ8RlA+dNDUlCTYkqdXjXjHj3WlBbQP+Et6LDegT13W5FeLYFyW
	Q78jwABvx7A0mottPRs3EYH67nSYqm0OL4vCtxBrdnczceHugFA35FswjYAkuGD9LmnP
	sa0slbdHAHLoP0Kv9iSzl1oBHlrv3Ap4lcuLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8ZcHbxBNB8VLwBfIR4bmqQJf+90bRYmldbR5n1JtZdQ=;
	b=B+F5DOhyC2y7tcq027mXiq4idnx+58SBq9dFIuW7hP/x0HkylSJvhisfRlOVLB2Abh
	D9sH8TdJsgF02AYEVRDAA7fkooKnQoNQ8FErLOxbsDx8eGazStkNA5QhY9rOi3MkR8sG
	iGMFmL1S//sXCYarOtpPxcbWVdTJbHeqh2tMAkOd/nIixLb2eDjmVhkrkTn7xcEeXeaX
	BZrpfeF5TThvhUE3VfjN8NVW5PEeQfK3dK2ULCc44BiwkxZ8GCdoeRHWS3l++p6CLerU
	u8BDEo+2tXBn2XN3qzz9RG5wVqX+ohOLA9XxHnf9o5oLh2mjjq6jXxsl1/CNJ1LpnCyM
	KxcQ==
X-Gm-Message-State: APjAAAVB49HrIiMD+CREheFKXTCh6mpUFPOIXHK4GqypFxXZRyEIl6aZ
	fpsEaJvoeF7Of6mvytOphtU2rQ==
X-Google-Smtp-Source: APXvYqxkPslJhaZh4LQGvjfLH8/8ucVUWNlu+BYMSLzb2dJ+OVThlPEexrCK7At7tClqU9c14WbL8w==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr19908583wrw.289.1580804899180; 
	Tue, 04 Feb 2020 00:28:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f207sm2922199wme.9.2020.02.04.00.28.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 00:28:18 -0800 (PST)
Message-ID: <587d3ca449eb20660d1effbbd07e1f671511485f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JH <jupiter.hce@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 04 Feb 2020 08:28:17 +0000
In-Reply-To: <CAA=hcWQ47R4kiGtB-zAuzf1OSorJ2SumgEt6DZMebEzb14jBYg@mail.gmail.com>
References: <CAA=hcWQ47R4kiGtB-zAuzf1OSorJ2SumgEt6DZMebEzb14jBYg@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: How to patch a local file in a simple elegant way?
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
X-List-Received-Date: Tue, 04 Feb 2020 08:28:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-04 at 18:26 +1100, JH wrote:
> Hello,
> 
> Is anyway to patch a local file without committing to the git source?
> I did not realize a local patch is that hard or if it is impossible.
> 
> In my OE build, I want to make a patch file for mx6ullevk.h in
> meta-freescale/recipes-bsp/u-boot/u-boot-imx_2017.03.bb, to customize
> mtdparts and bootargs as I could not find a simple way to do it using
> bbapaend, I did not and I don't want to submit the patch to the git
> source. So I got a bunch of errors:
> 
> ERROR: u-boot-imx-2017.03-r0 do_fetch: Fetcher failure: Unable to
> find
> revision 8be98e9322040c655b9e5c9fb2c494e002e3fad9 in branch
> imx_v2017.03_4.9.123_imx8mm_gafile://mx6ullevk.patch even from
> upstream
> ERROR: u-boot-imx-2017.03-r0 do_fetch: Fetcher failure for URL:
> 'git://source.codeaurora.org/external/imx/uboot-
> imx.git;protocol=https;branch=imx_v2017.03_4.9.123_imx8mm_ga
> file://mx6ullevk.patch'.
> Unable to fetch URL from any source.
> ERROR: u-boot-imx-2017.03-r0 do_fetch: Function failed: base_do_fetch
> ERROR: Logfile of failure stored in:
> /build/Installation/sa_platform_build/Source/Yocto/build/tmp-
> glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-
> r0/temp/log.do_fetch.25780
> ERROR: Task (/build/Installation/sa_platform_build/Source/Yocto/oe-
> core/../meta-freescale/recipes-bsp/u-boot/u-boot-
> imx_2017.03.bb:do_fetch)
> failed with exit code '1'

I think your approach was right, you just need to fix the whitespace
issue. Note how the above error says:

123_imx8mm_gafile://mx6u

You need a space before the "file://"

so probably

_append = " file://xxx"

instead of what I'd guess you had:

_append = "file://xxx"

Cheers,

Richard




