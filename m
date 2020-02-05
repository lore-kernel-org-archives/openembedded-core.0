Return-Path: <ross@burtonini.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6860860043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 17:29:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d5so1252790pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 09:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=+2GFL2+Y3DzVe78fwj7rU5kXhocAljScAG71d9DIEAU=;
	b=WjOGj9HEu3CU+5c1Kpt4+n3AEh4WksBn7p8ommkaCQV0GHx/JvZq2/AwtZ3utdwQwu
	CpIk23ua1Gh/In6g1GiMa4j5O4gGj/O6vxsDf5fJuGnsdfOxYAaVGgErt1V00P8WN95n
	TPnIrtS5Udcfx8mMAXYJL1DwStyKw38mV6k9MQFHuFjf8qTkd8loLrTn0V9nBtx62lzt
	bQgAOMph+Vpfm0ow6/ShxCpVNVtj0LeXsTrj3BNP5UFRu0tJoVyHeHtLffrdnx8/tlDw
	pgW4BvCODfeLl4gIfzW+FHin4UBb0tfxMyN7+x3yj9SxFS9hCnBBgcFval5oT8FXvjvk
	pcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+2GFL2+Y3DzVe78fwj7rU5kXhocAljScAG71d9DIEAU=;
	b=MXzk41MD+k0cklvWb7XwWoilg00V/7U8mzbMqo40eGDDpjYDp7ektB/D9rfZ6MMFxp
	C87cF432CJob/kFOaz4yQXFwRLIZxBoRMmT6G9vBhOkI9ApPfnJ66W/SGlI4FKbMNxLW
	o7vAiR+hIEUGq7GzOcaz4cuEzMpG4NMnh8f+gZdvHv3QTaW8XDAcimPo8VNALh50onI6
	YOg+DZ5wLXwLFVgFjW4RK1gPRk/sIE+1hGII26q7L7ouvwNdO/dUGl8JVzgAXBkEB0YN
	+v/wLVfRqkII3HX5yNKjz26aTewDCCUhJiTyDtORjIdtM/l/l8ebzWrd52mwUT4St0lm
	XQlA==
X-Gm-Message-State: APjAAAX/Uzn/oOCg4LCU8+CDgkwzAh1n6w1TvklTRn37I4U4ajp5WDW6
	zZPwBpoF9bNv4Aoi1HeXYfKrb1rXGis=
X-Google-Smtp-Source: APXvYqxBZFbnmHeJ0aptHW9azVZhOcW9RWZ+z53S0qcruuGpMMVwDhCdFAkmIde5jhVSQUCW9y1j9w==
X-Received: by 2002:a17:902:7283:: with SMTP id
	d3mr31536242pll.118.1580923771811; 
	Wed, 05 Feb 2020 09:29:31 -0800 (PST)
Received: from dbird-mobl1.ger.corp.intel.com (fmdmzpr03-ext.fm.intel.com.
	[192.55.54.38])
	by smtp.gmail.com with ESMTPSA id 6sm436951pgh.0.2020.02.05.09.29.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 05 Feb 2020 09:29:31 -0800 (PST)
To: oe-core <openembedded-core@lists.openembedded.org>
References: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Message-ID: <0d407eca-e156-4457-9cc0-cb11581c7aca@burtonini.com>
Date: Wed, 5 Feb 2020 17:29:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
Subject: Re: Reproducible Builds Issue Status
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
X-List-Received-Date: Wed, 05 Feb 2020 17:29:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/02/2020 14:27, Richard Purdie wrote:
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb

I grabbed the library on the theory that this is just a single probem. 
The issue is that the gresources segment in libgdk.so (files embedded 
inside the binary) had the same files in a different order, so I just 
sent a patch to sort the $(wildcard).  Hopefully that solves the problem.

Ross

