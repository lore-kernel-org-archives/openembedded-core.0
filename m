Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Seq9C-0005vZ-If
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 18:10:18 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 13 Jun 2012 08:59:40 -0700
Received: by dano14 with SMTP id o14so1250975dan.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 08:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=OYxktm0tECidkPYQ/p2r29UiqbHgYZ2dpo0idajOPNI=;
	b=ar2JYN3pLIUkQJeYwQ8EuK4+I5e//dX40e0lU48QhTCszZIXpKxKfm8HKYrlgoAwSj
	qjp+M/G0saqz4RCurA9qd/kAOqx5RFjsAA7uAvTAsyMf+ijU3gcXA1znk3khrZVvx98s
	MS8/lPrHc9OK1wawWntZ+w2jdYIr+cCbr7AtFU3JsJy3aUOTbKiupamexq9Cp7KseHyW
	qXUxi2Ipnxvv0L8Tz49vce3IKXeYKQYkow6CdhF5XnNTIRqLyKyJkWnHHlGiSn6xaqMb
	aX8FW3VhRfPQ2LZ208KuXRk/trHqhsI0viDkWFCzVYjZKhQpEn6rOATVetqe/tt4lXLx
	zliQ==
Received: by 10.68.233.102 with SMTP id tv6mr51993645pbc.153.1339603180234;
	Wed, 13 Jun 2012 08:59:40 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id nh6sm4702912pbc.44.2012.06.13.08.59.38
	(version=SSLv3 cipher=OTHER); Wed, 13 Jun 2012 08:59:39 -0700 (PDT)
Message-ID: <4FD8B8E8.8040608@intel.com>
Date: Wed, 13 Jun 2012 08:59:36 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQmUmhuimdkNiu8/6QTQCyFc3qI0jaFeYXBSCXY7msACBIU4kKS0eMiexC3tsrJINe8AkZ/Z
Subject: Re: RFC: [PATCH 00/16] denzil pull request 2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 16:10:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 01:36 PM, Scott Garman wrote:
> Hello,
>
> This is the second pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
>
> I'm submitting this as an RFC so the community can offer feedback as
> soon as possible. I'm planning on running this through the Yocto
> autobuilder tonight and will reply to this thread with test results.
> Assuming we get green builds, the goal is to get this pull request
> merged into oe-core's denzil branch fairly quickly, so please speak
> up if you have any comments or concerns with these commits.

Autobuilder test results are in:

nightly:
http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/509

We appear to have a package_index failure:

http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/509/steps/shell_45/logs/stdio

I'll file a bug for this after confirming some things with Beth.

nightly-non-gpl3:
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/105

nightly-tiny:
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/86

nightly-meta-intel:
http://autobuilder.yoctoproject.org:8010/builders/nightly-meta-intel/builds/101

I'll note these tests were done with the poky-based tree.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


