Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 334DA6058C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 23:53:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f25so3943770pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t9G4LuoWZnYDBEHqlnZUAJ/oiqAjnpw7CcvBLu7ZW6Y=;
	b=YSLvluhsXKehz6EXle1JrjGEKlSxXhyk0QRIPpd98itEhDcLuTXbPls5OCPig0II/i
	UsiWYKgcVqgpJllaVtLu30KU2XxsVgAAs2Q/9KKcHQ3i6AfQdYsbm9kB/Po5CMbxtVDd
	tOVUQo5+Jy4gCdeIQZ8YMwwcKuSv3J2Az+54VyZ801dlsB+XlRRNQDqphgWB7/iZjDE2
	z2GEVvM9XM8GlswtJ0FPBNUGri3ukSuo8OvIkFcpkIY5BvCnuBhmP5tlJE474gTcT3f3
	o0MeNH4YiJVGsmezx+x4msoGpjRrFv31T/71Lki5qJbGxGtXlh5J9hMYSthWn5a3aF41
	oO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=t9G4LuoWZnYDBEHqlnZUAJ/oiqAjnpw7CcvBLu7ZW6Y=;
	b=QQRhjJ2tETu5TRzsHauppo4JCNQvs35JB4gGV41yVzOUHCiKd5vw2IQfPP84aWrXnR
	nEPBrJR0R0kzL5ZcW977t3QOhNP4iqcSehA8fF7H/uREqD59tAGpLkWDfdJY9YHpJhAG
	STCcP7t75OrHgGJH4uOBDSuJz8zUmoxbJqtUWRep/asA8bTMbeuR2XXBPGGNNL9N4SbD
	1DeJbNbOSot4HxXSI2WY5M6cD7/V8aCqDP/0Ggdx0+tRr8qWq2JeC68UXHgc8j/XPrMZ
	jrLXBrYwJUDfGzDeJzBOeQmcfSr5QwEMaGly3kwv457BsuqppR+PYKgoMBK48jE+jZiR
	nckA==
X-Gm-Message-State: APjAAAUDaGt8235A/d/qEDLdAP9gLRr8oVmTcmIFpzpKQIRXkT4y3oO7
	9DAITe0PfQJnL5cO06n86enG43mh3jg=
X-Google-Smtp-Source: APXvYqwiQsSgPPSi1y/Zwc51Tyoq3uECHnOuD4hs8BllDfXlk8FwjycQxd2xD2x4DPku4Ea4/jL+Ng==
X-Received: by 2002:a65:4243:: with SMTP id d3mr6511864pgq.57.1558655590893;
	Thu, 23 May 2019 16:53:10 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:7892:9931:70c0:491e])
	by smtp.gmail.com with ESMTPSA id l23sm410671pgh.68.2019.05.23.16.53.10
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 16:53:10 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP71WjzDVJuGSVmOErD9bpH+Wv=MHTLJXVt3rp=8mOF8MKMiHA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a90d34c9-2bf9-439e-bd52-f76b20cd1eb6@gmail.com>
Date: Thu, 23 May 2019 16:53:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzDVJuGSVmOErD9bpH+Wv=MHTLJXVt3rp=8mOF8MKMiHA@mail.gmail.com>
Subject: Re: possible issue with buildhistory?
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
X-List-Received-Date: Thu, 23 May 2019 23:53:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/22/19 11:53 PM, Nicolas Dechesne wrote:
> hi,
> 
> not sure if it's been discussed reported before. but i ended up in a
> situation where a package is "empty" (e.g. it's not created) even
> though "files-in-packages.txt" in its buildhistory folder shows it
> should contain a file.
> 
> I have a synthetic example:
> 
> $ cat buildhistory/packages/aarch64-linaro-linux/helloworld/latest
> PV = 1.0
> PR = r0
> DEPENDS = autoconf-native automake-native gnu-config-native
> libtool-cross libtool-native virtual/aarch64-linaro-linux-compilerlibs
> virtual/aarch64-linaro-linux-gcc virtual/libc
> PACKAGES = helloworld-src helloworld-dbg helloworld-staticdev
> helloworld-dev helloworld-doc helloworld-locale helloworld
> goodbyeworld
> LAYER = meta-rpb
> 
> then:
> 
> $ cat buildhistory/packages/aarch64-linaro-linux/helloworld/goodbyeworld/files-in-package.txt
> drwxr-xr-x root       root             4096 ./usr
> drwxr-xr-x root       root             4096 ./usr/bin
> -rwxr-xr-x root       root             6144 ./usr/bin/goodbyeworld
> 
> However goodbyeworld package does not exist, and /usr/bin/goodbyeworld
> is in the helloworld package:
> 
> $ dpkg -c tmp-rpb-glibc/deploy/ipk/aarch64/helloworld_1.0-r0_aarch64.ipk
> drwxrwxrwx root/root         0 2019-05-23 08:25 ./
> drwxr-xr-x root/root         0 2019-05-23 08:25 ./usr/
> drwxr-xr-x root/root         0 2019-05-23 08:25 ./usr/bin/
> -rwxr-xr-x root/root      6144 2019-05-23 08:25 ./usr/bin/goodbyeworld
> -rwxr-xr-x root/root      6144 2019-05-23 08:25 ./usr/bin/helloworld
> 
> It is worth saying that the file should indeed be in helloworld
> package since there was a bug in my recipe! So buildhistory is wrong
> here.
> 
> The recipe is a simple one:
> 
> SRC_URI = "file://helloworld.c \
>    file://goodbyeworld.c \
>    file://Makefile.am \
>    file://configure.ac \
>    file://COPYING"
> S = "${WORKDIR}"
> inherit autotools
> PACKAGES += "goodbyeworld"
> FILES_goodbyeworld += "${bindir}/goodbyeworld"
> 
> Clearly the recipe has a bug, and if I do this instead:
> PACKAGES =+ "goodbyeworld"
> 
> /usr/bin/goodbyeworld ends up in the right package... however I think
> in the previous case, buildhistory should have shown
> /usb/bin/goodbyeworld in helloworld package, not goodbyeworld...
> 
> I was testing on warrior, but i can try to reproduce on master if needed..
> 

I think this could be happening since removing empty package is an 
optimization which is not considered by buildhistory. Its worth a bug 
report.

> thanks!
> 

