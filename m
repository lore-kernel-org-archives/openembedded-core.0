Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmAjG-0007Dt-A2
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 23:33:50 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 03 Jul 2012 14:22:46 -0700
Received: by yhpp61 with SMTP id p61so7305153yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=WS8G6t/2AfIuC3ta1RcsObgmZH+MOkYKyvGe/vx2zxQ=;
	b=hP9S/b7xnsYrUBI5FVfQTvYVnv8TJUtCEgkmcFuKzBba7S0IG6SaKwlnhL+U+s7Ueh
	/bCzfMcCbgof/onp4BeF4akqtqYlHG1y5oN6RVCOR4rOPCCvD5PhuuS4GrrFhgWAoCPH
	l68ZSGcxV/8/fgdVBYrLWsBZ2OUaMUqWMPJLLfoJV3M3GyRNbqFBobiTo+3zpliOjsEK
	QssoO2XEzBG1wY9HXhpQTn7dL8vKCNW3vqDctkLeOgp2MS5gV/XZArRhYAcecGxIbGjz
	F5u5dLeLFZlbJe2uu+hfAWPp+yfKrzbErlggcl7hLD15hKRTyG3s+W/4gzCm0+zRHAb1
	c3qQ==
Received: by 10.68.226.131 with SMTP id rs3mr10877333pbc.62.1341350564567;
	Tue, 03 Jul 2012 14:22:44 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id rs4sm16262035pbc.0.2012.07.03.14.22.42
	(version=SSLv3 cipher=OTHER); Tue, 03 Jul 2012 14:22:43 -0700 (PDT)
Message-ID: <4FF3628D.8090506@intel.com>
Date: Tue, 03 Jul 2012 14:22:21 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207031651540.31160@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207031651540.31160@oneiric>
X-Gm-Message-State: ALoCoQl0fA2pb3Wvo8srcPKyPWEJ3XhJ2uMBIW7wkgseMaUEbXuSKEeKSu3yc8CYz8nHDPAt/qe5
Subject: Re: was someone going to remove the MACHINE-related stuff from scripts/runqemu?
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
X-List-Received-Date: Tue, 03 Jul 2012 21:33:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 01:53 PM, Robert P. J. Day wrote:
>
>    a while back, i pointed out that some of the help printed from
> scripts/runqemu is clearly wrong -- anything to do with that "MACHINE"
> variable.  was someone going to fix that?
>
> rday

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2611

I will submit a patch for this by EOD Thursday.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




