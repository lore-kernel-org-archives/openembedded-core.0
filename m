Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8EE6C4FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 12:17:03 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m15so8496692itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 04:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OdtAkt5uEcvuksZXKUJjXNN0NIob0nN3jez/15XV5HA=;
	b=XwhYyavqHlctSc04zRBtKDvw0a8oxWvxju3hqdLfPYB1TFmOjvKYjG4SiznsjW1IVF
	+wYhjkc/lmfzD4WwmSi0qyT35K4TjQjZPUgKMTphPwCPzWTVZrsypUs9rxeLnqfV9+MP
	sE/UKDidKWjX9U2v3c2PVF6l9k71NXt7yoip2VdYMFTvnwMLxNS5XF1B0eYAkVE0zR33
	1gXQ2IKEfUblf60w1HRidNyO32LrMVtQnaF47M//hRPi+mFstX88Jr3Uj36sxZxGU0UT
	b/ID6U0CM5TsaqT/E641u5BOzP8RqhPin0BfyY47xPnreFpqH8cGzJayLcXioDgpcwlv
	ie5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OdtAkt5uEcvuksZXKUJjXNN0NIob0nN3jez/15XV5HA=;
	b=O/x2TYaU1+sXld2u24CDm8Y0UsJeEc+kG5EOqhCisOxelrmcJumbr8rSH0nfhFoV6r
	5gJnCdOA78P9/9J9XMRg6bO9loP1Vb/tIUlF2FFnwpQ+SuO+8i9+AkGw6c3RihC8rwoh
	TwnaLuasSWRJ+XTDurrbZRXUUHAWGvnWBaEntgr30kSeahyLNjhpVXzA1apFztTdPPhm
	onfbBxCFHRqKlTAb2kJcW6svzcDlrDKzNV1wtcVymu1CDOtkVUZ8+CjpzPLgP8/PUFgb
	Ts1pJ3UQXKquK/syqc0Tuthfv6koTpCPicc7kQMTsH0fRP58yEiq6aHTZt2x79uj3/8G
	ZZLg==
X-Gm-Message-State: AGRZ1gLAnjh0KapF/5w1cGS1GmxxdIgk1AnwtgEIXy4bDbjSVFf7VUlj
	wTIR3PmS4jO+5XNi8Uy7YYl1YS5ybjSzz3i92l/TuA==
X-Google-Smtp-Source: AJdET5f/ZtrygtLyEIxXkBHX9AwZVVpQoSA4GiRAjYAzGT5Uz6L5vfIX4+P3Vb35P6iI4DVO46NLW9WC+wMKJBpnl/o=
X-Received: by 2002:a02:1e4c:: with SMTP id m73mr5335211jad.79.1542802624909; 
	Wed, 21 Nov 2018 04:17:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542778410.git.Qi.Chen@windriver.com>
	<dc2278cac296d5ad9af04e0de849d0f9e0a0884e.1542778410.git.Qi.Chen@windriver.com>
In-Reply-To: <dc2278cac296d5ad9af04e0de849d0f9e0a0884e.1542778410.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2018 12:16:53 +0000
Message-ID: <CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] busybox: remove three hostname test cases
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
X-List-Received-Date: Wed, 21 Nov 2018 12:17:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Nov 2018 at 05:35, Chen Qi <Qi.Chen@windriver.com> wrote:
> These three test case are removed because of two reasons.
> 1) net-tools' hostname have different behaviour regarding some options
>    So when net-tools is installed, test cases may fail.
>    e.g.
>    test x$(hostname -i) = x$(busybox hostname -i)

This is just a specific instance of the problem where alternatives may
not be what you want.  The busybox test suite should be sure it's
running busybox tools.  Having spoken to a few people about this
already, maybe busybox-ptest should contain a symlink farm for all the
applets to the busybox binary that run-ptest can put at the front of
$PATH.

> 2) hostname may set to some value, e.g. qemux86-64, which is not an entry in /etc/hosts
>    This results in lookup failure when using `hostname -f' as there's no entry in /etc/hosts.

Let's fix the hostname setup so hosts is correct too.

Ross

