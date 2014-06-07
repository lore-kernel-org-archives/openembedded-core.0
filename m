Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 19AA16AE84
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jun 2014 10:51:26 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hn18so1770403igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jun 2014 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MIEfzxNpKNzlq9/RxdZXrsbe9xwsQlZcaeg/JgRl8NQ=;
	b=JH1N5L39Wv7SJdkhwzGzmdIcYCRnQXuEd4RJSZZZMLLX+7uJrce6n3TVurI5evlqaH
	M8eSqkn8crQZKZHHroEGpIt5A96pS1x4JXT0bzdXQkJ+wq7QOIhq/zXA45X2b8lEKx/D
	xIFQy122lxFJobzUBNTuvTlSvBOo+JdFQxXwtHuuqN85bvfBbTipRZL/fupO6HVZU1np
	4tCzMP/IaxKz7RWQP21jf2WscwG1Mc+sava8JyfKGHCKntsbUcY175Bq9tNE1NOYnuAC
	Pa7EEKdC5BA1qiSHSn4br+qEQDhHS3udL6AguOX2T7nSCKUUDQMGWFE8gtQdUpD0aUJU
	lTsQ==
X-Received: by 10.42.211.205 with SMTP id gp13mr12784177icb.29.1402138287402; 
	Sat, 07 Jun 2014 03:51:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.6.197 with HTTP; Sat, 7 Jun 2014 03:50:57 -0700 (PDT)
In-Reply-To: <1402069681-17929-2-git-send-email-ross.burton@intel.com>
References: <1402069681-17929-1-git-send-email-ross.burton@intel.com>
	<1402069681-17929-2-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Jun 2014 03:50:57 -0700
Message-ID: <CAMKF1spMhvvf-WgEKHo+0FXCVbqY0dym4+HPLWSZiBFuvhRCNg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gawk: remove dgawk and pgawk packages, merge gawk-common into gawk
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
X-List-Received-Date: Sat, 07 Jun 2014 10:51:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 6, 2014 at 8:48 AM, Ross Burton <ross.burton@intel.com> wrote:
> -PACKAGES += "gawk-common pgawk dgawk"

would it make sense to have RPROVIDES

