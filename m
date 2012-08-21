Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T3sp4-0003C0-QL
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:05:02 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Aug 2012 10:45:39 -0700
Received: by mail-pb0-f52.google.com with SMTP id xa7so224497pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 10:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=i7f/Z5sEFf5PrlMHrcsXFsT3Qt2u8yji0RXpxR6YTEI=;
	b=J+5dx7g0CmWx3mEst90f2D7JtUPxqaPVtQgY69svqG5hcFQpEe6EN0+hkSlS+KtfxQ
	TDgBJ/tz5GGo3Bn7/vsQPlP86CUshkTg97B0yOE8AnjkRIoH2wXNNBMcSHsOwPHBn3Qk
	aHy+Fdn0xGkn1CfCQTOnaaFvu5M8QdL/MEW+puwoRzdbQSu9z6bNw6eifbH5GiSmdHU3
	l8BrdKpK5Psu6sGeJl8TbFkL+4B/bLOfPTdI20DnzE4rMCKRK8jxQ06dmep0e6MMJlLu
	4ehFJ1DyRfH+LHEyhQOQ30ijaI/hOLZz5C4RQH1efSQ0k+nsKnyHvDN7JcgLb/J3E2z9
	vj+Q==
Received: by 10.68.219.226 with SMTP id pr2mr45838763pbc.1.1345571139209;
	Tue, 21 Aug 2012 10:45:39 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id oa5sm1877392pbb.14.2012.08.21.10.45.37
	(version=SSLv3 cipher=OTHER); Tue, 21 Aug 2012 10:45:38 -0700 (PDT)
Message-ID: <5033C94D.4080902@intel.com>
Date: Tue, 21 Aug 2012 10:45:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5033B589.8080502@intel.com>
In-Reply-To: <5033B589.8080502@intel.com>
X-Gm-Message-State: ALoCoQmfcVMpzZC0YvAs3HWVFMwOkzU8Vo/EmxYvpz6i2Jsa+DeEHLV+xy6MK8i61eAHMj8NEmbF
Subject: Re: qemu gl changes are broken.
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
X-List-Received-Date: Tue, 21 Aug 2012 18:05:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 09:21 AM, Scott Garman wrote:
> Hello,
>
> I tried building some images overnight with the latest master, and could
> not get them to run this morning with qemu - I got an odd error that a
> VNC server was started instead?
>
> Just on a hunch, I reverted the following commits:
>
> qemu: Fix broken accidental path move
> qemu-git: Drop GL passthrough support
> qemu-0.15: Drop GL passthrough support
>
> rebuilt qemu-native, and now qemu works correctly.
>
> I have no idea why qemu is trying to fallback on a VNC server, as I did
> not have one running on my machine. I know we use VNC for our
> autobuilder sanity tests, but those haven't been integrated into the
> runqemu scripts as far as I can tell.

This may need further research, I seem to have it working on another 
machine. I'll report back once I've learned more.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


