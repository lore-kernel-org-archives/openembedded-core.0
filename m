Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 52BAC6F09E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 11:52:14 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so11230174qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 04:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9uL0Eq14NTVk8Jq0+UsB49LVyeNbxn4V3jGArOEw2ag=;
	b=NuEzxIyKn17ZnEKi9NvKREyak9W8/DHZ/tgeUsluQOES72z6+5OGePVnff0QqzSjm9
	vl4nxvu2RnVeL4qX2UGBiDywvCeG0X59mn7fWzzccvwDUuHPH//6JNDFAJB/P2sSnKzY
	Rsd0tckje6+i0DBMVvG5ZjAC5jVUepuV1K5+BpaHR705JEWL8T/5qAPZVl8BrtfkD87B
	Cjy5tYNm16q0LqFOmtqPto6aLUx+OgHRPDOF+fEjyvFikcls9D55dJV/hRZFQsPF1D60
	YiUxKjU06WD6Uxr5w3A04S3IVkfIXNY2vZeP85fLM3wek9iPx9Im9IU+tLMy6Zzw2o2l
	DZAg==
X-Gm-Message-State: ALoCoQm0tJsfc2bUGBbHUSaEL1WPeM3ogsdf2+6Hi7K00SCg+3eE20oSbno+e3+LJJnPDMNJg4W0
X-Received: by 10.224.127.129 with SMTP id g1mr39943806qas.22.1394452335771;
	Mon, 10 Mar 2014 04:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 10 Mar 2014 04:51:55 -0700 (PDT)
In-Reply-To: <53192B35.3060807@windriver.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
	<CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
	<53192B35.3060807@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Mar 2014 11:51:55 +0000
Message-ID: <CAJTo0LZx5doYDH9XD6UkYfB5KHrX_2s9+tWAP2-OwKA9JUHLjw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 10 Mar 2014 11:52:15 -0000
Content-Type: text/plain; charset=UTF-8

On 7 March 2014 02:13, Chong Lu <Chong.Lu@windriver.com> wrote:
> Do you mean using PACKAGES += "${@base_contains('IMAGE_FEATURES',
> 'ptest-pkgs', 'dbus-ptest-ptest', 'dbus-ptest', d)}" or something else?

Clearly I wasn't thinking clearly last week.  You can't check
IMAGE_FEATURES in a non-image recipe so this isn't a good solution.

Ross

