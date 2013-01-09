Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsrba-0001xC-QP
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:05:57 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 00:50:37 -0800
Received: by mail-vc0-f197.google.com with SMTP id m8so2608111vcd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 00:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Sh5IGpJ+6A7HHx35SoXfzZcXCagqxHAcIyCuE9wcizQ=;
	b=gxYe5q7lZNbtGLEkOHL4MywWDPSdIzLMVyX6EdWRgGCEdLzCjxnQln5XIXZeAsDHhj
	du4mcrRiuP0WB4aefLRou6ZjlQhcTP6sEZ4C6KBmHallCkoH7J9tIEl5/cn3vc2Wky8b
	VLyYMvGDvofoKetuNwGlU4PxOche8PSYtMAvt/IdfdIgP3znOmeH52hK5tLBc9yrNjMD
	8s3iByP04F+nQg7ZdHLDARNnFExF04mpV3RqpG7FYJDx5nmHv8lqTvtJSo3xGFt033Hw
	RYK0viTCCgDmu/bAVz7BO5VCtmGE2m569qxvq1dI9ekQUB2/J/NLoZsdLplDArvyDlKD
	lNLg==
X-Received: by 10.52.66.71 with SMTP id d7mr77337418vdt.121.1357721436511;
	Wed, 09 Jan 2013 00:50:36 -0800 (PST)
Received: by 10.52.66.71 with SMTP id d7mr77337416vdt.121.1357721436392; Wed,
	09 Jan 2013 00:50:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 9 Jan 2013 00:50:15 -0800 (PST)
In-Reply-To: <1499acb24c57f9bf9b10c0b87e331df4f00ea5b4.1357719953.git.hongxu.jia@windriver.com>
References: <cover.1357719953.git.hongxu.jia@windriver.com>
	<1499acb24c57f9bf9b10c0b87e331df4f00ea5b4.1357719953.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2013 08:50:15 +0000
Message-ID: <CAJTo0La0VCxXbhZ4de4pR0AqBoojLNWGaBm9+xVwtokSz99PLw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQkStAVHPa3Ax1LfC1X4RCPQAmjwD3n5/h8MLMX254cpkfi0t1Rf4AhgNiGmjP2aOJ6Qq3de3fT5i6tNRhKYR9kMNclUGNzMIKYs2VVgZTLhG08EFFKfmJjfj/gTwDuSZrG2IkxNGAQoAGyuBStLTxzKWPgMZIT23oX+YOmovK4IPJKmBsxFjBFbOw8PLomFFk7PGNsU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] qemu-native:add option march to BUILD_CFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 09:06:03 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 08:46, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Add option -march to BUILD_CFLAGS in order to let the atomic operations
> ("lock free") be available while using old version GCC (4.3.4 for example)
> on x86 host to compile glib-2.0-native.

Did you mean to say glib?

Ross


