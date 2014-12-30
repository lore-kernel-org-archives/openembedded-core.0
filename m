Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 14DD36017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:17:11 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so19536191pdi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=FIdAbjLKeCMUauDpTcpA07D6zzpKvoJeONnaQMPFnrA=;
	b=g/TYmsrUihtywNbllYc/1t1tBRATi3P+FBdg4INKaDNL/FzxKqdq4bcwE80iVQBJLI
	3C1CwUZaDC0eBJ0ZtyuAXFb4EXL2U0S4pbq4ePfR4WVrt0TdOtJBFr7BbIuxCetF642q
	Lax8gg1hVfeKIT/WHf6pNPiekRiFvn+prb3gnc/f5kOY41kXMz2a0xbpJ2rzprXSdm1w
	d0UPEM+mbIBQffYzEcfYGgS3UzPvI1H/9yrZuS6dWcN3sPNI+HFePBDmS0v3MgOB00xt
	1BLZvtUZz+Z63gNNJ3CcSkpKHWyihQoV4dK/Gnkg42RQUwK+OytUQ+e4ts67G2InPgK1
	KQJA==
X-Gm-Message-State: ALoCoQl9uWs3/8kwREK3JbcAUZEb5Ytt3o6Eg2TTrTpJw43claCz8/fprEpYUBbVOW+9nfWymCK0
X-Received: by 10.70.138.37 with SMTP id qn5mr101158811pdb.118.1419963431448; 
	Tue, 30 Dec 2014 10:17:11 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:1d49:be20:4ea5:c651?
	([2601:c:a700:272f:1d49:be20:4ea5:c651])
	by mx.google.com with ESMTPSA id
	ok9sm12832391pbb.52.2014.12.30.10.17.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:17:10 -0800 (PST)
Message-ID: <54A2EC21.6070308@mvista.com>
Date: Tue, 30 Dec 2014 10:17:05 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1419958884.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419958884.git.paul.eggleton@linux.intel.com>
Subject: Re: [dizzy][PATCH 0/2] Backport fixes for git-perltools split
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
X-List-Received-Date: Tue, 30 Dec 2014 18:17:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/2014 09:02 AM, Paul Eggleton wrote:
> The following changes since commit 1cf1edcd28a002291622d04dd2d0ee2c67e329e4:
>
>    buildtools-tarball: package all of Python (2014-12-11 16:34:01 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/dizzy-git-tools
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dizzy-git-tools
>
> Jackie Huang (1):
>    packagegroup-self-hosted: add git-perltools

This change is in that gray area "does this really need to be back 
ported decision make processed", so I did not include it.

>
> Paul Eggleton (1):
>    buildtools-tarball: restore missing git tools

This patch is already in the dizzy queue.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/dizzy_1_7_1&id=e8a6adf0612fc6d9ca703237a3a5c630177c2f34

see poky-contrib akuster/dizzy_1_7_1.

- armin

>
>   meta/recipes-core/meta/buildtools-tarball.bb          |  4 ++++
>   .../meta/nativesdk-buildtools-perl-dummy.bb           | 19 +++++++++++++++++++
>   .../packagegroups/packagegroup-self-hosted.bb         |  1 +
>   3 files changed, 24 insertions(+)
>   create mode 100644 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
>

