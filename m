Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SqqHJ-0005s0-V8
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 20:44:18 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 16 Jul 2012 11:32:58 -0700
Received: by pbbro8 with SMTP id ro8so10607486pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=7XmgtCAe9ERxevOd9MODKMltpSSyJGBdiOR2/VmmuJA=;
	b=jIC3OGno9vZ3QyKZRhv+Bi5Cbrq7DHhcLsTAT7WGeVHxr2bJTba9XsWLamG1rbpFHk
	bEauOhS7Q6VlA13Ga+lRld4HUIZNQyMin4Ll1X74x7SiBxnEBz+HO2vTPYEFXBIImVsj
	tZ9RfFEYS169dmkTjsgTDY0lT10qO+mBhAr6ohTAuL0vXXG9lur8AMZBED3eKOXbG8S/
	dsFSGXyr0/qsN6FEz2iv4Buvw29s9FLz7Rc4cWvSVY0bEO+kJlBN/5GLaNV9wfflXiuf
	8A2yr8QLUJ8N/VRKbRczYC8ZZ0GR6WedEHpPnoHbBvxzP5UwtZgsX/rxxAwp9LALRpDD
	1Q1g==
Received: by 10.68.130.163 with SMTP id of3mr29125619pbb.108.1342463577913;
	Mon, 16 Jul 2012 11:32:57 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id he9sm12356961pbc.68.2012.07.16.11.32.55
	(version=SSLv3 cipher=OTHER); Mon, 16 Jul 2012 11:32:56 -0700 (PDT)
Message-ID: <50045E4B.7070202@intel.com>
Date: Mon, 16 Jul 2012 11:32:43 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1342449862-26387-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1342449862-26387-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmnZs4e7Vs0P9JgfKVdcpkPixuJKXVPse7JXabg2VlkeLHHC4V5eWQyaf2HymNi/zMnrDCh
Subject: Re: [for-denzil][PATCH 1/2] curl: enable ssl support
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
X-List-Received-Date: Mon, 16 Jul 2012 18:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2012 07:44 AM, Koen Kooi wrote:
> From: Saul Wold <sgw@linux.intel.com>
>
> This patch enables ssl support for curl to allow git to clone from
> https / ssl sites. We do not want to enable gnutls for native or
> nativesdk, as it adds additional dependency and increase build time
>
> [YOCTO #2532]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Thanks, please ping me by the end of Wednesday if you don't see this in:

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next-1.2.2

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




