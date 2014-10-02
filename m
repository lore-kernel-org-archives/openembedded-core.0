Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id ADECB65E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 13:54:24 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id r5so2154549qcx.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 06:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KgeFgjOfOkYEN72GzFeoWe6XkIyoMzpeZmZAJKiSQq4=;
	b=nHNB2bnWgaOnZcJspdn7ihYRLdldAyH77VmCf2i9mCZ35FJr+uWSfabjZiy8FMVvV2
	HYsuQ7NkIEFi6ARCferfwW+AvV9ozlk2F2y8FoT42jQwbTKzMS3FIcXDkwv/TV1Qj8sf
	uoGimdDDhnl9+NWus1xrysFqdbRRxAsjeaGZ4VhYrnXu7i8wJrAmhGmZiDlSKPUi/oX4
	t9OrbWPSkRxqhGD6VzsCus4T2pAZf6hXvzIP+lPkuGnOGmYk2nJBh2RlioZNk3ODOoR+
	Z9wCsXa0Rx6GCDhib5fD/jR1UVqfw15Ls/8gD58iyrZBJOB/ZJ3xzRxJBlByh4GzKkFs
	ZqXg==
X-Gm-Message-State: ALoCoQkyS0bbSztSmsAjrN2QMEDLMa0Vq/iEpb7CaWxTkajB0XWPpQ0Tu2iYJ3Djs0r4XxoQcu8A
X-Received: by 10.224.103.194 with SMTP id l2mr6726947qao.93.1412258065465;
	Thu, 02 Oct 2014 06:54:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 2 Oct 2014 06:54:05 -0700 (PDT)
In-Reply-To: <1412170188-50070-1-git-send-email-maxin.john@enea.com>
References: <1412170188-50070-1-git-send-email-maxin.john@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Oct 2014 14:54:05 +0100
Message-ID: <CAJTo0LYN74cjhqQqNCB58_03Wq8_XLYbZ5_hBdQcc9mzKiOcUw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 02 Oct 2014 13:54:33 -0000
Content-Type: text/plain; charset=UTF-8

On 1 October 2014 14:29, Maxin B. John <maxin.john@enea.com> wrote:
> Details of vulnerabilities are available below:
> CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
> CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---

Still fails to apply the patches (different failure to before).

ERROR: Command Error: exit status: 1  Output:
Applying patch CVE-2014-3620.patch
patching file lib/cookie.c
patching file tests/data/test61
Hunk #1 FAILED at 23.
1 out of 1 hunk FAILED -- rejects in file tests/data/test61
Patch CVE-2014-3620.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/corei7-64-poky-linux/curl/7.37.1-r0/temp/log.do_patch.18104
ERROR: Task 6649
(/home/ross/Yocto/poky/meta/recipes-support/curl/curl_7.37.1.bb,
do_patch) failed with exit code '1'

Ross

