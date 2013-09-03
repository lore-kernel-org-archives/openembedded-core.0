Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4B26B8D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:49:39 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ht10so4043098vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 09:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EtzkZoKBoIIr+yxKL6+aw1KXHU1zJQ9BFFI2vE8Hw6I=;
	b=KLMpLE9uk7WTsD5IzbBG48/VgIXvTClz9NwxFAX+vm8hyqDeKXF4vP9M2LobT1hLLF
	vLqZTv/EHdDI4HH5RchlSw7/ja88vr7EktWN8Bt5/7FdMFB/gwZY0GG6LUNut8AlQC+1
	x+mLm1FBwvoiR8fwg3/LW/F1bEnXLZKW9JZUQ4mrfis7SWzIZrtWr9UwKFiJaDgKrhOb
	fmGaDjf1U45Vw9TcE6vjsMcbM39RAnGNJv3ySiCYQxzrRoyZ7g0Bex/PW62vZbRwe0cv
	ddM5DmHVek3esrwFmNBm5MCjwvqmG5CAV9e8KruYManQ4irSuadDXrwK8YosQBvLDUHL
	a9NA==
X-Gm-Message-State: ALoCoQm6T/0DlykcXV7U7t4Os7VIkVZYK9CTNKuRrM7vBXfbsSv3ul4wolX9hVEID/481+Ta2lPG
X-Received: by 10.52.103.101 with SMTP id fv5mr1823267vdb.31.1378226979376;
	Tue, 03 Sep 2013 09:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 09:49:19 -0700 (PDT)
In-Reply-To: <1377762070-22599-2-git-send-email-muhammad_shakeel@mentor.com>
References: <1377762070-22599-1-git-send-email-muhammad_shakeel@mentor.com>
	<1377762070-22599-2-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 17:49:19 +0100
Message-ID: <CAJTo0LZNOCVEinJh-G-EZ5dQC+omGpjfPrGiK-f6V=Eoj0S3ow@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] [v5] lighttpd: Add systemd support
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
X-List-Received-Date: Tue, 03 Sep 2013 16:49:39 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 08:41, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> +SYSTEMD_AUTO_ENABLE = "enable"

This is the default, so don't set it.

> -FILES_${PN} += "${sysconfdir} /www"
> +FILES_${PN} += "${sysconfdir} /www ${systemd_unitdir}"

This shouldn't be required as systemd.bbclass *should* be adding it to
FILES for you.

(ditto for the other patches)

Ross

