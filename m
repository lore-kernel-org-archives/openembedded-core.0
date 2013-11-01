Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCB36AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:59:34 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id m10so2722192vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 04:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1leQOR1eGTbAEk6CqnlDuIcc1OG/1JbJHQnOebeJLYE=;
	b=fazmACfGz/qfiPdWJcGFJdmdJ96kGtHApm3zlmI+dPu3Z7zKgArPAtpdq3EPXZcLDR
	lAyzKSjraGoOUFSGGOKvOZX+svUtXH6knVQ0IPhmETvFo+YkiDEKt7LK0IqF6zcvIl7s
	GvYG+bPfzswP+54a0IRjVzBqhbFlwfQAQ7VvFFVqXp0/89i4Lte+VVVMxWkdOCgxFEDN
	I6IBwGsUnqgkNwqxcHJxqVgfv/cSWs0Ff5u+1CUK7gflOs0xNx+GFIp9wdVMCMQh8Qax
	7o4o+JTSTo6jfuSQtukJH56Y95r1veGOZn/iQv+3BYtW2il2EHhqETfFFqpQkzsykkP3
	CRyw==
X-Gm-Message-State: ALoCoQnlbbhcfCsw2IEua1Y/5+99SBqKyYBZSWPD7u7Spstb/q//2IPkw9JfjUrLAJICpiZPsVNI
X-Received: by 10.52.171.79 with SMTP id as15mr1392173vdc.1.1383307176323;
	Fri, 01 Nov 2013 04:59:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 1 Nov 2013 04:59:16 -0700 (PDT)
In-Reply-To: <52724998.8060509@windriver.com>
References: <1383181191-17015-1-git-send-email-rongqing.li@windriver.com>
	<5271E1D7.6010100@windriver.com> <52724998.8060509@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Nov 2013 11:59:16 +0000
Message-ID: <CAJTo0LYNOxgS4t-YCBc7B1UyfoudKxOZZaeG_W0QAE4h9YzK-g@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez: declaration of virtual/bluez
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
X-List-Received-Date: Fri, 01 Nov 2013 11:59:34 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2013 12:14, Rongqing Li <rongqing.li@windriver.com> wrote:
> connman can detect whether Bluez 4.x or Bluez 5.x is running, so both
> versions are ok for it.
>
> I think all packages should have the capability to detect which bluez
> version is used.

Whereas the GNOME platform has (last time I looked) mandated BlueZ 5
and deleted all BlueZ 4 code.

BlueZ choice is very much one or other, and you can't expect all
upstreams to maintain support for both for a long period of time.

Ross

