Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <derek.buitenhuis@gmail.com>) id 1SyooP-0002iT-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:47:25 +0200
Received: by yhjj56 with SMTP id j56so3664132yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=q/XWVybrzZqlE8k/wjS9YxD3XEQgjxAwsQ9QFfAOmK8=;
	b=zP7J4zi5QugCn9Keyen/CHnG6POlylL4CutZuujCUzmPbapGisdr2YaOsUjGTtlMq2
	5b6AuPAOW7ujwWmAmyJ6tEC1vC6NTOAtHMqVa8E9f9EVTSWjDUFDxDP8Kl0sI+Vu5Ewv
	yAluQzv0YGNRRmWF+aFLQM9m5V1YKjdRTCinyvbgJlQr5dqMSRTGnRnOfKC1DYU7SwN5
	JZ3FJAjThOpb54Ap/WHh3yDVwszKTgPtuqND3NQ40DOq1/xHYRkipXbM4svH8KDhmIEh
	i4YQ9guywyVbXPIamVpiNfLrTpkwwbM1fndpg7cRAT3qunpESzdOgmi4KXv6lH3TNReT
	Cghg==
Received: by 10.50.158.195 with SMTP id ww3mr9487789igb.52.1344364535476;
	Tue, 07 Aug 2012 11:35:35 -0700 (PDT)
Received: from [192.168.1.111] (S0106586d8f4832af.tb.shawcable.net.
	[24.109.142.27])
	by mx.google.com with ESMTPS id pp4sm607817igb.5.2012.08.07.11.35.34
	(version=SSLv3 cipher=OTHER); Tue, 07 Aug 2012 11:35:34 -0700 (PDT)
Message-ID: <50215FE3.5060205@gmail.com>
Date: Tue, 07 Aug 2012 14:35:15 -0400
From: Derek Buitenhuis <derek.buitenhuis@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
In-Reply-To: <50215ED9.3070505@windriver.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 18:47:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2012 2:30 PM, Yao Zhao wrote:
> zlib is not using autotools although it has configure.
> when install, oe_runmake will be make -e so Makefile will always use 
> env's libdir which is the usr/libxx, we have to overwrite it when install.

Perhaps you don't need to specify during configure then? :shrug:

- Derek


