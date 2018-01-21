Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4967871C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 16:23:21 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 136so5166919pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=WV9h0+M7V28jHfJKQEmY2Mv4nnlo+XynVGkTBxkshvY=;
	b=K2hjluZjxoTvVp1T67NHuepbapfrweRCTRgK6Hjf3/5olY6JPr7Zc2gGFsy+JLOQkJ
	Sx90zOAxR9hq24Zymj+nD4yqP+MdE/kj4SgWC6mNEsuOV9FKvxYYmtozPM4P5X/of3yF
	5eMDL2r1A/EwFEgi2Hh3U2ApOqRwWmiGMgu2TGnT3WcFcOocqiaiMDFT57hOsI2MRaW0
	kAJ0SnjvGn4jIA0Jkjq3UjXgYJOf2Tymlm3dA8xgiJMQ+QO5GEupv2qoVCbCkDiDZvwz
	UsIVknhbO6RNHNDL4v/f23nqXNu68P131BF5oN13QF+5fZhPv9uvM4f6mMWJn/ZsPr1T
	PSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=WV9h0+M7V28jHfJKQEmY2Mv4nnlo+XynVGkTBxkshvY=;
	b=h3/TxYgPy7mhK11l6p4x/tVEfeL3598gBxJhg+umwiHXIMMPDTNE98lq92+G3PZX2k
	6mKfbvO7jpBUlZJabBoP4oj5tz6lo2P4WjBaqoWYI6F6Aexc7G5XaDZxKVcr/+bWz5Mp
	a1l7YpFB9FA6imX91m3y6dnnLIvOZ3lRTcB6YRnd4w1WCLjoJPbWVndZcu4bfM3c/JHo
	q+jc1ZIPKjJ6evhCLRO3mFup7QHrap7KmOLSUlr5b5vnn3VSy1aHxndbyGX0HDj51nUS
	15yRRhdv7po9u8K98uexa4rKRjyYpUY36xdXZKzWQG94AR2BnrHEvElCvnP9GmGcqBL5
	7d5w==
X-Gm-Message-State: AKwxytcRd24ZWJaMM3NXTSvRHonFoRdCkXHaL9jQ0ue05hQWqhuYUKVu
	t7eTofn1hcS3X2lEwDFedGjJCw==
X-Google-Smtp-Source: AH8x226eKeGiiFIfvraB0Ag1s+mZ92IOz+1nFYPaIagamozwAccM1Teh++iobpQmopqJWKn3eeMWYQ==
X-Received: by 10.98.192.134 with SMTP id g6mr5621941pfk.91.1516551802369;
	Sun, 21 Jan 2018 08:23:22 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:a4cf:fc1a:2afa:5e49?
	([2601:202:4000:1184:a4cf:fc1a:2afa:5e49])
	by smtp.gmail.com with ESMTPSA id
	v24sm24119353pgc.82.2018.01.21.08.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jan 2018 08:23:21 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	"Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
References: <1513757451-829-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C63B59397A@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CAJTo0LYQKNFQ5Dr3_xva_XUCsxL-zz=Mi44aWeHgmoKqtXcgYw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <67639acc-2c6c-3202-3274-d0ead83c7637@gmail.com>
Date: Sun, 21 Jan 2018 08:23:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQKNFQ5Dr3_xva_XUCsxL-zz=Mi44aWeHgmoKqtXcgYw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Sun, 21 Jan 2018 16:23:21 -0000
Content-Type: multipart/alternative;
	boundary="------------6C863F507885DFECB213BB93"
Content-Language: en-US

--------------6C863F507885DFECB213BB93
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


If have rebased this patch to latest master. I will be sending a few
more glibc fixes.

Hope I don't step on anyones toes.

- armin


On 01/19/2018 09:32 AM, Burton, Ross wrote:
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com
> <mailto:huangqy.fnst@cn.fujitsu.com>>


--------------6C863F507885DFECB213BB93
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <p>If have rebased this patch to latest master. I will be sending a
      few more glibc fixes.</p>
    <p>Hope I don't step on anyones toes.<br>
    </p>
    <p>- armin<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/19/2018 09:32 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYQKNFQ5Dr3_xva_XUCsxL-zz=Mi44aWeHgmoKqtXcgYw@mail.gmail.com">Signed-off-by:
      Huang Qiyu &lt;<a href="mailto:huangqy.fnst@cn.fujitsu.com"
        moz-do-not-send="true">huangqy.fnst@cn.fujitsu.com</a>&gt;</blockquote>
    <br>
  </body>
</html>

--------------6C863F507885DFECB213BB93--
