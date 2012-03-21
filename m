Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SA9f4-0004wU-3Y
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 01:44:22 +0100
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Mar 2012 17:35:27 -0700
Received: by pbcuo15 with SMTP id uo15so1725715pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 17:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=FzKZ4mQXuZsP1FY1axoqwFUqRe98YqljUtNFSkUi4dE=;
	b=bH2jYaJ9opMT1C81mocTOX4v1VFN7VGdQlNXybJYsHUrKNSCWZHqJIAeE+8aSKu/9p
	9vUMRA+4kBz1TAIwBsd+zMCI5Df+Txo6QawG+Z6kvAWulqRlHIAx06z9r3npBc0KEyWh
	B8U7tcL7XU7yFChvl2IvhMbLteoxGPPYEN+ulpQ0i7BC/suUsoZLdomAAcoKtvogk/TY
	KzUBMJXh5cDXRJh6VQuikVF0sV2+Fhic4aXo+oYcntVyJr6PvtbQ7QRS7vfFK9mCrtyl
	a9M4utNAJT8QXVv5vuLEntWpPN16HaVEtZxcel7WYKCgm3hXRsDADmnJL6TbamXmBjIA
	1QKA==
Received: by 10.68.74.138 with SMTP id t10mr5733006pbv.126.1332290127520;
	Tue, 20 Mar 2012 17:35:27 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id 6sm21002pbh.65.2012.03.20.17.35.25
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 17:35:26 -0700 (PDT)
Message-ID: <4F69224E.7050901@intel.com>
Date: Tue, 20 Mar 2012 17:35:26 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1332266918.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1332266918.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQlnXXlKTTiiTtKYu2n1odEnqwxP6Tf1TkuGuHZtIzlqEZQZpC6MII0Fbhx7Yq6yn8ynWc5g
Subject: Re: [PATCH 0/1] openssl security upgrade
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
X-List-Received-Date: Wed, 21 Mar 2012 00:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/20/2012 11:10 AM, Scott Garman wrote:
> Hello,
>
> This upgrade to the openssl recipe addresses a security vulnerability,
> CVE-2012-0884. I would like to ensure it gets included in our upcoming
> 1.2 release.
>
> This upgrade has been build-tested on all 5 of our qemu architectures,
> and I have inspected the image and package output to ensure there were
> no significant differences between the output of this recipe upgrade
> and the last version of openssl we were using.

I had forgotten to update the distro_tracking fields with this pull 
request - so I've pushed a commit onto this branch to do so.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


