Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1677E605B3;
	Thu, 25 Jun 2015 03:00:58 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so43330214pdc.3;
	Wed, 24 Jun 2015 20:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=HcKkLTIUojdDJN68a1F5nz8aWtFrq0DQwZ8N58VAmR4=;
	b=VAJ/hmrRG88bKQ6MABInc0DIIf5YfmJoYL5eeVmbsYEmzWK8eeWEAN9+SqN75feE7k
	ZN0b0A2tDoZwzBoDPzeJklRwEcfXd3oL6/xYLkU2ILSnm0F8icDL0De4VvV2wjuOdTrV
	81hrtAI65abdXQ7R/IIgwlkBDL92MB4xQU+RZDyrKcNnv19MaYP+fcSVhZyy1MIO6Lfc
	PZCQH98RYN8SWOg4EqM6kcF72M0vFQ4D5xynYTYwLPt9YPwFP77jJuwbCPr6w2dQhoc+
	2jkJMVKYF5JnvQoq3ABfvmJZCC1y10SAWwKhsKDYiVkeOIGxZJ+cFTO9Bno8iluPSI9Y
	L4yA==
X-Received: by 10.66.101.9 with SMTP id fc9mr14352491pab.37.1435201259437;
	Wed, 24 Jun 2015 20:00:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:64c5:89fd:13b4:1d00?
	([2601:202:4000:1239:64c5:89fd:13b4:1d00])
	by mx.google.com with ESMTPSA id
	qs8sm28169329pbc.38.2015.06.24.20.00.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 20:00:58 -0700 (PDT)
Message-ID: <558B6EE7.5090107@gmail.com>
Date: Wed, 24 Jun 2015 20:00:55 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: google mercurial repo issues
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
X-List-Received-Date: Thu, 25 Jun 2015 03:01:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I have run into an issue trying to build vim.

/usr/bin/env hg pull 
/home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| ERROR: Function failed: Fetcher failure: Fetch command failed with 
exit code 255, output:
| abort: repository 
/home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim not found!


there is a note on google regarding their hg repos: "We have some known 
issues with hg repositories."
	
https://groups.google.com/forum/#!topic/google-code-hosting/Gh3kl9MrzY4


is anyone else seeing this?

- armin

