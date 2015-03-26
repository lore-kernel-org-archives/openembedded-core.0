Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0406973C1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 00:33:08 +0000 (UTC)
Received: by pdbop1 with SMTP id op1so44869728pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=95AkfKMl4+PJe5xTrt9rGolhEoPz3H3ArMdSypS4fKU=;
	b=JyZOcG/l99CtzuWabKEyac80BFYr1bpR25puhXVxUCW72hWMgb47rSTrvQcDnG3nEJ
	7gguX8Ve1xghd/jIeVO6H/GnxkeZlinZenf2rYIXoHYnCpzeqefSSG09BLOJVXL6sItt
	bDSUlFHmh5R9CXTTi21EsPkuA9zEV6Jk2IQwOhBlbrUEdCMSu1q6tFY8k72ysjta5QGB
	fyCsEYjAA3/w1ZfulEKmwhZOPrkiomhP5+5xemG2fj0lZQjeoMusDKoCxMx/X8qdRIBu
	b/Zt7ntLbyDuHfbaY4v17yHj/ECpZRknaja36GFLUzjqa2veQr6z9TlIZlJkEMMCZlWk
	T9MA==
X-Received: by 10.66.234.2 with SMTP id ua2mr21570521pac.137.1427329990006;
	Wed, 25 Mar 2015 17:33:10 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id iw1sm3612023pbd.8.2015.03.25.17.33.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 17:33:09 -0700 (PDT)
Message-ID: <551353BF.2000803@gmail.com>
Date: Thu, 26 Mar 2015 11:33:03 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
References: <1426152047-20625-1-git-send-email-net147@gmail.com>
In-Reply-To: <1426152047-20625-1-git-send-email-net147@gmail.com>
Subject: Re: [daisy][PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 26 Mar 2015 00:33:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2015 8:20 PM, Jonathan Liu wrote:
> The ownership needs to be explicitly set otherwise it inherits the user
> and group id of the build user.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_211.bb | 2 ++
>   1 file changed, 2 insertions(+)
Ping.

This is a backport from master:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?id=0752c79282b1cc9699743e719518e6c341d50a3a

Regards,
Jonathan

