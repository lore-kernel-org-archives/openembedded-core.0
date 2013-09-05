Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 497C36B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:41:02 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so1062268vbg.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 04:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TghqoEJwJeCNd8WBOqL6dh+Q+UZF0ntE2ZBZ1f7n0wM=;
	b=XjbyIiFtefXYzHLFL9wppJO4En67qnSLxaz5R+hAdT45DrxdK6PQSAsstozI4JkdPS
	eFRCAM/UrwzJSAIKzDeWWlu8+Xglc339Ruwa4A8IH6S8ZMqO+Zow9NPLLDIrIWWAXiAo
	OR8nl9dWg+r+aj/6ac5AHzX8yclfLUerf8DXAkqJbaZu81GTXtm5YxzHyXvEiFwuO2hV
	k7jDUzIwrjpt7V//kuAA/7An3F/M9CJvNhL6opHAL1tmqqaiMIzgdpmf7HFcDlYaC8ao
	3WZqTIqsRuOsm7bR60n6Cq8F1EP9EhaBlLKR9tbNScI59KW4+t6aZLA0O2vfZrPAUBX2
	masQ==
X-Gm-Message-State: ALoCoQl667ML/T8l3z0epoT8IZQHXvfcAP3bR9P0E8hbZie+zXmDqo6FIbhApkEwHlIs9eb4VI6W
X-Received: by 10.220.11.7 with SMTP id r7mr5531584vcr.12.1378381264159; Thu,
	05 Sep 2013 04:41:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 04:40:44 -0700 (PDT)
In-Reply-To: <CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 12:40:44 +0100
Message-ID: <CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 11:41:02 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 12:37, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Sadly when using libtool you can't "opt-out" of installing .la files
>> unless you delete the files that just got installed.  In my opinion
>> this is something that needs to be done globally instead of
>> per-recipe.
>
> So autotools.bbclass?

Exactly.  Phil sent patches to do this previously, and I've a
branch... somewhere that has another unfinished version.

Ross

