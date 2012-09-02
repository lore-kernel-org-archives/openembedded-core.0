Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <z.p.gaal@gmail.com>) id 1T8Ept-0001ZC-OL
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 20:23:54 +0200
Received: by bkcik5 with SMTP id ik5so2205861bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=shPbZ6BrYUb4SNf/m0Ba24saZZW7f/gP4lSxLU0CHag=;
	b=0yWshrvojabXsVwAPpWeh2WhpHolAAonF05mAdVv4Q/u4ytHappjJ6YAVXWf1LTRos
	fzVJ0NYRiujlGlp8xs/H0hCzseA4TYe0wb9Oq/aDgIwgRCAJrAEpOq0SIkk3XZga7j8j
	ILEagL8ZAb++2g/VwMC7XRJARLNS1u3LKrY5jNCt824J0PqiosWd9UQXZq7OiTCNiGvC
	jF747fd17z+NApEOMkKWi/ofL/eYYQTMXi3UyKpt1RQye1AwPGqaKCBkd89c5sHV12s1
	uDSwl5aYOZkxKtkIXBwfKb1fICf+gwVbJmMra+fLl99J6jC5cF2ZHAsneMp5n9HJigdO
	0IZA==
Received: by 10.205.122.134 with SMTP id gg6mr5892319bkc.102.1346609494201;
	Sun, 02 Sep 2012 11:11:34 -0700 (PDT)
Received: from [192.168.0.13] (BC2411C1.catv.pool.telekom.hu. [188.36.17.193])
	by mx.google.com with ESMTPS id t23sm6384439bks.4.2012.09.02.11.11.33
	(version=SSLv3 cipher=OTHER); Sun, 02 Sep 2012 11:11:33 -0700 (PDT)
Message-ID: <5043A154.8020102@gmail.com>
Date: Sun, 02 Sep 2012 20:11:32 +0200
From: Zoltan Gaal <z.p.gaal@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1346589598.30964.4.camel@ted>
In-Reply-To: <1346589598.30964.4.camel@ted>
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Sun, 02 Sep 2012 18:23:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, that eliminated the error (warning), though I don't really like 
the idea. A recipe states something that's not so: mesa does not 
provides egl without the packageconfig, but who cares, while it is 
working and not too much confusing. In the pre-yocto ages there were 
much worse dependecies :)

Thx,
Gzp


