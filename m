Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB1C6DBF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 12:06:59 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jx11so3221355veb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 04:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iF8ltx9QcNFpDwq9uvEu+NXiATQihUyLO+mrmCWbsIA=;
	b=kMrdgXbPxlQTsO6vU5RQWp6gKsy2rLWB1HFrYuwZxKWy28bRyQK5W94335vD7rdZvE
	j+EZEWQKRtCDpov6l5XsVCzo2pKOxvYe4H2Yo7AXLW1hvBKaF8p0TMCq8hTftrY7av+7
	T72cTL+YkkUy4lxqfqLuaM5xWzn0lZt7dYiSWrhIFDSKNjZIkChbaKdQSQsIH2k/v69Y
	nmcZ0gQ4NxdYQDIzv0kSd7rC57y6Fktz2Ihgj/BSN9EAQyPAfKH07r/SEytrL9Ww5YgB
	TgdZM765W7ISprh/UwvOCuUcdyISWHAtdWYU6lElwjMBBElWlEqQZrQraoyAa54h9udi
	woow==
X-Gm-Message-State: ALoCoQmAiSCQEWy+pycqVQrN/bXzx+iBg6WPv1k1r6nXIbPCuat0lJU+zpgYOSta1620sKnN9YhL
X-Received: by 10.58.96.15 with SMTP id do15mr399518veb.56.1387195618799; Mon,
	16 Dec 2013 04:06:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Dec 2013 04:06:38 -0800 (PST)
In-Reply-To: <52AC68D0.1040208@linaro.org>
References: <1386677617-20952-1-git-send-email-ross.burton@intel.com>
	<1386677617-20952-2-git-send-email-ross.burton@intel.com>
	<52AC68D0.1040208@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Dec 2013 12:06:38 +0000
Message-ID: <CAJTo0LZAgzAcJDSZ_gPOpBdD_bJF4XhPQz1LFM7eox3zeGHjMg@mail.gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libmatchbox: use PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Dec 2013 12:07:01 -0000
Content-Type: text/plain; charset=UTF-8

On 14 December 2013 14:18, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> Hi Ross,
>
> Your commit message and your commit don't seem to agree. I.e. you say
> you've removed 2 dependencies, but it looks like you've actually removed
> more than just 2.

The other dependencies just moved into PACKAGECONFIG statements.

Ross

